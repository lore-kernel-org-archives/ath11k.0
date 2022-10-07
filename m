Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7CDAC433FE
	for <ath11k@archiver.kernel.org>; Fri,  7 Oct 2022 21:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xjX7y6WnffKIMlSMf2EQxN8wie8UZj/ymCJbAS577AY=; b=XFfRuAr2sHrPZ3
	YN0wDoafGEZBnhtVJs8+UA0/h/zPu5yGJFh/0Abtn3G0+6poF5dGOZhZUBH4UWHzbDGicpshL4Ld9
	1Y3ehEuF44+4OeXW7hy3m2APMNMTRdqQ7vTAXo8dl+VpBgDWozHIOFr3T4wQQbj/kUGrl8HgtzeS9
	PN5L42/wlea6NJ3yYtUYz77d7FVz7ow6WqlhrIcKOP4wUYxG5Z0LzlQTfl0BBq1ct6yG4zuTembZ5
	3uS4HgV1be+Nuk99qqtAts3isCSQD0ARUU74CYZkcG1dnKOXqyjvyDOZhrklpiTFTcgyIXinez8KE
	gZsayqmgWUJsUz2TLP9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oguic-00AZaW-5M; Fri, 07 Oct 2022 21:17:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oguiZ-00AZZr-5x
	for ath11k@lists.infradead.org; Fri, 07 Oct 2022 21:17:16 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 297KQu1K028477;
	Fri, 7 Oct 2022 21:17:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=3QrNVi1usyWME1gXqNkiJMWH+RqywCHaV32uqXC/9Ss=;
 b=RkH2RAp1CiM1y2GHQVnGvuLA/4zJ3Iqt5MUiIw8AhI8KpcSafcC2VxGzJ2GsbNrHTYmK
 cTgibubV3LP0AU20wTurAIPC8rCMjlfuVDOgwopKUqNGvR+LIi8sik8CKge6RZ3Y+e4s
 qOTJky3k6ZAN54R0uC1eajrL+S+DY+bdUe+lCm7C+AxVQdegX1hlLVbhZCD7BtXaSOWw
 SmOy5WzQzF20lU/SdxJqz8xv+bSSrWv7Ev8U8cEloxpcDDULHbUeA/63RekfvaXcNcsr
 Hd/jt/Qb4J4b651jmMvNRBa5V3OTVJd7HnaI+VGnLvi0LpOq0OYeoiCaCPr77qrhWL5D vA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k2a7qt48w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Oct 2022 21:17:14 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 297LHDAA014030
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Oct 2022 21:17:13 GMT
Received: from [10.110.6.63] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Fri, 7 Oct 2022
 14:17:12 -0700
Message-ID: <1b78eac5-2349-8845-aa5c-3092ba0e8b6f@quicinc.com>
Date: Fri, 7 Oct 2022 14:17:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] wifi: ath11k: add support to configure channel dwell time
Content-Language: en-US
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
        <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20221007051130.6067-1-quic_mpubbise@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20221007051130.6067-1-quic_mpubbise@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: o-Rs28QNKQy6QfjKH1iALLPA35fJ0bFq
X-Proofpoint-ORIG-GUID: o-Rs28QNKQy6QfjKH1iALLPA35fJ0bFq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-07_04,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 mlxscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 clxscore=1015
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210070127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_141715_369821_D4FD4A6B 
X-CRM114-Status: GOOD (  25.14  )
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

On 10/6/2022 10:11 PM, Manikanta Pubbisetty wrote:
> Add support to configure channel dwell time during scan.
> Dwell time help to stay on the channel for a specified duration
> during scan and aid userspace in finding WiFi networks. Very
> useful in passive scans where longer dwell times are needed
> to find the WiFi networks.
> 
> Configure channel dwell time from duration of the scan request
> received from mac80211 when the duration is non-zero. When the
> scan request does not have duration value, use the default ones,
> the current implementation.
> 
> Advertise orresponding feature flag NL80211_EXT_FEATURE_SET_SCAN_DWELL

s/orresponding/corresponding/
Kalle can fix that when he merges so don't repost for that

> to enable the feature.
> 
> Change is applicable for all ath11k hardware.
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
> 
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>

Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>

