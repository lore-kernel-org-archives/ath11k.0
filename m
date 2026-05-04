Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A72CFF886F
	for <ath11k@archiver.kernel.org>; Mon,  4 May 2026 13:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EyL+ckv32prGhdqPvBC96FXpnqbIVDmGry2rLJFtils=; b=YJRKa9mZ2FkVuHM+ClHR8x1UnL
	rdIQAGjdt3z88N1pgeeel3ryPpjgR1e5ICCGz/swkTz9Hh+kzqAHTXLJ+LwbQ8qnM2QpWf4ydD6U1
	zJCQYj7ydSmfcPKVOe3b+1jg4pyyG8jljH+HRxTT2E2l9KS61vKZmvE5Q3Fes7AtCdz2n7UZBleT/
	cFc44XAlmSCHrMFwD/R3xONsaUkcS/BYB5wjdB8jiVCIVSh9D/LOBzlhN3CGELiaE2M+tm2Gx6q0m
	poKMdFEJ3/HYGUa03xIfwUaIHQgJL8GnHZH4fUGXFb6TaXOpNtTlFYHzFmiCA63cZmOqXZ0gSHNso
	oqOPWITA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJt4g-0000000DGYP-3ti1;
	Mon, 04 May 2026 13:11:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJt4d-0000000DGVb-44i8
	for ath11k@lists.infradead.org;
	Mon, 04 May 2026 13:11:01 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644B4ENg636667
	for <ath11k@lists.infradead.org>; Mon, 4 May 2026 13:10:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EyL+ckv32prGhdqPvBC96FXpnqbIVDmGry2rLJFtils=; b=ZSvuHGy95t9IhfsP
	U3AUnAAWUZb4mq54JFS6nvzoZ9btK6EbfUg23V7kI56xOv7GPGAzijdIcg4NtuwA
	QQzmGEQyU/M8acpw5M99WmnZoh9sOA+qPIXl0bAnsEezyx4ZT6VH1emP73U+So1v
	P7dUn0UWcIkTpQug6+gD66d4Umg7wTExv3+MGH+pzOShYIhqBy74moGYuJ7yqwDm
	qW8DAN2Nh0Yov6kGScLpG+Pb6VQHKwO1zbNqBJ1kq530dm4W+d0SNFH8E8kP9XW6
	SVo8kV2gK42wvtxUL6SkLKEtx02NFmBDUEtCeGR1dxi/jjEP3YV433YmTCMgLyDY
	E780jA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxsx48dru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 04 May 2026 13:10:58 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56f6e373ba0so340278e0c.2
        for <ath11k@lists.infradead.org>; Mon, 04 May 2026 06:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777900257; x=1778505057; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EyL+ckv32prGhdqPvBC96FXpnqbIVDmGry2rLJFtils=;
        b=jQtB5PJIz5InyfiuYnFhcffkVFzvEKcbM/0279hQhWMAbQVIv6iIzEYg8ULCdvHjbq
         6toc2VpZRaDmohw0NF6DOskKQzX5CAeLLyE5BoyHsVPMcjXrynKOaEldQTtbeOFiBgd2
         928urZBOtF0ljuD4x+UTC42B0vmz252voYqg+TqMrz2vn2sR0vYhNSEZtjcDD1dXSMHh
         juJTFJtJjKZmZzMuKjQPO81Xvf8ocP8tIv7YIxW8iPxGCkMjX/7Q6saD7wsTk5GX4JkV
         W3YxyQXyvyzy18iftEaJcN5cDbNbcD9NlEdgR8BS00ReN/uchoQQpo3JjZet0JeqQCH0
         4QTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777900257; x=1778505057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EyL+ckv32prGhdqPvBC96FXpnqbIVDmGry2rLJFtils=;
        b=M/BO76e3lz150jSkU2t28uKE1sz1P/snNd2gq9nLm1T96F9D6cnJXD16Pq7i/fk7OK
         jb9Om7bKaEKgNtlxc9Yzq9g8aCrMi4QHCZmn5oEpPFuGo0m0t1oZgmfuNjPBZ8sS9nxi
         g3lS1vwF0KJiaqi6yof/yakN+1CsfmZLV17Y3dJuEaQkOLi9LP8Um3mvqcImVkkvf+Ag
         coS93m8AlyK6ig8/9Qy1tWemHBGWJ18SBq49TK3r1vu69YgUBIuUDv6fNH2u/dK8JYRW
         o9DpeXv7r6s1A1vQ61At4jv+CLoIh0NYuzL1jyPgSuGjvoc9gXPkX3G0nJ7x5l8oo+hQ
         rSYg==
