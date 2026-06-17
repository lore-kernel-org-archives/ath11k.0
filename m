Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF85FCD98E4
	for <ath11k@archiver.kernel.org>; Wed, 17 Jun 2026 10:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mNrGdDE5wIcEcKZAB2cOApd88y9gCStNjjCMJgqaBk4=; b=xD7J7XwZivThxwhkbbJN/pQgIV
	61Mtuu4oxVvN2wQdCJGLeE+EwwykYGC8R1HUmq+UPxDuA0UQhdehyJxpjmmdI7Lm6m+88+17zRXZb
	w25JSQPATZVDJEcifZsH4F4pm0SaXsrFIQVe13u1dn/dkucrqZC4qw13JrMavbOYAY30M8hBpP2xp
	QHnhdbEUE55MBSDNNU2DgiLg3pPOvR+/+CEVfk+SQLc2g3spngTVfN8p38zubn7h8wUMpX2JQt5kw
	mhQDzgcssOjhxH925KVmzLGuAh3N/Fft44opA354Ww9IwCq3BdF3OzuYRILjRyp+DNA/sNx0pBE8p
	d6qHS4MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnmz-0000000HAlX-3v4i;
	Wed, 17 Jun 2026 10:46:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnmx-0000000HAkx-1TbL
	for ath11k@lists.infradead.org;
	Wed, 17 Jun 2026 10:46:32 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UXaE2217648
	for <ath11k@lists.infradead.org>; Wed, 17 Jun 2026 10:46:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mNrGdDE5wIcEcKZAB2cOApd88y9gCStNjjCMJgqaBk4=; b=NTFUW6SyPyQlqpM0
	eRxetGpx0Bey2F8789sepoc5vGnzV3R7Dx7+FLDnTuOdjBPHhnNsgZB+7JD1TEu8
	GJlwJZN60NLoam4a7RpEGEE3ZgNyvQdrVnDvtkQ/rLidMlK4BctBb205w1lES0w/
	d4dtfR49OdnB4Qrljw66h+jbl8dPlP2vF7+gAiaJ5uNrucDP5YAVbouxWcOcmEKc
	GUKQmtHrZe0TC3bbL1QxAA/+ZlZ5V7ydPoqgzL4AyHu3WcWbEXSM9u+S0HYm7S/8
	EolR3DNKQU13xdeYJaupj0N9vZ+PzsyZQixtsJZQgqfuMJaqEZGtfpg295t97tXr
	ZvG+Ew==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueerarg7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 17 Jun 2026 10:46:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517741bcc53so13699601cf.1
        for <ath11k@lists.infradead.org>; Wed, 17 Jun 2026 03:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781693189; x=1782297989; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mNrGdDE5wIcEcKZAB2cOApd88y9gCStNjjCMJgqaBk4=;
        b=R12pQZqaRQfXmxGeEBiXK+EaW5hiOSeYrcTY1JLZ0aHFIfNGMigslRl5q38tM/Mq+Y
         bddZNsdCziSmwRs/Gwa61OGpZME1ZyZiaGW6n0kBiT+Nz/YKA6VixVaJ03gAs51UGkwG
         9TAaVRvW0j8Wysufan4N+K1bWTfAHoXb4RTPa2g7bb1dKmtCuuNV+/KnDFGbqAA2/Sxz
         NwQaSgt48lberCnomVglo7WSq6Ei3TJWDPv+InDwcV9/VBu3ZFpfRczp6MT3pzRx0tDC
         073iqh0Mkl5mIUsjw0VOqzBXExF6vn4nIrxN+U6aKAUj1e009BrqP1ctgzryiLJDTKvs
         DUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781693189; x=1782297989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mNrGdDE5wIcEcKZAB2cOApd88y9gCStNjjCMJgqaBk4=;
        b=sVN44sq++O7UX6/TGpg3E+GcyNHe9eO/lYnnb/1mR2dkhpmV5/uMa5hRbfzSTjD/0R
         kqGaOuy1LJ1sX3yUzdYoUGxD77n7mOvp4mjxpBPk1y/kfXqFF4LVlGZeXKwjTp3tU939
         vNdQ7TFbeoEb1XZZyjekwu+tZHN2FTGa7fFqYn/po1NNcjgPmzOIM8McduYwluwaFppr
         9VBpc3K64xOvpaLcQw1viz12LswPWWwc9d+T3gGh2tHganKOdhZZHfI9fJJ8CPH2jOft
         2yEPCSd0UxBcPhF5kMenRdKz3JU1nermpG9xgGWMo/R+jyqtwdTs4vfPT9m/0zz2igBg
         1hKw==
