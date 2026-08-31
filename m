Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A457DC624C6
	for <ath11k@archiver.kernel.org>; Mon, 31 Aug 2026 13:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JcFqPQ4TWgXMnuZg61x6R9zAyZTT0bouo2OLeij6rhA=; b=AsRE6kEGz6PAFRqUm+mcCnM97+
	1jOjsUKFP7DtP953dEChiRiQTSgph44Y8RuDSJEXaei6BLm5kDRutUk2cCSNXCi7Hk4E7PJLDnfTc
	XIMoiJo7HnwV2y/V1cmS22XKodUBl/aEi60qBEXlCxFUW6v2jswwDnSMBSj0li9lqmKPLuDvRwBv8
	xEA2IZKfuaaWSzwtGB48ddo78QiGlz20nVVpw6ETaASPPrgK+Kbs9cS+IgK4UqP3iobN1mmRR8g1K
	2J+wINPjPm58MekSxbKOi5s9Y0yTISxAxV1vcrJOZaJF9mB50kfsdwiqyHtIfttOrtxa88NaTgnRs
	ikTfZFCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12Py-00000009YO8-2uoJ;
	Mon, 31 Aug 2026 13:51:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12Pw-00000009YN4-43mI
	for ath11k@lists.infradead.org;
	Mon, 31 Aug 2026 13:51:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4909D60211;
	Mon, 31 Aug 2026 13:51:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAB631F00A3D;
	Mon, 31 Aug 2026 13:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788184280;
	bh=JcFqPQ4TWgXMnuZg61x6R9zAyZTT0bouo2OLeij6rhA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TKwFqX6j44cQfaj+wnVOw8es1MnZZ6IY3hlkJctVp0b998Iyb6q15MR6ZCQPWNbnh
	 6ubOeaKyFguozVIxwKHrStnYJ8YDMcE+ClyG2kQnm4mhKORzKgfCaHjHI+vXWxouhR
	 BsTEaNDK59Jb7Xq126Nsap66zGYmrjBbQ6ISchQ+0cq0VHO3jobzO6yCXu+g69AtYd
	 sgKSwR4djguYLWnHJ2i2enitKQ/DkeU5L0mXBO4eFc9bHjmxQzt6j5oFZNwjPV1p+/
	 wu4qXzwLqvwhgWPfSmVLbUVNRPhIj6M/PUucah9Xf+DnKaARm9eXJKlvacHlTxwZGU
	 c5kHQI37ri8Wg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.18-6.1] wifi: ath11k: fix invalid data access in ath11k_dp_rx_h_undecap_nwifi
Date: Mon, 31 Aug 2026 09:30:26 -0400
Message-ID: <20260831133314.4125787-598-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831133314.4125787-1-sashal@kernel.org>
References: <20260831133314.4125787-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.18.48
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>

[ Upstream commit 6b471e9aefee9ed73278eb1141e0d8530a56fae9 ]

In certain cases, hardware might provide packets with a
length greater than the maximum native Wi-Fi header length.
This can lead to accessing and modifying fields in the header
within the ath11k_dp_rx_h_undecap_nwifi() function for the
DP_RX_DECAP_TYPE_NATIVE_WIFI decap type and
potentially result in invalid data access and memory corruption.

Kernel stack is corrupted in: ath11k_dp_rx_h_undecap+0x6b0/0x6b0 [ath11k]
Call trace:
 ath11k_dp_rx_h_mpdu+0x0/0x2e8 [ath11k]
 ath11k_dp_rx_h_mpdu+0x1e0/0x2e8 [ath11k]
 ath11k_dp_rx_wbm_err+0x1e0/0x450 [ath11k]
 ath11k_dp_rx_process_wbm_err+0x2fc/0x460 [ath11k]
 ath11k_dp_service_srng+0x2e0/0x348 [ath11k]

