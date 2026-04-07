Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7555FFEEF3E
	for <ath11k@archiver.kernel.org>; Tue,  7 Apr 2026 13:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XKnEUyjc+ddoTTjBnULfB8xhWcYvXVbs8lR0FNjEwO0=; b=m1izcST1cFglzqqofJaFErKCai
	mWDa2hGY42VvaLwg/1CRONtap/pKgjUoG267/mkZCcxc343pAWa8Tm7xoz7BPwSceZE5jelsZY3au
	ADmSRRsVyqECQaBrNJiPL6DGFe+RQaLczWnnagTljpBNie28EkgN9xbRVP0pMLYs3hkKMtse3nIXg
	Zw7SGD5IzJBhlgATEAq19RRu18qPrDUEeCZCUe2TbE01oa6IW3nZMzM1gDEiYtyDBu5z+4/P/rCas
	lPRkpsqhSCajn+H4NcZAypZm490b68BqIVSgLdDA1a07Pdw9iP3iClBCdKLpKULQrNzuAb4k8o99j
	ppRMv6DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA6Hq-00000006Um0-20TQ;
	Tue, 07 Apr 2026 13:16:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA6Ho-00000006Ulc-1bSU
	for ath11k@lists.infradead.org;
	Tue, 07 Apr 2026 13:16:09 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637CVaQO1404186
	for <ath11k@lists.infradead.org>; Tue, 7 Apr 2026 13:16:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XKnEUyjc+ddoTTjBnULfB8xhWcYvXVbs8lR0FNjEwO0=; b=ppWcSLxqr5d5b9/h
	OZE7Q/KsO6xrwkRE+iJkyMXvUzZ2FHC429n0VxXDoAKUuMeeNxqlu+YiU9jT2+aK
	HNv45y2ToeC/B+P53CW+nbnaDOxNMuMco7kqoq2TpnigXwgQRJGkjmxAFhQCj/Hv
	9FlvYA1OMWAFVSiuGOKzW3gWIpt90V3EkfR/2+SrQMBzEoFvPwkjYPYhZJ4u+RvI
	F5iAxX9snpkLXYB04U1vbOQBxsBuYJzw59EqrOmWGi1y2SPmF2ESqETCHkEpFnGX
	ZJpHUlgLg7CH/sG+4Kg9SB++Zd59PFWq3IG7h6bJ23Pi3jERXb0pt5WqTC+2Hq16
	6Ld0nA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8av29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 07 Apr 2026 13:16:07 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7d4f354b639so2263583a34.2
        for <ath11k@lists.infradead.org>; Tue, 07 Apr 2026 06:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775567766; x=1776172566; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XKnEUyjc+ddoTTjBnULfB8xhWcYvXVbs8lR0FNjEwO0=;
        b=hY0jgf26DGailpYAewHL7jrw+JGCHc0E2oVQ0Z+wNzwWt92pOBmD1SKQa4ziI2PgUm
         lh3LzmgOH+ebvdig+i6qr1SAOiRzIHUSpvzBonQggHUdZ+VQQL2QtNF86M6ZVbODFjBM
         zDin8CJuS9GFRkWNwFV+YqbxZF8Oa4SHLu1lhqluK0QYrS+jJseUtf6iR/rtqZA3O34S
         18b7va0d0GbUFbG2yhpS/bMTuX7sYxP9IVLPGBbq7e1GRbnNYpjpLRwLXfaCe1paheOU
         +3ziSwjgBwNzjXZZBX4Jt3qxNyWjlWSpabHCgxiQ2umYrKc/0lUPMxGbm2oMSaRmbY7U
         /nRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775567766; x=1776172566;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XKnEUyjc+ddoTTjBnULfB8xhWcYvXVbs8lR0FNjEwO0=;
        b=Fl5Hzqfho4y57sFVJU6UwyW/RfbC1v6wex1kCyujS2r98aKr7oD97D+ZbqohURfHuf
         7pDfYD6bwjbGNZJWrB6kT9AMYJzuy02F9VIpC7eS2K2P84YXa+fJXcVHaCdwhVdIhozT
         lnDrrKuzaPamK4YCCCrWtcmo7MzUA1txcijYhrbSFEsgu1qUJ5lUXiBTAbWFAVxsQgKT
         uV41xd+qJh30IYDte233pRu77mo4FNuUp72gg2jzoxqkC3i7MkiPUMA/gbZ2bDPgyyJ1
         DqGjnbiUrRMpv9IVwPrgbhBrA91u9UD2ufHbGSnSG/arEFmGBiDtS6rNZsKskh85fR3m
         LWDg==
X-Forwarded-Encrypted: i=1; AJvYcCWMoomaaoPuVzpGa4pAtk5fugyb/4Ib/x0gCpwm0J696QL2OQwVnyaBIEH7fCb3ECoazpQUf7A=@lists.infradead.org
X-Gm-Message-State: AOJu0YyB65xaGxS5Ymen8j6hgomIMinJOMkcH6irxJ95oYY8L7FXnGrf
	rGZZjZTyhSC+qL86tB973+LrTwazq7UPEBeG7a9S9VY/B3d7I1gmwkSoJz8Pz8l5hXVX3ifxy6D
	pd38Y5vZzRyj1aCCFE4SfcSXJjXlO+3mclBDOcP3QsbXHmOOmXek7qbaVSHzX//no
