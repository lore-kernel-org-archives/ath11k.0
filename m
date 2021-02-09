Return-Path: <SRS0=1RzP=HL=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35640C433DB
	for <ath11k@archiver.kernel.org>; Tue,  9 Feb 2021 04:09:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C550864EAA
	for <ath11k@archiver.kernel.org>; Tue,  9 Feb 2021 04:09:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C550864EAA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y0Q9Q/Xfgl8DQ/9LcZ2KhU3WQWcDjWapyA6kwittFvs=; b=wEFAp3Kq1W0cVNXXSS4uFEeBP1
	hD7OsLu5XqDiVhZqFURKSBJUKbuAuQF4h7mFEOUIotPU7qMg94EHCr0efdtBfgiGA5pk5lMHUeeUQ
	/LGqwLe13Qg6qU57KV9bs1qMZ5TyuVxM0Hc7TN6/TNLL4qFPFT2F1zYsC8/23cRDEFTIks3kTRuvX
	34phBk0qkfze2Aj9llDUWlL9zFvlJKSqvgdCfJtwCd0HQoX4Fd2DHvTJHVZAni8o1OhOLKEYrlvx/
	u/d3WAHD4tBlge6O/jjdZewkRG9QK6Yl0+nwjguPdDSZPNroP5YfI3SmoAXxSDd0LwZ3np/F/DISC
	F3ej+5aA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9KL1-00035b-D5; Tue, 09 Feb 2021 04:09:19 +0000
