Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5447C7EE30
	for <ath11k@archiver.kernel.org>; Wed, 25 Jun 2025 11:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vVfbmAL9nuta9hPZ9Nq1gX/UlCRXU0dU44mdWz4B17A=; b=R/Asft4DdXqdMkfetR9TjV12iT
	xlxrebGCdv6M5Nhon/oE9SVVVNTtCgsgl+25WqeAlA7uw7NgTqRaMjm9MCJ6RN3qA0+QlEJPRmk1n
	GXJS8j0ZiGM27turM7nD867G98JRE3muQnsFK2CXyKDn5hLEvdUqT7BunNFFMgvDvQr7Y53jX1RBn
	Jp2TKETMLOyUo/xeljKv7GFUXYqse2o70Urjb8Au3H1Qq/ewCXE57TIZKCzcC5iV3Qw7JyoTei6oH
	SkfYqpHhhKJNyltuWM3Ha9pCTfh1qGcYEFFbDqFRd+mQLIcGV7DqvYiE4NV6xgJwRsx31/5Tz0rqT
	3z9J4JUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNy5-00000008Q0z-2WZD;
	Wed, 25 Jun 2025 11:07:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMwA-00000008Enb-1RJY
	for ath11k@bombadil.infradead.org;
	Wed, 25 Jun 2025 10:01:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vVfbmAL9nuta9hPZ9Nq1gX/UlCRXU0dU44mdWz4B17A=; b=UJYjaR/e0G1r5c+Qy4LbsiAICj
	0qL3R1kMaQ8ABorjYZZH4D1zGWYnX81rnZSzVVrZmRIKGI5yMuPqIoD6pEMe6WZSy5hQmqEX4hrIV
	yWIUIUDNHn3GpmwJkRL88qIQSLf8mr6kcIu2knol0+aq1xwI35MigPt7yjB+hn47wyN//1AlPty5q
	109qW41zo4n07gYiHaebVzVQCre02MwocAE3zh7FVVF+DnzaIHx0nGOOVbqFFKm3+UxmJO4khj7Qu
	O1FMVVfaGRnu0P5HUr4m+dz3CnHmsJHAV537qVc9RG+BEwqIktc8BUmHTr/Iwvd2PfGpGSzXPCSFN
	zBkQVQwA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMw7-00000005lU6-2LTx
	for ath11k@lists.infradead.org;
	Wed, 25 Jun 2025 10:01:01 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P3VefR027585;
	Wed, 25 Jun 2025 10:00:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vVfbmAL9nuta9hPZ9Nq1gX/UlCRXU0dU44mdWz4B17A=; b=pHrpTZFsUM+eQDdW
	KP1bxe8k3CXM2AZk37Z0VZwe5ZDMcTjdciP4RhxH/xJw5w1Exby9cMDRcZDAR18V
	tDoYqN61JOfgOYmZY2OSaige+Q4eE+NLonZ4XGteLhI4VeSxEdatszkqtRxp9jvg
	9NKxlSVfinZTlXt87VOaEL/RcaYPTMOsbuY02wFnO4hP7j777OibXwqkOEpxcgMA
	V+CK28WXdLHQtCmWQOYnJM+nT+hKf8ZFzk2ffIvjBpGh5VfVFOWzth7Ceg5V0USP
	tfnomaFhuWfkYqeGbKd+RIC6EkTULlu15MQ09osXdQfzb2t3otBbfNN5sCrO5YtA
	m6OqiA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqnxek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 10:00:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55PA0pKp017026
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 10:00:51 GMT
Received: from [10.133.33.71] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Jun
 2025 03:00:48 -0700
Message-ID: <d163080d-61ee-4af1-a783-5a77cbc525d1@quicinc.com>
Date: Wed, 25 Jun 2025 18:00:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] wifi: ath11k: fix dest ring-buffer corruption when
 ring is full
To: Johan Hovold <johan+linaro@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
CC: Miaoqing Pan <quic_miaoqing@quicinc.com>, <linux-wireless@vger.kernel.org>,
        <ath11k@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>
