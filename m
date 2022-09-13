Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003A6C6FA8A
	for <ath11k@archiver.kernel.org>; Tue, 13 Sep 2022 05:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TXdNpvMYXRkFB4bEpxURb2tVdHmD9R5D1v0kLDId5Rs=; b=TyAvjTdKw48O5d
	lZg4loVSNerf93fsDfHgSNi8sacChwWy27YXAGYbEjuvlLGWI6eAsWLShdybmTvNnWJZcT5UiZ/rO
	mXmeYxTgc1CtwJFJQ2aIvh51SAbatYmVIa5JbNIvMaivw2+ksmDVr0rOyXxoV63KlAUhQ65RWdttx
	SAYmOn7ucPtFwM+0BhIYoAfe17G7qVzJG39A81Y6rF647IHMQjlXEcn+5qDnSGs/JSP38oOqF22yv
	dbQKEC3a9YQq7Mnw+mYTMRbLJTsUjAF+kBGehiYXHwWolKqxLaiTfrzNsVPF1LEZHeotYNWZRXBSw
	ncrHsi/qwIZ3nN066D9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXyHR-002Duu-0e; Tue, 13 Sep 2022 05:16:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXyH5-002DbY-W0
	for ath11k@lists.infradead.org; Tue, 13 Sep 2022 05:16:05 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28D4lrfj030656;
	Tue, 13 Sep 2022 05:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=Y0Fx2tnZAlNk0Y2hqURJkNjZm1uuj4lBUD+WF4i4TRE=;
 b=Z1zkYwmEQUPDdUi10GBU1DjBzp3dfgT3JnahZOMBqtjefz+3wqX5fI3cE0hW56aMeGTF
 M9291/oLv+kQm5ghxV23NBsG+xuRvSuw0ZUHiSE2XjzLJ4UoJtfgBRQosji0WpCjX/la
 PD3KNT9lHnBqMGyuqWmP31zwMWbtkiE1C0VmWLYRjUm+3f0Z2B6aQ3hB6sjJ9v9bKzQe
 z27d90Ut+n51i6++xP4r/Xcgansx4vwzoZL3sq+8BUlhmrXqA7BCDPkR3fC0Fdlq61Uw
 GAV3SvpOjUUl5crU577yyGGahG/pig3bQpTKcXnLp8Opn6xyY59yRcuHrLOv8lz5z1oS pQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jgk6ke4d3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 05:15:55 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28D5Fs8T011694
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 05:15:54 GMT
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Mon, 12 Sep 2022 22:15:52 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v3 14/15] wifi: ath11k: add handler for WMI_VDEV_SET_TPC_POWER_CMDID
Date: Tue, 13 Sep 2022 01:15:17 -0400
Message-ID: <20220913051518.23051-15-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220913051518.23051-1-quic_wgong@quicinc.com>
References: <20220913051518.23051-1-quic_wgong@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tmWr5KHZ_zElHXlWPYMTsvyEuYrCI7zj
X-Proofpoint-ORIG-GUID: tmWr5KHZ_zElHXlWPYMTsvyEuYrCI7zj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_02,2022-09-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209130023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_221603_795420_72B33785 
X-CRM114-Status: GOOD (  21.16  )
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

Add the handler for WMI_VDEV_SET_TPC_POWER_CMDID, it is for 6 GHz band.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 63 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.h | 61 ++++++++++++++++++++++++++
 2 files changed, 124 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 7d7751fd6a8e..89027d3cb5e9 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -2304,6 +2304,69 @@ int ath11k_wmi_send_scan_start_cmd(struct ath11k *ar,
 	return ret;
 }
 
