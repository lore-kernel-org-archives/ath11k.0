Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C142AC433F5
	for <ath11k@archiver.kernel.org>; Mon, 10 Jan 2022 03:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UNg9xWLVc3rw+/HdvwLSPty0oTxUEWbEH/h4r6biprg=; b=d7L2QFZYJ+87cC
	1rOB6jZKq2u5A7AXGIRZQL7fhv4NXXx4IhctNbFZbgZhn9joNY8nPMSqfXJxyIop6LyBUjNgn8oQP
	ik0BVxL4Jjf3M+QGVmSAa2g83wfCQPDVHt3+ZJWO1kRz3+1kKHXkToVTAxDYbAsfRiu61hvAGeWUx
	MaI83YNCNxPwvV7/qnOeqIXw6bP47d4+45QEHaQxKhrnI9fcsLCI6kwLTf/NvmscaE02C670v1qYT
	6Ym4xHmipJGcIzqqLM55EYDAV5DSVhB/C0EZbKEpLZQVnM/Thx8B0I4Vs3nxjBERJD1Gy3FIh0c8S
	oljZJW5QtFawj2et89Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6lZM-0096TW-LU; Mon, 10 Jan 2022 03:42:04 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6lZJ-0096SE-4x
 for ath11k@lists.infradead.org; Mon, 10 Jan 2022 03:42:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1641786121; x=1673322121;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=6atlCaAsXX8JPSzTnDoXyLuEau0LhlnX5CmM9kGW+vM=;
 b=Cq8xVrILLSg+lVqGxB4gLBGGx5TqRH4h5ZoGRiZtz7W8L7zDSRFtu7bf
 peIQvJqkG/oUfeNjNb9JCpqgHpmlatyFFuX7Z/Zz7w4NE83tVV9Dn04HE
 OoYmXtjSdVTq0p29L6TKLkoer80nQE8OzE3egjh2CjgEzNk40XfL3HZD7 I=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 09 Jan 2022 19:41:57 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2022 19:41:41 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Sun, 9 Jan 2022 19:41:41 -0800
Received: from seevalam-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Sun, 9 Jan 2022 19:41:39 -0800
From: Seevalamuthu Mariappan <quic_seevalam@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Seevalamuthu Mariappan
 <quic_seevalam@quicinc.com>
Subject: [PATCH] ath11k: Add support for dynamic vlan
Date: Mon, 10 Jan 2022 09:11:30 +0530
Message-ID: <1641786090-10232-1-git-send-email-quic_seevalam@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220109_194201_280108_3DD6B774 
X-CRM114-Status: GOOD (  19.03  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Advertise AP-VLAN interface type for vlan support in driver.
Metadata information in dp_tx is added to notify firmware
that multicast/broadcast packets are encrypted in software.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01073-QCAHKSWPL_SILICONZ-1

Signed-off-by: Seevalamuthu Mariappan <quic_seevalam@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c  |  6 +++
 drivers/net/wireless/ath/ath11k/dp_tx.c | 74 ++++++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/dp_tx.h | 14 +++++++
 drivers/net/wireless/ath/ath11k/hw.h    |  1 +
 drivers/net/wireless/ath/ath11k/mac.c   |  5 +++
 5 files changed, 98 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 293563b..0b2407e 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -86,6 +86,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.num_vdevs = 16 + 1,
 		.num_peers = 512,
 		.supports_suspend = false,
+		.supports_ap_vlan = true,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_ipq8074),
 		.supports_regdb = false,
 		.fix_l1ss = true,
@@ -150,6 +151,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.num_vdevs = 16 + 1,
 		.num_peers = 512,
 		.supports_suspend = false,
+		.supports_ap_vlan = true,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_ipq8074),
 		.supports_regdb = false,
 		.fix_l1ss = true,
@@ -213,6 +215,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.num_vdevs = 16 + 1,
 		.num_peers = 512,
 		.supports_suspend = true,
+		.supports_ap_vlan = false,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_ipq8074),
 		.supports_regdb = true,
 		.fix_l1ss = true,
