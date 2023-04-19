Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70582C6FD18
	for <ath11k@archiver.kernel.org>; Wed, 19 Apr 2023 06:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RVuWgHguxATjxzZ4fXRQpuxDFii6hEw6vZMPMJqeGX8=; b=oiJzUSRkTDLlbk
	dkhVGGSltXvnZ9DWtvSVKIRcKMLmeNq+VkW1F9qkP6MDMC3UlBJbbFezJQNk+utG54dwvZq9l5mKV
	rmm6pXxZcVcPbYd825+YW7UQf9MlbujSVGxrOw6zLbg7sACg4qTuKlkpVEUOwmH9qEMdR5NZgJQJB
	Js1pD8mj+CfVQAnfXledjD/nUEpftZWi5z2rNC2y8MCNLulzFhD2q4eFSE25xHSUbwOmzOFObr3cD
	ziXTmLqVs1U0Z8NkDoobLCXpFVZui94dsWgT4yNqYcf2b4j+OWHaRcnpqA9IlQ4N/vnWzJRHZzJFm
	dbT2mFjjrJeOqsScLk1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp0w9-004A1F-1g;
	Wed, 19 Apr 2023 06:05:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp0w5-004A0U-0I
	for ath11k@lists.infradead.org;
	Wed, 19 Apr 2023 06:04:59 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33J62oB5009687;
	Wed, 19 Apr 2023 06:04:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=RkSpBpAs+4d6jRP2+nm8ZKdyBFU11034H6cGBVSN9Wc=;
 b=f5BTzyPx4il6EFrzfePV+M2jRalGQYgO2fZxmT+HiEmMLDQnVdi/SE0KevCWTVPJVYoV
 5X6R668eYY7KCP3IQHoopd2qwEIq5NlT77eD56UFk424Cma+YayC9dqKMg//uvk9BbtO
 O7+bnZh35Fn0oIS0QYtCsosv3gc3MDGe1gIA9oTz/g4Bojv1Rbsl12cHNsLUQ2FqZrV/
 eQqyy/0kJoCRtHna+cG9I10ujkA+9gsOjRTbi858qaeVYJHG7P/wWfvAci/KuYcwxJZv
 ti2b4/tmWmbnSEqP/6KEGk2xREA8bLiQH4ORhPNok+PTkRcHdlrTqm5KQjOPmQ8aOFhp eg== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q28g2g7h0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Apr 2023 06:04:53 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33J64qIV009614
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Apr 2023 06:04:52 GMT
Received: from [10.242.242.155] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 18 Apr
 2023 23:04:50 -0700
Message-ID: <083b024f-fd38-24ed-98a9-66bd23612094@quicinc.com>
Date: Wed, 19 Apr 2023 11:34:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3] wifi: ath11k: add support for htt stats rx_ext_stats
 (30) support
Content-Language: en-US
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Sathishkumar Muruganandam
	<quic_murugana@quicinc.com>
References: <20230418143032.4814-1-quic_karm@quicinc.com>
From: Karthik M <quic_karm@quicinc.com>
In-Reply-To: <20230418143032.4814-1-quic_karm@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nL8l8DP-GGD7vWGLUvZ1ywLy0j4fmA0f
X-Proofpoint-GUID: nL8l8DP-GGD7vWGLUvZ1ywLy0j4fmA0f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-19_02,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 mlxlogscore=966 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304190054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_230457_250795_DE10583A 
X-CRM114-Status: GOOD (  23.39  )
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

Please ignore this patch.

Karthik M