Received: from so15.mailgun.net ([198.61.254.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9KKj-0002wd-LK
 for ath11k@lists.infradead.org; Tue, 09 Feb 2021 04:09:08 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1612843741; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=R50Akbwfk42o23JYjHXRgvMaipp7nxsQALd9/x1OWSk=;
 b=sEC37BLiIHmgXoHixjnyM0AQmH6fztPlc6bxFiIw8mN6GUzkYC4l1x7PKfKrBi9SEDHl9obv
 DsmAQD4nGsz4cq1y1FCPGEqhqx9LaMX6thspsnP1NNSic/pAFJXlYMkuSTVLbjd4NZnPsLdV
 fMCkGrr5u/sSkxF9NkEka3VKUDc=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60220adae3df861f4bd8d860 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Feb 2021 04:08:58
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8130DC43461; Tue,  9 Feb 2021 04:08:57 +0000 (UTC)
Received: from rmanohar-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: rmanohar)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 02603C433CA;
 Tue,  9 Feb 2021 04:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 02603C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=rmanohar@codeaurora.org
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
To: ath11k@lists.infradead.org
Subject: [PATCH] ath11k: add support to configure spatial reuse parameter set
Date: Mon,  8 Feb 2021 20:08:34 -0800
Message-Id: <1612843714-29174-1-git-send-email-rmanohar@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_230901_896618_8689C043 
X-CRM114-Status: GOOD (  18.50  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: linux-wireless@vger.kernel.org,
 Rajkumar Manoharan <rmanohar@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

The SPR parameter set comprises OBSS PD threshold for SRG
and non SRG and Bitmap of BSS color and partial BSSID. This adds
support to configure fields of SPR element to firmware.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01164-QCAHKSWPL_SILICONZ-1
Tested-by: Muna Sinada <msinada@codeaurora.org>
Signed-off-by: Rajkumar Manoharan <rmanohar@codeaurora.org>
---
 .../net/wireless/ath/ath11k/debugfs_htt_stats.c    |  12 ++
 .../net/wireless/ath/ath11k/debugfs_htt_stats.h    |  15 +-
 drivers/net/wireless/ath/ath11k/mac.c              | 154 +++++++++++++-
 drivers/net/wireless/ath/ath11k/mac.h              |   6 +
 drivers/net/wireless/ath/ath11k/wmi.c              | 227 +++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.h              |  37 +++-
 6 files changed, 446 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c
index 9191ffa081c2..e13684343ec3 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c
@@ -3845,6 +3845,18 @@ htt_print_pdev_obss_pd_stats_tlv_v(const void *tag_buf,
 			   htt_stats_buf->num_obss_tx_ppdu_success);
 	len += HTT_DBG_OUT(buf + len, buf_len - len, "OBSS Tx failures PPDU = %u\n",
 			   htt_stats_buf->num_obss_tx_ppdu_failure);
+	len += HTT_DBG_OUT(buf + len, buf_len - len, "Non-SRG Opportunities = %u\n",
+			   htt_stats_buf->num_non_srg_opportunities);
+	len += HTT_DBG_OUT(buf + len, buf_len - len, "Non-SRG tried PPDU = %u\n",
+			   htt_stats_buf->num_non_srg_ppdu_tried);
+	len += HTT_DBG_OUT(buf + len, buf_len - len, "Non-SRG success PPDU = %u\n",
+			   htt_stats_buf->num_non_srg_ppdu_success);
+	len += HTT_DBG_OUT(buf + len, buf_len - len, "SRG Opportunies = %u\n",
+			   htt_stats_buf->num_srg_opportunities);
+	len += HTT_DBG_OUT(buf + len, buf_len - len, "SRG tried PPDU = %u\n",
+			   htt_stats_buf->num_srg_ppdu_tried);
+	len += HTT_DBG_OUT(buf + len, buf_len - len, "SRG success PPDU = %u\n",
+			   htt_stats_buf->num_srg_ppdu_success);
 
 	if (len >= buf_len)
 		buf[buf_len - 1] = 0;
diff --git a/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.h b/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.h
index 74b2086eed9d..567a26d485a9 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.h
+++ b/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.h
@@ -1656,8 +1656,19 @@ struct htt_tx_sounding_stats_tlv {
 };
 
 struct htt_pdev_obss_pd_stats_tlv {
-	u32        num_obss_tx_ppdu_success;
-	u32        num_obss_tx_ppdu_failure;
+	u32 num_obss_tx_ppdu_success;
+	u32 num_obss_tx_ppdu_failure;
+	u32 num_sr_tx_transmissions;
+	u32 num_spatial_reuse_opportunities;
+	u32 num_non_srg_opportunities;
+	u32 num_non_srg_ppdu_tried;
+	u32 num_non_srg_ppdu_success;
+	u32 num_srg_opportunities;
+	u32 num_srg_ppdu_tried;
+	u32 num_srg_ppdu_success;
+	u32 num_psr_opportunities;
+	u32 num_psr_ppdu_tried;
+	u32 num_psr_ppdu_success;
 };
 
 struct htt_ring_backpressure_stats_tlv {
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 288720c5ab01..312a7a1d49b3 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1871,6 +1871,157 @@ static int ath11k_mac_fils_discovery(struct ath11k_vif *arvif,
 	return ret;
 }
 
+static int ath11k_mac_config_obss_pd(struct ath11k *ar,
+				     struct ieee80211_he_obss_pd *he_obss_pd)
+{
+	u32 bitmap[2], param_id, param_val, pdev_id;
+	int ret;
+	s8 non_srg_th = 0, srg_th = 0;
+
+	pdev_id = ar->pdev->pdev_id;
+
+	/* Set and enable SRG/non-SRG OBSS PD Threshold */
+	param_id = WMI_PDEV_PARAM_SET_CMD_OBSS_PD_THRESHOLD;
+	if (test_bit(ATH11K_FLAG_MONITOR_ENABLED, &ar->monitor_flags)) {
+		ret = ath11k_wmi_pdev_set_param(ar, param_id, 0, pdev_id);
+		if (ret)
+			ath11k_warn(ar->ab,
+				    "Failed to set obss_pd_threshold for pdev: %u\n",
+				    pdev_id);
+		return ret;
+	}
+
+	ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
+		   "OBSS PD Params: sr_ctrl %x non_srg_thres %u srg_max %u\n",
+		   he_obss_pd->sr_ctrl, he_obss_pd->non_srg_max_offset,
+		   he_obss_pd->max_offset);
+
+	param_val = 0;
+	if (he_obss_pd->sr_ctrl &
+	    IEEE80211_HE_SPR_NON_SRG_OBSS_PD_SR_DISALLOWED) {
+		non_srg_th = ATH11K_OBSS_PD_MAX_THRESHOLD;
+	} else {
+		if (he_obss_pd->sr_ctrl &
+		    IEEE80211_HE_SPR_NON_SRG_OFFSET_PRESENT)
+			non_srg_th = (ATH11K_OBSS_PD_MAX_THRESHOLD +
+				      he_obss_pd->non_srg_max_offset);
+		else
+			non_srg_th = ATH11K_OBSS_PD_NON_SRG_MAX_THRESHOLD;
+		param_val |= ATH11K_OBSS_PD_NON_SRG_EN;
+	}
+
+	if (he_obss_pd->sr_ctrl & IEEE80211_HE_SPR_SRG_INFORMATION_PRESENT) {
+		srg_th = ATH11K_OBSS_PD_MAX_THRESHOLD + he_obss_pd->max_offset;
+		param_val |= ATH11K_OBSS_PD_SRG_EN;
+	}
+
+	if (test_bit(WMI_TLV_SERVICE_SRG_SRP_SPATIAL_REUSE_SUPPORT,
+		     ar->ab->wmi_ab.svc_map)) {
+		param_val |= ATH11K_OBSS_PD_THRESHOLD_IN_DBM;
+		param_val |= FIELD_PREP(GENMASK(15, 8), srg_th);
+	} else {
+		non_srg_th -= ATH11K_DEFAULT_NOISE_FLOOR;
+		/* SRG not supported and threshold in dB */
+		param_val &= ~(ATH11K_OBSS_PD_SRG_EN |
+			       ATH11K_OBSS_PD_THRESHOLD_IN_DBM);
+	}
+
+	param_val |= (non_srg_th & GENMASK(7, 0));
+	ret = ath11k_wmi_pdev_set_param(ar, param_id, param_val, pdev_id);
+	if (ret) {
+		ath11k_warn(ar->ab,
+			    "Failed to set obss_pd_threshold for pdev: %u\n",
+			    pdev_id);
+		return ret;
+	}
+
+	/* Enable OBSS PD for all access category */
+	param_id  = WMI_PDEV_PARAM_SET_CMD_OBSS_PD_PER_AC;
+	param_val = 0xf;
+	ret = ath11k_wmi_pdev_set_param(ar, param_id, param_val, pdev_id);
+	if (ret) {
+		ath11k_warn(ar->ab,
+			    "Failed to set obss_pd_per_ac for pdev: %u\n",
+			    pdev_id);
+		return ret;
+	}
+
+	/* Set SR Prohibit */
+	param_id  = WMI_PDEV_PARAM_ENABLE_SR_PROHIBIT;
+	param_val = !!(he_obss_pd->sr_ctrl &
+		       IEEE80211_HE_SPR_HESIGA_SR_VAL15_ALLOWED);
+	ret = ath11k_wmi_pdev_set_param(ar, param_id, param_val, pdev_id);
+	if (ret) {
+		ath11k_warn(ar->ab, "Failed to set sr_prohibit for pdev: %u\n",
+			    pdev_id);
+		return ret;
+	}
+
+	if (!test_bit(WMI_TLV_SERVICE_SRG_SRP_SPATIAL_REUSE_SUPPORT,
+		      ar->ab->wmi_ab.svc_map))
+		return 0;
+
+	/* Set SRG BSS Color Bitmap */
+	memcpy(bitmap, he_obss_pd->bss_color_bitmap, sizeof(bitmap));
+	ret = ath11k_wmi_pdev_set_srg_bss_color_bitmap(ar, bitmap);
+	if (ret) {
+		ath11k_warn(ar->ab,
+			    "Failed to set bss_color_bitmap for pdev: %u\n",
+			    pdev_id);
+		return ret;
+	}
+
+	/* Set SRG Partial BSSID Bitmap */
+	memcpy(bitmap, he_obss_pd->partial_bssid_bitmap, sizeof(bitmap));
+	ret = ath11k_wmi_pdev_set_srg_patial_bssid_bitmap(ar, bitmap);
+	if (ret) {
+		ath11k_warn(ar->ab,
+			    "Failed to set partial_bssid_bitmap for pdev: %u\n",
+			    pdev_id);
+		return ret;
+	}
+
+	memset(bitmap, 0xff, sizeof(bitmap));
+
+	/* Enable all BSS Colors for SRG */
+	ret = ath11k_wmi_pdev_srg_obss_color_enable_bitmap(ar, bitmap);
+	if (ret) {
+		ath11k_warn(ar->ab,
+			    "Failed to set srg_color_en_bitmap pdev: %u\n",
+			    pdev_id);
+		return ret;
+	}
+
+	/* Enable all patial BSSID mask for SRG */
+	ret = ath11k_wmi_pdev_srg_obss_bssid_enable_bitmap(ar, bitmap);
+	if (ret) {
+		ath11k_warn(ar->ab,
+			    "Failed to set srg_bssid_en_bitmap pdev: %u\n",
+			    pdev_id);
+		return ret;
+	}
+
+	/* Enable all BSS Colors for non-SRG */
+	ret = ath11k_wmi_pdev_non_srg_obss_color_enable_bitmap(ar, bitmap);
+	if (ret) {
+		ath11k_warn(ar->ab,
+			    "Failed to set non_srg_color_en_bitmap pdev: %u\n",
+			    pdev_id);
+		return ret;
+	}
+
+	/* Enable all patial BSSID mask for non-SRG */
+	ret = ath11k_wmi_pdev_non_srg_obss_bssid_enable_bitmap(ar, bitmap);
+	if (ret) {
+		ath11k_warn(ar->ab,
+			    "Failed to set non_srg_bssid_en_bitmap pdev: %u\n",
+			    pdev_id);
+		return ret;
+	}
+
+	return 0;
+}
+
 static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 					   struct ieee80211_vif *vif,
 					   struct ieee80211_bss_conf *info,
@@ -2114,8 +2265,7 @@ static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 	}
 
 	if (changed & BSS_CHANGED_HE_OBSS_PD)
-		ath11k_wmi_send_obss_spr_cmd(ar, arvif->vdev_id,
-					     &info->he_obss_pd);
+		ath11k_mac_config_obss_pd(ar, &info->he_obss_pd);
 
 	if (changed & BSS_CHANGED_HE_BSS_COLOR) {
 		if (vif->type == NL80211_IFTYPE_AP) {
diff --git a/drivers/net/wireless/ath/ath11k/mac.h b/drivers/net/wireless/ath/ath11k/mac.h
index 597104a9078d..455577905505 100644
--- a/drivers/net/wireless/ath/ath11k/mac.h
+++ b/drivers/net/wireless/ath/ath11k/mac.h
@@ -116,6 +116,12 @@ struct ath11k_generic_iter {
 
 #define ATH11K_CHAN_WIDTH_NUM			8
 
+#define ATH11K_OBSS_PD_MAX_THRESHOLD			-82
+#define ATH11K_OBSS_PD_NON_SRG_MAX_THRESHOLD		-62
+#define ATH11K_OBSS_PD_THRESHOLD_IN_DBM			BIT(29)
+#define ATH11K_OBSS_PD_SRG_EN				BIT(30)
+#define ATH11K_OBSS_PD_NON_SRG_EN			BIT(31)
+
 extern const struct htt_rx_ring_tlv_filter ath11k_mac_mon_status_filter_default;
 
 void ath11k_mac_destroy(struct ath11k_base *ab);
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 2e6ce28ecc8d..12eb28e96f7d 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -2971,6 +2971,233 @@ ath11k_wmi_send_obss_spr_cmd(struct ath11k *ar, u32 vdev_id,
 }
 
 int
+ath11k_wmi_pdev_set_srg_bss_color_bitmap(struct ath11k *ar, u32 *bitmap)
+{
+	struct ath11k_pdev_wmi *wmi = ar->wmi;
+	struct ath11k_base *ab = wmi->wmi_ab->ab;
+	struct wmi_pdev_obss_pd_bitmap_cmd *cmd;
+	struct sk_buff *skb;
+	int ret, len;
+
+	len = sizeof(*cmd);
+
+	skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, len);
+	if (!skb)
+		return -ENOMEM;
+
+	cmd = (struct wmi_pdev_obss_pd_bitmap_cmd *)skb->data;
+	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
+				     WMI_TAG_PDEV_SRG_BSS_COLOR_BITMAP_CMD) |
+			  FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
+	cmd->pdev_id = ar->pdev->pdev_id;
+	memcpy(cmd->bitmap, bitmap, sizeof(cmd->bitmap));
+
+	ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
+		   "obss pd pdev_id %d bss color bitmap %08x %08x\n",
+		   cmd->pdev_id, cmd->bitmap[0], cmd->bitmap[1]);
+
+	ret = ath11k_wmi_cmd_send(wmi, skb,
+				  WMI_PDEV_SET_SRG_BSS_COLOR_BITMAP_CMDID);
+	if (ret) {
+		ath11k_warn(ab,
+			    "Failed to send WMI_PDEV_SET_SRG_BSS_COLOR_BITMAP_CMDID");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
+}
+
+int
+ath11k_wmi_pdev_set_srg_patial_bssid_bitmap(struct ath11k *ar, u32 *bitmap)
+{
+	struct ath11k_pdev_wmi *wmi = ar->wmi;
+	struct ath11k_base *ab = wmi->wmi_ab->ab;
+	struct wmi_pdev_obss_pd_bitmap_cmd *cmd;
+	struct sk_buff *skb;
+	int ret, len;
+
+	len = sizeof(*cmd);
+
+	skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, len);
+	if (!skb)
+		return -ENOMEM;
+
+	cmd = (struct wmi_pdev_obss_pd_bitmap_cmd *)skb->data;
+	cmd->tlv_header =
+		FIELD_PREP(WMI_TLV_TAG,
+			   WMI_TAG_PDEV_SRG_PARTIAL_BSSID_BITMAP_CMD) |
+		FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
+	cmd->pdev_id = ar->pdev->pdev_id;
+	memcpy(cmd->bitmap, bitmap, sizeof(cmd->bitmap));
+
+	ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
+		   "obss pd pdev_id %d partial bssid bitmap %08x %08x\n",
+		   cmd->pdev_id, cmd->bitmap[0], cmd->bitmap[1]);
+
+	ret = ath11k_wmi_cmd_send(wmi, skb,
+				  WMI_PDEV_SET_SRG_PARTIAL_BSSID_BITMAP_CMDID);
+	if (ret) {
+		ath11k_warn(ab,
+			    "Failed to send WMI_PDEV_SET_SRG_PARTIAL_BSSID_BITMAP_CMDID");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
+}
+
+int
+ath11k_wmi_pdev_srg_obss_color_enable_bitmap(struct ath11k *ar, u32 *bitmap)
+{
+	struct ath11k_pdev_wmi *wmi = ar->wmi;
+	struct ath11k_base *ab = wmi->wmi_ab->ab;
+	struct wmi_pdev_obss_pd_bitmap_cmd *cmd;
+	struct sk_buff *skb;
+	int ret, len;
+
+	len = sizeof(*cmd);
+
+	skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, len);
+	if (!skb)
+		return -ENOMEM;
+
+	cmd = (struct wmi_pdev_obss_pd_bitmap_cmd *)skb->data;
+	cmd->tlv_header =
+		FIELD_PREP(WMI_TLV_TAG,
+			   WMI_TAG_PDEV_SRG_OBSS_COLOR_ENABLE_BITMAP_CMD) |
+		FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
+	cmd->pdev_id = ar->pdev->pdev_id;
+	memcpy(cmd->bitmap, bitmap, sizeof(cmd->bitmap));
+
+	ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
+		   "obss pd srg pdev_id %d bss color enable bitmap %08x %08x\n",
+		   cmd->pdev_id, cmd->bitmap[0], cmd->bitmap[1]);
+
+	ret = ath11k_wmi_cmd_send(wmi, skb,
+				  WMI_PDEV_SET_SRG_OBSS_COLOR_ENABLE_BITMAP_CMDID);
+	if (ret) {
+		ath11k_warn(ab,
+			    "Failed to send WMI_PDEV_SET_SRG_OBSS_COLOR_ENABLE_BITMAP_CMDID");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
+}
+
+int
+ath11k_wmi_pdev_srg_obss_bssid_enable_bitmap(struct ath11k *ar, u32 *bitmap)
+{
+	struct ath11k_pdev_wmi *wmi = ar->wmi;
+	struct ath11k_base *ab = wmi->wmi_ab->ab;
+	struct wmi_pdev_obss_pd_bitmap_cmd *cmd;
+	struct sk_buff *skb;
+	int ret, len;
+
+	len = sizeof(*cmd);
+
+	skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, len);
+	if (!skb)
+		return -ENOMEM;
+
+	cmd = (struct wmi_pdev_obss_pd_bitmap_cmd *)skb->data;
+	cmd->tlv_header =
+		FIELD_PREP(WMI_TLV_TAG,
+			   WMI_TAG_PDEV_SRG_OBSS_BSSID_ENABLE_BITMAP_CMD) |
+		FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
+	cmd->pdev_id = ar->pdev->pdev_id;
+	memcpy(cmd->bitmap, bitmap, sizeof(cmd->bitmap));
+
+	ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
+		   "obss pd srg pdev_id %d bssid enable bitmap %08x %08x\n",
+		   cmd->pdev_id, cmd->bitmap[0], cmd->bitmap[1]);
+
+	ret = ath11k_wmi_cmd_send(wmi, skb,
+				  WMI_PDEV_SET_SRG_OBSS_BSSID_ENABLE_BITMAP_CMDID);
+	if (ret) {
+		ath11k_warn(ab,
+			    "Failed to send WMI_PDEV_SET_SRG_OBSS_BSSID_ENABLE_BITMAP_CMDID");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
+}
+
+int
+ath11k_wmi_pdev_non_srg_obss_color_enable_bitmap(struct ath11k *ar, u32 *bitmap)
+{
+	struct ath11k_pdev_wmi *wmi = ar->wmi;
+	struct ath11k_base *ab = wmi->wmi_ab->ab;
+	struct wmi_pdev_obss_pd_bitmap_cmd *cmd;
+	struct sk_buff *skb;
+	int ret, len;
+
+	len = sizeof(*cmd);
+
+	skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, len);
+	if (!skb)
+		return -ENOMEM;
+
+	cmd = (struct wmi_pdev_obss_pd_bitmap_cmd *)skb->data;
+	cmd->tlv_header =
+		FIELD_PREP(WMI_TLV_TAG,
+			   WMI_TAG_PDEV_NON_SRG_OBSS_COLOR_ENABLE_BITMAP_CMD) |
+		FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
+	cmd->pdev_id = ar->pdev->pdev_id;
+	memcpy(cmd->bitmap, bitmap, sizeof(cmd->bitmap));
+
+	ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
+		   "obss pd non_srg pdev_id %d bss color enable bitmap %08x %08x\n",
+		   cmd->pdev_id, cmd->bitmap[0], cmd->bitmap[1]);
+
+	ret = ath11k_wmi_cmd_send(wmi, skb,
+				  WMI_PDEV_SET_NON_SRG_OBSS_COLOR_ENABLE_BITMAP_CMDID);
+	if (ret) {
+		ath11k_warn(ab,
+			    "Failed to send WMI_PDEV_SET_NON_SRG_OBSS_COLOR_ENABLE_BITMAP_CMDID");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
+}
+
+int
+ath11k_wmi_pdev_non_srg_obss_bssid_enable_bitmap(struct ath11k *ar, u32 *bitmap)
+{
+	struct ath11k_pdev_wmi *wmi = ar->wmi;
+	struct ath11k_base *ab = wmi->wmi_ab->ab;
+	struct wmi_pdev_obss_pd_bitmap_cmd *cmd;
+	struct sk_buff *skb;
+	int ret, len;
+
+	len = sizeof(*cmd);
+
+	skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, len);
+	if (!skb)
+		return -ENOMEM;
+
+	cmd = (struct wmi_pdev_obss_pd_bitmap_cmd *)skb->data;
+	cmd->tlv_header =
+		FIELD_PREP(WMI_TLV_TAG,
+			   WMI_TAG_PDEV_NON_SRG_OBSS_BSSID_ENABLE_BITMAP_CMD) |
+		FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
+	cmd->pdev_id = ar->pdev->pdev_id;
+	memcpy(cmd->bitmap, bitmap, sizeof(cmd->bitmap));
+
+	ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
+		   "obss pd non_srg pdev_id %d bssid enable bitmap %08x %08x\n",
+		   cmd->pdev_id, cmd->bitmap[0], cmd->bitmap[1]);
+
+	ret = ath11k_wmi_cmd_send(wmi, skb,
+				  WMI_PDEV_SET_NON_SRG_OBSS_BSSID_ENABLE_BITMAP_CMDID);
+	if (ret) {
+		ath11k_warn(ab,
+			    "Failed to send WMI_PDEV_SET_NON_SRG_OBSS_BSSID_ENABLE_BITMAP_CMDID");
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
+}
+
+int
 ath11k_wmi_send_obss_color_collision_cfg_cmd(struct ath11k *ar, u32 vdev_id,
 					     u8 bss_color, u32 period,
 					     bool enable)
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 993674228c9e..3ade1ddd35c9 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -257,6 +257,16 @@ enum wmi_tlv_cmd_id {
 	WMI_PDEV_DMA_RING_CFG_REQ_CMDID,
 	WMI_PDEV_HE_TB_ACTION_FRM_CMDID,
 	WMI_PDEV_PKTLOG_FILTER_CMDID,
+	WMI_PDEV_SET_RAP_CONFIG_CMDID,
+	WMI_PDEV_DSM_FILTER_CMDID,
+	WMI_PDEV_FRAME_INJECT_CMDID,
+	WMI_PDEV_TBTT_OFFSET_SYNC_CMDID,
+	WMI_PDEV_SET_SRG_BSS_COLOR_BITMAP_CMDID,
+	WMI_PDEV_SET_SRG_PARTIAL_BSSID_BITMAP_CMDID,
+	WMI_PDEV_SET_SRG_OBSS_COLOR_ENABLE_BITMAP_CMDID,
+	WMI_PDEV_SET_SRG_OBSS_BSSID_ENABLE_BITMAP_CMDID,
+	WMI_PDEV_SET_NON_SRG_OBSS_COLOR_ENABLE_BITMAP_CMDID,
+	WMI_PDEV_SET_NON_SRG_OBSS_BSSID_ENABLE_BITMAP_CMDID,
 	WMI_VDEV_CREATE_CMDID = WMI_TLV_CMD(WMI_GRP_VDEV),
 	WMI_VDEV_DELETE_CMDID,
 	WMI_VDEV_START_REQUEST_CMDID,
@@ -919,6 +929,9 @@ enum wmi_tlv_pdev_param {
 	WMI_PDEV_PARAM_RADIO_CHAN_STATS_ENABLE,
 	WMI_PDEV_PARAM_RADIO_DIAGNOSIS_ENABLE,
 	WMI_PDEV_PARAM_MESH_MCAST_ENABLE,
+	WMI_PDEV_PARAM_SET_CMD_OBSS_PD_THRESHOLD = 0xbc,
+	WMI_PDEV_PARAM_SET_CMD_OBSS_PD_PER_AC = 0xbe,
+	WMI_PDEV_PARAM_ENABLE_SR_PROHIBIT = 0xc6,
 };
 
 enum wmi_tlv_vdev_param {
@@ -1812,10 +1825,15 @@ enum wmi_tlv_tag {
 	WMI_TAG_NDP_CHANNEL_INFO,
 	WMI_TAG_NDP_CMD,
 	WMI_TAG_NDP_EVENT,
-	/* TODO add all the missing cmds */
 	WMI_TAG_PDEV_PEER_PKTLOG_FILTER_CMD = 0x301,
 	WMI_TAG_PDEV_PEER_PKTLOG_FILTER_INFO,
 	WMI_TAG_FILS_DISCOVERY_TMPL_CMD = 0x344,
+	WMI_TAG_PDEV_SRG_BSS_COLOR_BITMAP_CMD = 0x37b,
+	WMI_TAG_PDEV_SRG_PARTIAL_BSSID_BITMAP_CMD,
+	WMI_TAG_PDEV_SRG_OBSS_COLOR_ENABLE_BITMAP_CMD = 0x381,
+	WMI_TAG_PDEV_SRG_OBSS_BSSID_ENABLE_BITMAP_CMD,
+	WMI_TAG_PDEV_NON_SRG_OBSS_COLOR_ENABLE_BITMAP_CMD,
+	WMI_TAG_PDEV_NON_SRG_OBSS_BSSID_ENABLE_BITMAP_CMD,
 	WMI_TAG_MAX
 };
 
@@ -2039,6 +2057,7 @@ enum wmi_tlv_service {
 	WMI_TLV_SERVICE_PER_PEER_HTT_STATS_RESET = 213,
 	WMI_TLV_SERVICE_FREQINFO_IN_METADATA = 219,
 	WMI_TLV_SERVICE_EXT2_MSG = 220,
+	WMI_TLV_SERVICE_SRG_SRP_SPATIAL_REUSE_SUPPORT = 249,
 
 	WMI_MAX_EXT_SERVICE
 };
@@ -4781,6 +4800,12 @@ struct wmi_obss_spatial_reuse_params_cmd {
 	u32 vdev_id;
 } __packed;
 
+struct wmi_pdev_obss_pd_bitmap_cmd {
+	u32 tlv_header;
+	u32 pdev_id;
+	u32 bitmap[2];
+} __packed;
+
 #define ATH11K_BSS_COLOR_COLLISION_SCAN_PERIOD_MS		200
 #define ATH11K_OBSS_COLOR_COLLISION_DETECTION_DISABLE		0
 #define ATH11K_OBSS_COLOR_COLLISION_DETECTION			1
@@ -5316,6 +5341,16 @@ int ath11k_wmi_send_twt_enable_cmd(struct ath11k *ar, u32 pdev_id);
 int ath11k_wmi_send_twt_disable_cmd(struct ath11k *ar, u32 pdev_id);
 int ath11k_wmi_send_obss_spr_cmd(struct ath11k *ar, u32 vdev_id,
 				 struct ieee80211_he_obss_pd *he_obss_pd);
+int ath11k_wmi_pdev_set_srg_bss_color_bitmap(struct ath11k *ar, u32 *bitmap);
+int ath11k_wmi_pdev_set_srg_patial_bssid_bitmap(struct ath11k *ar, u32 *bitmap);
+int ath11k_wmi_pdev_srg_obss_color_enable_bitmap(struct ath11k *ar,
+						 u32 *bitmap);
+int ath11k_wmi_pdev_srg_obss_bssid_enable_bitmap(struct ath11k *ar,
+						 u32 *bitmap);
+int ath11k_wmi_pdev_non_srg_obss_color_enable_bitmap(struct ath11k *ar,
+						     u32 *bitmap);
+int ath11k_wmi_pdev_non_srg_obss_bssid_enable_bitmap(struct ath11k *ar,
+						     u32 *bitmap);
 int ath11k_wmi_send_obss_color_collision_cfg_cmd(struct ath11k *ar, u32 vdev_id,
 						 u8 bss_color, u32 period,
 						 bool enable);
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