X-Forwarded-Encrypted: i=1; AFNElJ9LLeNJeYstgGdhzu6fYNFaNg1B301rWeQfxUJFwP2t77CRx+ixfPUC27VhmVP1/7S2Mf/r94A=@lists.infradead.org
X-Gm-Message-State: AOJu0YxV03lcGZYpJnlHOmZexp00V8R9BDhzBxl6cxOj3JcHNMq1YSDm
	SQBsLaLuFVJ5UO2tqbx1vndDZ4KLlyfsfMwcFs8O/9yBp9qgSnzxLpJ3I6dPk7E/t8jnDEvW47K
	vpAy8ca4moTaBimbrXqSyhl3+eS5Yd0alCOlWSFSASs3G6bpTkexkSesGuwVeXHht
X-Gm-Gg: Acq92OGttvTUXvHskue/rEoZX43EY+xsTNUOr1SDY0Yi8iVSb309aTTxII1LglrROV+
	1oC905eGV2Te35cwJGzOGJ99UkarM1KwjAiimMI6FnCTJ7N8KnIXFETkra54QPzulRCsrT0r7nd
	N9IZbG1EUgTBY4H6UF8x9wvYJ4hntqIjMjynDIyUgMZRdo9oR9uwERvdYSW6+uqnhkhtapo1TRq
	W+uzvX0zItlVjF5W9PoNVChmBV54lZGpaQBRYBVnna8XXTt/NVJEBXQI6SqIyyWyulj8EFjg+AZ
	KXfiUgfvwl2EAvGA8KJ5aPjuQhNSEkvg7FrzouUo2NBYx/q7AvLWmP5RQaI6mp+8vfJAtDN/t0f
	u6tqdKYxTFODVNvFZYOf0AbclYf+qzj15gDk=
X-Received: by 2002:a05:620a:c4d:b0:916:10f6:765e with SMTP id af79cd13be357-91dbc5298c0mr258844485a.6.1781693189471;
        Wed, 17 Jun 2026 03:46:29 -0700 (PDT)
X-Received: by 2002:a05:620a:c4d:b0:916:10f6:765e with SMTP id af79cd13be357-91dbc5298c0mr258839885a.6.1781693189023;
        Wed, 17 Jun 2026 03:46:29 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937948ddfcsm6244840a12.21.2026.06.17.03.46.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:46:28 -0700 (PDT)
Message-ID: <7b5c713c-e00c-410c-968e-56b9f487211b@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 12:46:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sm8350-hdk: describe WiFi/BT chip
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-bluetooth@vger.kernel.org
References: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com>
 <20260601-sm8350-wifi-v1-7-242917d88031@oss.qualcomm.com>
 <955691e1-e40d-4584-861e-8f29db4ba8a9@oss.qualcomm.com>
 <dz4qovpquxgynnzviqg6g23oa2o3trlkznremnmlqfnlj3b62x@oqgcuvalfcph>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <dz4qovpquxgynnzviqg6g23oa2o3trlkznremnmlqfnlj3b62x@oqgcuvalfcph>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEwMSBTYWx0ZWRfX5ggGttyoWP6s
 mzncHYOK5Oes3QGAt0ob+t1q9vIOUzFBilxVfdu42X8a3QBp5sBVsyMD1Vffahq9chbIE6qiKB6
 YIWTd5MixPbbgFFAMfxKssjJ8J1dWJA=
