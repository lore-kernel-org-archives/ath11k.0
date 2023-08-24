Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4E0C3DA66
	for <ath11k@archiver.kernel.org>; Thu, 24 Aug 2023 00:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dX8/JqA0yG4b+UQ5jDq46INCpSM3ULsNzA3MFRKjxCs=; b=RPoGeZf0LEWkAQ
	KteS8x+eS16VKiwJNGORg+YAu/8aQRzo7GZsfBa9LYbDR92IsdYfxSbCHtWY9JJR0gTEjN7f8fSV6
	fNH/uAhWhU1noBzrzKMw0YolmGNBKnCLRkyFRZZQDaOup2ce2IrJ11ky8k5myEGqah/qCVCtAmmj7
	IYxz+GSY8NF72WkbCbZ60vnTuOXAD9KR9p4YocdGGNqDw53rxLPNLmHF61qYhcaeop9+2GBi8eg+o
	7tteVkzPqJ8xfucWQLxEX8r6wE7WqA3rLTNbqOJz3QBvCpriWOByXbrl8xf2MyDN90qCNudAfncF9
	6DJg3bMEp/2owH//ox5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYyNG-001p3t-23;
	Thu, 24 Aug 2023 00:38:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYyND-001p3V-1h
	for ath11k@lists.infradead.org;
	Thu, 24 Aug 2023 00:38:57 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37O0ETI6007439;
	Thu, 24 Aug 2023 00:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=RT4MrCHxhIv7PqgIxws5duYYUrRHy3bCH8Fu59gJLLI=;
 b=C7UC7eJyZsN7FxKrLRrIl9eAVVKljk7ERqd7+hFgY9gwRgj0T16JTsiWJj1rknbq6wJI
 0JoOiaWz+DSveyb6ugbx16vQPMnsgwmoXVKqMOtHcI2v4GRNyaiNo+bCNDr8tjSRJAqG
 9hFQwypGNtwxi81Zi5xGc/znJiH5D3XIunnMU5tBLrqingrwVt+fT9gICPqyxwQhSKex
 Ode3++XFNE3S44EGM/Qj02zk2Ow+Z9UxYWhJE9Tfyab8snvmQP39uU5mphufOYh49fIW
 NJ9jCONsve0K33FlUy5efM1F1pRpYmHpFiLFDljU5QUffJld7z8cdsIIBlTzO4VpygAT Ig== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sn2be3ecq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Aug 2023 00:38:53 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37O0cru1022600
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Aug 2023 00:38:53 GMT
Received: from [10.48.247.99] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 23 Aug
 2023 17:38:52 -0700
Message-ID: <9654c49d-68c4-4609-8832-85811b83522d@quicinc.com>
Date: Wed, 23 Aug 2023 17:38:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath11k: move references from rsvd2 to info
 fields
Content-Language: en-US
To: Muna Sinada <quic_msinada@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <1692827868-15667-1-git-send-email-quic_msinada@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <1692827868-15667-1-git-send-email-quic_msinada@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CFhDE9nyda85cDyZGezS8WEJNietnwE5
X-Proofpoint-ORIG-GUID: CFhDE9nyda85cDyZGezS8WEJNietnwE5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-23_17,2023-08-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 spamscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=999 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308240003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_173855_664701_63C21C51 
X-CRM114-Status: GOOD (  17.86  )
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
> Remove references to reserved fields and add new info fields for
> struct hal_rx_ppdu_end_user_stats. Reserved fields should not be
> accessed, therefore existing references to it are to be changed to
> referencing specific info fields.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00356-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Muna Sinada <quic_msinada@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

