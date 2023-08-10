Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA7DC41513
	for <ath11k@archiver.kernel.org>; Thu, 10 Aug 2023 13:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=toLfD8gfilFT74DUXYCaBLzjjX7EC85Uw0eNlVvWY44=; b=eGvoi9oY0nkI/d
	Qxs6al5Et15bZjolp/uELcKMExdJLJF3vAAkISZNTg5cXB8rTK67RskMHgtW5lHA6uJxH65D7cPqI
	6HUvJlt6sCOugj7v9hBeQPu2F8Gk1ukakQiAxj8IDcrhpJATnNGgB4ZjaOzmd46P15MWZhBA4HiNy
	GvGefEzrTY3PlHvtXgoLQ+JKa8QOFV06k1LniLMO64xOYqE2aoNrI1kRHX24nt1N8oBO9xN37YeEd
	pSzwaFgz0FQAApyyGHLdqilbMddty2HNIbHp2XABimfuDmdypX34/Ox4p89hvj9B2mcWXLJUuosFA
	k3Z+auGpncx455aQ/0RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU5q2-007l2G-26;
	Thu, 10 Aug 2023 13:36:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU5pz-007l09-37;
	Thu, 10 Aug 2023 13:36:29 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37A6lQMi006745;
	Thu, 10 Aug 2023 13:36:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=fUbUwoo6OheMueK6/JfpH1rYQwGOwGMskqMCESnJUIc=;
 b=AtIcD3uOIO1cF6+Ge64APpEM+bWLB5yeyKTBHljvYgiWnWAdZ48JGzXTqjeuRGuN/682
 sKRW2yPNFIzxJ8FdfLRsqxVrZsDaUO/9FwD6PWQRS7wksqO6bcrRZdupzM8ydd1uCHTI
 WAqqkVmgVaSC46isP/6aGH4G20KowZYnA4uSpn6sWVN92FqSyeSz+M/Dz8CEqhxm7qhg
 H60J1uUPWUmGoLmUIdVD7D8kt7fYBO82pgWZ6fbO7KjJSNXLqN8RimTwiXyTJxGPuSJQ
 li51IGIexxiPymLQkrlFgQ94oR0WltqhVEiRgTW49hRu4NCWgBV6pYn1nYedWIF7CuZL FA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3scqsj16s1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Aug 2023 13:36:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37ADaJV0029051
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Aug 2023 13:36:19 GMT
Received: from [10.111.180.219] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 10 Aug
 2023 06:36:18 -0700
Message-ID: <81ff873f-20ea-84f3-d29d-dc5441f2654a@quicinc.com>
Date: Thu, 10 Aug 2023 06:36:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/2] wifi: ath11k: fix Wvoid-pointer-to-enum-cast
 warning
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Kalle Valo
	<kvalo@kernel.org>, <ath10k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <ath11k@lists.infradead.org>
CC: Andi Shyti <andi.shyti@kernel.org>
References: <20230810091224.70088-1-krzysztof.kozlowski@linaro.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230810091224.70088-1-krzysztof.kozlowski@linaro.org>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -eAclCM2FoCO0znynItk5D0zppLKW4_i
X-Proofpoint-GUID: -eAclCM2FoCO0znynItk5D0zppLKW4_i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-10_10,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1011 suspectscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308100115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_063628_041417_893A837B 
X-CRM114-Status: GOOD (  17.34  )
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

On 8/10/2023 2:12 AM, Krzysztof Kozlowski wrote:
> 'hw_rev' is an enum, thus cast of pointer on 64-bit compile test with W=1
> causes:
> 
>    h11k/ahb.c:1124:11: error: cast to smaller integer type 'enum ath11k_hw_rev' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

> ---
>   drivers/net/wireless/ath/ath11k/ahb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
> index 139da578831a..ada4d68c7421 100644
> --- a/drivers/net/wireless/ath/ath11k/ahb.c
> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
> @@ -1121,7 +1121,7 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
>   		return -EINVAL;
>   	}
>   
> -	hw_rev = (enum ath11k_hw_rev)of_id->data;
> +	hw_rev = (uintptr_t)of_id->data;
>   
>   	switch (hw_rev) {
>   	case ATH11K_HW_IPQ8074:


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
