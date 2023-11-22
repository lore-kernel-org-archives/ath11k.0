Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA6CC61D9C
	for <ath11k@archiver.kernel.org>; Wed, 22 Nov 2023 09:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RNhtsLzoA9ApZFL9cQ9OF51DaEVAD+7wGovj52mu3WM=; b=EtUaOUiCBxvXsP
	1z7KjaI5T+Oloi3pljufZ4XZsGSA0sSWWvY6Oxa7EGfmrGkEDbLvhqt34xY07cFaOltiRKfbe0WVh
	aFN4IzEiiUyb12wPYrYYzp6nPhNwMTdQFE8XlW1vJezKOpugRu8bbAUd2dFqfyyZy19RPkb5RwkOi
	jDiEhGg6nmMSR693ZLwbilMsoo5NO//Rz0SipSvbSonYzQYo4I292xKQ8Qxhe8G6/N+PkrR/gZpJn
	+7Z+y8TDNGAeb0TgZLtYb2lnsmhW6RcqDn9fr2k/xN6axcKk7Ae2cz1c8t133RcdaKSyJUJglox3n
	jNmASURc3dMk0NNBjWIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jLR-001Aju-2X;
	Wed, 22 Nov 2023 09:16:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jLP-001AhJ-0W
	for ath11k@lists.infradead.org;
	Wed, 22 Nov 2023 09:16:28 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AM4utv0017801;
	Wed, 22 Nov 2023 09:16:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=FbI8dWjoEgNl+ZPquNLZ8z6v19aGAeL7CdVdcIdBtBY=;
 b=A+517dx3zpHZgQfXY+1WC/bn7ffHqB9poWF14YTG1yHhuUb2D8ZK6DX5oa+1/a7fhGN3
 eklJtxmexJHJ2zWgSeUNF9mHXvBZONDPWhKRyCdloHwLXKsni42WziIPrZM4pv3OT8ME
 oNySgyQKGQcAu3mb0piCsmscEc9n9LKsRfKft+3snUVecz21N1ro4VGjhDKO44JzZCIZ
 4pai9GTDp/s+46S/Qt2XRWsmWFyOJB8zbvSxqm2JXQVQKaBRCU4uACLIs67erU8pHZ/x
 3KnQaVKnuSYYA97KbJKpDOKSxUOqfo8kz8y8pvRseCEgS4W9HjbY6wkJiPpHn11UqLwh Dw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ugu54baqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 09:16:26 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AM9GPfe001532
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 09:16:25 GMT
Received: from bqiang-Celadon-RN.lan (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 22 Nov 2023 01:16:24 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH v7 11/12] wifi: ath11k: add handler for WMI_VDEV_SET_TPC_POWER_CMDID
Date: Wed, 22 Nov 2023 17:15:52 +0800
Message-ID: <20231122091553.10837-12-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231122091553.10837-1-quic_bqiang@quicinc.com>
References: <20231122091553.10837-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FlX-iBzAOgv_5jwaYusJDaMC6cKMM7k_
X-Proofpoint-ORIG-GUID: FlX-iBzAOgv_5jwaYusJDaMC6cKMM7k_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-22_06,2023-11-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311220064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_011627_315034_0D555A83 
X-CRM114-Status: GOOD (  21.21  )
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

From: Wen Gong <quic_wgong@quicinc.com>

Add the handler for WMI_VDEV_SET_TPC_POWER_CMDID, it is for 6 GHz band.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
v7:
 1. move this patch ahead.

 drivers/net/wireless/ath/ath11k/wmi.c | 63 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.h | 61 ++++++++++++++++++++++++++
 2 files changed, 124 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 7e2007ea2352..c3c7b16e88a9 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -2379,6 +2379,69 @@ int ath11k_wmi_send_scan_start_cmd(struct ath11k *ar,
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
+	int i, ret, len, array_len;
+
+	array_len = sizeof(*ch) * param->num_pwr_levels;
+	len = sizeof(*cmd) + TLV_HDR_SIZE + array_len;
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
+	cmd->power_type_6ghz = param->ap_power_type;
+	ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
+		   "wmi tpc vdev id %d is psd power %d eirp power %d 6 GHz power type %d\n",
+		   vdev_id, param->is_psd_power, param->eirp_power, param->ap_power_type);
+
+	ptr += sizeof(*cmd);
+	tlv = (struct wmi_tlv *)ptr;
+	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_STRUCT) |
+		      FIELD_PREP(WMI_TLV_LEN, array_len);
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
+			   "wmi tpc chan freq %d TX power %d\n",
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
index 972bae6a4e3b..e119152d8518 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -15,6 +15,7 @@ struct ath11k;
 struct ath11k_fw_stats;
 struct ath11k_fw_dbglog;
 struct ath11k_vif;
+struct ath11k_reg_tpc_power_info;
 
 #define PSOC_HOST_MAX_NUM_SS (8)
 
@@ -327,6 +328,36 @@ enum wmi_tlv_cmd_id {
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
@@ -1878,6 +1909,8 @@ enum wmi_tlv_tag {
 	WMI_TAG_PDEV_NON_SRG_OBSS_BSSID_ENABLE_BITMAP_CMD,
 	WMI_TAG_REGULATORY_RULE_EXT_STRUCT = 0x3A9,
 	WMI_TAG_REG_CHAN_LIST_CC_EXT_EVENT,
+	WMI_TAG_VDEV_SET_TPC_POWER_CMD = 0x3B5,
+	WMI_TAG_VDEV_CH_POWER_INFO,
 	WMI_TAG_PDEV_SET_BIOS_SAR_TABLE_CMD = 0x3D8,
 	WMI_TAG_PDEV_SET_BIOS_GEO_TABLE_CMD,
 	WMI_TAG_MAX
@@ -3168,6 +3201,31 @@ struct wlan_ssid {
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
 
 /* prefix used by scan requestor ids on the host */
@@ -6513,4 +6571,7 @@ int ath11k_reg_handle_chan_list(struct ath11k_base *ab,
 				struct cur_regulatory_info *reg_info,
 				enum ieee80211_ap_reg_power power_type);
 bool ath11k_wmi_supports_6ghz_cc_ext(struct ath11k *ar);
+int ath11k_wmi_send_vdev_set_tpc_power(struct ath11k *ar,
+				       u32 vdev_id,
+				       struct ath11k_reg_tpc_power_info *param);
 #endif
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
