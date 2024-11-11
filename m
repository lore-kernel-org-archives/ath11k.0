Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5909ED12D7E
	for <ath11k@archiver.kernel.org>; Mon, 11 Nov 2024 07:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sKoUBbuQqLVKV9vnsO4RkxC7AjCQWLEZH1h5/aLHAaU=; b=RFlBfB5TEJyo7puGaa9zARtbpg
	UAtUaZVK2mr9tccHX3zAYpdpojUVqTNNw08LNz4q3ufnDmzYiyymwxvApuIfl4hJvI7mK7ON70q1m
	xBvvlk7yhFZMC/rhCqNeU9g6b5ZcBFiyWAhpmZj5HCStxQ9qOe0kSEVrNDI7Ce5q3ztAzflJp56Xo
	mPntCEQJYSelfwa8y7DqMv8JiE2eJP6Av7fsNiW55zG6lNrzy2f1Ba1i2VySiXc71agh7CzMcRc8R
	27YYC9De9SScePfT50hd9sAYqyatteaVzuntNQUQ28XYaVB+XoJYis/EpUBovi2am1rI2FFTxCmC7
	caGtuJXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOTm-0000000GYte-3g1i;
	Mon, 11 Nov 2024 07:04:54 +0000
Received: from forward101a.mail.yandex.net ([178.154.239.84])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAORC-0000000GYSE-1iEn
	for ath11k@lists.infradead.org;
	Mon, 11 Nov 2024 07:02:16 +0000
Received: from mail-nwsmtp-smtp-production-main-31.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-31.vla.yp-c.yandex.net [IPv6:2a02:6b8:c0f:26bf:0:640:efa0:0])
	by forward101a.mail.yandex.net (Yandex) with ESMTPS id 5677960B2A;
	Mon, 11 Nov 2024 10:02:05 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-31.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 22g22h1xFKo0-G8Rhr3gT;
	Mon, 11 Nov 2024 10:02:04 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1731308524; bh=sKoUBbuQqLVKV9vnsO4RkxC7AjCQWLEZH1h5/aLHAaU=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=YpYAXLt/nQGSIQz7EHnNrxUWdf656ouPKWyIOkCzoWh7ArlLY8LKGUU4+e+5nFnpe
	 nbQteS9wYoHBHOJdxBTzhpR/TKJptg2nU30RZlXrmPOhxoXGNs9/Wjct3W2nl+3qsp
	 DtbGOn50ntDNzAoo66LT6a2SsXACB29JihoydXpk=
Authentication-Results: mail-nwsmtp-smtp-production-main-31.vla.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH v2 4/4] wifi: ath11k: miscellaneous spelling fixes
Date: Mon, 11 Nov 2024 10:01:52 +0300
Message-ID: <20241111070152.85140-4-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241111070152.85140-1-dmantipov@yandex.ru>
References: <20241111070152.85140-1-dmantipov@yandex.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_230214_637266_10EAD4B1 
X-CRM114-Status: GOOD (  11.60  )
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

Correct spelling here and there as suggested by codespell.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
v2: join the series but unchanged otherwise
---
 drivers/net/wireless/ath/ath11k/hal.h | 6 +++---
 drivers/net/wireless/ath/ath11k/mac.c | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/hal.h b/drivers/net/wireless/ath/ath11k/hal.h
index dc8bbe073017..601542410c75 100644
--- a/drivers/net/wireless/ath/ath11k/hal.h
+++ b/drivers/net/wireless/ath/ath11k/hal.h
@@ -700,7 +700,7 @@ enum hal_rx_buf_return_buf_manager {
 #define HAL_REO_CMD_FLG_UNBLK_RESOURCE		BIT(7)
 #define HAL_REO_CMD_FLG_UNBLK_CACHE		BIT(8)
 
-/* Should be matching with HAL_REO_UPD_RX_QUEUE_INFO0_UPD_* feilds */
+/* Should be matching with HAL_REO_UPD_RX_QUEUE_INFO0_UPD_* fields */
 #define HAL_REO_CMD_UPD0_RX_QUEUE_NUM		BIT(8)
 #define HAL_REO_CMD_UPD0_VLD			BIT(9)
 #define HAL_REO_CMD_UPD0_ALDC			BIT(10)
@@ -725,7 +725,7 @@ enum hal_rx_buf_return_buf_manager {
 #define HAL_REO_CMD_UPD0_PN_VALID		BIT(29)
 #define HAL_REO_CMD_UPD0_PN			BIT(30)
 
-/* Should be matching with HAL_REO_UPD_RX_QUEUE_INFO1_* feilds */
+/* Should be matching with HAL_REO_UPD_RX_QUEUE_INFO1_* fields */
 #define HAL_REO_CMD_UPD1_VLD			BIT(16)
 #define HAL_REO_CMD_UPD1_ALDC			GENMASK(18, 17)
 #define HAL_REO_CMD_UPD1_DIS_DUP_DETECTION	BIT(19)
@@ -741,7 +741,7 @@ enum hal_rx_buf_return_buf_manager {
 #define HAL_REO_CMD_UPD1_PN_HANDLE_ENABLE	BIT(30)
 #define HAL_REO_CMD_UPD1_IGNORE_AMPDU_FLG	BIT(31)
 
-/* Should be matching with HAL_REO_UPD_RX_QUEUE_INFO2_* feilds */
+/* Should be matching with HAL_REO_UPD_RX_QUEUE_INFO2_* fields */
 #define HAL_REO_CMD_UPD2_SVLD			BIT(10)
 #define HAL_REO_CMD_UPD2_SSN			GENMASK(22, 11)
 #define HAL_REO_CMD_UPD2_SEQ_2K_ERR		BIT(23)
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 9757ac4aae50..31ae9b384a29 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -2228,7 +2228,7 @@ static void ath11k_peer_assoc_h_vht(struct ath11k *ar,
 		__le16_to_cpu(vht_cap->vht_mcs.tx_mcs_map), vht_mcs_mask);
 
 	/* In IPQ8074 platform, VHT mcs rate 10 and 11 is enabled by default.
-	 * VHT mcs rate 10 and 11 is not suppoerted in 11ac standard.
+	 * VHT mcs rate 10 and 11 is not supported in 11ac standard.
 	 * so explicitly disable the VHT MCS rate 10 and 11 in 11ac mode.
 	 */
 	arg->tx_mcs_set &= ~IEEE80211_VHT_MCS_SUPPORT_0_11_MASK;
@@ -6950,7 +6950,7 @@ static void ath11k_mac_op_remove_interface(struct ieee80211_hw *hw,
 	/* Recalc txpower for remaining vdev */
 	ath11k_mac_txpower_recalc(ar);
 
-	/* TODO: recal traffic pause state based on the available vdevs */
+	/* TODO: recalc traffic pause state based on the available vdevs */
 
 	mutex_unlock(&ar->conf_mutex);
 }
-- 
2.47.0


