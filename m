Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2286DD5AE73
	for <ath11k@archiver.kernel.org>; Thu,  7 Nov 2024 08:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=76mnb3IeiSJ5Qb6v2c8NFgRXUy0/RW4iOC9h+AhxDzM=; b=aTsufRTxyPcQ+287qbl3hOLF4E
	XEwg+a9Vn+KfreI3/Xt0zBX/UXFebXSV2y6/70sEVKh54RopM51y9Z+DFfhThJqh2AHrCII4idak0
	/hTzrJcpCrPL6V5LKQzeICMqJXu+55yqJOKPc9eH2YCJU1YnM9U+ccXN1M/To+RdPC9HPy9sLAvAr
	0VgcxCKWaxDs24o9oTgW/6iBQjVoAm2hdpfNqQf8Vsf2nA6tjDJPJ6nupWrIKs5Kdacj7VK4pqHLh
	+EgbuHrvByyLReP7GxpkeUD/FiRRWVCkOIKsFnqHaGMs5A2Ip7G0nFuIfQF6qf51E7Jxk4aCCqsJZ
	Y6z9VqhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8yIG-00000006Cjf-0jar;
	Thu, 07 Nov 2024 08:55:08 +0000
Received: from forward101a.mail.yandex.net ([2a02:6b8:c0e:500:1:45:d181:d101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8yIC-00000006Cg9-0kA2
	for ath11k@lists.infradead.org;
	Thu, 07 Nov 2024 08:55:06 +0000
Received: from mail-nwsmtp-smtp-production-main-74.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-74.vla.yp-c.yandex.net [IPv6:2a02:6b8:c15:2e9d:0:640:5e79:0])
	by forward101a.mail.yandex.net (Yandex) with ESMTPS id 29B8660E4B;
	Thu,  7 Nov 2024 11:54:57 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-74.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id usdEEKE7UKo0-p46LF6Ww;
	Thu, 07 Nov 2024 11:54:56 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1730969696; bh=76mnb3IeiSJ5Qb6v2c8NFgRXUy0/RW4iOC9h+AhxDzM=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=Kd2h7t3gahp2RjYZ6VJN6o4JtPGiJ0tbkTvzvvquXUsKNvFkEJhceVudDYsObIc00
	 rTTuHWkabj7rOP2RtUloFC/B6sjoCRkH1W+airYM6m5OlEUZeBmVZWyvTIhlbbiBkT
	 cjwW6LqvFAjgclyAwjykWpJ4yWVj9yDUGJvKZrkI=
Authentication-Results: mail-nwsmtp-smtp-production-main-74.vla.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH 1/2] ath11k: cleanup struct ath11k_vif
Date: Thu,  7 Nov 2024 11:54:54 +0300
Message-ID: <20241107085455.78788-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_005504_835569_FA403C91 
X-CRM114-Status: UNSURE (   7.99  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Remove set but otherwise unused 'tx_seq_no' member of 'struct ath11k_vif',
adjust 'ath11k_control_beaconing()' accordingly. This field was actually
unused since an initial commit of the driver. Compile tested only.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/net/wireless/ath/ath11k/core.h | 1 -
 drivers/net/wireless/ath/ath11k/mac.c  | 2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 09c37e19a168..5ab1fdd21144 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -370,7 +370,6 @@ struct ath11k_vif {
 	struct ath11k *ar;
 	struct ieee80211_vif *vif;
 
-	u16 tx_seq_no;
 	struct wmi_wmm_params_all_arg wmm_params;
 	struct list_head list;
 	union {
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index e6acbff06749..9757ac4aae50 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1697,8 +1697,6 @@ static void ath11k_control_beaconing(struct ath11k_vif *arvif,
 		return;
 	}
 
-	arvif->tx_seq_no = 0x1000;
-
 	arvif->aid = 0;
 
 	ether_addr_copy(arvif->bssid, info->bssid);
-- 
2.47.0


