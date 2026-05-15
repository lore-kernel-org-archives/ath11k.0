Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB00CD343F
	for <ath11k@archiver.kernel.org>; Fri, 15 May 2026 10:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q74vIe1vHtsQlNs4raX5h9oaRxwa1dTxwCCq8Ygatgk=; b=fCT4t7GJVSkQrLxAF4JsXlEISA
	zb5briyaXWTRxiWw+ifeOwn5vjBr5ESQJrME/+iUvgFegNARc550uC3TWUAPR58LVtfy9OrdJmDUv
	GcgxZqVpTlpPylR3+J3O433rX29ktzQRQx45lDbSyLnG66MhgYLLgt7lh6movD3/swTTfsQTqWSXR
	MdUhvjSoI2WzpsOYivEcfLekwdG8xJPv+xyCay0+uRPsWc7qsCSOngQpoViwymlpt9+SgTnPPWr4c
	k4g8J/SGQwyrHfObrnias1rzrxiZtrWALaaifVSygRV53glP13sC/X215UoOUdvhxM70mBMctG+o+
	awDhsV7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqA6-000000086Qq-2LVw;
	Fri, 15 May 2026 10:52:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqA3-000000086QK-43yi
	for ath11k@lists.infradead.org;
	Fri, 15 May 2026 10:52:57 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F51wL14008229
	for <ath11k@lists.infradead.org>; Fri, 15 May 2026 10:52:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q74vIe1vHtsQlNs4raX5h9oaRxwa1dTxwCCq8Ygatgk=; b=HY2l0GaaIOTOInh/
	lFpvlr8nwTsjS56jmB7h0lPRnvOanPA/m/eV3BcO6oG5eMK2vPQdUEp4gJNnF38m
	XPzngmatmyIHiMrJLkxDkdoF9xrC+Zt57rUipSc9dzWg2ZtPCDLvK5z2inJTgk2s
	BFF7u53xBs69A24v+0fL4xvXgxXQcmj56gtNh+ADEYvzie4wRTuJhfo9WLqiSLgO
	x8ipv9BeW8TNAncwLGXl93rgMkV7kSccbsmAqP4Ue8JoLqb4C2iEXvBF+MW2wHRG
	vKb/vFWvPtSn0sXc9zf/MKjZnIkGMQB8PScv4STA2Qj+xP1qY6j9oorZJBfepGDW
	/gDJBQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1stxc4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 15 May 2026 10:52:54 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9511f903b16so420460241.1
        for <ath11k@lists.infradead.org>; Fri, 15 May 2026 03:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842374; x=1779447174; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q74vIe1vHtsQlNs4raX5h9oaRxwa1dTxwCCq8Ygatgk=;
        b=Lb2PGaBz+mQ97dnRunKuKOPOtGQVdF1AWLp6sSrkjOPUFrJ7qMU0CcKgyjL8omKg01
         etpctuC1+QBJuZQr95oFosC8Ug/6vdARmhA39KK7VszbVUfoC3m0FXd5vvtCVVhYJh6E
         Inngd2xiQeSkLwe2SOUNIrKgMMiLYP3tI13/k6DpOJrhBOTtA2nG/10Ux8x+E+yC0O1S
         3mncSglqw35wwdCG/V9HUaHMoH4G6LZiul8WvjrtZyBQMAQNsGrP6pdxsjIzt0Qg3y4Y
         NlswueoVpwwyysaCYcv7xEuBV66ifdXd3xnEjPlMmkRtz6ceYLKRx+wYH4KJGlEkR5oK
         cw/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842374; x=1779447174;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q74vIe1vHtsQlNs4raX5h9oaRxwa1dTxwCCq8Ygatgk=;
        b=iKgysWcPNOLyaeBWPdElu4Id9q/b8qJ68Obim9fAsWJF/BF87UgvJSe2LaOEY9wmp7
         yIwsEfWEP2sZjm/IPdtKGB4KWIjRJWiFRt5Jzf5BZccQ9xQm93GIY+0UmR9UcxY1KHFx
         ISGwyKwQrCnOhGeqGwZsZ0tXanf/jhM3SHxUPb9+VQHNcdOxRIx8GjHleCui5HaRl6e6
         gIvcIAMeBZbpUP2dE7tG/HQLu+yNevheld3l82326Wuee0SY7DeSQlICg3Etn/3njIcN
         NxLIBacmC/D7gpeRMFF2W+qloqGnloFuSXvNEZZ9wBK+uaKCwa+6xvAZoPSyuzvkt0VG
         dIvQ==