Add a sanity check before processing the SKB to prevent invalid
data access in the undecap native Wi-Fi function for the
DP_RX_DECAP_TYPE_NATIVE_WIFI decap type.

This adapted from the discussion/patch of the ath12k driver [1].

Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04685-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1

Link: https://lore.kernel.org/linux-wireless/20250211090302.4105141-1-tamizh.raja@oss.qualcomm.com/ # [1]
Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Link: https://patch.msgid.link/20260512022351.2033155-2-miaoqing.pan@oss.qualcomm.com
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

The background searches finished and match the earlier analysis:

- **Ath11k fix not in tree** — `git log --grep` found no commit for
  `ath11k_dp_rx_check_nwifi_hdr_len_valid` or the ath11k undecap_nwifi
  fix.
- **Ath12k analogue present** — `9a0dddfb30f12` (`wifi: ath12k: Fix
  invalid data access in ath12k_dp_rx_h_undecap_nwifi`) is already in
  v6.18.44.

That supports the **YES** backport verdict: the bug is still present in
ath11k here, and the fix is a proven port of code already merged for
ath12k in this tree.

 drivers/net/wireless/ath/ath11k/dp_rx.c | 50 +++++++++++++++++++++++--
 1 file changed, 47 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 330446f279cd6..1514f8657d546 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2501,6 +2501,29 @@ static void ath11k_dp_rx_deliver_msdu(struct ath11k *ar, struct napi_struct *nap
 	ieee80211_rx_napi(ar->hw, pubsta, msdu, napi);
 }
 
+static bool ath11k_dp_rx_check_nwifi_hdr_len_valid(struct ath11k_base *ab,
+						   struct hal_rx_desc *rx_desc,
+						   struct sk_buff *msdu)
+{
+	struct ieee80211_hdr *hdr;
+	u8 decap_type;
+	u32 hdr_len;
+
+	decap_type = ath11k_dp_rx_h_msdu_start_decap_type(ab, rx_desc);
+	if (decap_type != DP_RX_DECAP_TYPE_NATIVE_WIFI)
+		return true;
+
+	hdr = (struct ieee80211_hdr *)msdu->data;
+	hdr_len = ieee80211_hdrlen(hdr->frame_control);
+
+	if (likely(hdr_len <= DP_MAX_NWIFI_HDR_LEN))
+		return true;
+
+	ab->soc_stats.invalid_rbm++;
+	WARN_ON_ONCE(1);
+	return false;
+}
+
 static int ath11k_dp_rx_process_msdu(struct ath11k *ar,
 				     struct sk_buff *msdu,
 				     struct sk_buff_head *msdu_list,
@@ -2571,6 +2594,11 @@ static int ath11k_dp_rx_process_msdu(struct ath11k *ar,
 		}
 	}
 
+	if (unlikely(!ath11k_dp_rx_check_nwifi_hdr_len_valid(ab, rx_desc, msdu))) {
+		ret = -EINVAL;
+		goto free_out;
+	}
+
 	ath11k_dp_rx_h_ppdu(ar, rx_desc, rx_status);
 	ath11k_dp_rx_h_mpdu(ar, msdu, rx_desc, rx_status);
 
