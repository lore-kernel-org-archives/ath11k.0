Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A34DC10DC3
	for <ath11k@archiver.kernel.org>; Mon, 11 Dec 2023 14:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DXqbcW2/yfevKNDzFduXfzs6j0etXw4ujAd+Te43fK4=; b=kjmOHKE3bg28vdRVOkIbIrg/U8
	ahqOy9R2+wcysd1IPwufQxo0esIey9PolEINplU+zRKODDbum30GW2f9PzyNy8n1f27Euvj51+glW
	9z1tDXhJ2ekftrCbrCorRmQWuUgW/poipEVfpVCE9nJraeAbdOCw3fVy8QxIfY/gfwS3ROFFz5Ks3
	T5EBe84MLyZ8fd9sB0ihdN+GeC8nRVWsvV788yAsKkIAR5AnOqKsUzKdOeoAA3RYOzqH2a7KYSX/j
	DlClIskD9GNSwdtyNhbxAARlRYsX/fzBJJ1kmWLK/lM+7ietSM0Qau9tQI/0B7mY+TlsE7gFzk3PE
	UtoJkFjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rChgT-005Ewg-2h;
	Mon, 11 Dec 2023 14:55:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rChgB-005Etc-2i
	for ath11k@lists.infradead.org;
	Mon, 11 Dec 2023 14:54:57 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BBC9kZm010067;
	Mon, 11 Dec 2023 14:54:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=DXqbcW2/yfevKNDzFduXfzs6j0etXw4ujAd+Te43fK4=; b=dA
	x3NDT7Ww/VxrYNp7+v3LdFuB7OSbkrWwxHSffZygN4VlUGCyYHdORPpniiha2IjO
	zQin4X7vXDlRBcnMtel9H6ViwRtEZC31mqk/AU+C+GUyPFxarlAWo9HhHJIHt8JZ
	AdFrvGt1jx0mFhe/tHkI92oI/M2d6ABEDUqbSQ+t6XwINIoJgWvzTw9F/sTbqLI5
	17cWJYBHpKNQ5ocwgnO28vDkF2GaDfvirm6mKOcFqr+vzgC60KLsKAnWuZjl6Ytz
	xNFLzXN245QRD2J/UafE+C8sxioYYrgOb6bS99ctxELCOwItUvVoq/9Zpi+i9/iq
	ASNM3HAy0i407r+H1vdg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ux25xgbb1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 14:54:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BBEscjW021479
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 14:54:38 GMT
Received: from [10.110.106.103] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 11 Dec
 2023 06:54:37 -0800
Message-ID: <6e09aeb2-4811-47ff-aa4b-beb1a30ba00d@quicinc.com>
Date: Mon, 11 Dec 2023 06:54:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix IOMMU errors on buffer rings
Content-Language: en-US
To: Zhenghao Gu <imguzh@gmail.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231206024325.27283-1-imguzh@gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231206024325.27283-1-imguzh@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: dgkxoVU3qJQi5SczLJM7wcF_N5AY0Hh3
X-Proofpoint-GUID: dgkxoVU3qJQi5SczLJM7wcF_N5AY0Hh3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1011 spamscore=0 lowpriorityscore=0
 mlxlogscore=445 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312110122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_065443_909607_B6ACCB6A 
X-CRM114-Status: GOOD (  22.06  )
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