X-Proofpoint-GUID: _y2va4ngNo-DtV_95da6MU4aJDjhXSok
X-Authority-Analysis: v=2.4 cv=d4fFDxjE c=1 sm=1 tr=0 ts=6a327b06 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KWhx9lE1SZ_w_DgzBjgA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEwMSBTYWx0ZWRfX28U1PJk94/ho
 JymehOrVLvCJxVOuuNZDoRBqc+D9ek2tOTghlvjIHdBU7cXaVJiBmfLdAbnm/nCzyt4cE10B/bm
 g7n4iNgjoz9btivPByLrjV0C+1NoAcLHYwkmhGFpvgg5o4Y6cVFioCHQ/qBTLt3EHAboy6vv4N1
 ulDUqphO9lr2DN7KkpzbPOYdCtk90hBhG4Qv8fCeHjWklujlqLVozQ+ji0W6jVyj0eftYmof0t1
 GRGWdPL7H4kcvqBxtRWJiAQXuM8i8KBZNcby14maubLXDpRKoIErsh+lFpKy99xwYkh3xnlgxCE
 t1BZt+7z5XLNBzUE51faelNNzn8o4kmDK0UzTiVLbWEBeZ0EftjLPWzfV5QeQykkbfhMkrnPJ3K
 2zygdt1UadC4lFonix1WZ0WKQdaSKlPJIAGoxFJyyZsCelHDmYf/7AyHnzO7T0Msgg7Wv1dc91w
 JKRGTsbCd9oY3Z6ZS7g==
X-Proofpoint-ORIG-GUID: _y2va4ngNo-DtV_95da6MU4aJDjhXSok
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_034631_512896_BDCD5339 
X-CRM114-Status: GOOD (  16.05  )
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

On 6/11/26 9:44 PM, Dmitry Baryshkov wrote:
> On Thu, Jun 11, 2026 at 02:09:27PM +0200, Konrad Dybcio wrote:
>> On 6/1/26 11:46 AM, Dmitry Baryshkov wrote:
>>> The SM8350 HDK has onboard WiFi/BT chip, WCN6851. It is an earlier
>>> version of well-known WCN6855 WiFI/BT SoC. Describe the PMU, BT and WiFI
>>> parts of the device.
>>
>> [...]
>>
>>> +	wcn6855-pmu {
>>> +		compatible = "qcom,wcn6851-pmu", "qcom,wcn6855-pmu";
>>> +
>>> +		pinctrl-0 = <&bt_en>, <&wlan_en>, <&swctrl>;
>>> +		pinctrl-names = "default";
>>> +
>>> +		wlan-enable-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
>>> +		bt-enable-gpios = <&tlmm 65 GPIO_ACTIVE_HIGH>;
>>> +		swctrl-gpios = <&tlmm 153 GPIO_ACTIVE_HIGH>;
>>> +
>>> +		vddio-supply = <&vreg_s10b_1p8>;
>>> +		vddaon-supply = <&vreg_s11b_0p95>;
>>> +		vddpmu-supply = <&vreg_s11b_0p95>;
>>> +		vddpmumx-supply = <&vreg_s2e_0p85>;
>>> +		vddpmucx-supply = <&vreg_s11b_0p95>;
>>> +		vddrfa0p95-supply = <&vreg_s11b_0p95>;
>>> +		vddrfa1p3-supply = <&vreg_s12b_1p25>;
>>> +		vddrfa1p9-supply = <&vreg_s1c_1p86>;
>>> +		vddpcie1p3-supply = <&vreg_s12b_1p25>;
>>> +		vddpcie1p9-supply = <&vreg_s1c_1p86>;
>>
>> [...]
>>
>>> @@ -373,6 +437,13 @@ vreg_l7e_2p8: ldo7 {
>>>  			regulator-name = "vreg_l7e_2p8";
>>>  			regulator-min-microvolt = <2800000>;
>>>  			regulator-max-microvolt = <2800000>;
>>> +
>>> +			/*
>>> +			 * This is used by the RF front-end for which there is
>>> +			 * no way to represent it in DT (yet?).
>>> +			 */
>>> +			regulator-boot-on;
>>> +			regulator-always-on;
>>
>> msm-5.4 maps this to bt-vdd-asd-supply (asd being a keyboard smash,
>> perhaps?) - what is its actual use?
> 
> WiFI/BT RF front-end, a separate chip containing amplifiers, couplers,
> etc.
> 
> It is a separate chip (or a module), it is not powered on by the PMU,
> etc.

Ah, that thing.. yeah I don't really know. Although it'd be a shame to
keep it powered forever, so maybe one day someone will revisit this

Konrad