X-Forwarded-Encrypted: i=1; AFNElJ9EaJnNYnr8XvT/ihkric7/zG6BSbUSB6S5ghK8UkL58JSKPGja6zZuGtg8r6aerSdAJr/9R/o=@lists.infradead.org
X-Gm-Message-State: AOJu0YyiZC/UeLT5YDGqPEgbcPia+i3vNQVwhUC8QGACEURSbRtvHAy+
	40ee2eQ4JnD+pf/MSDUcEOwdAVaiLNKa2/f2IwS75q7xr3AkLzjYXeqDg/XLyxNNP1TllDBCYcy
	jOu2JLEREnhybBfsG3RfhcztUzBuu/5bU2MLY/WVgYk36bW4o62qJkdORUBetALxK
X-Gm-Gg: AeBDieuKY85KuNnNv48xOScDxDSiOmfflG/S+ECw3XRhlFOnWbqlGqp3dhdh68ZK8ge
	bEtYpuIw5IppSyZsBXD2TVALgrkU/lNb0565oDjfpg+c2/ES8nuKdYR5XiYS3r9f3y7h0aKL8y5
	kVaxvclPqvCPIWuWxFCmO7y09f9Ag7ng8JoaDuCDhAQtVMXTEDSVstc8YMK6e0ky99Rc0cqCI0O
	45tkwzaKNHJhn7AZJ78S3bhlYMMdIf67pSl8cAfNivEXV03To2VzS1EVKaaCWdpcCy/IPhr2QmP
	Pj5re52Hfz4sIqtETJAePP2BQntmWNpSf85lD0p195pgT48oIEnn4A5HvLDIXExm6arYStcFUhV
	3poQSZZcYVW9LStP3BT8fgIqnfCDeEmvwGljaTXClxcAAPTTZ1g3ucl3I1vp4WEW/7+1FygklxQ
	yheDBfdEGWrwnwrA==
X-Received: by 2002:a05:6122:3611:b0:575:35f9:66b7 with SMTP id 71dfb90a1353d-57535f97091mr279801e0c.3.1777900257430;
        Mon, 04 May 2026 06:10:57 -0700 (PDT)
X-Received: by 2002:a05:6122:3611:b0:575:35f9:66b7 with SMTP id 71dfb90a1353d-57535f97091mr279764e0c.3.1777900256820;
        Mon, 04 May 2026 06:10:56 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc1ad2d59fcsm149037266b.45.2026.05.04.06.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 06:10:55 -0700 (PDT)