References: <20250604143457.26032-1-johan+linaro@kernel.org>
 <20250604143457.26032-6-johan+linaro@kernel.org>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <20250604143457.26032-6-johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vx5Yl7wNXEWKorOCHEJ7MqcFJEe5imyX
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685bc8d4 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=3Go43yyQdFlCKqBfqAEA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: vx5Yl7wNXEWKorOCHEJ7MqcFJEe5imyX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA3NCBTYWx0ZWRfX2c8mFj9e0oaI
 5Xz9MCz1PRScfjD5M7sb3oG42qD3NB2w3ni/MOqbpUxJSGKaLTjyUOnTXOsfv5cLW6yAnj8iLw/
 S6qfXNtsVHyaoqcOmMQOondctl6t/ebZcsO3+VrWuIfvTjL31Bh3QwjrzphjJlOcFHDfActAeMT
 OJs28HGVCiyaJVSf68APwqmoiHBYJ3QPwwOQYcaKz91CnMXqNruRybgayPS3t1paIbMHmNmPTTF
 7Pzcow5Ix6t6ASnUQSfrQwqNmoKcoHZUZQFrLfCZyVEBIKOIKBrD222bjp82XXblJNAJDPugneo
 SVUHl/aVYRID2c/YCPgm7T2ZEbEsWO0IPR6496hySa3zZjhUlMx3xeLdZSjWvGCMENaSQVG88iA
 8wXxQEszSS/zMeDiJH4FWEIGgs5xWPiGVBIIvS5i3B1/ZCPHSJ6sDTkVDHiRXJixIuZz/vzy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=632 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_110059_892830_AF4AF500 
X-CRM114-Status: GOOD (  18.19  )
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
> Add the missing memory barriers to make sure that destination ring
> descriptors are read before updating the tail pointer (and passing
> ownership to the device) to avoid memory corruption on weakly ordered
> architectures like aarch64 when the ring is full.
> 
> Tested-on: WCN6855 hw2.1 WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Cc: stable@vger.kernel.org      # 5.6
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/net/wireless/ath/ath11k/hal.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
> index 927ed2bc3fbf..7eeffb36899e 100644
> --- a/drivers/net/wireless/ath/ath11k/hal.c
> +++ b/drivers/net/wireless/ath/ath11k/hal.c
> @@ -854,7 +854,6 @@ void ath11k_hal_srng_access_end(struct ath11k_base *ab, struct hal_srng *srng)
>  {
>  	lockdep_assert_held(&srng->lock);
>  
> -	/* TODO: See if we need a write memory barrier here */
>  	if (srng->flags & HAL_SRNG_FLAGS_LMAC_RING) {
>  		/* For LMAC rings, ring pointer updates are done through FW and
>  		 * hence written to a shared memory location that is read by FW
> @@ -869,7 +868,11 @@ void ath11k_hal_srng_access_end(struct ath11k_base *ab, struct hal_srng *srng)
>  			WRITE_ONCE(*srng->u.src_ring.hp_addr, srng->u.src_ring.hp);
>  		} else {
>  			srng->u.dst_ring.last_hp = *srng->u.dst_ring.hp_addr;
> -			*srng->u.dst_ring.tp_addr = srng->u.dst_ring.tp;
> +			/* Make sure descriptor is read before updating the
> +			 * tail pointer.
> +			 */
> +			dma_mb();
> +			WRITE_ONCE(*srng->u.dst_ring.tp_addr, srng->u.dst_ring.tp);
>  		}
>  	} else {
>  		if (srng->ring_dir == HAL_SRNG_DIR_SRC) {
> @@ -885,6 +888,10 @@ void ath11k_hal_srng_access_end(struct ath11k_base *ab, struct hal_srng *srng)
>  					   srng->u.src_ring.hp);
>  		} else {
>  			srng->u.dst_ring.last_hp = *srng->u.dst_ring.hp_addr;
> +			/* Make sure descriptor is read before updating the
> +			 * tail pointer.
> +			 */
> +			mb();
>  			ath11k_hif_write32(ab,
>  					   (unsigned long)srng->u.dst_ring.tp_addr -
>  					   (unsigned long)ab->mem,

Reviewed-by: Baochen Qiang <quic_bqiang@quicinc.com>