X-Forwarded-Encrypted: i=1; AFNElJ+bH44lorLmzNJpMku1IF7JNWVD9n0PXtGBfAKSwUXXn7M1LCu5tgwlx+5JDvvuxB3sRgfiTTA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwCqem3LBPta4U6saW2EPDH82qUtlW498+kbrU0TlpTPDm6MOfM
	lqKDpJH7rtXc0TYuthSrUvC9Mvx7QZp9zyhsTYmjKcG1Qvj08MJ6hJ889q2sZBlat+FP7TQsKTl
	psgKOv41EzJ+GsXe+IAdBG6ySCd2RCRmzvcOH+fwV80jsl51ose6VQGMZsIKvCnV7
X-Gm-Gg: Acq92OHhBcdghZIW9VVx0w8LNh/u9iyA0OrM9BQXMLKiadiKRMMEAiyl+hwP1DdZthZ
	UDqNO4FbNq1P2jY4JkB3VsSW9yQd376Tb7lVeplt9KyUBh+uQr3ENodFlyRatgXW/ofo1rDWFPl
	DnELWRcfeO+mSGWmZ1uRb0GIFf7xASYzGeQZmhTHP5qRAmRRGhkeMQvHPcYBqSf25M2kIGe4axG
	F2gD8jETb9KJQu5HZ24Pb9/h5Sav30tUR/cTFJk1+q9m3xSTsiT7WzWzLd60FRWrbWZbwP00oUT
	Pxs31v9Nvh4+BU6J0RTOWXf2ktvw5brE2S6RAwUeyTspZEQmPh39rXNnkfpZ2gOWnN6M1qhgKNf
	qD9JV2QEHI2DWN00Qr5/Vrf48Q/TMUO1YJvqNUSoe38EFcWKFo40D8tY+yepkApTV44gcJ3k/k9
	MvFfU=
X-Received: by 2002:a05:6122:6117:b0:575:dcec:efc1 with SMTP id 71dfb90a1353d-5760bc49d2emr517881e0c.0.1778842373933;
        Fri, 15 May 2026 03:52:53 -0700 (PDT)
X-Received: by 2002:a05:6122:6117:b0:575:dcec:efc1 with SMTP id 71dfb90a1353d-5760bc49d2emr517858e0c.0.1778842373403;
        Fri, 15 May 2026 03:52:53 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4bd1bc9sm212603566b.9.2026.05.15.03.52.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:52:52 -0700 (PDT)
Message-ID: <bad20423-de93-416e-896f-002e7c05e4ec@oss.qualcomm.com>
Date: Fri, 15 May 2026 12:52:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: milos-fairphone-fp6: Enable WiFi
To: Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
 <jjohnson@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
 <20260403-milos-fp6-bt-wifi-v2-7-393322b27c5f@fairphone.com>
 <4fbs4arx6sez6fffy75ctmzecfvitr6aocau3cczlr2ps2ptld@v7wpa2irsihl>
 <2514523f-a43f-4470-a69b-3d5175d10385@oss.qualcomm.com>
 <DI789NOBWJHK.1V3SFQLCFLS4P@fairphone.com>
 <870d16bb-b426-4285-a299-deb09ae90243@oss.qualcomm.com>
 <DI9X9D3TTIRE.1CGHQI2LEZ1UL@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DI9X9D3TTIRE.1CGHQI2LEZ1UL@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zOvhNTOXstFso8rTVOIFUrRytTC_DMsp
