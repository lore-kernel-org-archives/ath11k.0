Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F63CD3430
	for <ath11k@archiver.kernel.org>; Mon,  4 May 2026 13:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cu51mh4jahJU18+vQyHL65Jaia7lK69Ad8pkf9BheHQ=; b=fqiQWMuB4DPLett/qICW/K35x7
	IAbAOC3jnvd8Z8zbKGVlJ6K1S3OwWGN691IQcwksHkhG7tf4vGurtlU+2Zl3PKn76mjmPbTMdOF6P
	LtFKinozJ1fa80YSn+8gawBAzmnpS8dbqLgbRn3e58sjjRsRTUsNIBJr8IwutlV62WzzniRDALJ09
	jZa7xlQ/xH3zbgrhq8ZBrdOAINVS7+HXAb4pbEO14XRTCVi+/U7b5ZAGnINEHiizCUufuu3l2bOnV
	Lj/lJjPKSHXD3KOUMz1cklwhdFNwWtngaXFAcpKywyteXPBbUCRDm28Jjho0pCAmqmyMv/Lk85DRJ
	Lxd75ilA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJtEe-0000000DIZX-1I5o;
	Mon, 04 May 2026 13:21:20 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJtEb-0000000DIYg-45FU
	for ath11k@lists.infradead.org;
	Mon, 04 May 2026 13:21:19 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-67bb5ad91bfso5181114a12.0
        for <ath11k@lists.infradead.org>; Mon, 04 May 2026 06:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777900875; x=1778505675; darn=lists.infradead.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cu51mh4jahJU18+vQyHL65Jaia7lK69Ad8pkf9BheHQ=;
        b=4b4P6ah/Pb5tMI91fNghKRjKlw6W29qRnE8Oi3H5o3WXph0LL3jsnEaP/UwgyMWK63
         JiSy/hWRJmae8BCH8/EVO5wlJVYYMMkegNtK6yYbb9iNSDuXfZs7SGhDqvkaftRuM68p
         Wd7OfhuYoOSXnCSQ6ogv0Np3hNzQvgqft7dcVJl8qJr/jKbDNGSxEg5DBUPLAdfXocFm
         3seD2NMxjUIV39SSNyu1tM0rp1XKzoz2Xmw0YidBWp1c01POQbyvNrLNCsXpnhnVqf3G
         76V4cCVOESn6sHW1wSYy9ANNtEJbYCJwfQ/v3FSwil/o0iTP3xYtoS6wUqVQSAd7QpXZ
         5YuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777900875; x=1778505675;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cu51mh4jahJU18+vQyHL65Jaia7lK69Ad8pkf9BheHQ=;
        b=LvnlxkZKkWalLB4ZiX6CRvYNwt31nNVSU9Ezd7SbgYdQzQyTmgkGKF5JvGuvx9DkiR
         ipa5TreoWzTf46e/1/COrGMarWg6nZeTFu00JCb6vmf8vyL3Sj81pqhxCmp8aloHI+Fc
         y2xe5NDxY54ljcOV1pnrYQ4EUjRNGCz8iEvqBBznsL35G3gVnWzdmVk8XOGwBVK5ThV0
         M2LtWZCvqvKOVbSd45E+Cj5UzeS/ZwLQvG85sYTd9pVGyiRUTFUDQ4kIAkCIb3WKNVm3
         kGrWmFKaL8f6ghcPXcpnu1dnyeAXZerBB6762qZySkVvgKnQFfx69q9tbSHlUJv76oz5
         9B4g==
X-Forwarded-Encrypted: i=1; AFNElJ+PfiiFE9UhCQa3XRd5Mven5a0gRyKVB+bRspTGXyxWZbWNxv1SuoCc8r3Ia1H2dndN97ECyfM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxmqv+z5S6Zyd1a+Zg4784NCZ5lMgonTh4X0cIZOKJw0zBeADLr
	PfEqDUkp3KPBkjRaK0gAyuU3eoE+6rCk96E/duy1OsewIngAlMFbEOFHrQSpjt0dN74=
X-Gm-Gg: AeBDies6An6GhbFNG+NG6n44tnIuYbGEGgdCCX2fu+/7vaiqjQIA+oznAEUEJi3cNY1
	NMJ6859UsRd4mSETvmxe6B4wIUSknXflF0hn1LrxfuMYembBvTDpInDSm8655nELU7Bzbr7zGi9
	YJ/FsIgDQ4EqmW6dtXFfzDClOlsMhqQBiLVzK7vn200eq8R1Qr9RiBFSfwPXWK6gtDqSYRd4G1/
	lmzK9Q6XBbH11X5GC8zX7j51p2zMzrSwfwCxU3lTy3tG3PDrGvdcpYA7aZeOpweXH9sSTooZk9O
	DpuzTEJ9FGUGFtQmHaqb+G/HqvWR8rsvCpNUPr7lugvnAdnEyE6K9FIFNgrUeaXNs+JcJzKc2DE
	OYo4+hPhSenbmcFe41Cz5DT7fSvnkN3P8E9xHkooRFxUCIkx3XQzlxlwkTnWqkqUqCzGKF8foSb
	ZJtjbMv9rmvJe0pYEzUQQkwShu3Hrt33X6um+kBhuy9BpUJDtxiklMgsBNB0azfz+JboJEW5VVy
	v/rrcg=