@@ -276,6 +279,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.num_vdevs = 8,
 		.num_peers = 128,
 		.supports_suspend = false,
+		.supports_ap_vlan = true,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_qcn9074),
 		.supports_regdb = false,
 		.fix_l1ss = true,
@@ -339,6 +343,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.num_vdevs = 16 + 1,
 		.num_peers = 512,
 		.supports_suspend = true,
+		.supports_ap_vlan = false,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_wcn6855),
 		.supports_regdb = true,
 		.fix_l1ss = false,
@@ -401,6 +406,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.num_vdevs = 16 + 1,
 		.num_peers = 512,
 		.supports_suspend = true,
+		.supports_ap_vlan = false,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_wcn6855),
 		.supports_regdb = true,
 		.fix_l1ss = false,
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 91d6244..211a604 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -78,6 +78,44 @@ enum hal_encrypt_type ath11k_dp_tx_get_encrypt_type(u32 cipher)
 	}
 }
 
+#define HTT_META_DATA_ALIGNMENT    0x8
+
+static int ath11k_dp_metadata_align_skb(struct sk_buff *skb, u8 align_len)
+{
+	if (unlikely(skb_cow_head(skb, align_len)))
+		return -ENOMEM;
+
+	skb_push(skb, align_len);
+	memset(skb->data, 0, align_len);
+	return 0;
+}
+
+static int ath11k_dp_prepare_htt_metadata(struct sk_buff *skb,
+					  u8 *htt_metadata_size)
+{
+	u8 htt_desc_size;
+	/* Size rounded of multiple of 8 bytes */
+	u8 htt_desc_size_aligned;
+	struct htt_tx_msdu_desc_ext *desc_ext;
+	int ret;
+
+	htt_desc_size = sizeof(*desc_ext);
+	htt_desc_size_aligned = ALIGN(htt_desc_size, HTT_META_DATA_ALIGNMENT);
+
+	ret = ath11k_dp_metadata_align_skb(skb, htt_desc_size_aligned);
+	if (unlikely(ret))
+		return ret;
+
+	desc_ext = (struct htt_tx_msdu_desc_ext *)skb->data;
+	desc_ext->info0 =
+		__cpu_to_le32(FIELD_PREP(HTT_TX_MSDU_DESC_INFO0_VALID_ENCRYPT_TYPE, 1) |
+			      FIELD_PREP(HTT_TX_MSDU_DESC_INFO0_ENCRYPT_TYPE, 0) |
+			      FIELD_PREP(HTT_TX_MSDU_DESC_INFO0_HOST_TX_DESC_POOL, 1));
+	*htt_metadata_size = htt_desc_size_aligned;
+
+	return 0;
+}
+
 int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 		 struct ath11k_sta *arsta, struct sk_buff *skb)
 {
@@ -95,6 +133,7 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 	int ret;
 	u8 ring_selector = 0, ring_map = 0;
 	bool tcl_ring_retry;
+	u8 align_pad, htt_meta_size = 0;
 
 	if (unlikely(test_bit(ATH11K_FLAG_CRASH_FLUSH, &ar->ab->dev_flags)))
 		return -ESHUTDOWN;
@@ -211,15 +250,42 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 		goto fail_remove_idr;
 	}
 
