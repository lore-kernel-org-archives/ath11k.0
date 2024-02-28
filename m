Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE95C54E41
	for <ath11k@archiver.kernel.org>; Wed, 28 Feb 2024 10:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qEJeYbmJxo0BtItp/7yVTF7rBZlv9oown4rhFVe/Ymw=; b=akiCuSUiJKcbsuZMJTJ4eA23TT
	39Dd55aFniYqxe52BUZidVPeih5gWOA5MTNgz48iPsXCrioXlwDhCSfNU3iPrua5MVa3JvcXTX0R2
	GEZ6GYUJ/je80erGXpYH/9fRsB/BJVeIlZBDDZ2N7UaykLtEQdJlixmynBAN/0lfTki8f4XJU7rBv
	2jPboh3Wq/H4aHTs/3/4cpFEDHNbxE+NBcuCQMo2ziOAkltxbcfLq7qkwNf2OGbQWQJUgoLQS0zkH
	LQe+6mSJXHP/Hjfpdt22FcGfH1XFWNXbyDFFzrwsG/ts7ZKpHnrsul9aX0QCKMIrZuL01+6EicvfE
	ZLFcQ0sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfGkV-00000008laO-06XL;
	Wed, 28 Feb 2024 10:01:15 +0000
Received: from forward102b.mail.yandex.net ([2a02:6b8:c02:900:1:45:d181:d102])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfGkQ-00000008lYS-14uh
	for ath11k@lists.infradead.org;
	Wed, 28 Feb 2024 10:01:12 +0000
Received: from mail-nwsmtp-smtp-production-main-46.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-46.sas.yp-c.yandex.net [IPv6:2a02:6b8:c14:40a4:0:640:8f61:0])
	by forward102b.mail.yandex.net (Yandex) with ESMTPS id ED909609CC;
	Wed, 28 Feb 2024 13:00:55 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-46.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id s0WeXZ7EUGk0-MPorsuKX;
	Wed, 28 Feb 2024 13:00:55 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1709114455; bh=qEJeYbmJxo0BtItp/7yVTF7rBZlv9oown4rhFVe/Ymw=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=SK1CSyQMM4jD42S1SLWEHk7xn+TZARBpgwD7fqWz+ozAdqoZmY7hzrMtI0ezC0wGd
	 Q520UvPdLOjkv4GpbO/eGos5M1AThga4qVbXFaRLxs4bKkXVQB7dsMCphdaPGY7AoY
	 gAUMR/6+omTKRKV7I8zVaFfwBMmxY4nL/6BSZd8A=
Authentication-Results: mail-nwsmtp-smtp-production-main-46.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
	Kalle Valo <kvalo@kernel.org>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH] wifi: ath11k: use ath11k_mac_get_ar_by_pdev_id() consistently
Date: Wed, 28 Feb 2024 13:00:38 +0300
Message-ID: <20240228100038.138267-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_020110_861238_6351F653 
X-CRM114-Status: UNSURE (   8.85  )
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

Since 'ath11k_mac_get_ar_by_pdev_id()' can return NULL, check
the return value in 'ath11k_wmi_tlv_rssi_chain_parse()' as well
as in 'ath11k_wmi_tlv_fw_stats_data_parse()', and return -EINVAL
in case of error. Compile tested only.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 34ab9631ff36..2d93e4e78a37 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -6498,6 +6498,12 @@ static int ath11k_wmi_tlv_rssi_chain_parse(struct ath11k_base *ab,
 	rcu_read_lock();
 
 	ar = ath11k_mac_get_ar_by_pdev_id(ab, ev->pdev_id);
+	if (!ar) {
+		ath11k_warn(ab, "%s: invalid pdev_id %d\n",
+			    __func__, ev->pdev_id);
+		ret = -EINVAL;
+		goto exit;
+	}
 	stats->stats_id = WMI_REQUEST_RSSI_PER_CHAIN_STAT;
 
 	ath11k_dbg(ab, ATH11K_DBG_WMI,
@@ -6570,6 +6576,12 @@ static int ath11k_wmi_tlv_fw_stats_data_parse(struct ath11k_base *ab,
 	rcu_read_lock();
 
 	ar = ath11k_mac_get_ar_by_pdev_id(ab, ev->pdev_id);
+	if (!ar) {
+		ath11k_warn(ab, "%s: invalid pdev_id %d\n",
+			    __func__, ev->pdev_id);
+		ret = -EINVAL;
+		goto exit;
+	}
 
 	for (i = 0; i < ev->num_pdev_stats; i++) {
 		const struct wmi_pdev_stats *src;
-- 
2.43.2


