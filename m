Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8DFCE7AB8
	for <ath11k@archiver.kernel.org>; Fri,  6 Sep 2024 07:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xjBkVuHx5tmNXoe8jTAz2MZ+SIuGr4IBJ4WvYnMmroQ=; b=lO8vKpeFLLtcW5rV0bMWt+x1Fp
	GSuctY8AaJP9hQzNUZ229vIMxaqkMH5WtYLWd5oXFBnWvxZsR7uMieDRHXLZgTqPpCzNUdg73PRnh
	iKpV6sPw6rIlGgvx1zaFs1cwwAoJr/ju+c5l2eFSmjBrQYVg4Q+gvGl5wMyoDULbQF1UBLVFNyZf2
	lMZhrjMelTd5xH9aoaOZP87Lj8VjKpncNJNpY7PmFN0rHXtb8gHJkOJkt9IzqP8l9DvB1VzmMXNAi
	nM5kcnlN2hWY11darTIrvdpPs6ngb1HJvjlCILTdKSbbwuzPDFPE4/WN7UHic1nFtQe7dUyrIiQKD
	WycQ4Ecw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smTPA-0000000B5Bb-1a4c;
	Fri, 06 Sep 2024 07:29:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smTDy-0000000B3FL-043g
	for ath11k@lists.infradead.org;
	Fri, 06 Sep 2024 07:17:43 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 485IPpnH019562;
	Fri, 6 Sep 2024 07:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xjBkVuHx5tmNXoe8jTAz2MZ+SIuGr4IBJ4WvYnMmroQ=; b=D3vI11jn+ZiefM4m
	ZvYVo+CRCSF7vmeHAgJDeqrpPuSeDGR2DuwBIzT3jyb64d6Ji8G4zT3mlMUGf9XB
	vVn3Cr1NMb/PJ+omuN7h06EUBqaAeEl5UrhEC6q6jbsOUVpAUxXwZvs19rwi1yeJ
	1sox9fO5AReUyAfAxiiVaUZAOQgz062I+lfQFRyTtpL635uIHJ3yCkLMehtMkfhr
	sjL9rkHBJ0MixNODwDGonUyLFHgx1HtRPeQtbihGf2S9L4PB0325vHk4XhNNve2i
	R8G5Otb2EoAzhn6Kh1pckzrK4Rhi0nhkRRWxbmra5nnyvMyGX3jt0B3848P5q5LQ
	A7JZtA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fhwu1dek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Sep 2024 07:17:37 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4867HbVq026270
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Sep 2024 07:17:37 GMT
Received: from [10.151.41.25] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Sep 2024
 00:17:34 -0700
Message-ID: <8f64a4ab-abf5-4afe-bc4f-725fc89d27ec@quicinc.com>
Date: Fri, 6 Sep 2024 12:47:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ath11k: allow missing memory-regions
To: Caleb Connolly <caleb.connolly@linaro.org>,
        Jeff Johnson
	<jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <ath11k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>
References: <20240904095815.1572186-2-caleb.connolly@linaro.org>
Content-Language: en-US
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <20240904095815.1572186-2-caleb.connolly@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Fkny-sO44lEgSpwv8d--Zod8DZd72V0k
X-Proofpoint-GUID: Fkny-sO44lEgSpwv8d--Zod8DZd72V0k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_17,2024-09-05_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0
 clxscore=1011 mlxscore=0 mlxlogscore=898 phishscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409060051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_001742_105424_6FCAADC5 
X-CRM114-Status: GOOD (  22.00  )
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

On 9/4/2024 3:27 PM, Caleb Connolly wrote:
> On SC7280 platforms which are running with TrustZone, it is not
> necessary to manually map the memory regions used by the wifi hardware.
> However, ath11k will currently fail to load unless both memory regions
> are specified.
> 
> This breaks wifi on the rb3gen2 which only specifies the firmware memory
> region and does not use the CE region.
> 
> Adjust the order of operations in ath11k_ahb_fw_resources_init() to
> check for the wifi-firmware subnode before attempting to parse the
> memory regions.
> 
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
> Cc: linux-arm-msm@vger.kernel.org
> ---
>  drivers/net/wireless/ath/ath11k/ahb.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
> index 634d385fd9ad..e24f8da565db 100644
> --- a/drivers/net/wireless/ath/ath11k/ahb.c
> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
> @@ -999,20 +999,20 @@ static int ath11k_ahb_fw_resources_init(struct ath11k_base *ab)
>  	 */
>  	if (!ab->hw_params.fixed_fw_mem)
>  		return 0;
>  
> -	ret = ath11k_ahb_setup_msa_resources(ab);
> -	if (ret) {
> -		ath11k_err(ab, "failed to setup msa resources\n");
> -		return ret;
> -	}
> -
>  	node = of_get_child_by_name(host_dev->of_node, "wifi-firmware");
>  	if (!node) {
>  		ab_ahb->fw.use_tz = true;
>  		return 0;
>  	}
>  
> +	ret = ath11k_ahb_setup_msa_resources(ab);
> +	if (ret) {
> +		ath11k_err(ab, "failed to setup msa resources\n");
> +		return ret;
> +	}
> +
>  	info.fwnode = &node->fwnode;
>  	info.parent = host_dev;
>  	info.name = node->name;
>  	info.dma_mask = DMA_BIT_MASK(32);


ath11k_ahb_setup_msa_resources(ab), will only read the device-tree and
save the memory addresses/size form device-tree to ab_ahb->fw.
These saved address, only used if "wifi-firmware" node is defined.
This the node "wifi-firmware" is not defined it is considered to be
running with TrustZone, and saved addresses are not of use.

This changes looks fine.

