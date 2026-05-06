Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70585CD3442
	for <ath11k@archiver.kernel.org>; Wed,  6 May 2026 13:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mvBq+xLHwx+fK/mB2YwxQsW3HjTF7InbZSrqKmztdrE=; b=HAXn+ksCbqV0GjFjuwRBj0gRy2
	3bDAEO61XN5cdKc8O8HfAGVHBWaUKtb/+YI5JATfodZM/odVxBVerusJ5oPQPSPfLbwGZHux0b36a
	PxDnliJP9dpfBz8rr6U1DPouAGoZaOTtnXUcQLSzkK1sEMRRfmOADiwKnNHmZbHJhVy5uqBDcPGVo
	Vst4Q/LY3fWqrcn2spi6Tnt3QXqIsKBf+dTzPFM5uddMuPIRt01VVhXl7yt/j0GEG4xOsu1kkVfXd
	LRVGUtDemoeUXa3DJTeLxmcIcxwuAq9FhT+HjOK9XL5vjdZ/EF1kp9h2mIOD5f8RUD/f9J/HiesQA
	QNFxXYgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcWX-00000000vvg-1sxA;
	Wed, 06 May 2026 13:42:49 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcWS-00000000vrc-3M5U
	for ath11k@lists.infradead.org;
	Wed, 06 May 2026 13:42:46 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-44b052142e1so2772840f8f.1
        for <ath11k@lists.infradead.org>; Wed, 06 May 2026 06:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778074963; x=1778679763; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mvBq+xLHwx+fK/mB2YwxQsW3HjTF7InbZSrqKmztdrE=;
        b=AkkNO2tAXahbwIT3ozmfkiv1WM2DJ3lmFmv9aDPe827PL6ZjMKd80EycPkBq/pMVl6
         nnX13VnTiC9+j7w7h7KP75Wo64gIYEE/FWs5zDq+bgwHWKK8je9k7NnK+136fGWvwai5
         1mu/XH2oSONJ1bkonHl19E5T5ev+3Nf5Ld+juUwEMsAyIuSIRw1mdEPA7Qz51x2dBJZS
         rx0P666LXbifBTMZEH8EHByYoT1XCoL+zgaf0UbOH2ggJODrYNzwpjQbIO3BjtH50KZw
         yS0WU+j8coHPi+Ci/QXb+aB/iKOijA5cmw8uqvqJdn51muCpDQcOnkqJuYwW1xY3L+uB
         iCyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778074963; x=1778679763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mvBq+xLHwx+fK/mB2YwxQsW3HjTF7InbZSrqKmztdrE=;
        b=Hi/2WVD0U7jEjmrz4/SO7ZhwnhuYQM7l6JxedA4VcMZg4dxn81JepGFZhX5Cs1KK/O
         1xOI1Bs8lCTK2pEI6Z2nff/qfVWfPsOP7c3TwB0bheFz1EgJDPEdUFbBWQq5nRAm73iT
         em0yKFIrUuhiNDfg23X1InQRJLckfc0mOKwGD3ifLvEbTKnp1JmG18JWYFr8aaWWG4+x
         cV1mfxG4gqpQcM5BaXu/WgEZ0FwnJlTJSrw9rLEBIiWwWO84pomeQDGwNe8RnuHPK9aL
         NxGbN6Ijs6zi5+9ePi9Iay0VISFQ3fWqf/G6HkP7D8OcXfCCTe1x4d/kJHNfh/j2yr0P
         uYig==
X-Gm-Message-State: AOJu0YwkNoNbnJ5SVryre3QaOETqrJvGyHPyOyTF7PpXd03OBlxEG7yw
	SnURaXxPNRGSg72g2L5QeSD/lBx+fK1LXx6HLzjDBK1fWFiGa54WKTrSEw0j7A==
