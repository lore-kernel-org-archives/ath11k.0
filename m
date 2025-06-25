Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB42EC7EE32
	for <ath11k@archiver.kernel.org>; Wed, 25 Jun 2025 11:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MWRBYYbdI2suFA4YYYEBwVodLd67TfdJKU/AXlno+H4=; b=RDq/IMN7riwoTXbXKvFXtZv8h4
	uxnAN+i0LzpjsOAZb2i9ApptPJyBzeNbDGfx8btFqhWZQ5qRjlMRtdQ9oA+LplecCz3eWCKueRT34
	9Bef9dgUhZ6jftOrEDK6HI8M2SmbChtN1rlMY7OIFA6SQboc1J2ulqBNlyDSr9pXqJEKN1S4/wTsz
	5XG6mPUDeRqZWvhviwdywTIIqMjPvevP2g6jicOPfoQGGlKWA2cP50c+99mWvrmY0niNhn+go/unx
	TGm6Vs2WNGyp1k5JT4LB0PIIo5IN3XZCoE9vppIC84ajDUNKpXG/uPtQCCHMEFch6U/x7nmaW3Pvt
	J+Zab0ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNxw-00000008Ptj-1USU;
	Wed, 25 Jun 2025 11:06:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMub-00000008EYP-0eV3
	for ath11k@lists.infradead.org;
	Wed, 25 Jun 2025 09:59:26 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P89juS015531;
	Wed, 25 Jun 2025 09:59:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MWRBYYbdI2suFA4YYYEBwVodLd67TfdJKU/AXlno+H4=; b=NS+ytyfSz3QRkjmJ
	FffnMK+i85M9X8Z3wS0W5ZWrnUv40yOBgzH7JxGgI7dgeFDjL6IP777PNs220Zd4
	9MS1/Fsn1aoUWuAqy3ny13ivK4fF3mmJXixEqYgM2b5TjjN8Rn8errdn6PpWD0gv
	xSQEeQ0HrCZgvzHPrEiVuBOARYuKd6JoWwp/ErxdK/hV9PkCxP3pq/SMiSJUajjU
	uGVMFbDf8Yt8c0hiX03fC78Qg6/iJyEWX6bSCTmLbL7KktYWwgylcdyHpOKd0AJn
	uzabluOE+Z1SY2QnmF6JthxgNwTLHrjkLzNwI7LrhthmokeyZqSv5tFlID+p0NOc
	ijg/+Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec269mpe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 09:59:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55P9xKtj023120
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 09:59:20 GMT
Received: from [10.133.33.71] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Jun
 2025 02:59:18 -0700
Message-ID: <9aacb7bd-c613-40d2-b901-53419b57c130@quicinc.com>
Date: Wed, 25 Jun 2025 17:59:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] wifi: ath11k: fix dest ring-buffer corruption
To: Johan Hovold <johan+linaro@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
CC: Miaoqing Pan <quic_miaoqing@quicinc.com>, <linux-wireless@vger.kernel.org>,
        <ath11k@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>
References: <20250604143457.26032-1-johan+linaro@kernel.org>
 <20250604143457.26032-2-johan+linaro@kernel.org>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <20250604143457.26032-2-johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA3NCBTYWx0ZWRfXxU5BxMuNh6pn
 Pp7XW06PMCB67A5A6cKDTlmyDt+0f8DaXkj4ub0riMUkKeft338d3Y0MstSxa5KDp3yUN2Z3gMd
 ithF0wXdhIJhd9VRrHvj8AstINcPnozC+q685q14EECj+Z7WL+CKTacQnDo3L1vWoqKY4dsviH1
 q8KmwQfUe0ATybJ5/cNB3wmrT9dNfo0SGt11jAffiTQ/ygWEaQ7SS3s2JbUUyl7aVG2o5hY0dmv
 byj6YzZmuomVNRd+oAIQ0QEX+qlAGehdwEFJbWOk5RNbO6R3Qwqp2vgMrKqydBczDBlQMdJXpvc
 TX66XnVV3C70cDXfgv5dkD/VH3Lqln6sVRb0vfAE3QUNaD6u2poOCLtYDaTGYEC61kAZQHu2u/l
 FdFI0tYa1MdSzTgJan7Oh8sg8RQcq6p725pDeb1EsGCEi78q7Y5Y/z09SjFiT6J0UKX6fVoR
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685bc879 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=ISufsDh2QXdYQW1nCwMA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 6E7vLhd4BjdK1lPRI8HXVZaJqv-x44Kz
X-Proofpoint-ORIG-GUID: 6E7vLhd4BjdK1lPRI8HXVZaJqv-x44Kz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=830 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_025925_202471_36D7ED9F 
X-CRM114-Status: GOOD (  20.44  )
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