> ---
>   drivers/net/wireless/ath/ath11k/mac.c | 33 +++++++++++++++++++++++----
>   1 file changed, 29 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index 84d956ad4093..0da136916e0e 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -241,7 +241,10 @@ const struct htt_rx_ring_tlv_filter ath11k_mac_mon_status_filter_default = {
>   #define ath11k_a_rates (ath11k_legacy_rates + 4)
>   #define ath11k_a_rates_size (ARRAY_SIZE(ath11k_legacy_rates) - 4)
>   
> -#define ATH11K_MAC_SCAN_TIMEOUT_MSECS 200 /* in msecs */
> +#define ATH11K_MAC_SCAN_CMD_EVT_OVERHEAD		200 /* in msecs */
> +
> +/* Overhead due to the processing of channel switch events from FW */
> +#define ATH11K_SCAN_CHANNEL_SWITCH_WMI_EVT_OVERHEAD	10 /* in msecs */
>   
>   static const u32 ath11k_smps_map[] = {
>   	[WLAN_HT_CAP_SM_PS_STATIC] = WMI_PEER_SMPS_STATIC,
> @@ -3611,6 +3614,7 @@ static int ath11k_mac_op_hw_scan(struct ieee80211_hw *hw,
>   	struct scan_req_params arg;
>   	int ret = 0;
>   	int i;
> +	u32 scan_timeout;
>   
>   	mutex_lock(&ar->conf_mutex);
>   
> @@ -3680,6 +3684,26 @@ static int ath11k_mac_op_hw_scan(struct ieee80211_hw *hw,
>   		ether_addr_copy(arg.mac_mask.addr, req->mac_addr_mask);
>   	}
>   
> +	/* if duration is set, default dwell times will be overwritten */
> +	if (req->duration) {
> +		arg.dwell_time_active = req->duration;
> +		arg.dwell_time_active_2g = req->duration;
> +		arg.dwell_time_active_6g = req->duration;
> +		arg.dwell_time_passive = req->duration;
> +		arg.dwell_time_passive_6g = req->duration;
> +		arg.burst_duration = req->duration;
> +
> +		scan_timeout = min_t(u32, arg.max_rest_time *
> +				(arg.num_chan - 1) + (req->duration +
> +				ATH11K_SCAN_CHANNEL_SWITCH_WMI_EVT_OVERHEAD) *
> +				arg.num_chan, arg.max_scan_time);
> +	} else {
> +		scan_timeout = arg.max_scan_time;
> +	}
> +
> +	/* Add a margin to account for event/command processing */
> +	scan_timeout += ATH11K_MAC_SCAN_CMD_EVT_OVERHEAD;
> +
>   	ret = ath11k_start_scan(ar, &arg);
>   	if (ret) {
>   		ath11k_warn(ar->ab, "failed to start hw scan: %d\n", ret);
> @@ -3688,10 +3712,8 @@ static int ath11k_mac_op_hw_scan(struct ieee80211_hw *hw,
>   		spin_unlock_bh(&ar->data_lock);
>   	}
>   
> -	/* Add a 200ms margin to account for event/command processing */
>   	ieee80211_queue_delayed_work(ar->hw, &ar->scan.timeout,
> -				     msecs_to_jiffies(arg.max_scan_time +
> -						      ATH11K_MAC_SCAN_TIMEOUT_MSECS));
> +				     msecs_to_jiffies(scan_timeout));
>   
>   exit:
>   	kfree(arg.chan_list);
> @@ -9013,6 +9035,9 @@ static int __ath11k_mac_register(struct ath11k *ar)
>   				      NL80211_EXT_FEATURE_UNSOL_BCAST_PROBE_RESP);
>   	}
>   
> +	wiphy_ext_feature_set(ar->hw->wiphy,
> +			      NL80211_EXT_FEATURE_SET_SCAN_DWELL);
> +
>   	ath11k_reg_init(ar);
>   
>   	if (!test_bit(ATH11K_FLAG_RAW_MODE, &ab->dev_flags)) {
> 
> base-commit: 023baf1318ef21442fab3842bf03883bc81223e0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