X-Gm-Gg: AeBDies+ddytrmFy/CmXqjEG5ZofwbQf4h3kxifvMXD0aIe5jBlPaHTXRqnqr/kMHjY
	lKKOoRUTjpokwz1ujrLblzQMQS0cBrsIxETdV2O1Es0G/h5k2dRTBbaNsmeE1yxqkBS9ZVCZ6xX
	/QsRlGWoalImai8RcC/8Ow0GKuW4XXaqhDOueiGp1EmxIQ8kNJaCk6eYx0EXYrsmgR0IE7wTaEF
	BmptKA3YT1/lX8UMPjnkNTuO9Cg+RJAMkHg+6MXpX52Yv9jUlfdyuPKurXgDQSj3G1kWcrw7W8v
	G9959841N+k1VCB7CB+Z9dyhnSRnEKOBUMSpET1FbZjA6fXYkhg0Z6j7aISXspYj6hMAK6u2JHs
	3STQCUcB2z3KbeVuhEHt9prdZRIDmOx9gqH8cuf+gmVxOKMPxuf2A1oUMfnMgSjzbTNjEBF2qiS
	mWobm6c3O5Y1NQir3R/1sgjatdq5eQ9+xdvcSt90Kfa6T+gbMYnFnk1z7SL3ty1sQphOk=
X-Received: by 2002:a05:6000:2381:b0:43d:7261:8759 with SMTP id ffacd0b85a97d-4515d008856mr6046157f8f.28.1778074962344;
        Wed, 06 May 2026 06:42:42 -0700 (PDT)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45052483166sm12542182f8f.7.2026.05.06.06.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 06:42:41 -0700 (PDT)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH v2 2/3] wifi: ath11k: fix error path leaks in some WMI calls
Date: Wed,  6 May 2026 15:42:39 +0200
Message-ID: <20260506134240.2284016-3-nico.escande@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506134240.2284016-1-nico.escande@gmail.com>
References: <20260506134240.2284016-1-nico.escande@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_064246_249572_886CBC3C 
X-CRM114-Status: GOOD (  13.30  )
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

This is the same pattern that was previously identified as problematic:
direct 'return ath11k_wmi_cmd_send(...)' will leak the skb in the error
path if it is not explicitly handled.