Message-ID: <870d16bb-b426-4285-a299-deb09ae90243@oss.qualcomm.com>
Date: Mon, 4 May 2026 15:10:51 +0200
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DI789NOBWJHK.1V3SFQLCFLS4P@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE0MCBTYWx0ZWRfXyh7EydmT7bIC
 brVMWjbhrhyhrZxGG8SPqi9zin7Yp9tAFOoT9IKaQswAm+ST5j5FnZQneALhBdhCG55/+SMrD2Z
 e2U8jv04d+JOb8gQbWssA2Ndl0wgF6psN+4VJ23xhmMfHU80S7RyYuAY3ljnpDJ4YcLrwL2LlQ0
 gnvdjHg9McXuJKWR3th78jGCLEC0JCXR/TKxN+0wxORDEOY5WGdh6lWd4uNK6WPZ4m7qffh1ufv
 r2rNSG74EFkMH6myM/wPYpqW708rDbupDq81HoOihVMggj/oj9TFliWyo75DDMvwtEA9+ce4urA
 D5GbG4xYOy9HmjHPvbnoq0aUj7JxybAEcK3QxHUx66YstWiVBBQ7Hv+ARPfCjJqq4riiSDu4LCh
 4QuydqVLaLYkC70BpWPXvNXkWQph0pfDwTlmVUsdQ27/RJ1xlFZpRjQAHEg/NR0LIMeqX6m50ef
 NAvvUtGl/zVQPiYXQxw==
X-Proofpoint-ORIG-GUID: tjjz9ekBiotWy-bJbC-jbiZlI97q0Uu0
X-Proofpoint-GUID: tjjz9ekBiotWy-bJbC-jbiZlI97q0Uu0
X-Authority-Analysis: v=2.4 cv=LdIMLDfi c=1 sm=1 tr=0 ts=69f89ae2 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=1iLxIbVeREuL6hqEqU8A:9
 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_061100_135394_94BB60D2 
X-CRM114-Status: GOOD (  18.97  )
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

On 5/1/26 11:20 AM, Luca Weiss wrote:
> Hi Konrad,
> 
> On Tue Apr 7, 2026 at 3:16 PM CEST, Konrad Dybcio wrote:
>> On 4/3/26 9:35 PM, Dmitry Baryshkov wrote:
>>> On Fri, Apr 03, 2026 at 03:52:53PM +0200, Luca Weiss wrote:
>>>> Configure and enable the WiFi node, and add the required pinctrl to
>>>> provide the sleep clock from the PMK8550 (PMK7635) to WCN6755.
>>>>
>>>> Thanks to Alexander Koskovich for helping with the bringup, adding
>>>> the missing pinctrl to make the WPSS stop crashing.
>>>>
>>>> Link: https://lore.kernel.org/linux-arm-msm/DBF7OWAWQ94M.FSCP4DPF8ZJY@fairphone.com/
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 19 ++++++++++++++++++-
>>>>  1 file changed, 18 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>>> index db72418b7195..d8ac495ca7c8 100644
>>>> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>>> @@ -242,7 +242,7 @@ wcn6750-pmu {
>>>>  
>>>>  		clocks = <&rpmhcc RPMH_RF_CLK1>;
>>>>  
>>>> -		pinctrl-0 = <&bluetooth_enable_default>;
>>>> +		pinctrl-0 = <&bluetooth_enable_default>, <&pmk8550_sleep_clk_default>;
>>>>  		pinctrl-names = "default";
>>>>  
>>>>  		regulators {
>>>> @@ -766,6 +766,17 @@ &pmiv0104_eusb2_repeater {
>>>>  	qcom,tune-usb2-preem = /bits/ 8 <0x6>;
>>>>  };
>>>>  
>>>> +&pmk8550_gpios {
>>>> +	pmk8550_sleep_clk_default: sleep-clk-default-state {
>>>> +		pins = "gpio5";
>>>> +		function = "func1";
>>>> +		input-disable;
>>>> +		output-enable;
>>>
>>> Hmm, if it's a sleep_clk, should it not be handled via the power
>>> sequencer?
>>
>> If you mean that it may be needed to toggle it with specific timings,
>> possibly..  seems that WCN6855 has a "xo-clk" GPIO defined. I requested
>> access to some docs that I think should have the answer, hopefully should
>> get it soon.
> 
> Did you manage to get anything there yet?

Yeah, sorry, it got lost in the sea of emails..

The PDF talks about the electrical requirements of the clock signal and
the section titled "Power-up sequence timing" doesn't mention it at all,
so my assumption would be "OK so long as it's ticking before you power
up the WCN"

Konrad