X-Gm-Gg: AeBDiesRlUigNMC3+dKvNSYbQpQNRoTZL0YytXTL6Ko2NRpo8i9Tfs2IVaITxc1HMnU
	x5w9dGcqz5fLbX2e5T4RMt+4gtmyduUXtrWVfTfUUW3I0ChnkBcm2lFwB44gZR4Pbxl+piJ2f7Q
	ak6UedGp3KMujCihuP0A25sFHQmnLW1OcBXp+0u2qVpgY6fExatT3cvh4dJBFsXg1PUOoXzAHiW
	ghwaPiLiNnwtHXJCRiUAm0AJYfNkoRArEFdZLp5Q165ykoIqODJdI7QrP5N0kP/L+6RhNVv1aAQ
	CAQ6Oe9a82YkyZWnjx7vagv5i6aXRuQ4ob92Nk9DihkPwx8PqKtLlVz5+QKsCuHbSqzQ7GiVqj4
	XXzZKBF/orcB9JH9L3WmEaUuL5nKPeZ8oNn6KV5OFl+KU/GQnjni/cYpBgKSs2wPG1uoEvTT6+L
	79W58=
X-Received: by 2002:a05:6808:4fe9:b0:462:dd41:414c with SMTP id 5614622812f47-46ef831d5aamr5805570b6e.6.1775567766072;
        Tue, 07 Apr 2026 06:16:06 -0700 (PDT)
X-Received: by 2002:a05:6808:4fe9:b0:462:dd41:414c with SMTP id 5614622812f47-46ef831d5aamr5805526b6e.6.1775567765296;
        Tue, 07 Apr 2026 06:16:05 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c99ec5dsm567712966b.15.2026.04.07.06.16.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 06:16:04 -0700 (PDT)
Message-ID: <2514523f-a43f-4470-a69b-3d5175d10385@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 15:16:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: milos-fairphone-fp6: Enable WiFi
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4fbs4arx6sez6fffy75ctmzecfvitr6aocau3cczlr2ps2ptld@v7wpa2irsihl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7qOktLnjyHNEW8V0l5pdRrS93fTPW-1s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyNSBTYWx0ZWRfX04fb8Yy0K08I
 tgf0PVTWCyds6OG/N2/bZx+0J2TKShGCWUQ8jgTvt9rtdyevFDlvxTSp4YWZ8nsnLjaeA3y2SJd
 EILVsZf0/+TQYyl/WWUbZ8GuemgNwBc5eYvm7KUr6T4AXkTMhewU99y6MPPbqR6Az2/FoSNLcSL
 Ono5vGptkk1mYypYNavF/Tk3ArEuJ5L2x9RwDKd4oD7HjP/1cCVtUGvix5LDueuKVZbL0jvlmEV
 qx5syFXVWfYbcrpIDW/EUjZsHiRA+9mGNyjNR85t0BebtEuPN36Hwb36YfJ6ZEmJlbwEW/C+dmM
 9Rb117qLPCfqVWNkKRMilNVhSxOfguz8785zolN4tBZnN2D5PFc8JwC3QkEfWZDwCuyOU1c3C0U
 1jkjVzStBfReejBnbmvDANhOQBcxr13PH8XJzfj8GUhweSMknglFAItyvhbiI2rysoUD/EPpbsX
 vA414vBHgibEoY3WVkg==
X-Proofpoint-GUID: 7qOktLnjyHNEW8V0l5pdRrS93fTPW-1s
X-Authority-Analysis: v=2.4 cv=A/hc+aWG c=1 sm=1 tr=0 ts=69d50397 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=iIL34To0PIL57gYWuS8A:9
 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_061608_545512_EFB323C3 
X-CRM114-Status: GOOD (  18.74  )
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

On 4/3/26 9:35 PM, Dmitry Baryshkov wrote:
> On Fri, Apr 03, 2026 at 03:52:53PM +0200, Luca Weiss wrote:
>> Configure and enable the WiFi node, and add the required pinctrl to
>> provide the sleep clock from the PMK8550 (PMK7635) to WCN6755.
>>
>> Thanks to Alexander Koskovich for helping with the bringup, adding
>> the missing pinctrl to make the WPSS stop crashing.
>>
>> Link: https://lore.kernel.org/linux-arm-msm/DBF7OWAWQ94M.FSCP4DPF8ZJY@fairphone.com/
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 19 ++++++++++++++++++-
>>  1 file changed, 18 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>> index db72418b7195..d8ac495ca7c8 100644
>> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>> @@ -242,7 +242,7 @@ wcn6750-pmu {
>>  
>>  		clocks = <&rpmhcc RPMH_RF_CLK1>;
>>  
>> -		pinctrl-0 = <&bluetooth_enable_default>;
>> +		pinctrl-0 = <&bluetooth_enable_default>, <&pmk8550_sleep_clk_default>;
>>  		pinctrl-names = "default";
>>  
>>  		regulators {
>> @@ -766,6 +766,17 @@ &pmiv0104_eusb2_repeater {
>>  	qcom,tune-usb2-preem = /bits/ 8 <0x6>;
>>  };
>>  
>> +&pmk8550_gpios {
>> +	pmk8550_sleep_clk_default: sleep-clk-default-state {
>> +		pins = "gpio5";
>> +		function = "func1";
>> +		input-disable;
>> +		output-enable;
> 
> Hmm, if it's a sleep_clk, should it not be handled via the power
> sequencer?

If you mean that it may be needed to toggle it with specific timings,
possibly..  seems that WCN6855 has a "xo-clk" GPIO defined. I requested
access to some docs that I think should have the answer, hopefully should
get it soon.

Or maybe +Jeff/Baochen could answer faster?

Konrad