Fixes: c417b247ba04 ("ath11k: implement hardware data filter")
Fixes: 9cbd7fc9be82 ("ath11k: support MAC address randomization in scan")
Fixes: ba9177fcef21 ("ath11k: Add basic WoW functionalities")
Fixes: fec4b898f369 ("ath11k: Add WoW net-detect functionality")
Fixes: c3c36bfe998b ("ath11k: support ARP and NS offload")
Fixes: a16d9b50cfba ("ath11k: support GTK rekey offload")
Fixes: 652f69ed9c1b ("ath11k: Add support for SAR")
Fixes: 0f84a156aa3b ("ath11k: Handle keepalive during WoWLAN suspend and resume")
Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 112 ++++++++++++++++++++++----
 1 file changed, 96 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 024c2aad9fb4..dca6e011cc40 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -9299,7 +9299,7 @@ int ath11k_wmi_hw_data_filter_cmd(struct ath11k *ar, u32 vdev_id,
 {
 	struct wmi_hw_data_filter_cmd *cmd;
 	struct sk_buff *skb;
-	int len;
+	int ret, len;
 
 	len = sizeof(*cmd);
 	skb = ath11k_wmi_alloc_skb(ar->wmi->wmi_ab, len);
@@ -9324,7 +9324,13 @@ int ath11k_wmi_hw_data_filter_cmd(struct ath11k *ar, u32 vdev_id,
 		   "hw data filter enable %d filter_bitmap 0x%x\n",
 		   enable, filter_bitmap);
 
-	return ath11k_wmi_cmd_send(ar->wmi, skb, WMI_HW_DATA_FILTER_CMDID);
+	ret = ath11k_wmi_cmd_send(ar->wmi, skb, WMI_HW_DATA_FILTER_CMDID);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to send WMI_HW_DATA_FILTER_CMDID\n");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
 }
 
 int ath11k_wmi_wow_host_wakeup_ind(struct ath11k *ar)
@@ -9389,7 +9395,7 @@ int ath11k_wmi_scan_prob_req_oui(struct ath11k *ar,
 	struct sk_buff *skb;
 	struct wmi_scan_prob_req_oui_cmd *cmd;
 	u32 prob_req_oui;
-	int len;
+	int ret, len;
 
 	prob_req_oui = (((u32)mac_addr[0]) << 16) |
 		       (((u32)mac_addr[1]) << 8) | mac_addr[2];
@@ -9408,7 +9414,13 @@ int ath11k_wmi_scan_prob_req_oui(struct ath11k *ar,
 	ath11k_dbg(ar->ab, ATH11K_DBG_WMI, "scan prob req oui %d\n",
 		   prob_req_oui);
 
-	return ath11k_wmi_cmd_send(ar->wmi, skb, WMI_SCAN_PROB_REQ_OUI_CMDID);
+	ret = ath11k_wmi_cmd_send(ar->wmi, skb, WMI_SCAN_PROB_REQ_OUI_CMDID);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to send WMI_SCAN_PROB_REQ_OUI_CMDID\n");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
 }
 
 int ath11k_wmi_wow_add_wakeup_event(struct ath11k *ar, u32 vdev_id,
@@ -9418,6 +9430,7 @@ int ath11k_wmi_wow_add_wakeup_event(struct ath11k *ar, u32 vdev_id,
 	struct wmi_wow_add_del_event_cmd *cmd;
 	struct sk_buff *skb;
 	size_t len;
+	int ret;
 
 	len = sizeof(*cmd);
 	skb = ath11k_wmi_alloc_skb(ar->wmi->wmi_ab, len);
@@ -9435,7 +9448,13 @@ int ath11k_wmi_wow_add_wakeup_event(struct ath11k *ar, u32 vdev_id,
 	ath11k_dbg(ar->ab, ATH11K_DBG_WMI, "tlv wow add wakeup event %s enable %d vdev_id %d\n",
 		   wow_wakeup_event(event), enable, vdev_id);
 
-	return ath11k_wmi_cmd_send(ar->wmi, skb, WMI_WOW_ENABLE_DISABLE_WAKE_EVENT_CMDID);
+	ret = ath11k_wmi_cmd_send(ar->wmi, skb, WMI_WOW_ENABLE_DISABLE_WAKE_EVENT_CMDID);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to send WMI_WOW_ENABLE_DISABLE_WAKE_EVENT_CMDID\n");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
 }
 
 int ath11k_wmi_wow_add_pattern(struct ath11k *ar, u32 vdev_id, u32 pattern_id,
@@ -9448,6 +9467,7 @@ int ath11k_wmi_wow_add_pattern(struct ath11k *ar, u32 vdev_id, u32 pattern_id,
 	struct sk_buff *skb;
 	u8 *ptr;
 	size_t len;
+	int ret;
 
 	len = sizeof(*cmd) +
 	      sizeof(*tlv) +			/* array struct */
@@ -9540,7 +9560,13 @@ int ath11k_wmi_wow_add_pattern(struct ath11k *ar, u32 vdev_id, u32 pattern_id,
 	ath11k_dbg(ar->ab, ATH11K_DBG_WMI, "tlv wow add pattern vdev_id %d pattern_id %d pattern_offset %d\n",
 		   vdev_id, pattern_id, pattern_offset);
 
-	return ath11k_wmi_cmd_send(ar->wmi, skb, WMI_WOW_ADD_WAKE_PATTERN_CMDID);
+	ret = ath11k_wmi_cmd_send(ar->wmi, skb, WMI_WOW_ADD_WAKE_PATTERN_CMDID);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to send WMI_WOW_ADD_WAKE_PATTERN_CMDID\n");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
 }
 
 int ath11k_wmi_wow_del_pattern(struct ath11k *ar, u32 vdev_id, u32 pattern_id)
@@ -9548,6 +9574,7 @@ int ath11k_wmi_wow_del_pattern(struct ath11k *ar, u32 vdev_id, u32 pattern_id)
 	struct wmi_wow_del_pattern_cmd *cmd;
 	struct sk_buff *skb;
 	size_t len;
+	int ret;
 
 	len = sizeof(*cmd);
 	skb = ath11k_wmi_alloc_skb(ar->wmi->wmi_ab, len);
@@ -9566,7 +9593,13 @@ int ath11k_wmi_wow_del_pattern(struct ath11k *ar, u32 vdev_id, u32 pattern_id)
 	ath11k_dbg(ar->ab, ATH11K_DBG_WMI, "tlv wow del pattern vdev_id %d pattern_id %d\n",
 		   vdev_id, pattern_id);
 
-	return ath11k_wmi_cmd_send(ar->wmi, skb, WMI_WOW_DEL_WAKE_PATTERN_CMDID);
+	ret = ath11k_wmi_cmd_send(ar->wmi, skb, WMI_WOW_DEL_WAKE_PATTERN_CMDID);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to send WMI_WOW_DEL_WAKE_PATTERN_CMDID\n");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
 }
 
 static struct sk_buff *
@@ -9710,6 +9743,7 @@ int ath11k_wmi_wow_config_pno(struct ath11k *ar, u32 vdev_id,
 			      struct wmi_pno_scan_req  *pno_scan)
 {
 	struct sk_buff *skb;
+	int ret;
 
 	if (pno_scan->enable)
 		skb = ath11k_wmi_op_gen_config_pno_start(ar, vdev_id, pno_scan);
@@ -9719,7 +9753,13 @@ int ath11k_wmi_wow_config_pno(struct ath11k *ar, u32 vdev_id,
 	if (IS_ERR_OR_NULL(skb))
 		return -ENOMEM;
 
-	return ath11k_wmi_cmd_send(ar->wmi, skb, WMI_NETWORK_LIST_OFFLOAD_CONFIG_CMDID);
+	ret = ath11k_wmi_cmd_send(ar->wmi, skb, WMI_NETWORK_LIST_OFFLOAD_CONFIG_CMDID);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to send WMI_NETWORK_LIST_OFFLOAD_CONFIG_CMDID\n");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
 }
 
 static void ath11k_wmi_fill_ns_offload(struct ath11k *ar,
@@ -9837,6 +9877,7 @@ int ath11k_wmi_arp_ns_offload(struct ath11k *ar,
 	u8 *buf_ptr;
 	size_t len;
 	u8 ns_cnt, ns_ext_tuples = 0;
+	int ret;
 
 	offload = &arvif->arp_ns_offload;
 	ns_cnt = offload->ipv6_count;
@@ -9875,7 +9916,13 @@ int ath11k_wmi_arp_ns_offload(struct ath11k *ar,
 	if (ns_ext_tuples)
 		ath11k_wmi_fill_ns_offload(ar, offload, &buf_ptr, enable, 1);
 
-	return ath11k_wmi_cmd_send(ar->wmi, skb, WMI_SET_ARP_NS_OFFLOAD_CMDID);
+	ret = ath11k_wmi_cmd_send(ar->wmi, skb, WMI_SET_ARP_NS_OFFLOAD_CMDID);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to send WMI_SET_ARP_NS_OFFLOAD_CMDID\n");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
 }
 
 int ath11k_wmi_gtk_rekey_offload(struct ath11k *ar,
@@ -9883,7 +9930,7 @@ int ath11k_wmi_gtk_rekey_offload(struct ath11k *ar,
 {
 	struct wmi_gtk_rekey_offload_cmd *cmd;
 	struct ath11k_rekey_data *rekey_data = &arvif->rekey_data;
-	int len;
+	int ret, len;
 	struct sk_buff *skb;
 	__le64 replay_ctr;
 
@@ -9917,14 +9964,20 @@ int ath11k_wmi_gtk_rekey_offload(struct ath11k *ar,
 
 	ath11k_dbg(ar->ab, ATH11K_DBG_WMI, "offload gtk rekey vdev: %d %d\n",
 		   arvif->vdev_id, enable);
-	return ath11k_wmi_cmd_send(ar->wmi, skb, WMI_GTK_OFFLOAD_CMDID);
+	ret = ath11k_wmi_cmd_send(ar->wmi, skb, WMI_GTK_OFFLOAD_CMDID);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to send WMI_GTK_OFFLOAD_CMDID offload\n");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
 }
 
 int ath11k_wmi_gtk_rekey_getinfo(struct ath11k *ar,
 				 struct ath11k_vif *arvif)
 {
 	struct wmi_gtk_rekey_offload_cmd *cmd;
-	int len;
+	int ret, len;
 	struct sk_buff *skb;
 
 	len = sizeof(*cmd);
@@ -9941,7 +9994,13 @@ int ath11k_wmi_gtk_rekey_getinfo(struct ath11k *ar,
 
 	ath11k_dbg(ar->ab, ATH11K_DBG_WMI, "get gtk rekey vdev_id: %d\n",
 		   arvif->vdev_id);
-	return ath11k_wmi_cmd_send(ar->wmi, skb, WMI_GTK_OFFLOAD_CMDID);
+	ret = ath11k_wmi_cmd_send(ar->wmi, skb, WMI_GTK_OFFLOAD_CMDID);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to send WMI_GTK_OFFLOAD_CMDID getinfo\n");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
 }
 
 int ath11k_wmi_pdev_set_bios_sar_table_param(struct ath11k *ar, const u8 *sar_val)
@@ -9951,6 +10010,7 @@ int ath11k_wmi_pdev_set_bios_sar_table_param(struct ath11k *ar, const u8 *sar_va
 	struct sk_buff *skb;
 	u8 *buf_ptr;
 	u32 len, sar_len_aligned, rsvd_len_aligned;
+	int ret;
 
 	sar_len_aligned = roundup(BIOS_SAR_TABLE_LEN, sizeof(u32));
 	rsvd_len_aligned = roundup(BIOS_SAR_RSVD1_LEN, sizeof(u32));
@@ -9981,7 +10041,13 @@ int ath11k_wmi_pdev_set_bios_sar_table_param(struct ath11k *ar, const u8 *sar_va
 	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_BYTE) |
 		      FIELD_PREP(WMI_TLV_LEN, rsvd_len_aligned);
 
-	return ath11k_wmi_cmd_send(wmi, skb, WMI_PDEV_SET_BIOS_SAR_TABLE_CMDID);
+	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_PDEV_SET_BIOS_SAR_TABLE_CMDID);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to send WMI_PDEV_SET_BIOS_SAR_TABLE_CMDID\n");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
 }
 
 int ath11k_wmi_pdev_set_bios_geo_table_param(struct ath11k *ar)
@@ -9992,6 +10058,7 @@ int ath11k_wmi_pdev_set_bios_geo_table_param(struct ath11k *ar)
 	struct sk_buff *skb;
 	u8 *buf_ptr;
 	u32 len, rsvd_len_aligned;
+	int ret;
 
 	rsvd_len_aligned = roundup(BIOS_SAR_RSVD2_LEN, sizeof(u32));
 	len = sizeof(*cmd) + TLV_HDR_SIZE + rsvd_len_aligned;
@@ -10011,7 +10078,13 @@ int ath11k_wmi_pdev_set_bios_geo_table_param(struct ath11k *ar)
 	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_BYTE) |
 		      FIELD_PREP(WMI_TLV_LEN, rsvd_len_aligned);
 
-	return ath11k_wmi_cmd_send(wmi, skb, WMI_PDEV_SET_BIOS_GEO_TABLE_CMDID);
+	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_PDEV_SET_BIOS_GEO_TABLE_CMDID);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to send WMI_PDEV_SET_BIOS_GEO_TABLE_CMDID\n");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
 }
 
 int ath11k_wmi_sta_keepalive(struct ath11k *ar,
@@ -10022,6 +10095,7 @@ int ath11k_wmi_sta_keepalive(struct ath11k *ar,
 	struct wmi_sta_keepalive_arp_resp *arp;
 	struct sk_buff *skb;
 	size_t len;
+	int ret;
 
 	len = sizeof(*cmd) + sizeof(*arp);
 	skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, len);
@@ -10053,7 +10127,13 @@ int ath11k_wmi_sta_keepalive(struct ath11k *ar,
 		   "sta keepalive vdev %d enabled %d method %d interval %d\n",
 		   arg->vdev_id, arg->enabled, arg->method, arg->interval);
 
-	return ath11k_wmi_cmd_send(wmi, skb, WMI_STA_KEEPALIVE_CMDID);
+	ret = ath11k_wmi_cmd_send(wmi, skb, WMI_STA_KEEPALIVE_CMDID);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to send WMI_STA_KEEPALIVE_CMDID\n");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
 }
 
 bool ath11k_wmi_supports_6ghz_cc_ext(struct ath11k *ar)
-- 
2.54.0