X-Proofpoint-GUID: zOvhNTOXstFso8rTVOIFUrRytTC_DMsp
X-Authority-Analysis: v=2.4 cv=cZPiaHDM c=1 sm=1 tr=0 ts=6a06fb06 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=jmRdrQK5CiodBuYeE2YA:9
 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMCBTYWx0ZWRfX1nIbpXMlj25/
 DjSsFBpZVDkIuqpbmqXC7ADPXgvIBENvYtHAEYD1MmFdMj2zFaupiEAiJ2YCGCjHuDPT6pyfqP9
 zCP4rtHVg8r6mmiLjTaJURDqenejarQcc4fF32WSW7XiqC/DRslic+8++0/ZMtO2Ob9x9FUwSSR
 cMZSK3Uv/rQZ6XXX7TpRuUn/zq9u3r4hHp3JsqMo+Vlbo7kP6muLBsVoUHaqsjqoznjSmPCvDXu
 ato72SSL6pPkfhCybqueLB3jak5YqSP892fcl23I3XHKc0/KesWWB9TSmDHYAM7XOn5h6oFysjO
 1rD89fEZ4SA9JJp0BU/gT8zgnzhnmLOIictGqMaJyTHK15nu6m9hFkcXGmREGT86gc569o8srZs
 2tCa8ENU4WgOI3b+CguXt3PhND7T6TsiZYecQNtPpc4xcUfUTjiQYcKsetPmyP7Vu6s6L9ZUXlb
 kKE2QIhwiJBtC1Htnpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_035256_136737_5D3F188F 
X-CRM114-Status: GOOD (  19.83  )
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

On 5/4/26 3:21 PM, Luca Weiss wrote:
> On Mon May 4, 2026 at 3:10 PM CEST, Konrad Dybcio wrote:
>> On 5/1/26 11:20 AM, Luca Weiss wrote:
>>> Hi Konrad,
>>>
>>> On Tue Apr 7, 2026 at 3:16 PM CEST, Konrad Dybcio wrote:
>>>> On 4/3/26 9:35 PM, Dmitry Baryshkov wrote:
>>>>> On Fri, Apr 03, 2026 at 03:52:53PM +0200, Luca Weiss wrote:
>>>>>> Configure and enable the WiFi node, and add the required pinctrl to
>>>>>> provide the sleep clock from the PMK8550 (PMK7635) to WCN6755.
>>>>>>
>>>>>> Thanks to Alexander Koskovich for helping with the bringup, adding
>>>>>> the missing pinctrl to make the WPSS stop crashing.
>>>>>>
>>>>>> Link: https://lore.kernel.org/linux-arm-msm/DBF7OWAWQ94M.FSCP4DPF8ZJY@fairphone.com/
>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>>>> ---
>>>>>>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 19 ++++++++++++++++++-
>>>>>>  1 file changed, 18 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>>>>> index db72418b7195..d8ac495ca7c8 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>>>>> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>>>>> @@ -242,7 +242,7 @@ wcn6750-pmu {
>>>>>>  
>>>>>>  		clocks = <&rpmhcc RPMH_RF_CLK1>;
>>>>>>  
>>>>>> -		pinctrl-0 = <&bluetooth_enable_default>;
>>>>>> +		pinctrl-0 = <&bluetooth_enable_default>, <&pmk8550_sleep_clk_default>;
>>>>>>  		pinctrl-names = "default";
>>>>>>  
>>>>>>  		regulators {
>>>>>> @@ -766,6 +766,17 @@ &pmiv0104_eusb2_repeater {
>>>>>>  	qcom,tune-usb2-preem = /bits/ 8 <0x6>;
>>>>>>  };
>>>>>>  
>>>>>> +&pmk8550_gpios {
>>>>>> +	pmk8550_sleep_clk_default: sleep-clk-default-state {
>>>>>> +		pins = "gpio5";
>>>>>> +		function = "func1";
>>>>>> +		input-disable;
>>>>>> +		output-enable;
>>>>>
>>>>> Hmm, if it's a sleep_clk, should it not be handled via the power
>>>>> sequencer?
>>>>
>>>> If you mean that it may be needed to toggle it with specific timings,
>>>> possibly..  seems that WCN6855 has a "xo-clk" GPIO defined. I requested
>>>> access to some docs that I think should have the answer, hopefully should
>>>> get it soon.
>>>
>>> Did you manage to get anything there yet?
>>
>> Yeah, sorry, it got lost in the sea of emails..
>>
>> The PDF talks about the electrical requirements of the clock signal and
>> the section titled "Power-up sequence timing" doesn't mention it at all,
>> so my assumption would be "OK so long as it's ticking before you power
>> up the WCN"
> 
> Thanks for checking!
> 
> Is this an R-b then?

Yes

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

