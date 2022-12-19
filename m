Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1E8C4332F
	for <ath11k@archiver.kernel.org>; Mon, 19 Dec 2022 13:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NVHYKyY/4kHlhNfcc9z5QtrH/M3tnQzmyoe1v26NpuA=; b=XTK4tA2W4jYKfm
	3Yol21rUn5Y0llvdctN72RKXeLOvmvMgt1rVSm7alIzK3pLgKMVOT3WjHMU01w3HAx6ix32AV3eMx
	ZcXEqyv0dhwe1Xa/xdP9pzfIUbW76TXhxMFDjaxwQ2ItfUeIXbBSEx3746PpYIlk1pBiTGInuNKqX
	GK7YMO7NU8mjEDKmPV82NwPs2dfP3kRE9LjtScpbIHjaFN5arbXfo+xkunGEvm+xXmXkSARkMG6QJ
	mPqwN5FOm25jNn+H4jKr4gR1vMKCOlv/9EoATdbrHR9bb5KdZQPwTWlkw1I9we4IgIz8LBCTA+yRg
	Xma0cChQZ7IwqMPBUhlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7GSy-00EFjk-Mk; Mon, 19 Dec 2022 13:46:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7GSu-00EFaz-Sw
	for ath11k@lists.infradead.org; Mon, 19 Dec 2022 13:46:02 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BJBEEPv022254;
	Mon, 19 Dec 2022 13:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=lQyNqYU9KnNtnUHjNhcP6N/pp/vK2lVT3JKv/+bbuvs=;
 b=oF5RELd7d87pMU/8XXwuZ9ZgVpxXL5vxG562UxRm0xZEExcrllIfUEnwbuFOwZkrogl2
 aNx1rmAPX0yXVY93zurbNSeGt0hf3cwcBfaOuKf5qhAihvAVsCpYyldYEJwZ3BSdXR9M
 BO84nRSiQY39y65CZr9bWTTucFbmysK67VUcY90hXF4kPs0bdY/zC7o7042OJQLV/+tO
 mfTEruGViW92qZTrXZA70TxJj6JvIS3M2JDaGrZTSeBJIPjWpBh6+mEO3PFOaOrIH1LV
 kn1JU/KHTPt4qiFtlXK+V4+Y8fULbysh46cJ8xAZpI9XbtdORM8LAfs7uDhY4gAA9jYu nA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mh4secgbv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Dec 2022 13:45:53 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BJDjq7P017587
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Dec 2022 13:45:52 GMT
Received: from [10.216.40.161] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 19 Dec
 2022 05:45:47 -0800
Message-ID: <773848af-c11e-2a9f-00b8-085d98147de3@quicinc.com>
Date: Mon, 19 Dec 2022 19:15:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/2] dt: bindings: add dt entry for XO calibration support
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, <ath11k@lists.infradead.org>,
        "kvalo@kernel.org >> Kalle Valo" <kvalo@kernel.org>,
        <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
        <robh+dt@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20221214121818.12928-1-quic_youghand@quicinc.com>
 <20221214121818.12928-2-quic_youghand@quicinc.com>
 <f39cd52f-94d4-fe3b-a5be-8b27017028ed@kernel.org>
From: "Youghandhar Chintala (Temp)" <quic_youghand@quicinc.com>
In-Reply-To: <f39cd52f-94d4-fe3b-a5be-8b27017028ed@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: D3a8YjalaZ3M25Wo2h0jwwG54-uzrKe1
X-Proofpoint-ORIG-GUID: D3a8YjalaZ3M25Wo2h0jwwG54-uzrKe1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-19_01,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxlogscore=833
 mlxscore=0 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212190122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_054601_123200_602165E6 
X-CRM114-Status: GOOD (  13.65  )
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


On 12/19/2022 4:19 PM, Krzysztof Kozlowski wrote:
> On 14/12/2022 13:18, Youghandhar Chintala wrote:
>> Add dt binding to get XO calibration data support for Wi-Fi RF clock. 	 	
>>
>> Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC.  It might happen, that command when run on an older
> kernel, gives you outdated entries.  Therefore please be sure you base
> your patches on recent Linux kernel.
>
> You skipped all of them, so this has to be fixed.
>
> Best regards,
> Krzysztof
Thank you Krzysztof.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
