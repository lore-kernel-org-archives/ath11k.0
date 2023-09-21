Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F91AE7D0AA
	for <ath11k@archiver.kernel.org>; Thu, 21 Sep 2023 20:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DVjpWgOI/50Q8e8MBGMWcLOP+d4y14w6plTMC0NZzuw=; b=z3HtkyoqDfzZLC
	6DXn57ZKh5SOAsDUTLnK/9NKomJ69mf8cOTuG1QM34TRp63V5ndEXXUDvml5SrRtiCWuahN9RhX7b
	BizRbmg7grq+cps/Dtcl0vjguynrhLV8SlDG2kJlUHBrYpp/N8EIRY5zjeNjaLYCh1kFcv/KWE3CI
	j1PjMgO2rgujMV3bLrRoViOVz6rUWwuqh/boitMKWGmBWIvl96aFL2Tq68JC90L11UeMJ6/utnOD6
	W8wyuXXREIJQG/1KoLWUVwmAAvw8MEeRqyHFAGiz9zrJdQRCqfu3MDi8KdVFf47AIZ6g3r7GbYMAU
	sGZu+lb0PijLzzmlD/ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjQQm-0076Zr-0N;
	Thu, 21 Sep 2023 20:37:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjQQi-0076Yt-3D
	for ath11k@lists.infradead.org;
	Thu, 21 Sep 2023 20:37:46 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38LJxBqe009085;
	Thu, 21 Sep 2023 20:37:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Sllg++wz9BE1uvGvV/QmHxip3vDhRxyCSMx+YEBmprk=;
 b=EpKcnwFSlv14BhD50CdaUlw7cj4UPff509ngZlZiIwiahMZxzsFJbACPqB23+1zMIIx3
 Ahm3mYNAcCFJZk99JZ9XxioyUZMYER9y8aXuoeJGkC0U/Y5MwjJGkA7paMkEz7lUOASp
 DZ5YzxFDiEiStcPZ2LvDzc4r8icaEMo42xPBelX9zfU3i9DqGD4uI/I4vEANE9UIYsz4
 Hgh4VW9YmnmP+RV2ZGtSzSvYFsdFuVpEiTfMMSmyNeSSU8sxmlA6kw7qaSNUThmrbnRZ
 1122kzMWmvfflOMOBKxiXRmuIjdNfPY7qppPJChznohkNMXzsF8Z3Pf19wMvZTAbk69I 3Q== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t8tyxg8w6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Sep 2023 20:37:41 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38LKbfMj025837
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Sep 2023 20:37:41 GMT
Received: from [10.48.245.144] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 21 Sep
 2023 13:37:40 -0700
Message-ID: <69bd973f-5aba-4329-a0d8-f1e76857a6a4@quicinc.com>
Date: Thu, 21 Sep 2023 13:37:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/13] wifi: ath11k: add handler for
 WMI_VDEV_SET_TPC_POWER_CMDID
Content-Language: en-US
To: Wen Gong <quic_wgong@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <kvalo@kernel.org>
References: <20230920082349.29111-1-quic_wgong@quicinc.com>
 <20230920082349.29111-13-quic_wgong@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230920082349.29111-13-quic_wgong@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wrNR1-ctDYYSGyycbYb4lzyHRYkemHwj
