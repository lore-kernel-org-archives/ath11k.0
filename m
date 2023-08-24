Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EEE1C3DA6F
	for <ath11k@archiver.kernel.org>; Thu, 24 Aug 2023 00:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AK/oedw4o9sVJkXk1SebAexzWKmLAHdlocmcWntT4mg=; b=ELTd6DU1GLF+hG
	u/LJLd/Y6BNXUnYCGtjGZtDPAB/VolmaXKkw+nmN5PbA3ZxGZDoQzKiEKxD4xIBYM39eU9w3nVu3k
	TQ+mM2Y5berP3IsaiE9z2Aj0aPx/LtA3/LyL793+w+FfP4P7WCtbbRUVPJvNpWovLa9Xcx3bN91Vy
	NYrPJLRTCDlRSZAftb+MTvs7lV0kigBkD+cFEN79/rVCka7z+4X2y4a/4r8r79OR0laWuNkosrbm1
	dD75jf2vdeoNSPT+T+ZncQ/1qQxj871JLA8iont71cI2CYaknc8f5vMCGTTUtDopMAw5592m5BwMt
	dYVFof64STmpgvK+UPow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYyO0-001p8I-0f;
	Thu, 24 Aug 2023 00:39:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYyNx-001p7n-1y
	for ath11k@lists.infradead.org;
	Thu, 24 Aug 2023 00:39:43 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37O0TtdN014073;
	Thu, 24 Aug 2023 00:39:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ql5qCJXsGeY7wS6b58HZbMfdQIHPB9SCkTTKF1SJutI=;
 b=exnzn77l0pt6fcq3BunhKzjZXVj0dAVQVxTrA8wxS5aemT+qLtALInrZlbeWEPqh2mio
 1IdFe+LeRGWlXKy28fFJO8sDDcddo9G/64vyJCqR76tHPI73k5dwknmb51zf50f/5ip8
 jYLh+3k2MfqFBRY8TgApalY6kfyZvp3rCECiljCNoHBWjG0YIf82G/zfqwTcDrOazk/5
 H5yh5tYp902CGGDU56O7FQKTwioW+N3cqDvX9SAm1mtoAAln4Z2Ocu09DDOFRkn7mPpJ
 xMvrni8S+9u/kVwHdo7+IOA5C+X2Xu2m0e04BnVYwGzPd867N790e3Q1sD361Pppnl+p fQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sn3tqk3q7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Aug 2023 00:39:39 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37O0dHsh008125
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Aug 2023 00:39:17 GMT
Received: from [10.48.247.99] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 23 Aug
 2023 17:39:17 -0700
Message-ID: <371e63ac-b25a-479f-8d70-3dc8bf57f472@quicinc.com>
Date: Wed, 23 Aug 2023 17:39:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: ath11k: fix tid bitmap is 0 in peer rx mu stats
Content-Language: en-US
To: Muna Sinada <quic_msinada@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <1692827868-15667-1-git-send-email-quic_msinada@quicinc.com>
 <1692827868-15667-2-git-send-email-quic_msinada@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <1692827868-15667-2-git-send-email-quic_msinada@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SbaHhrGHvIHN5CRcLpYKuTvtvjwDTnT9
X-Proofpoint-ORIG-GUID: SbaHhrGHvIHN5CRcLpYKuTvtvjwDTnT9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-23_16,2023-08-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 bulkscore=0 spamscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308240003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_173941_768619_2D7C9777 
X-CRM114-Status: GOOD (  18.04  )
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

On 8/23/2023 2:57 PM, Muna Sinada wrote:
> Correct parsing of reading offset for rx tid 16 bit bitmap. Incorrect
> offset caused peer rx mu stats tid bitmap to always be zero. This
> correction is in the software context and does not affect the
> firmware interface.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00356-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Muna Sinada <quic_msinada@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