X-Received: by 2002:a05:6402:2b99:b0:671:eac2:d328 with SMTP id 4fb4d7f45d1cf-67c1992a1c7mr4428495a12.10.1777900875106;
        Mon, 04 May 2026 06:21:15 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b85e28ef8sm3367092a12.2.2026.05.04.06.21.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 06:21:14 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 May 2026 15:21:11 +0200
Message-Id: <DI9X9D3TTIRE.1CGHQI2LEZ1UL@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Jeff Johnson"
 <jeff.johnson@oss.qualcomm.com>, "Baochen Qiang"
 <baochen.qiang@oss.qualcomm.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Alexander Koskovich" <AKoskovich@pm.me>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Bartosz
 Golaszewski" <brgl@kernel.org>, "Marcel Holtmann" <marcel@holtmann.org>,
 "Luiz Augusto von Dentz" <luiz.dentz@gmail.com>, "Balakrishna Godavarthi"
 <quic_bgodavar@quicinc.com>, "Rocky Liao" <quic_rjliao@quicinc.com>,
 "Johannes Berg" <johannes@sipsolutions.net>, "Jeff Johnson"
 <jjohnson@kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-bluetooth@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
 <ath11k@lists.infradead.org>
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: milos-fairphone-fp6: Enable
 WiFi
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
 <20260403-milos-fp6-bt-wifi-v2-7-393322b27c5f@fairphone.com>
 <4fbs4arx6sez6fffy75ctmzecfvitr6aocau3cczlr2ps2ptld@v7wpa2irsihl>
 <2514523f-a43f-4470-a69b-3d5175d10385@oss.qualcomm.com>
 <DI789NOBWJHK.1V3SFQLCFLS4P@fairphone.com>
 <870d16bb-b426-4285-a299-deb09ae90243@oss.qualcomm.com>
In-Reply-To: <870d16bb-b426-4285-a299-deb09ae90243@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_062118_112341_4FFF10ED 
X-CRM114-Status: GOOD (  14.94  )
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

On Mon May 4, 2026 at 3:10 PM CEST, Konrad Dybcio wrote:
> On 5/1/26 11:20 AM, Luca Weiss wrote:
>> Hi Konrad,
>>=20
>> On Tue Apr 7, 2026 at 3:16 PM CEST, Konrad Dybcio wrote:
>>> On 4/3/26 9:35 PM, Dmitry Baryshkov wrote:
>>>> On Fri, Apr 03, 2026 at 03:52:53PM +0200, Luca Weiss wrote:
>>>>> Configure and enable the WiFi node, and add the required pinctrl to
>>>>> provide the sleep clock from the PMK8550 (PMK7635) to WCN6755.
>>>>>
>>>>> Thanks to Alexander Koskovich for helping with the bringup, adding
>>>>> the missing pinctrl to make the WPSS stop crashing.
>>>>>
>>>>> Link: https://lore.kernel.org/linux-arm-msm/DBF7OWAWQ94M.FSCP4DPF8ZJY=
@fairphone.com/
>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>>> ---
>>>>>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 19 ++++++++++++++=
++++-
>>>>>  1 file changed, 18 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/=
arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>>>> index db72418b7195..d8ac495ca7c8 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>>>> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>>>> @@ -242,7 +242,7 @@ wcn6750-pmu {
>>>>> =20
>>>>>  		clocks =3D <&rpmhcc RPMH_RF_CLK1>;
>>>>> =20
>>>>> -		pinctrl-0 =3D <&bluetooth_enable_default>;
>>>>> +		pinctrl-0 =3D <&bluetooth_enable_default>, <&pmk8550_sleep_clk_def=
ault>;
>>>>>  		pinctrl-names =3D "default";
>>>>> =20
>>>>>  		regulators {
>>>>> @@ -766,6 +766,17 @@ &pmiv0104_eusb2_repeater {
>>>>>  	qcom,tune-usb2-preem =3D /bits/ 8 <0x6>;
>>>>>  };
>>>>> =20
>>>>> +&pmk8550_gpios {
>>>>> +	pmk8550_sleep_clk_default: sleep-clk-default-state {
>>>>> +		pins =3D "gpio5";
>>>>> +		function =3D "func1";
>>>>> +		input-disable;
>>>>> +		output-enable;
>>>>
>>>> Hmm, if it's a sleep_clk, should it not be handled via the power
>>>> sequencer?
>>>
>>> If you mean that it may be needed to toggle it with specific timings,
>>> possibly..  seems that WCN6855 has a "xo-clk" GPIO defined. I requested
>>> access to some docs that I think should have the answer, hopefully shou=
ld
>>> get it soon.
>>=20
>> Did you manage to get anything there yet?
>
> Yeah, sorry, it got lost in the sea of emails..
>
> The PDF talks about the electrical requirements of the clock signal and
> the section titled "Power-up sequence timing" doesn't mention it at all,
> so my assumption would be "OK so long as it's ticking before you power
> up the WCN"

Thanks for checking!

Is this an R-b then?

Regards
Luca

