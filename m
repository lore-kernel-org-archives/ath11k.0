Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE14C001E0
	for <ath11k@archiver.kernel.org>; Thu, 10 Aug 2023 13:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6qp+/Pg4O8p1ZatRSVUW4bWtvGkLGxvwk4UBbxtXTxQ=; b=uZhgcHMXCv2xoX
	Gad/cGPlvt++bgWXIYdnRCk70gTYl8v9VBgedjNyYzCEIwVwG6E3+ouuTZr7QGkUH7gFSCNycY4oE
	N3ID0Kg1xceb3XRmuLxilN2gwDVNT2AZvh0O4xXe6WUJS9zMxN9tTfx3W1alEnNa0HDxpSxXaEmy2
	lPaQvpaTvifSqaaV8HlAnfwrUWh1Q047X4WisCvZdjBfDrw2K/G6+Z1IWymyVfGuqa65PU6o4ERI3
	1ylafaFaZLOWZUjaaXZ9O0guCBpkVf8jt4BuOi/qnbf2HwgLmHY/lcfqsRjjIJDM8WK/RUZQkJXIt
	31F83mmFIfdziyivO4/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU5qR-007lEQ-23;
	Thu, 10 Aug 2023 13:36:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU5qL-007l9e-2R;
	Thu, 10 Aug 2023 13:36:53 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37ACJB5B025613;
	Thu, 10 Aug 2023 13:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=WosU3mZZv4If5RZRzpaKIsoNLeDov51QZ4taRcdq6Qk=;
 b=NYcvkYN3vKHyqmLvor7hlwS6rqEyAU01eQ+6yhE3GUUoKdi9r2bS1ZcoCNfrVh+wuE1x
 UqexumGTONh91FD25OuBBWkuTd+UN9FzRInxOWOyXz3LlnacdY5dnWxCLZ/O1EhGTxhB
 z5AlL8nY39IRVlwlIwpHcaqsAXspY7mtHP4xJepZRAVlLT7/7cG1PTediZ5avazjDJj+
 9XrK+lnOjsjfpPLsWLEyw/SwhW90Hl/lqG+zD6jDfydKp3zsEbla6asbK3/RdCSHU8Jl
 fY5rKlTOActw+bWLELGfEq6O58DB9v4R+96GDNrIMnOYzMv90XMPidP3a0dEh50FJO29 3w== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sc5ffbh39-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Aug 2023 13:36:43 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37ADageg014538
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Aug 2023 13:36:42 GMT
Received: from [10.111.180.219] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 10 Aug
 2023 06:36:42 -0700
Message-ID: <3fc73725-2b17-4c89-0e61-1dd01f659bfa@quicinc.com>
Date: Thu, 10 Aug 2023 06:36:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/2] wifi: ath10k: fix Wvoid-pointer-to-enum-cast
 warning
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Kalle Valo
	<kvalo@kernel.org>, <ath10k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <ath11k@lists.infradead.org>
CC: Andi Shyti <andi.shyti@kernel.org>
References: <20230810091224.70088-1-krzysztof.kozlowski@linaro.org>
 <20230810091224.70088-2-krzysztof.kozlowski@linaro.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230810091224.70088-2-krzysztof.kozlowski@linaro.org>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rTSasbpruEtdEroTYuvB0na2F77FqxR2
X-Proofpoint-GUID: rTSasbpruEtdEroTYuvB0na2F77FqxR2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-10_10,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308100115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_063649_918721_BA050D60 
X-CRM114-Status: GOOD (  17.78  )
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
>    ath10k/ahb.c:736:11: error: cast to smaller integer type 'enum ath10k_hw_rev' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

> ---
>   drivers/net/wireless/ath/ath10k/ahb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/ahb.c b/drivers/net/wireless/ath/ath10k/ahb.c
> index 4a006fb4d424..95bcf54ddc3f 100644
> --- a/drivers/net/wireless/ath/ath10k/ahb.c
> +++ b/drivers/net/wireless/ath/ath10k/ahb.c
> @@ -733,7 +733,7 @@ static int ath10k_ahb_probe(struct platform_device *pdev)
>   	int ret;
>   	struct ath10k_bus_params bus_params = {};
>   
> -	hw_rev = (enum ath10k_hw_rev)of_device_get_match_data(&pdev->dev);
> +	hw_rev = (uintptr_t)of_device_get_match_data(&pdev->dev);
>   	if (!hw_rev) {
>   		dev_err(&pdev->dev, "OF data missing\n");
>   		return -EINVAL;


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