X-Proofpoint-ORIG-GUID: wrNR1-ctDYYSGyycbYb4lzyHRYkemHwj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-21_17,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309210178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_133745_046977_6C23B802 
X-CRM114-Status: GOOD (  29.24  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 9/20/2023 1:23 AM, Wen Gong wrote:
> Add the handler for WMI_VDEV_SET_TPC_POWER_CMDID, it is for 6 GHz band.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath11k/wmi.c | 63 +++++++++++++++++++++++++++
>   drivers/net/wireless/ath/ath11k/wmi.h | 61 ++++++++++++++++++++++++++
>   2 files changed, 124 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
> index d93ed92335c7..43c47967eec1 100644
> --- a/drivers/net/wireless/ath/ath11k/wmi.c
> +++ b/drivers/net/wireless/ath/ath11k/wmi.c
> @@ -2379,6 +2379,69 @@ int ath11k_wmi_send_scan_start_cmd(struct ath11k *ar,
>   	return ret;
>   }
>   
> +int ath11k_wmi_send_vdev_set_tpc_power(struct ath11k *ar,
> +				       u32 vdev_id,
> +				       struct ath11k_reg_tpc_power_info *param)
> +{
> +	struct ath11k_pdev_wmi *wmi = ar->wmi;
> +	struct wmi_vdev_set_tpc_power_cmd *cmd;
> +	struct wmi_vdev_ch_power_info *ch;
> +	struct sk_buff *skb;
> +	struct wmi_tlv *tlv;
> +	u8 *ptr;
> +	int i, ret, len;
> +
> +	len = sizeof(*cmd) + TLV_HDR_SIZE;
> +	len += (sizeof(struct wmi_vdev_ch_power_info) * param->num_pwr_levels);

sizeof(*ch) is preferred

and since you need this sum both here and when you fill the TLV, 
consider calculating it once and using the calculated value in both places

> +
> +	skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, len);
> +	if (!skb)
> +		return -ENOMEM;
> +
> +	ptr = skb->data;
> +
> +	cmd = (struct wmi_vdev_set_tpc_power_cmd *)ptr;
> +	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_VDEV_SET_TPC_POWER_CMD) |
> +			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
> +	cmd->vdev_id = vdev_id;
> +	cmd->psd_power = param->is_psd_power;
> +	cmd->eirp_power = param->eirp_power;
> +	cmd->power_type_6ghz = param->ap_power_type;
> +	ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
> +		   "wmi tpc vdev id %d is psd power %d eirp power %d 6 GHz power type %d\n",
> +		   vdev_id, param->is_psd_power, param->eirp_power, param->ap_power_type);
> +
> +	ptr += sizeof(*cmd);
> +	tlv = (struct wmi_tlv *)ptr;
> +	tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_STRUCT) |
> +		      FIELD_PREP(WMI_TLV_LEN, param->num_pwr_levels * sizeof(*ch));

as noted above you can use previously calculated length here