On 18-Apr-23 8:00 PM, Karthik M wrote:
> HTT stats, HTT_RX_PDEV_RATE_EXT_STATS has the rx stats info of
> the extended 80MHz, mainly 80+80 and 160MHz modes.
> 
> Usage: echo 30 > /sys/kernel/debug/ieee80211/phyx/ath11k/htt_stats_type
>         cat /sys/kernel/debug/ieee80211/phyx/ath11k/htt_stats
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-01184-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Sathishkumar Muruganandam <quic_murugana@quicinc.com>
> Signed-off-by: Karthik M <quic_karm@quicinc.com>
> ---
> ---
> v2:
>    - Integrated the patch already raised.
> ---
> v3:
>    - Addressed jeff's comments to remove unnecssary MACRO
>    - Removed scnprintf check
>    - Removed inline in function definition.
> ---
>   drivers/net/wireless/ath/ath11k/debugfs.h     |  1 +
>   .../wireless/ath/ath11k/debugfs_htt_stats.c   | 91 +++++++++++++++++++
>   .../wireless/ath/ath11k/debugfs_htt_stats.h   | 40 ++++++++
>   3 files changed, 132 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/debugfs.h b/drivers/net/wireless/ath/ath11k/debugfs.h
> index 3af0169f6cf2..00da0c06b4a0 100644
> --- a/drivers/net/wireless/ath/ath11k/debugfs.h
> +++ b/drivers/net/wireless/ath/ath11k/debugfs.h
> @@ -39,6 +39,7 @@ enum ath11k_dbg_htt_ext_stats_type {
>   	ATH11K_DBG_HTT_EXT_STATS_PDEV_OBSS_PD_STATS	    =  23,
>   	ATH11K_DBG_HTT_EXT_STATS_RING_BACKPRESSURE_STATS    =  24,
>   	ATH11K_DBG_HTT_EXT_STATS_PEER_CTRL_PATH_TXRX_STATS  =  29,
> +	ATH11K_DBG_HTT_EXT_STATS_PDEV_RX_RATE_EXT           =  30,
>   	ATH11K_DBG_HTT_EXT_STATS_PDEV_TX_RATE_TXBF_STATS    =  31,
>   	ATH11K_DBG_HTT_EXT_STATS_TXBF_OFDMA		    =  32,
>   	ATH11K_DBG_HTT_EXT_PHY_COUNTERS_AND_PHY_STATS	    =  37,
> diff --git a/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c
> index b3efca6bd7dd..ee094197c70e 100644
> --- a/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c
> +++ b/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c
> @@ -2879,6 +2879,94 @@ static inline void htt_print_tx_pdev_rate_stats_tlv(const void *tag_buf,
>   	stats_req->buf_len = len;
>   }
>   
> +static void htt_print_rx_pdev_rate_ext_stats_tlv(const void *tag_buf,
> +						 struct debug_htt_stats_req *stats_req)
> +{
> +	const struct htt_rx_pdev_rate_ext_stats_tlv *htt_stats_buf = tag_buf;
> +	u8 *buf = stats_req->buf;
> +	u32 len = stats_req->buf_len;
> +	u32 buf_len = ATH11K_HTT_STATS_BUF_SIZE;
> +	u8 i, j;
> +
> +	len += scnprintf(buf + len, buf_len - len,
> +			 "HTT_RX_PDEV_RATE_EXT_STATS_TLV:\n");
> +	len += scnprintf(buf + len, buf_len - len, "rssi_mcast = %d\n",
> +			 htt_stats_buf->rssi_mcast);
> +	len += scnprintf(buf + len, buf_len - len, "rssi_mgmt = %d\n",
> +			 htt_stats_buf->rssi_mgmt);
> +
> +	for (j = 0; j < HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS; j++) {
> +		len += scnprintf(buf + len, buf_len - len,
> +				 "\nrssi_chain_ext[%u] = ", j);
> +		PRINT_ARRAY_TO_BUF(buf, len,
> +				   htt_stats_buf->rssi_chain_ext[j],
> +				   NULL,
> +				   HTT_RX_PDEV_STATS_NUM_BW_EXT_COUNTERS,
> +				   "\n");
> +	}
> +
> +	for (j = 0; j < HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS; j++) {
> +		len += scnprintf(buf + len, buf_len - len,
> +				 "\nrx_per_chain_rssi_ext_in_dbm[%u] = ", j);
> +		for (i = 0; i < HTT_RX_PDEV_STATS_NUM_BW_EXT_COUNTERS; i++)
> +			len += scnprintf(buf + len,
> +					 ATH11K_HTT_STATS_BUF_SIZE - len,
> +					 " %u:%d,",
> +					 i,
> +					 htt_stats_buf->rx_per_chain_rssi_ext_in_dbm[j][i]);
> +		len += scnprintf(buf + len,
> +				 ATH11K_HTT_STATS_BUF_SIZE - len,
> +				 "\n");
> +	}
> +
> +	PRINT_ARRAY_TO_BUF(buf, len, htt_stats_buf->rx_mcs_ext,
> +			   "\nrx_mcs_ext",
> +			   HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS_EXT, "\n");
> +
> +	PRINT_ARRAY_TO_BUF(buf, len, htt_stats_buf->rx_stbc_ext,
> +			   "\nrx_stbc_ext",
> +			   HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS_EXT, "\n");
> +
> +	for (j = 0; j < HTT_RX_PDEV_STATS_NUM_GI_COUNTERS; j++) {
> +		len += scnprintf(buf + len, buf_len - len,
> +				 "\nrx_gi_ext[%u] = ", j);
> +		PRINT_ARRAY_TO_BUF(buf, len, htt_stats_buf->rx_gi_ext[j],
> +				   NULL,
> +				   HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS_EXT,
> +				   "\n");
> +	}
> +
> +	PRINT_ARRAY_TO_BUF(buf, len, htt_stats_buf->ul_ofdma_rx_mcs_ext,
> +			   "\nul_ofdma_rx_mcs_ext",
> +			   HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS_EXT, "\n");
> +
> +	for (j = 0; j < HTT_RX_PDEV_STATS_NUM_GI_COUNTERS; j++) {
> +		len += scnprintf(buf + len, buf_len - len,
> +				 "\nul_ofdma_rx_gi_ext[%u] = ", j);
> +		PRINT_ARRAY_TO_BUF(buf, len,
> +				   htt_stats_buf->ul_ofdma_rx_gi_ext[j],
> +				   NULL,
> +				   HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS_EXT,
> +				   "\n");
> +	}
> +
> +	PRINT_ARRAY_TO_BUF(buf, len, htt_stats_buf->rx_11ax_su_txbf_mcs_ext,
> +			   "\nrx_11ax_su_txbf_mcs_ext",
> +			   HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS_EXT, "\n");
> +
> +	PRINT_ARRAY_TO_BUF(buf, len, htt_stats_buf->rx_11ax_mu_txbf_mcs_ext,
> +			   "\nrx_11ax_mu_txbf_mcs_ext",
> +			   HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS_EXT, "\n");
> +
> +	PRINT_ARRAY_TO_BUF(buf, len, htt_stats_buf->rx_11ax_dl_ofdma_mcs_ext,
> +			   "\nrx_11ax_dl_ofdma_mcs_ext",
> +			   HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS_EXT, "\n");
> +
> +	len += scnprintf(buf + len, buf_len - len, "\n");
> +
> +	stats_req->buf_len = len;
> +}
> +
>   static inline void htt_print_rx_pdev_rate_stats_tlv(const void *tag_buf,
>   						    struct debug_htt_stats_req *stats_req)
>   {
> @@ -4428,6 +4516,9 @@ static int ath11k_dbg_htt_ext_stats_parse(struct ath11k_base *ab,
>   	case HTT_STATS_PEER_CTRL_PATH_TXRX_STATS_TAG:
>   		htt_print_peer_ctrl_path_txrx_stats_tlv(tag_buf, stats_req);
>   		break;
> +	case HTT_STATS_RX_PDEV_RATE_EXT_STATS_TAG:
> +		htt_print_rx_pdev_rate_ext_stats_tlv(tag_buf, stats_req);
> +		break;
>   	default:
>   		break;
>   	}
> diff --git a/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.h b/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.h
> index 2b97cbbd28cb..ce692fb3f357 100644
> --- a/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.h
> +++ b/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.h
> @@ -104,6 +104,7 @@ enum htt_tlv_tag_t {
>   	HTT_STATS_HW_WAR_TAG				    = 89,
>   	HTT_STATS_RING_BACKPRESSURE_STATS_TAG		    = 90,
>   	HTT_STATS_PEER_CTRL_PATH_TXRX_STATS_TAG		    = 101,
> +	HTT_STATS_RX_PDEV_RATE_EXT_STATS_TAG                = 103,
>   	HTT_STATS_PDEV_TX_RATE_TXBF_STATS_TAG		    = 108,
>   	HTT_STATS_TXBF_OFDMA_NDPA_STATS_TAG		    = 113,
>   	HTT_STATS_TXBF_OFDMA_NDP_STATS_TAG		    = 114,
> @@ -442,6 +443,12 @@ enum htt_stats_param_type {
>   #define HTT_TX_PEER_STATS_NUM_MCS_COUNTERS        12
>   #define HTT_TX_PEER_STATS_NUM_GI_COUNTERS          4
>   #define HTT_TX_PEER_STATS_NUM_DCM_COUNTERS         5
> +/* HTT_TX_PEER_STATS_NUM_BW_COUNTERS:
> + * bw index 0: rssi_pri20_chain0
> + * bw index 1: rssi_ext20_chain0
> + * bw index 2: rssi_ext40_low20_chain0
> + * bw index 3: rssi_ext40_high20_chain0
> + */
>   #define HTT_TX_PEER_STATS_NUM_BW_COUNTERS          4
>   #define HTT_TX_PEER_STATS_NUM_SPATIAL_STREAMS      8
>   #define HTT_TX_PEER_STATS_NUM_PREAMBLE_TYPES       HTT_STATS_PREAM_COUNT
> @@ -1986,4 +1993,37 @@ static inline int ath11k_debugfs_htt_stats_req(struct ath11k *ar)
>   
>   #endif /* CONFIG_ATH11K_DEBUGFS */
>   
> +/* == PDEV RX RATE EXT STATS == */
> +#define HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS_EXT 14
> +/* HTT_RX_PEER_STATS_NUM_BW_EXT_COUNTERS:
> + * bw index 4 (bw ext index 0): rssi_ext80_low20_chain0
> + * bw index 5 (bw ext index 1): rssi_ext80_low_high20_chain0
> + * bw index 6 (bw ext index 2): rssi_ext80_high_low20_chain0
> + * bw index 7 (bw ext index 3): rssi_ext80_high20_chain0
> + */
> +#define HTT_RX_PEER_STATS_NUM_BW_EXT_COUNTERS 4
> +#define HTT_RX_PDEV_STATS_NUM_BW_EXT_COUNTERS 4
> +
> +struct htt_rx_pdev_rate_ext_stats_tlv {
> +	u8 rssi_chain_ext[HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS]
> +			 [HTT_RX_PDEV_STATS_NUM_BW_EXT_COUNTERS];
> +	/* units = dB above noise floor */
> +	s8 rx_per_chain_rssi_ext_in_dbm[HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS]
> +				       [HTT_RX_PDEV_STATS_NUM_BW_EXT_COUNTERS];
> +	/* rx mcast signal strength value in dBm unit */
> +	s32 rssi_mcast;
> +	/* rx mgmt packet signal strength value in dBm unit */
> +	s32 rssi_mgmt;
> +	u32 rx_mcs_ext[HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS_EXT];
> +	u32 rx_stbc_ext[HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS_EXT];
> +	u32 rx_gi_ext[HTT_RX_PDEV_STATS_NUM_GI_COUNTERS]
> +		     [HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS_EXT];
> +	u32 ul_ofdma_rx_mcs_ext[HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS_EXT];
> +	u32 ul_ofdma_rx_gi_ext[HTT_TX_PDEV_STATS_NUM_GI_COUNTERS]
> +			      [HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS_EXT];
> +	u32 rx_11ax_su_txbf_mcs_ext[HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS_EXT];
> +	u32 rx_11ax_mu_txbf_mcs_ext[HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS_EXT];
> +	u32 rx_11ax_dl_ofdma_mcs_ext[HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS_EXT];
> +};
> +
>   #endif

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