On 6/4/2025 10:34 PM, Johan Hovold wrote:
> Add the missing memory barrier to make sure that destination ring
> descriptors are read after the head pointers to avoid using stale data
> on weakly ordered architectures like aarch64.
> 
> The barrier is added to the ath11k_hal_srng_access_begin() helper for
> symmetry with follow-on fixes for source ring buffer corruption which
> will add barriers to ath11k_hal_srng_access_end().
> 
> Tested-on: WCN6855 hw2.1 WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Cc: stable@vger.kernel.org	# 5.6
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/net/wireless/ath/ath11k/ce.c    |  3 ---
>  drivers/net/wireless/ath/ath11k/dp_rx.c |  3 ---
>  drivers/net/wireless/ath/ath11k/hal.c   | 12 +++++++++++-
>  3 files changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
> index 9d8efec46508..39d9aad33bc6 100644
> --- a/drivers/net/wireless/ath/ath11k/ce.c
> +++ b/drivers/net/wireless/ath/ath11k/ce.c
> @@ -393,9 +393,6 @@ static int ath11k_ce_completed_recv_next(struct ath11k_ce_pipe *pipe,
>  		goto err;
>  	}
>  
> -	/* Make sure descriptor is read after the head pointer. */
> -	dma_rmb();
> -
>  	*nbytes = ath11k_hal_ce_dst_status_get_length(desc);
>  
>  	*skb = pipe->dest_ring->skb[sw_index];
> diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
> index ea2959305dec..d8dab182a9af 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
> @@ -2650,9 +2650,6 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
>  try_again:
>  	ath11k_hal_srng_access_begin(ab, srng);
>  
> -	/* Make sure descriptor is read after the head pointer. */
> -	dma_rmb();
> -
>  	while (likely(desc =
>  	      (struct hal_reo_dest_ring *)ath11k_hal_srng_dst_get_next_entry(ab,
>  									     srng))) {
> diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
> index 8cb1505a5a0c..921114686ba3 100644
> --- a/drivers/net/wireless/ath/ath11k/hal.c
> +++ b/drivers/net/wireless/ath/ath11k/hal.c
> @@ -823,13 +823,23 @@ u32 *ath11k_hal_srng_src_peek(struct ath11k_base *ab, struct hal_srng *srng)
>  
>  void ath11k_hal_srng_access_begin(struct ath11k_base *ab, struct hal_srng *srng)
>  {
> +	u32 hp;
> +
>  	lockdep_assert_held(&srng->lock);
>  
>  	if (srng->ring_dir == HAL_SRNG_DIR_SRC) {
>  		srng->u.src_ring.cached_tp =
>  			*(volatile u32 *)srng->u.src_ring.tp_addr;
>  	} else {
> -		srng->u.dst_ring.cached_hp = READ_ONCE(*srng->u.dst_ring.hp_addr);
> +		hp = READ_ONCE(*srng->u.dst_ring.hp_addr);
> +
> +		if (hp != srng->u.dst_ring.cached_hp) {
> +			srng->u.dst_ring.cached_hp = hp;
> +			/* Make sure descriptor is read after the head
> +			 * pointer.
> +			 */
> +			dma_rmb();
> +		}
>  
>  		/* Try to prefetch the next descriptor in the ring */
>  		if (srng->flags & HAL_SRNG_FLAGS_CACHED)

Reviewed-by: Baochen Qiang <quic_bqiang@quicinc.com>

