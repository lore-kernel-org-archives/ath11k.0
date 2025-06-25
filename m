Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BC4C7115C
	for <ath11k@archiver.kernel.org>; Wed, 25 Jun 2025 11:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WAJGmVLkcSHj7fVRUBSlZ3mqVrP+vEQzKX4QGAJkaOw=; b=kSFIUtKG0iYl36SmSTspDRsZmK
	bvUh3BlT6YKH3bDINF85+Rk6n5in2yYD7FkBGyPVVfRUIbyN9LVHu8ye8OlFDSjSFzPttay5j6kpU
	00Y5ytB4/UM15e1tapzY2bEiIhYyDeAdEe5ng5H0blr7QCn9JC33C4ETjXWf5+Zdm1hL1BOJTnEKo
	773kljkWWDTaQM61TPbWBzeBWjvyUsblmjAEFJZI9wGs9l3WCxv1/MCA3SNACHvJfRJWXyA4iD1VL
	YQka1jx4LvSzodGySg+lrvhnBb/E9zJ0Hlw0R30ZmkmlHbPsETZlISGXjhzElq7CVLnxl/tYWDs1t
	bBeIoWww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNxw-00000008PuR-3n8B;
	Wed, 25 Jun 2025 11:06:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMup-00000008EZi-2K0q
	for ath11k@lists.infradead.org;
	Wed, 25 Jun 2025 09:59:40 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P4Mr9p021510;
	Wed, 25 Jun 2025 09:59:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WAJGmVLkcSHj7fVRUBSlZ3mqVrP+vEQzKX4QGAJkaOw=; b=DEJONGvZX4VsQRtq
	w8qS9BebcGoZPEfrZV7eYnWhLTlHl3EzikfqIOuMDM8KjHSA/h0LWqiVtaWDeY6e
	6NeVnDJvrSXljE6Yl4K9WZRXrRQ1ZeC5Eya8Gfy8GbiITZIGQqzWQtXsQdEq1p+h
	o6GzA10dNGJSZQZoz0O+8aoPGtGs4DHgVgOpV1048/oe04FJnSKVYGKjOT3F/UGy
	X/wJIEZ0eoD4FnvJKe98a5olatgvXR2wjP/Yt9EZjy/Nea3MwJOX3O6CMth0wWsk
	OqyIIi9xXgpvVOf20XseSJGlBBWsfN1wU9R1wVfv6pGcYscCbIz6gkZhVNnZ4aVc
	decuYw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4rn1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 09:59:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55P9xXmd014301
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 09:59:33 GMT
Received: from [10.133.33.71] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Jun
 2025 02:59:32 -0700
Message-ID: <2e72da79-e443-4168-979d-43722493001f@quicinc.com>
Date: Wed, 25 Jun 2025 17:59:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] wifi: ath11k: use plain access for descriptor
 length
To: Johan Hovold <johan+linaro@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
CC: Miaoqing Pan <quic_miaoqing@quicinc.com>, <linux-wireless@vger.kernel.org>,
        <ath11k@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250604143457.26032-1-johan+linaro@kernel.org>
 <20250604143457.26032-3-johan+linaro@kernel.org>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <20250604143457.26032-3-johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685bc886 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=ijPAINBQZKyftGx5nG4A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: NeFfw4ZHt0MuwvFnFKj7ouEZ9c_oM_4s
X-Proofpoint-ORIG-GUID: NeFfw4ZHt0MuwvFnFKj7ouEZ9c_oM_4s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA3NCBTYWx0ZWRfX8DC/yWYfjyN/
 kfcyHQ7julZ++IIbfjFA1PQWWt1a/Rdtp0fW/1iHwUQni3FWlM0JR3SvaHaPU2yhexSggcpVtUh
 36pRjqFPUoZXy6JeVEXijAD31pXHX2YIT8qHqsSEWzX+UaUpR2Kl6XG6m6mSoSzRluS81xjT0wh
 i0Q7owJPt2BqJ48QJjjuntkWbmW15uHCQPg1Z/fz7vg3rJiGJCMjXEi+JOq67OqpLwkYj1712vm
 nLLByO7SvPkTdpbNV7tss0x6Y0e0mHP0uS3Puv7N2x6CqR05h/D83AvC7UyRveOOp0AbCOCkwxr
 yI/YiR/Q5lDa5L2X2QHYbbobZohHSPe08wNWO3lreRpf6obNcGhwJWA8xydHE+2lnykcOjzI+ZU
 TJ8/nYf+z2YmJm0oMH4p22XkeX2XeOGbexkXMGOJ8TJcnMFWfrxdjK+/ZXwh7kQwPpJiOENe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=870
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_025939_600495_C035D410 
X-CRM114-Status: GOOD (  13.94  )
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
> The read memory barrier added by commit 6d037a372f81 ("wifi: ath11k: fix
> ring-buffer corruption") is enough to guarantee ordering also for plain
> descriptor accesses if the length helper is ever inlined so drop the
> unnecessary READ_ONCE().
> 
> Tested-on: WCN6855 hw2.1 WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/net/wireless/ath/ath11k/hal.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
> index 921114686ba3..b1f5a927dddd 100644
> --- a/drivers/net/wireless/ath/ath11k/hal.c
> +++ b/drivers/net/wireless/ath/ath11k/hal.c
> @@ -599,7 +599,7 @@ u32 ath11k_hal_ce_dst_status_get_length(void *buf)
>  	struct hal_ce_srng_dst_status_desc *desc = buf;
>  	u32 len;
>  
> -	len = FIELD_GET(HAL_CE_DST_STATUS_DESC_FLAGS_LEN, READ_ONCE(desc->flags));
> +	len = FIELD_GET(HAL_CE_DST_STATUS_DESC_FLAGS_LEN, desc->flags);
>  	desc->flags &= ~HAL_CE_DST_STATUS_DESC_FLAGS_LEN;
>  
>  	return len;

Reviewed-by: Baochen Qiang <quic_bqiang@quicinc.com>