> ---
>   drivers/net/wireless/ath/ath11k/hal_rx.c | 10 +++++-----
>   drivers/net/wireless/ath/ath11k/hal_rx.h | 11 ++++++++---
>   2 files changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.c b/drivers/net/wireless/ath/ath11k/hal_rx.c
> index e5ed5efb139e..1103d922320e 100644
> --- a/drivers/net/wireless/ath/ath11k/hal_rx.c
> +++ b/drivers/net/wireless/ath/ath11k/hal_rx.c
> @@ -814,7 +814,7 @@ ath11k_hal_rx_handle_ofdma_info(void *rx_tlv,
>   
>   	rx_user_status->ul_ofdma_user_v0_word0 = __le32_to_cpu(ppdu_end_user->info6);
>   
> -	rx_user_status->ul_ofdma_user_v0_word1 = __le32_to_cpu(ppdu_end_user->rsvd2[10]);
> +	rx_user_status->ul_ofdma_user_v0_word1 = __le32_to_cpu(ppdu_end_user->info9);
>   }
>   
>   static inline void
> @@ -825,11 +825,11 @@ ath11k_hal_rx_populate_byte_count(void *rx_tlv, void *ppduinfo,
>   		(struct hal_rx_ppdu_end_user_stats *)rx_tlv;
>   
>   	rx_user_status->mpdu_ok_byte_count =
> -		FIELD_GET(HAL_RX_PPDU_END_USER_STATS_RSVD2_6_MPDU_OK_BYTE_COUNT,
> -			  __le32_to_cpu(ppdu_end_user->rsvd2[6]));
> +		FIELD_GET(HAL_RX_PPDU_END_USER_STATS_INFO8_MPDU_OK_BYTE_COUNT,
> +			  __le32_to_cpu(ppdu_end_user->info7));
>   	rx_user_status->mpdu_err_byte_count =
> -		FIELD_GET(HAL_RX_PPDU_END_USER_STATS_RSVD2_8_MPDU_ERR_BYTE_COUNT,
> -			  __le32_to_cpu(ppdu_end_user->rsvd2[8]));
> +		FIELD_GET(HAL_RX_PPDU_END_USER_STATS_INFO9_MPDU_ERR_BYTE_COUNT,
> +			  __le32_to_cpu(ppdu_end_user->info8));
>   }
>   
>   static inline void
> diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.h b/drivers/net/wireless/ath/ath11k/hal_rx.h
> index 61bd8416c4fd..833440df7d5c 100644
> --- a/drivers/net/wireless/ath/ath11k/hal_rx.h
> +++ b/drivers/net/wireless/ath/ath11k/hal_rx.h
> @@ -222,8 +222,8 @@ struct hal_rx_ppdu_start {
>   #define HAL_RX_PPDU_END_USER_STATS_INFO6_TID_BITMAP		GENMASK(15, 0)
>   #define HAL_RX_PPDU_END_USER_STATS_INFO6_TID_EOSP_BITMAP	GENMASK(31, 16)
>   
> -#define HAL_RX_PPDU_END_USER_STATS_RSVD2_6_MPDU_OK_BYTE_COUNT	GENMASK(24, 0)
> -#define HAL_RX_PPDU_END_USER_STATS_RSVD2_8_MPDU_ERR_BYTE_COUNT	GENMASK(24, 0)
> +#define HAL_RX_PPDU_END_USER_STATS_INFO7_MPDU_OK_BYTE_COUNT	GENMASK(24, 0)
> +#define HAL_RX_PPDU_END_USER_STATS_INFO8_MPDU_ERR_BYTE_COUNT	GENMASK(24, 0)
>   
>   struct hal_rx_ppdu_end_user_stats {
>   	__le32 rsvd0[2];
> @@ -236,7 +236,12 @@ struct hal_rx_ppdu_end_user_stats {
>   	__le32 info4;
>   	__le32 info5;
>   	__le32 info6;
> -	__le32 rsvd2[11];
> +	__le32 rsvd2[5];
> +	__le32 info7;
> +	__le32 rsvd3;
> +	__le32 info8;
> +	__le32 rsvd3[2];
> +	__le32 info9;
>   } __packed;
>   
>   struct hal_rx_ppdu_end_user_stats_ext {


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
