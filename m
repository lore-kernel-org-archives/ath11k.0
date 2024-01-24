Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D24C47258
	for <ath11k@archiver.kernel.org>; Wed, 24 Jan 2024 02:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ry6TUcO/tVaxpVzOT+I1siLRRNkF5Nd5FE83y4j4sJU=; b=tyoUXt8LbdXFg9ejNj6OoELaaZ
	UP8ShhrLrzFWbFLqO0b3RuUjR0qhGjfhFQWQHbZSbJT2100er1ezy7cL4gmrAjp56/F+h9Xs9m+HR
	yPUTIZGXzWb/EO2aEey0ftewVDKCHgZsg4vnMlCOmFgSVFxq30qqtypSEbNC7SEnBgiLCF0GqzPCt
	m2VUbwy9a18c5xzMF7ecMZO6tnc31yW2Z5Al2QZUh0shvSu15dSIOKz8EeXdgwaWWUyErkRvGzvh+
	XxSXbiJQp50+F1cL11uZ2ZcftGfZq8PRtZVZFbZzOaRCfnyskEIsSqQaj+/ei4jIs7iK5nqoN1yV6
	iQcXlhHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rST7I-0019fh-24;
	Wed, 24 Jan 2024 02:35:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rST7G-0019fG-0I
	for ath11k@lists.infradead.org;
	Wed, 24 Jan 2024 02:35:51 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40O1MLnP027786;
	Wed, 24 Jan 2024 02:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=ry6TUcO/tVaxpVzOT+I1siLRRNkF5Nd5FE83y4j4sJU=; b=ZN
	FxpPNK15YyHwLdBcYyWh8L57Ud8dQNWpKozngB2PP+5nUi4TNaLcldXe1b+RV+X+
	0ASb+I5SlszpYqxnB9rlcnUBbwXYbukwd56WwpNWKh2uv7Qk9GRKLA6ODc3/bUcu
	cOuZmrlc88KGJRDEmd+bYXjSRMPlTilRL0e8RDp1zbrWxBj/Ir7EcDwiNfER0FDE
	nB+ZX4ylNWg4jwUJGCxJQglCcx6tYh3H/zhDgD5QKq58KvM6lfIF723Y4k01JuyT
	SvZAC7WW7aHKv7/YZOARUQuVGSVRd8cCYH1wYFkqjCf+7U4bM/CMuSA3z3uRVdW/
	5WEcqErhKD/dv+z2plTw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vtmmegj6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jan 2024 02:35:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40O2Zm3Z019378
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jan 2024 02:35:48 GMT
Received: from [10.110.18.75] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 23 Jan
 2024 18:35:47 -0800
Message-ID: <73e9ddd2-7c0c-4a96-a120-7480ebffc4f0@quicinc.com>
Date: Tue, 23 Jan 2024 18:35:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: enable 36 bit mask for stream DMA
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240123015201.28939-1-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240123015201.28939-1-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yyhLIKeTVocZkE2UvWO9haVYNpg7V10P
X-Proofpoint-ORIG-GUID: yyhLIKeTVocZkE2UvWO9haVYNpg7V10P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-23_15,2024-01-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401240018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_183550_136278_1FC7F54B 
X-CRM114-Status: GOOD (  17.06  )
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

On 1/22/2024 5:52 PM, Baochen Qiang wrote:
> Currently 32 bit DMA mask is used, telling kernel to get us an DMA
> address under 4GB when mapping a buffer. This results in a very high
> CPU overhead in the case where IOMMU is disabled and more than 4GB
> system memory is installed. The reason is, with more than 4GB memory
> installed, kernel is likely to allocate a buffer whose physical
> address is above 4GB. While with IOMMU disabled, kernel has to involve
> SWIOTLB to map/unmap that buffer, which consumes lots of CPU cycles.
> 
> We did hit an issue caused by the reason mentioned above: in a system
> that disables IOMMU and gets 8GB memory installed, a total of 40.5%
> CPU usage is observed in throughput test. CPU profiling shows nearly
> 60% of CPU cycles are consumed by SWIOTLB.
> 
> By enabling 36 bit DMA mask, we can bypass SWIOTLB for any buffer
> whose physical address is below 64GB. There are two types of DMA mask
> within struct device, named dma_mask and coherent_dma_mask. Here we
> only enable 36 bit for dma_mask, because firmware crashes if
> coherent_dma_mask is also enabled, due to some unknown hardware
> limitations. This is acceptable because coherent_dma_mask is used for
> mapping a consistent DMA buffer, which generally does not happen in
> a hot path.
> 
> With this change, the total CPU usage mentioned in above issue drops
> to 18.9%.
> 
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath11k/mhi.c |  2 +-
>  drivers/net/wireless/ath/ath11k/pci.c | 16 +++++++++++++---
>  drivers/net/wireless/ath/ath11k/pci.h |  1 +
>  3 files changed, 15 insertions(+), 4 deletions(-)
My Qualcomm Innovation Center copyright checker reports:
drivers/net/wireless/ath/ath11k/mhi.c copyright missing 2024
drivers/net/wireless/ath/ath11k/pci.c copyright missing 2024
drivers/net/wireless/ath/ath11k/pci.h copyright missing 2024

Kalle can fix this in the pending tree, actual code LGTM
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


