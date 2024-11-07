Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC05D5AE74
	for <ath11k@archiver.kernel.org>; Thu,  7 Nov 2024 08:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uxrRGgJA297ioDznUrIABtmHdW7eugoHDl+39LPbelg=; b=Eol4Ap9PKFTJNsizZPzK9Dm723
	nLMx4UrICYQRu3azrYtY0j1ZndVSbfYiHNDSUAfo4PJLuf+dU62RRd5YNyd4EDI4bjfQeiPg2KTk0
	cabbsGOEpIvoof2qLXOgnJa3WB8qlsjehKAyfd17up/85MiHfe7I/CUDDjh08l2JQ7G+kD5rifTyy
	wuqF0Xdq1057mKUv8w7I0fYl60rn0tXRaRwFpTMnQE+AedVXked8wCI6wiBl0F+J7f2ZF9HSMgHPY
	uwJjxSVFXDc4BizvHKB6rWXi69+/qYHmymOtHZz66cJDL5BuHOgaTLuzRg1V4lUwRsmBlIOe/7pYy
	H5+V6R5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8yIG-00000006Cjk-3MRl;
	Thu, 07 Nov 2024 08:55:08 +0000
Received: from forward101a.mail.yandex.net ([2a02:6b8:c0e:500:1:45:d181:d101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8yIC-00000006CgB-1Wb1
	for ath11k@lists.infradead.org;
	Thu, 07 Nov 2024 08:55:07 +0000
Received: from mail-nwsmtp-smtp-production-main-74.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-74.vla.yp-c.yandex.net [IPv6:2a02:6b8:c15:2e9d:0:640:5e79:0])
	by forward101a.mail.yandex.net (Yandex) with ESMTPS id 06CE460CFD;
	Thu,  7 Nov 2024 11:54:58 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-74.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id usdEEKE7UKo0-QaO0hTm5;
	Thu, 07 Nov 2024 11:54:57 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1730969697; bh=uxrRGgJA297ioDznUrIABtmHdW7eugoHDl+39LPbelg=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=rL01RQJ6/kemz9i7bwfoFFitjHLi5mLX2Bk9XcFohe3nyymISMbIMeil0OCkSJoLv
	 b35lMBimtknZi/yZEt6vZ0eVzLpIbWyxttOCaZhnahMXWiKBNiGDXAbL3FfCu8euxu
	 umWQ9Zp2RC63oWvzxPO/PBWIqTBTT7AeFjC3l2aA=
Authentication-Results: mail-nwsmtp-smtp-production-main-74.vla.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH 2/2] wifi: ath11k: miscellaneous spelling fixes
Date: Thu,  7 Nov 2024 11:54:55 +0300
Message-ID: <20241107085455.78788-2-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241107085455.78788-1-dmantipov@yandex.ru>
References: <20241107085455.78788-1-dmantipov@yandex.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_005504_832727_729ABA47 
X-CRM114-Status: GOOD (  11.23  )
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