> +
> +	ptr += TLV_HDR_SIZE;
> +	ch = (struct wmi_vdev_ch_power_info *)ptr;
> +
> +	for (i = 0; i < param->num_pwr_levels; i++, ch++) {
> +		ch->tlv_header = FIELD_PREP(WMI_TLV_TAG,
> +					    WMI_TAG_VDEV_CH_POWER_INFO) |
> +				FIELD_PREP(WMI_TLV_LEN,
> +					   sizeof(*ch) - TLV_HDR_SIZE);
> +
> +		ch->chan_cfreq = param->chan_power_info[i].chan_cfreq;
> +		ch->tx_power = param->chan_power_info[i].tx_power;
> +
> +		ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
> +			   "wmi tpc chan freq %d TX power %d\n",
> +			   ch->chan_cfreq, ch->tx_power);
> +	}
> +
> +	ret = ath11k_wmi_cmd_send(wmi, skb,
> +				  WMI_VDEV_SET_TPC_POWER_CMDID);
> +	if (ret) {
> +		ath11k_warn(ar->ab, "failed to send WMI_VDEV_SET_TPC_POWER_CMDID\n");
> +		dev_kfree_skb(skb);
> +	}
> +	return ret;
> +}
> +
>   int ath11k_wmi_send_scan_stop_cmd(struct ath11k *ar,
>   				  struct scan_cancel_param *param)
>   {
> diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
> index ed1a6db23709..dbe973698a89 100644
> --- a/drivers/net/wireless/ath/ath11k/wmi.h
> +++ b/drivers/net/wireless/ath/ath11k/wmi.h
> @@ -15,6 +15,7 @@ struct ath11k;
>   struct ath11k_fw_stats;
>   struct ath11k_fw_dbglog;
>   struct ath11k_vif;
> +struct ath11k_reg_tpc_power_info;
>   
>   #define PSOC_HOST_MAX_NUM_SS (8)
>   
> @@ -327,6 +328,36 @@ enum wmi_tlv_cmd_id {
>   	WMI_VDEV_SET_CUSTOM_AGGR_SIZE_CMDID,
>   	WMI_VDEV_ENCRYPT_DECRYPT_DATA_REQ_CMDID,
>   	WMI_VDEV_ADD_MAC_ADDR_TO_RX_FILTER_CMDID,
> +	/** WMI commands related to dbg arp stats */
> +	WMI_VDEV_SET_ARP_STAT_CMDID,
> +	WMI_VDEV_GET_ARP_STAT_CMDID,
> +	/** get tx power for the current vdev */
> +	WMI_VDEV_GET_TX_POWER_CMDID,
> +	/* limit STA offchannel activity */
> +	WMI_VDEV_LIMIT_OFFCHAN_CMDID,
> +	/** To set custom software retries per-AC for vdev */
> +	WMI_VDEV_SET_CUSTOM_SW_RETRY_TH_CMDID,
> +	/** To set chainmask configuration for vdev */
> +	WMI_VDEV_CHAINMASK_CONFIG_CMDID,
> +	WMI_VDEV_GET_BCN_RECEPTION_STATS_CMDID,
> +	/* request LTE-Coex info */
> +	WMI_VDEV_GET_MWS_COEX_INFO_CMDID,
> +	/** delete all peer (excluding bss peer) */
> +	WMI_VDEV_DELETE_ALL_PEER_CMDID,
> +	/* To set bss max idle time related parameters */
> +	WMI_VDEV_BSS_MAX_IDLE_TIME_CMDID,
> +	/** Indicates firmware to trigger Audio sync */
> +	WMI_VDEV_AUDIO_SYNC_TRIGGER_CMDID,
> +	/** Gives Qtimer value to firmware */
> +	WMI_VDEV_AUDIO_SYNC_QTIMER_CMDID,
> +	/** Preferred channel list for each vdev */
> +	WMI_VDEV_SET_PCL_CMDID,
> +	/** VDEV_GET_BIG_DATA_CMD IS DEPRECATED - DO NOT USE */
> +	WMI_VDEV_GET_BIG_DATA_CMDID,
> +	/** Get per vdev BIG DATA stats phase 2 */
> +	WMI_VDEV_GET_BIG_DATA_P2_CMDID,
> +	/** set TPC PSD/non-PSD power */
> +	WMI_VDEV_SET_TPC_POWER_CMDID,
>   	WMI_PEER_CREATE_CMDID = WMI_TLV_CMD(WMI_GRP_PEER),
>   	WMI_PEER_DELETE_CMDID,
>   	WMI_PEER_FLUSH_TIDS_CMDID,
> @@ -1878,6 +1909,8 @@ enum wmi_tlv_tag {
>   	WMI_TAG_PDEV_NON_SRG_OBSS_BSSID_ENABLE_BITMAP_CMD,
>   	WMI_TAG_REGULATORY_RULE_EXT_STRUCT = 0x3A9,
>   	WMI_TAG_REG_CHAN_LIST_CC_EXT_EVENT,
> +	WMI_TAG_VDEV_SET_TPC_POWER_CMD = 0x3B5,
> +	WMI_TAG_VDEV_CH_POWER_INFO,
>   	WMI_TAG_PDEV_SET_BIOS_SAR_TABLE_CMD = 0x3D8,
>   	WMI_TAG_PDEV_SET_BIOS_GEO_TABLE_CMD,
>   	WMI_TAG_MAX
> @@ -3168,6 +3201,31 @@ struct wlan_ssid {
>   	u8 ssid[WLAN_SSID_MAX_LEN];
>   };
>   
> +struct wmi_vdev_ch_power_info {
> +	u32 tlv_header;
> +	u32 chan_cfreq; /* Channel center frequency (MHz) */
> +	/* Unit: dBm, either PSD/EIRP power for this frequency or
> +	 * incremental for non-PSD BW
> +	 */
> +	u32 tx_power;
> +} __packed;
> +
> +struct wmi_vdev_set_tpc_power_cmd {
> +	u32 tlv_header;
> +	u32 vdev_id;
> +	u32 psd_power; /* Value: 0 or 1, is PSD power or not */
> +	u32 eirp_power; /* Maximum EIRP power (dBm units), valid only if power is PSD */
> +	u32 power_type_6ghz; /* Type: WMI_6GHZ_REG_TYPE, used for halphy CTL lookup */
> +	/* This fixed_param TLV is followed by the below TLVs:
> +	 * num_pwr_levels of wmi_vdev_ch_power_info
> +	 * For PSD power, it is the PSD/EIRP power of the frequency (20 MHz chunks).
> +	 * For non-PSD power, the power values are for 20, 40, and till
> +	 * BSS BW power levels.
> +	 * The num_pwr_levels will be checked by sw how many elements present
> +	 * in the variable-length array.
> +	 */
> +} __packed;
> +
>   #define WMI_IE_BITMAP_SIZE             8
>   
>   /* prefix used by scan requestor ids on the host */
> @@ -6512,4 +6570,7 @@ void ath11k_reg_reset_info(struct cur_regulatory_info *reg_info);
>   int ath11k_reg_handle_chan_list(struct ath11k_base *ab,
>   				struct cur_regulatory_info *reg_info,
>   				enum ieee80211_ap_reg_power power_type);
> +int ath11k_wmi_send_vdev_set_tpc_power(struct ath11k *ar,
> +				       u32 vdev_id,
> +				       struct ath11k_reg_tpc_power_info *param);
>   #endif


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