On 12/5/2023 6:43 PM, Zhenghao Gu wrote:
> virt_to_phys doesn't work on systems with IOMMU enabled,
> which have non-identity physical-to-IOVA mappings.
> It leads to IO_PAGE_FAULTs like this:
> [IO_PAGE_FAULT domain=0x0023 address=0x1cce00000 flags=0x0020]
> and no link can be established.
> 
> This patch changes that to dma_map_single(), which works correctly.
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> Signed-off-by: Zhenghao Gu <imguzh@gmail.com>
> ---
>  drivers/net/wireless/ath/ath11k/dp.c  | 19 ++++++++++++++++---
>  drivers/net/wireless/ath/ath11k/hal.c | 20 ++++++++++++++++++--
>  drivers/net/wireless/ath/ath11k/hal.h |  2 ++
>  3 files changed, 36 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
> index d070bcb3f..c74230e4c 100644
> --- a/drivers/net/wireless/ath/ath11k/dp.c
> +++ b/drivers/net/wireless/ath/ath11k/dp.c
> @@ -104,11 +104,14 @@ void ath11k_dp_srng_cleanup(struct ath11k_base *ab, struct dp_srng *ring)
>  	if (!ring->vaddr_unaligned)
>  		return;
>  
> -	if (ring->cached)
> +	if (ring->cached) {
> +		dma_unmap_single(ab->dev, ring->paddr_unaligned, ring->size,
> +				 DMA_FROM_DEVICE);
>  		kfree(ring->vaddr_unaligned);
> -	else
> +	} else {
>  		dma_free_coherent(ab->dev, ring->size, ring->vaddr_unaligned,
>  				  ring->paddr_unaligned);
> +	}
>  
>  	ring->vaddr_unaligned = NULL;
>  }
> @@ -249,7 +252,17 @@ int ath11k_dp_srng_setup(struct ath11k_base *ab, struct dp_srng *ring,
>  
>  		if (cached) {
>  			ring->vaddr_unaligned = kzalloc(ring->size, GFP_KERNEL);
> -			ring->paddr_unaligned = virt_to_phys(ring->vaddr_unaligned);
> +			if (!ring->vaddr_unaligned)
> +				return -ENOMEM;
> +
> +			ring->paddr_unaligned =
> +				dma_map_single(ab->dev, ring->vaddr_unaligned,
> +					       ring->size, DMA_FROM_DEVICE);
> +			if (dma_mapping_error(ab->dev, ring->paddr_unaligned)) {
> +				kfree(ring->vaddr_unaligned);
> +				ring->vaddr_unaligned = NULL;
> +				return -ENOMEM;
> +			}
>  		}
>  	}
>  
> diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
> index 0a99aa7dd..bd4cccdba 100644
> --- a/drivers/net/wireless/ath/ath11k/hal.c
> +++ b/drivers/net/wireless/ath/ath11k/hal.c
> @@ -628,15 +628,31 @@ u32 *ath11k_hal_srng_dst_peek(struct ath11k_base *ab, struct hal_srng *srng)
>  	return NULL;
>  }
>  
> +u32 *ath11k_hal_srng_dst_peek_with_dma(struct ath11k_base *ab,
> +				       struct hal_srng *srng, dma_addr_t *paddr)

since this is only used from within hal.c make it static

> +{
> +	lockdep_assert_held(&srng->lock);
> +
> +	if (srng->u.dst_ring.tp != srng->u.dst_ring.cached_hp) {
> +		*paddr = (srng->ring_base_paddr +
> +			  sizeof(*srng->ring_base_vaddr) * srng->u.dst_ring.tp);
> +		return (srng->ring_base_vaddr + srng->u.dst_ring.tp);
> +	}
> +
> +	return NULL;
> +}
> +
>  static void ath11k_hal_srng_prefetch_desc(struct ath11k_base *ab,
>  					  struct hal_srng *srng)
>  {
>  	u32 *desc;
> +	dma_addr_t desc_paddr;
> +
>  
>  	/* prefetch only if desc is available */
> -	desc = ath11k_hal_srng_dst_peek(ab, srng);
> +	desc = ath11k_hal_srng_dst_peek_with_dma(ab, srng, &desc_paddr);
>  	if (likely(desc)) {
> -		dma_sync_single_for_cpu(ab->dev, virt_to_phys(desc),
> +		dma_sync_single_for_cpu(ab->dev, desc_paddr,
>  					(srng->entry_size * sizeof(u32)),
>  					DMA_FROM_DEVICE);
>  		prefetch(desc);
> diff --git a/drivers/net/wireless/ath/ath11k/hal.h b/drivers/net/wireless/ath/ath11k/hal.h
> index 1942d41d6..facaf8fe0 100644
> --- a/drivers/net/wireless/ath/ath11k/hal.h
> +++ b/drivers/net/wireless/ath/ath11k/hal.h
> @@ -943,6 +943,8 @@ void ath11k_hal_srng_get_params(struct ath11k_base *ab, struct hal_srng *srng,
>  u32 *ath11k_hal_srng_dst_get_next_entry(struct ath11k_base *ab,
>  					struct hal_srng *srng);
>  u32 *ath11k_hal_srng_dst_peek(struct ath11k_base *ab, struct hal_srng *srng);
> +u32 *ath11k_hal_srng_dst_peek_with_dma(struct ath11k_base *ab,
> +				       struct hal_srng *srng, dma_addr_t *paddr);

should be static so remove this

>  int ath11k_hal_srng_dst_num_free(struct ath11k_base *ab, struct hal_srng *srng,
>  				 bool sync_hw_ptr);
>  u32 *ath11k_hal_srng_src_peek(struct ath11k_base *ab, struct hal_srng *srng);
> 