+int ath11k_wmi_send_vdev_set_tpc_power(struct ath11k *ar,
+				       u32 vdev_id,
+				       struct ath11k_reg_tpc_power_info *param)
+{
+	struct ath11k_pdev_wmi *wmi = ar->wmi;
+	struct wmi_vdev_set_tpc_power_cmd *cmd;
+	struct wmi_vdev_ch_power_info *ch;
+	struct sk_buff *skb;
+	struct wmi_tlv *tlv;
+	u8 *ptr;
+	int i, ret, len;
+
+	len = sizeof(*cmd) + TLV_HDR_SIZE;
+	len += (sizeof(struct wmi_vdev_ch_power_info) * param->num_pwr_levels);
+
+	skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, len);
+	if (!skb)
+		return -ENOMEM;
+
+	ptr = skb->data;
+
+	cmd = (struct wmi_vdev_set_tpc_power_cmd *)ptr;
+	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_VDEV_SET_TPC_POWER_CMD) |
+			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
+	cmd->vdev_id = vdev_id;
+	cmd->psd_power = param->is_psd_power;
+	cmd->eirp_power = param->eirp_power;
+	cmd->power_type_6ghz = param->power_type_6g;
+	ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
+		   "wmi tpc vdev_id %d is_psd_power %d eirp_power %d power_type_6g %d\n",
+		   vdev_id, param->is_psd_power, param->eirp_power, param->power_type_6g);
+
+	ptr += sizeof(*cmd);
+	tlv = (struct wmi_tlv *)ptr;
+	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_STRUCT) |
+		      FIELD_PREP(WMI_TLV_LEN, param->num_pwr_levels * sizeof(*ch));
+
+	ptr += TLV_HDR_SIZE;
+	ch = (struct wmi_vdev_ch_power_info *)ptr;
+
+	for (i = 0; i < param->num_pwr_levels; i++, ch++) {
+		ch->tlv_header = FIELD_PREP(WMI_TLV_TAG,
+					    WMI_TAG_VDEV_CH_POWER_INFO) |
+				FIELD_PREP(WMI_TLV_LEN,
+					   sizeof(*ch) - TLV_HDR_SIZE);
+
+		ch->chan_cfreq = param->chan_power_info[i].chan_cfreq;
+		ch->tx_power = param->chan_power_info[i].tx_power;
+
+		ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
+			   "wmi tpc chan_cfreq %d tx_power %d\n",
+			   ch->chan_cfreq, ch->tx_power);
+	}
+
+	ret = ath11k_wmi_cmd_send(wmi, skb,
+				  WMI_VDEV_SET_TPC_POWER_CMDID);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to send WMI_VDEV_SET_TPC_POWER_CMDID\n");
+		dev_kfree_skb(skb);
+	}
+	return ret;
+}
+
 int ath11k_wmi_send_scan_stop_cmd(struct ath11k *ar,
 				  struct scan_cancel_param *param)
 {
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index d285d18e99a8..736b6f00ccb5 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -12,6 +12,7 @@
 struct ath11k_base;
 struct ath11k;
 struct ath11k_fw_stats;
+struct ath11k_reg_tpc_power_info;
 
 #define PSOC_HOST_MAX_NUM_SS (8)
 
@@ -310,6 +311,36 @@ enum wmi_tlv_cmd_id {
 	WMI_VDEV_SET_CUSTOM_AGGR_SIZE_CMDID,
 	WMI_VDEV_ENCRYPT_DECRYPT_DATA_REQ_CMDID,
 	WMI_VDEV_ADD_MAC_ADDR_TO_RX_FILTER_CMDID,
+	/** WMI commands related to dbg arp stats */
+	WMI_VDEV_SET_ARP_STAT_CMDID,
+	WMI_VDEV_GET_ARP_STAT_CMDID,
+	/** get tx power for the current vdev */
+	WMI_VDEV_GET_TX_POWER_CMDID,
+	/* limit STA offchannel activity */
+	WMI_VDEV_LIMIT_OFFCHAN_CMDID,
+	/** To set custom software retries per-AC for vdev */
+	WMI_VDEV_SET_CUSTOM_SW_RETRY_TH_CMDID,
+	/** To set chainmask configuration for vdev */
+	WMI_VDEV_CHAINMASK_CONFIG_CMDID,
+	WMI_VDEV_GET_BCN_RECEPTION_STATS_CMDID,
+	/* request LTE-Coex info */
+	WMI_VDEV_GET_MWS_COEX_INFO_CMDID,
+	/** delete all peer (excluding bss peer) */
+	WMI_VDEV_DELETE_ALL_PEER_CMDID,
+	/* To set bss max idle time related parameters */
+	WMI_VDEV_BSS_MAX_IDLE_TIME_CMDID,
+	/** Indicates firmware to trigger Audio sync */
+	WMI_VDEV_AUDIO_SYNC_TRIGGER_CMDID,
+	/** Gives Qtimer value to firmware */
+	WMI_VDEV_AUDIO_SYNC_QTIMER_CMDID,
+	/** Preferred channel list for each vdev */
+	WMI_VDEV_SET_PCL_CMDID,
+	/** VDEV_GET_BIG_DATA_CMD IS DEPRECATED - DO NOT USE */
+	WMI_VDEV_GET_BIG_DATA_CMDID,
+	/** Get per vdev BIG DATA stats phase 2 */
+	WMI_VDEV_GET_BIG_DATA_P2_CMDID,
+	/** set TPC PSD/non-PSD power */
+	WMI_VDEV_SET_TPC_POWER_CMDID,
 	WMI_PEER_CREATE_CMDID = WMI_TLV_CMD(WMI_GRP_PEER),
 	WMI_PEER_DELETE_CMDID,
 	WMI_PEER_FLUSH_TIDS_CMDID,
@@ -1860,6 +1891,8 @@ enum wmi_tlv_tag {
 	WMI_TAG_PDEV_NON_SRG_OBSS_BSSID_ENABLE_BITMAP_CMD,
 	WMI_TAG_REGULATORY_RULE_EXT_STRUCT = 0x3A9,
 	WMI_TAG_REG_CHAN_LIST_CC_EXT_EVENT,
+	WMI_TAG_VDEV_SET_TPC_POWER_CMD = 0x3B5,
+	WMI_TAG_VDEV_CH_POWER_INFO,
 
 	WMI_TAG_MAX
 };
@@ -3128,6 +3161,31 @@ struct wlan_ssid {
 	u8 ssid[WLAN_SSID_MAX_LEN];
 };
 
+struct wmi_vdev_ch_power_info {
+	u32 tlv_header;
+	u32 chan_cfreq; /* Channel center frequency (MHz) */
+	/* Unit: dBm, either PSD/EIRP power for this frequency or
+	 * incremental for non-PSD BW
+	 */
+	u32 tx_power;
+} __packed;
+
+struct wmi_vdev_set_tpc_power_cmd {
+	u32 tlv_header;
+	u32 vdev_id;
+	u32 psd_power; /* Value: 0 or 1, is PSD power or not */
+	u32 eirp_power; /* Maximum EIRP power (dBm units), valid only if power is PSD */
+	u32 power_type_6ghz; /* Type: WMI_6GHZ_REG_TYPE, used for halphy CTL lookup */
+	/* This fixed_param TLV is followed by the below TLVs:
+	 * num_pwr_levels of wmi_vdev_ch_power_info
+	 * For PSD power, it is the PSD/EIRP power of the frequency (20 MHz chunks).
+	 * For non-PSD power, the power values are for 20, 40, and till
+	 * BSS BW power levels.
+	 * The num_pwr_levels will be checked by sw how many elements present
+	 * in the variable-length array.
+	 */
+} __packed;
+
 #define WMI_IE_BITMAP_SIZE             8
 
 #define WMI_SCAN_MAX_NUM_SSID                0x0A
@@ -5736,4 +5794,7 @@ void ath11k_reg_reset_info(struct cur_regulatory_info *reg_info);
 int ath11k_reg_handle_chan_list(struct ath11k_base *ab,
 				struct cur_regulatory_info *reg_info,
 				enum ieee80211_ap_reg_power power_type);
+int ath11k_wmi_send_vdev_set_tpc_power(struct ath11k *ar,
+				       u32 vdev_id,
+				       struct ath11k_reg_tpc_power_info *param);
 #endif
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
