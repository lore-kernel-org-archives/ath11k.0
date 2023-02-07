Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEA4C636CD
	for <ath11k@archiver.kernel.org>; Tue,  7 Feb 2023 06:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9U16zUNw5E7/qSh9fxs6WNHuUYvVFEp83IkyU0mobec=; b=db6E/0UZjOYWGV
	5THG9c2ysZUAGN9N1hX4oRwNNcMUIFmdklSJMDj/uGo3URvtlLxUN3dCM9xy279K1nQ615pP/NK4B
	R2Ooffah1KwFDGgqnGIlQJ0SndXpOlPRfFh/DKTpjnNTpmTykj+KkEt9oc0XEwQP4IlJdSErKlivp
	ecIJbVNMain0Jmjl1ay7lpv/puRcwEfDKFRitpyk5zj1vKetNIVLhr+qGYptw0AwzKuyRbBlXxPjg
	BWd3GoKWL9qV6iWVLaRdC+mTCdHrvwUuVLusOu2nRZ+963LkR0HOAVI8QItpSTG0tInbi1cdgtWak
	JIXluMiGQFdkvEBwBHWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPHea-00B14o-Ba; Tue, 07 Feb 2023 06:40:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPHeY-00B12I-4N
	for ath11k@lists.infradead.org; Tue, 07 Feb 2023 06:40:31 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3176COwI022435;
	Tue, 7 Feb 2023 06:40:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=GZq7550o3hV/zZ6fBo1m7XvSv7PhPhTDoWFMEIh09Dw=;
 b=daf5GUTt9qUJ4Yh+SG20S5p9Lemk37fwuE8OTNwxHWSHIDp8CHnDoS4zOLQZIOC0/zIM
 oogaJhPA7YZQRXvZyXdMdaxzIznRf9K7oTAcCS8rDjdh04y2IfeKQFshGbhLNvi8OU3R
 ZY7KoVa83NbbDeiG4x2zLYwPK460Hi5CKrJmh/YEn5CvRXjPDv2bjG0JHeVr9gc201ku
 qXRayV2Nqwjh7HIhnZlWGLbsUrl1bEKS15OAuFUefa/ZRvgct0lW7Vvlwb7yNgYzWPah
 LA0pXScMZBSwjn5R+nKmPd0Xcc+fy7R2iVPf5dwNhI0pIe4PO5THNNJy430it0yJprot EQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nkfes89m7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Feb 2023 06:40:22 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3176eLBf015285
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Feb 2023 06:40:21 GMT
Received: from [10.50.24.106] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 6 Feb 2023
 22:40:16 -0800
Message-ID: <7fe7eedc-97ee-e5fc-a458-193e556d3174@quicinc.com>
Date: Tue, 7 Feb 2023 12:10:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/2] dt: bindings: add dt entry for XO calibration
 support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, <kvalo@kernel.org>,
        <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20230131140345.6193-1-quic_youghand@quicinc.com>
 <20230131140345.6193-2-quic_youghand@quicinc.com>
 <622ef51f-643e-5eb5-3884-3f22bf4fa9be@linaro.org>
Content-Language: en-US
From: "Youghandhar Chintala (Temp)" <quic_youghand@quicinc.com>
In-Reply-To: <622ef51f-643e-5eb5-3884-3f22bf4fa9be@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: U8gb2KESa60EQ4sSWCohkjVTNrBq8vWy
X-Proofpoint-ORIG-GUID: U8gb2KESa60EQ4sSWCohkjVTNrBq8vWy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_07,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 suspectscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1011 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302070060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_224030_343704_58E6232D 
X-CRM114-Status: GOOD (  17.35  )
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


On 1/31/2023 11:32 PM, Krzysztof Kozlowski wrote:
> On 31/01/2023 15:03, Youghandhar Chintala wrote:
>> Add dt binding to get XO calibration data support for Wi-Fi RF clock.
> Use subject prefixes matching the subsystem (which you can get for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching).
> Hint: dt-bindings: net: qcom,ath11k:
>
>> Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>
>> ---
>>   .../devicetree/bindings/net/wireless/qcom,ath11k.yaml         | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
>> index f7cf135aa37f..205ee949daba 100644
>> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
>> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
>> @@ -41,6 +41,10 @@ properties:
>>           * reg
>>           * reg-names
>>   
>> +  xo-cal-data:
>> +    description:
>> +      XO cal offset to be configured in XO trim register
> Missing type. I also do not understand what's this and why some register
> offset should be stored in DT. Please give us some justification why
> this is suitable for DT.
>
> Best regards,
> Krzysztof
>
Hi Krzysztof,

I will address you comments in next version of patch.

Regards,

Youghandhar



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
