Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02CD5E7717D
	for <ath11k@archiver.kernel.org>; Tue, 10 Dec 2024 02:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GXzvNzx05NSvSGxrZei66rwZlGrKkS52BmFkcznQQ5E=; b=gOq9Z0MHYHzalDUsTEs7tvxria
	0gygQZ4t40SvtUyblnwMbx19vgUji78XoX8WJP/jl6VeUhyaN+G+Obud0kcM5QNhFSW3nYObsoM45
	HWQOvHpwUP0C7DQln04D3QG7J4yJl0xoWze+dHHwyoPwus8JQNeSSPcim6HP/bNq6pzFmZXjp8dym
	XzkZa7+yC9xRj4l3wG3DjyY5OqEqxsg8/Z09ayWxPxxkgNLy00bF7Pl4GTxpyCQCaZGs9BMNn4KqP
	uOOXXHRBT/rJB7JG7Ocm2fwqfoRtFEZ6hoC/SjsP8CKLSU8n/mBGUAytWak5/yrkJWR8kOWoa0JNN
	CpvEe72g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKq8R-00000009z28-1qVR;
	Tue, 10 Dec 2024 02:38:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKq8L-00000009yzo-0zqL
	for ath11k@lists.infradead.org;
	Tue, 10 Dec 2024 02:38:01 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9FdCJq014037;
	Tue, 10 Dec 2024 02:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GXzvNzx05NSvSGxrZei66rwZlGrKkS52BmFkcznQQ5E=; b=U+w3bmb0UkMr9obN
	b8O67aSOCCkfJLONzlAP4zkJb4k03ebTzWVcwGYVlUobC2OSI1x5gnIJf+05hmMS
	qVGyUpWxY+V2AXe2fpc+8w5WItvWhFs9fK4Bd30AAlIJ5dRigUQJEzwHy74GYoQJ
	h3TZr/HsOiWVxDWsh7mTU6MADO4X3uSd4FaIT8mP/WkFREJe30aPVCGfO/sdDArw
	CbokgMAtvaV/7cK9ar+N3zYAy7soKDS9L204Z7geKxU/GX5ZlSIlLFE6nP6eUYWX
	fkfyxuBC9yNyDXTcoRmFu5rBKD7SrTlFXBUpC5+FM+RwsM0/STdcLPKE7ZlDogF3
	Y4Ng1A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43dvyak1rv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 02:37:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BA2bpCG012407
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 02:37:51 GMT
Received: from [10.231.194.79] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Dec 2024
 18:37:46 -0800
Message-ID: <fd8dd19a-a15b-48a3-ab14-9c63e617ed10@quicinc.com>
Date: Tue, 10 Dec 2024 10:37:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: qcs615: add WiFi/BT nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: <agross@kernel.org>, <ath11k@lists.infradead.org>,
        <dmitry.baryshkov@linaro.org>, <konradybcio@kernel.org>,
        <kvalo@kernel.org>, <linux-media@vger.kernel.org>,
        <mchehab@kernel.org>, <quic_jjohnson@quicinc.com>,
        <quic_miaoqing@quicinc.com>, <quic_vgarodia@quicinc.com>,
        <stanimir.k.varbanov@gmail.com>, <quic_jiaymao@quicinc.com>
References: <20241203060318.1750927-1-quic_yuzha@quicinc.com>
 <1ca062dd-8910-4caf-a133-0e5717b43540@oss.qualcomm.com>
 <649dc6c0-f0e1-4dca-8f93-d0f81803cd70@quicinc.com>
 <7107275e-1ccf-4f09-ada3-e082833d9364@oss.qualcomm.com>
Content-Language: en-US
From: "Yu Zhang (Yuriy)" <quic_yuzha@quicinc.com>
In-Reply-To: <7107275e-1ccf-4f09-ada3-e082833d9364@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tYWoVYZk6l9OiMLMSvoq3Jpo26fiH5zt
X-Proofpoint-ORIG-GUID: tYWoVYZk6l9OiMLMSvoq3Jpo26fiH5zt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 mlxlogscore=821 mlxscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412100017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_183757_390762_987A98F2 
X-CRM114-Status: GOOD (  11.35  )
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



On 12/6/2024 8:16 PM, Konrad Dybcio wrote:
> On 6.12.2024 4:22 AM, Yu Zhang (Yuriy) wrote:
>>
>>
>> On 12/6/2024 1:14 AM, Konrad Dybcio wrote:
>>> On 3.12.2024 7:03 AM, Yu Zhang(Yuriy) wrote:
>>>> Add a node for the PMU module of the WCN6855 present on the qcs615
>>>> board. Assign its LDO power outputs to the existing WiFi/BT module.
>>>>
>>>
>>> subject:
>>>
>>> arm64: dts: qcom: qcs615-ride: ....
>>>
>>> [...]
>>>
>>>> +
>>>> +    vreg_conn_1p8: vreg_conn_1p8 {
>>>> +        compatible = "regulator-fixed";
>>>> +        regulator-name = "vreg_conn_1p8";
>>>> +        startup-delay-us = <4000>;
>>>> +        enable-active-high;
>>>> +        gpio = <&pm8150_gpios 1 GPIO_ACTIVE_HIGH>;
>>>> +    };
>>>> +
>>>> +    vreg_conn_pa: vreg_conn_pa {
>>>> +        compatible = "regulator-fixed";
>>>> +        regulator-name = "vreg_conn_pa";
>>>> +        startup-delay-us = <4000>;
>>>> +        enable-active-high;
>>>> +        gpio = <&pm8150_gpios 6 GPIO_ACTIVE_HIGH>;
>>>> +    };
>>>
>>> Are any of these boot-on?
>>>
>> Yes, these are used wcn6855-pmu：
>>       vddio-supply = <&vreg_conn_pa>;
>>       vddpmu-supply = <&vreg_conn_1p8>;
> 
> What i meant is, whether these regulators are enabled at boot
> time (i.e. without software intervention). If that's the case,
> `regulator-boot-on;` should be added
> 
No need regulator-boot-on, it was triggered by the 
software(pci_pwrctl_pwrseq_driver).
> Konrad
Yu

