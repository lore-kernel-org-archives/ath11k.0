Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEAC4C369AB
	for <ath11k@archiver.kernel.org>; Tue, 22 Apr 2025 02:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yPhpEfspJ3un5qULZi8Z94YjW5YiGEKufQi5Vd8r07Y=; b=UUBRmZ0a9JUdGTK0ivLHc/8gEh
	Z3+RbnWCqbINOYqnffns515CnFeCyMsw361AKK4MgWo73hSxBfdzWHh5MJeI5eGMrlgZo7PviytKT
	6gFuagZ+yQvQXnJT1L8OP/Ga5ZorsFrVCLXQKojGSDBShrHrQbXWP//4Uxia4BsNJsk6GSOJ9PH8z
	PUJeR+TwP04oItZBsMz5N99FalniFMo/WMJFfxk5vYJxGwFtAyxkCPUn9ETmFCL2C1IZfXH0cchoi
	IdXv6lzmVt9uNIsDfbEO1Yhqm02aitqZAim8tai4fFatrSqpgZPuSQ9mkeihFfirXLVJkYWriP2b1
	3cd2oRXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u73Db-00000005ZlQ-02L2;
	Tue, 22 Apr 2025 02:18:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u73Ax-00000005YxH-3yZm
	for ath11k@lists.infradead.org;
	Tue, 22 Apr 2025 02:15:57 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LMV7N6015364;
	Tue, 22 Apr 2025 02:15:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yPhpEfspJ3un5qULZi8Z94YjW5YiGEKufQi5Vd8r07Y=; b=hlrLD3gXBAN/rLZi
	WC2ViOO1HlJWzgMxSICQegQdsui3p8SdpjM/5U/IP2LShDyZPY41toa7p5Na1Mz5
	0Ky0+eb5+N6o5BlVPZZL2zXx1mWl6MGbqG+1g/s863+Pf3dDgGQFANAL4p1RfBwU
	8HQgmVfmafiRAYr/ORCTIwP0GpC7xfbUugp/hBla357r9ipCze0fXPam6mjLbRot
	gWquu4Z4SXILhGrJQK3oZei8cEp5xNmNc0O3HpRDrm/i+KxGW4qMwHiAY+aHASzS
	I8xcIb4EryAOYmKDGL+4SmfmGaR1gSpGR9M4zpTK6N8Y9xnwW+QRhjOCRxkkKSb7
	gRmywA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 464426nr1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 02:15:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53M2Fj2D020770
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 02:15:45 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 21 Apr
 2025 19:15:43 -0700
Message-ID: <5ae72a5c-798a-4c57-b344-02b231cb881c@quicinc.com>
Date: Tue, 22 Apr 2025 10:15:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: Fix memory reuse logic
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Jeff Johnson
	<jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Anilkumar Kolli
	<quic_akolli@quicinc.com>
CC: <kernel@collabora.com>, <linux-wireless@vger.kernel.org>,
        <ath11k@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250418120951.94021-1-usama.anjum@collabora.com>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <20250418120951.94021-1-usama.anjum@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: sQThG3pSeN9kjsxfKHLL6mqGwENvfqQW
X-Proofpoint-GUID: sQThG3pSeN9kjsxfKHLL6mqGwENvfqQW
X-Authority-Analysis: v=2.4 cv=IP8CChvG c=1 sm=1 tr=0 ts=6806fbd2 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=QX4gbG5DAAAA:8 a=7xKvOyCpBhAOSqRoKRkA:9 a=QEXdDO2ut3YA:10
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_01,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 mlxscore=0 malwarescore=0 clxscore=1011 priorityscore=1501 bulkscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_191556_006173_5CC60B12 
X-CRM114-Status: GOOD (  30.92  )
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



On 4/18/2025 8:09 PM, Muhammad Usama Anjum wrote:
> Firmware requests 2 segments at first. 1st segment is of 6799360 whose
> allocation fails and we return success to firmware. Then firmware asks

Host won't fail in case DMA remapping is enabled. Better to rephrase to make it clear that
the big segment allocation fails in case DMA remapping is not working, usually due to
IOMMU not present or any necessary kernel config not enabled.

> for 22 smaller segments. Those get allocated. At suspend/hibernation
> time, these segments aren't freed as they are reused by firmware.
> 
> After resume the firmware asks for 2 segments again with first segment
> of 6799360 and with same vaddr of the first smaller segment which we had

Not follow you here. What do you mean by 'same vaddr'? firmware does not care about vaddr
at all.

> allocated. Hence vaddr isn't NULL and we compare the type and size if it
> can be reused. Unfornately, we detect that we cannot reuse it and this

s/Unfornately/Unfortunately/

> first smaller segment is freed. Then we continue to allocate 6799360 size
> memory from dma which fails and we call ath11k_qmi_free_target_mem_chunk()
> which frees the second smaller segment as well. Later success is returned
> to firmware which asks for 22 smaller segments again. But as we had freed
> 2 segments already, we'll allocate the first 2 new segments again and
> reuse the remaining 20.
> 
> This patch is correctiong the skip logic when vaddr is set, but size/type

s/correctiong/correcting/

> don't match. In this case, we should use the same skip and success logic
> as used when dma_alloc_coherent fails without freeing the memory area.
> 
> We had got reports that memory allocation in this function failed at

any public link to the report?

> resume which made us debug why the reuse logic is wrong. Those failures
> weren't because of the bigger chunk allocation failure as they are
> skipped. Rather these failures were because of smaller chunk allocation
> failures. This patch fixes freeing and allocation of 2 smaller chunks.

any you saying kernels fail to alloc a smaller chunk? why? is system memory exhausted or
too fragmented?

> 
> Tested-on: QCNFA765 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6

QCNFA765 is not an official chip name. please use WCN6855.

> 
> Fixes: 5962f370ce41 ("ath11k: Reuse the available memory after firmware reload")

I don't think a Fixes tag apply here. As IMO this is not really an issue, it is just not
doing well.

> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
>  drivers/net/wireless/ath/ath11k/qmi.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
> index 47b9d4126d3a9..3c26f4dcf5d29 100644
> --- a/drivers/net/wireless/ath/ath11k/qmi.c
> +++ b/drivers/net/wireless/ath/ath11k/qmi.c
> @@ -1990,8 +1990,16 @@ static int ath11k_qmi_alloc_target_mem_chunk(struct ath11k_base *ab)
>  		 */
>  		if (chunk->vaddr) {
>  			if (chunk->prev_type == chunk->type &&
> -			    chunk->prev_size == chunk->size)
> +			    chunk->prev_size == chunk->size) {
>  				continue;
> +			} else if (ab->qmi.mem_seg_count <= ATH11K_QMI_FW_MEM_REQ_SEGMENT_CNT) {
> +				ath11k_dbg(ab, ATH11K_DBG_QMI,
> +					   "size/type mismatch (current %d %u) (prev %d %u), try later with small size\n",
> +					    chunk->size, chunk->type,
> +					    chunk->prev_size, chunk->prev_type);
> +				ab->qmi.target_mem_delayed = true;
> +				return 0;
> +			}
>  
>  			/* cannot reuse the existing chunk */
>  			dma_free_coherent(ab->dev, chunk->prev_size,

actual code change LGTM.