> ---
>   drivers/net/wireless/ath/ath11k/hal_rx.c | 10 +++++-----
>   drivers/net/wireless/ath/ath11k/hal_rx.h | 17 +++++++++--------
>   2 files changed, 14 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.c b/drivers/net/wireless/ath/ath11k/hal_rx.c
> index 1103d922320e..8c36a43af63e 100644
> --- a/drivers/net/wireless/ath/ath11k/hal_rx.c
> +++ b/drivers/net/wireless/ath/ath11k/hal_rx.c
> @@ -814,7 +814,7 @@ ath11k_hal_rx_handle_ofdma_info(void *rx_tlv,
>   
>   	rx_user_status->ul_ofdma_user_v0_word0 = __le32_to_cpu(ppdu_end_user->info6);
>   
> -	rx_user_status->ul_ofdma_user_v0_word1 = __le32_to_cpu(ppdu_end_user->info9);
> +	rx_user_status->ul_ofdma_user_v0_word1 = __le32_to_cpu(ppdu_end_user->info10);
>   }
>   
>   static inline void
> @@ -826,10 +826,10 @@ ath11k_hal_rx_populate_byte_count(void *rx_tlv, void *ppduinfo,
>   
>   	rx_user_status->mpdu_ok_byte_count =
>   		FIELD_GET(HAL_RX_PPDU_END_USER_STATS_INFO8_MPDU_OK_BYTE_COUNT,
> -			  __le32_to_cpu(ppdu_end_user->info7));
> +			  __le32_to_cpu(ppdu_end_user->info8));
>   	rx_user_status->mpdu_err_byte_count =
>   		FIELD_GET(HAL_RX_PPDU_END_USER_STATS_INFO9_MPDU_ERR_BYTE_COUNT,
> -			  __le32_to_cpu(ppdu_end_user->info8));
> +			  __le32_to_cpu(ppdu_end_user->info9));
>   }
>   
>   static inline void
> @@ -903,8 +903,8 @@ ath11k_hal_rx_parse_mon_status_tlv(struct ath11k_base *ab,
>   			FIELD_GET(HAL_RX_PPDU_END_USER_STATS_INFO2_AST_INDEX,
>   				  __le32_to_cpu(eu_stats->info2));
>   		ppdu_info->tid =
> -			ffs(FIELD_GET(HAL_RX_PPDU_END_USER_STATS_INFO6_TID_BITMAP,
> -				      __le32_to_cpu(eu_stats->info6))) - 1;
> +			ffs(FIELD_GET(HAL_RX_PPDU_END_USER_STATS_INFO7_TID_BITMAP,
> +				      __le32_to_cpu(eu_stats->info7))) - 1;
>   		ppdu_info->tcp_msdu_count =
>   			FIELD_GET(HAL_RX_PPDU_END_USER_STATS_INFO4_TCP_MSDU_CNT,
>   				  __le32_to_cpu(eu_stats->info4));
> diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.h b/drivers/net/wireless/ath/ath11k/hal_rx.h
> index 833440df7d5c..472a52cf5889 100644
> --- a/drivers/net/wireless/ath/ath11k/hal_rx.h
> +++ b/drivers/net/wireless/ath/ath11k/hal_rx.h
> @@ -149,7 +149,7 @@ struct hal_rx_mon_ppdu_info {
>   	u8 beamformed;
>   	u8 rssi_comb;
>   	u8 rssi_chain_pri20[HAL_RX_MAX_NSS];
> -	u8 tid;
> +	u16 tid;
>   	u16 ht_flags;
>   	u16 vht_flags;
>   	u16 he_flags;
> @@ -219,11 +219,11 @@ struct hal_rx_ppdu_start {
>   #define HAL_RX_PPDU_END_USER_STATS_INFO5_OTHER_MSDU_CNT		GENMASK(15, 0)
>   #define HAL_RX_PPDU_END_USER_STATS_INFO5_TCP_ACK_MSDU_CNT	GENMASK(31, 16)
>   
> -#define HAL_RX_PPDU_END_USER_STATS_INFO6_TID_BITMAP		GENMASK(15, 0)
> -#define HAL_RX_PPDU_END_USER_STATS_INFO6_TID_EOSP_BITMAP	GENMASK(31, 16)
> +#define HAL_RX_PPDU_END_USER_STATS_INFO7_TID_BITMAP		GENMASK(15, 0)
> +#define HAL_RX_PPDU_END_USER_STATS_INFO7_TID_EOSP_BITMAP	GENMASK(31, 16)
>   
> -#define HAL_RX_PPDU_END_USER_STATS_INFO7_MPDU_OK_BYTE_COUNT	GENMASK(24, 0)
> -#define HAL_RX_PPDU_END_USER_STATS_INFO8_MPDU_ERR_BYTE_COUNT	GENMASK(24, 0)
> +#define HAL_RX_PPDU_END_USER_STATS_INFO8_MPDU_OK_BYTE_COUNT	GENMASK(24, 0)
> +#define HAL_RX_PPDU_END_USER_STATS_INFO9_MPDU_ERR_BYTE_COUNT	GENMASK(24, 0)
>   
>   struct hal_rx_ppdu_end_user_stats {
>   	__le32 rsvd0[2];
> @@ -236,12 +236,13 @@ struct hal_rx_ppdu_end_user_stats {
>   	__le32 info4;
>   	__le32 info5;
>   	__le32 info6;
> -	__le32 rsvd2[5];
>   	__le32 info7;
> -	__le32 rsvd3;
> +	__le32 rsvd2[4];
>   	__le32 info8;
> -	__le32 rsvd3[2];
> +	__le32 rsvd3;
>   	__le32 info9;
> +	__le32 rsvd4[2];
> +	__le32 info10;
>   } __packed;
>   
>   struct hal_rx_ppdu_end_user_stats_ext {


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
