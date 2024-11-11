Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4388BD12D7B
	for <ath11k@archiver.kernel.org>; Mon, 11 Nov 2024 07:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kvGXn9BM3jNbzW5aDeunEoBEoVYjCFM1GXfIwX/+7uk=; b=YAiqPNKeGl2h4nQwg2C/GrT8J0
	iTiOPoaB01FWPy4OIRtTIk9gehHiwh4LFB1hFXx1edHc30TK0ETgPlf96iu6FEJAfrwMK39LLlXKN
	Vt/+YWx1aBWD/9Rb4AxwM701G4SWv64awbF+JSHUj0L/v1W7LFZCO4MjbN7z2aCbG95cuYFQTHrnJ
	wfSBxMBI8ZDjnfpKV2gQ/KrKvZaV3pLhv15zUWjkAzO+ZUReWsJgGBbns4V4asdGKNFp/7euEufFq
	wXIqvP1qEHvTNPCgMPo3j5naX//9xu0f8bUYPNLw6vyafpRAiyYK0rSdLi3nGD4hpyHFQMnJwPC78
	TBKQT+xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOTl-0000000GYtA-2fFd;
	Mon, 11 Nov 2024 07:04:53 +0000
Received: from forward102a.mail.yandex.net ([178.154.239.85])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAORA-0000000GYS4-2aS9
	for ath11k@lists.infradead.org;
	Mon, 11 Nov 2024 07:02:14 +0000
Received: from mail-nwsmtp-smtp-production-main-31.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-31.vla.yp-c.yandex.net [IPv6:2a02:6b8:c0f:26bf:0:640:efa0:0])
	by forward102a.mail.yandex.net (Yandex) with ESMTPS id 6822C60E97;
	Mon, 11 Nov 2024 10:02:03 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-31.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 22g22h1xFKo0-8zlvh9yw;
	Mon, 11 Nov 2024 10:02:02 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1731308522; bh=kvGXn9BM3jNbzW5aDeunEoBEoVYjCFM1GXfIwX/+7uk=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=HjPozOCaNS/zFs9ye/x/xqPLF8M1y8BXo8tAUzGpzyjlvMswYHzvZArXDm+3nJfCU
	 xieO/gGvGd314fPTKb933E24rNtzkzLG+dbnCf77+EDfh/VGfliDf5gqsqjm28d75n
	 PunxO3LnPNp4VoEQY/P+pL+lGi65IMXJpWxI735w=
Authentication-Results: mail-nwsmtp-smtp-production-main-31.vla.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH v2 1/4] wifi: ath11k: cleanup struct ath11k_vif
Date: Mon, 11 Nov 2024 10:01:49 +0300
Message-ID: <20241111070152.85140-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_230212_996223_088AD52A 
X-CRM114-Status: UNSURE (   8.37  )
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
v2: join the series but unchanged otherwise
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