+	/* Add metadata for sw encrypted vlan group traffic */
+	if (!test_bit(ATH11K_FLAG_HW_CRYPTO_DISABLED, &ar->ab->dev_flags) &&
+	    !(info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP) &&
+	    !info->control.hw_key &&
+	    ieee80211_has_protected(hdr->frame_control)) {
+		/* HW requirement is that metadata should always point to a
+		 * 8-byte aligned address. So we add alignment pad to start of
+		 * buffer. HTT Metadata should be ensured to be multiple of 8-bytes
+		 *  to get 8-byte aligned start address along with align_pad added
+		 */
+		align_pad = ((unsigned long)skb->data) & (HTT_META_DATA_ALIGNMENT - 1);
+		ret = ath11k_dp_metadata_align_skb(skb, align_pad);
+		if (unlikely(ret))
+			goto fail_remove_idr;
+
+		ti.pkt_offset += align_pad;
+		ret = ath11k_dp_prepare_htt_metadata(skb, &htt_meta_size);
+		if (unlikely(ret))
+			goto fail_pull_skb;
+
+		ti.pkt_offset += htt_meta_size;
+		ti.meta_data_flags |= HTT_TCL_META_DATA_VALID_HTT;
+		ti.flags0 |= FIELD_PREP(HAL_TCL_DATA_CMD_INFO1_TO_FW, 1);
+		ti.encap_type = HAL_TCL_ENCAP_TYPE_RAW;
+		ti.encrypt_type = HAL_ENCRYPT_TYPE_OPEN;
+	}
+
 	ti.paddr = dma_map_single(ab->dev, skb->data, skb->len, DMA_TO_DEVICE);
 	if (unlikely(dma_mapping_error(ab->dev, ti.paddr))) {
 		atomic_inc(&ab->soc_stats.tx_err.misc_fail);
 		ath11k_warn(ab, "failed to DMA map data Tx buffer\n");
 		ret = -ENOMEM;
-		goto fail_remove_idr;
+		goto fail_pull_skb;
 	}
 
-	ti.data_len = skb->len;
+	ti.data_len = skb->len - ti.pkt_offset;
 	skb_cb->paddr = ti.paddr;
 	skb_cb->vif = arvif->vif;
 	skb_cb->ar = ar;
@@ -274,6 +340,10 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 fail_unmap_dma:
 	dma_unmap_single(ab->dev, ti.paddr, ti.data_len, DMA_TO_DEVICE);
 
+fail_pull_skb:
+	if (ti.pkt_offset)
+		skb_pull(skb, ti.pkt_offset);
+
 fail_remove_idr:
 	spin_lock_bh(&tx_ring->tx_idr_lock);
 	idr_remove(&tx_ring->txbuf_idr,
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.h b/drivers/net/wireless/ath/ath11k/dp_tx.h
index e87d65b..95f8757 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.h
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.h
@@ -15,6 +15,20 @@ struct ath11k_dp_htt_wbm_tx_status {
 	int ack_rssi;
 };
 
+#define HTT_TX_MSDU_DESC_INFO0_VALID_ENCRYPT_TYPE	BIT(8)
+#define HTT_TX_MSDU_DESC_INFO0_ENCRYPT_TYPE		GENMASK(16, 15)
+#define HTT_TX_MSDU_DESC_INFO0_HOST_TX_DESC_POOL	BIT(31)
+
+struct htt_tx_msdu_desc_ext {
+	__le32 info0;
+	__le32 info1;
+	__le32 info2;
+	__le32 info3;
+	__le32 info4;
+	__le32 info5;
+	__le32 info6;
+} __packed;
+
 void ath11k_dp_tx_update_txcompl(struct ath11k *ar, struct hal_tx_status *ts);
 int ath11k_dp_tx_htt_h2t_ver_req_msg(struct ath11k_base *ab);
 int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 29934b3..dfe8d4c 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -181,6 +181,7 @@ struct ath11k_hw_params {
 	u32 num_vdevs;
 	u32 num_peers;
 	bool supports_suspend;
+	bool supports_ap_vlan;
 	u32 hal_desc_sz;
 	bool supports_regdb;
 	bool fix_l1ss;
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 07f499d..b035e29 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -8469,6 +8469,11 @@ static int __ath11k_mac_register(struct ath11k *ar)
 		 */
 		ar->hw->wiphy->interface_modes &= ~BIT(NL80211_IFTYPE_MONITOR);
 
+	if (ab->hw_params.supports_ap_vlan) {
+		ar->hw->wiphy->interface_modes |= BIT(NL80211_IFTYPE_AP_VLAN);
+		ar->hw->wiphy->software_iftypes |= BIT(NL80211_IFTYPE_AP_VLAN);
+	}
+
 	/* Apply the regd received during initialization */
 	ret = ath11k_regd_update(ar);
 	if (ret) {
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