@@ -3306,6 +3334,12 @@ static int ath11k_dp_rx_h_verify_tkip_mic(struct ath11k *ar, struct ath11k_peer
 		    RX_FLAG_IV_STRIPPED | RX_FLAG_DECRYPTED;
 	skb_pull(msdu, hal_rx_desc_sz);
 
+	if (unlikely(!ath11k_dp_rx_check_nwifi_hdr_len_valid(ar->ab, rx_desc,
+							     msdu))) {
+		dev_kfree_skb_any(msdu);
+		return -EINVAL;
+	}
+
 	ath11k_dp_rx_h_ppdu(ar, rx_desc, rxs);
 	ath11k_dp_rx_h_undecap(ar, msdu, rx_desc,
 			       HAL_ENCRYPT_TYPE_TKIP_MIC, rxs, true);
@@ -3998,6 +4032,10 @@ static int ath11k_dp_rx_h_null_q_desc(struct ath11k *ar, struct sk_buff *msdu,
 		skb_put(msdu, hal_rx_desc_sz + l3pad_bytes + msdu_len);
 		skb_pull(msdu, hal_rx_desc_sz + l3pad_bytes);
 	}
+
+	if (unlikely(!ath11k_dp_rx_check_nwifi_hdr_len_valid(ar->ab, desc, msdu)))
+		return -EINVAL;
+
 	ath11k_dp_rx_h_ppdu(ar, desc, status);
 
 	ath11k_dp_rx_h_mpdu(ar, msdu, desc, status);
@@ -4042,7 +4080,7 @@ static bool ath11k_dp_rx_h_reo_err(struct ath11k *ar, struct sk_buff *msdu,
 	return drop;
 }
 
-static void ath11k_dp_rx_h_tkip_mic_err(struct ath11k *ar, struct sk_buff *msdu,
+static bool ath11k_dp_rx_h_tkip_mic_err(struct ath11k *ar, struct sk_buff *msdu,
 					struct ieee80211_rx_status *status)
 {
 	u16 msdu_len;
@@ -4050,6 +4088,7 @@ static void ath11k_dp_rx_h_tkip_mic_err(struct ath11k *ar, struct sk_buff *msdu,
 	u8 l3pad_bytes;
 	struct ath11k_skb_rxcb *rxcb = ATH11K_SKB_RXCB(msdu);
 	u32 hal_rx_desc_sz = ar->ab->hw_params.hal_desc_sz;
+	struct ath11k_base *ab = ar->ab;
 
 	rxcb->is_first_msdu = ath11k_dp_rx_h_msdu_end_first_msdu(ar->ab, desc);
 	rxcb->is_last_msdu = ath11k_dp_rx_h_msdu_end_last_msdu(ar->ab, desc);
@@ -4059,6 +4098,9 @@ static void ath11k_dp_rx_h_tkip_mic_err(struct ath11k *ar, struct sk_buff *msdu,
 	skb_put(msdu, hal_rx_desc_sz + l3pad_bytes + msdu_len);
 	skb_pull(msdu, hal_rx_desc_sz + l3pad_bytes);
 
+	if (unlikely(!ath11k_dp_rx_check_nwifi_hdr_len_valid(ab, desc, msdu)))
+		return true;
+
 	ath11k_dp_rx_h_ppdu(ar, desc, status);
 
 	status->flag |= (RX_FLAG_MMIC_STRIPPED | RX_FLAG_MMIC_ERROR |
@@ -4066,19 +4108,21 @@ static void ath11k_dp_rx_h_tkip_mic_err(struct ath11k *ar, struct sk_buff *msdu,
 
 	ath11k_dp_rx_h_undecap(ar, msdu, desc,
 			       HAL_ENCRYPT_TYPE_TKIP_MIC, status, false);
+
+	return false;
 }
 
 static bool ath11k_dp_rx_h_rxdma_err(struct ath11k *ar,  struct sk_buff *msdu,
 				     struct ieee80211_rx_status *status)
 {
 	struct ath11k_skb_rxcb *rxcb = ATH11K_SKB_RXCB(msdu);
-	bool drop = false;
+	bool drop;
 
 	ar->ab->soc_stats.rxdma_error[rxcb->err_code]++;
 
 	switch (rxcb->err_code) {
 	case HAL_REO_ENTR_RING_RXDMA_ECODE_TKIP_MIC_ERR:
-		ath11k_dp_rx_h_tkip_mic_err(ar, msdu, status);
+		drop = ath11k_dp_rx_h_tkip_mic_err(ar, msdu, status);
 		break;
 	default:
 		/* TODO: Review other rxdma error code to check if anything is
-- 
2.53.0


