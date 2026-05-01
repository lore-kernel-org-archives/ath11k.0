Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB90CD3424
	for <ath11k@archiver.kernel.org>; Fri,  1 May 2026 09:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0bfYkGp++VX2XGf/8Df8kQnMjnWB1zask25dl4NteK4=; b=TB0LRS9VxRm5+SUeWB3FLaXZTm
	DbqFlXFYfKOco7rPt7Lcchff6ivJGnXsCnAdxSO7TmZx/x63fz4a6+VX1HjtePYsLRor4NThSac7M
	S/QbV/VgzhwKuQjjKBbgf63Am7QbwvrGgdRQk+Y1NsNR7wj0DsiK4KJcowIG1RiAWAyELMqO7a8eY
	po060pCbsH5TG7d/A6gvpomm2cLNr7BUXVZNd4M8DZGyGJwKcYFLhmE1t01nkVDU8gG9oaRzztIfY
	J0u3SnZoDYAV4UeRFTPhCBA0BWQOhB8VNmf37vmg3cpCYLcuvpqq6bizimLLkXR+4AaDLRgxePV2I
	0OlZ0r7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIk3L-00000006Xfa-3E7F;
	Fri, 01 May 2026 09:20:55 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIk3J-00000006XfE-0Lu8
	for ath11k@lists.infradead.org;
	Fri, 01 May 2026 09:20:54 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-43d73352cf2so1589788f8f.1
        for <ath11k@lists.infradead.org>; Fri, 01 May 2026 02:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777627250; x=1778232050; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0bfYkGp++VX2XGf/8Df8kQnMjnWB1zask25dl4NteK4=;
        b=wwzHT1cpvMEcBMkw40987NzoONGWlq3o/jIxgPd8KgtW03oU5FSkFwgqbHV/MpgD+l
         YQhMbmF6Qh1aa+ZRqr9LeXbOkJ3uHgQLyRMfaIyyhsIlUMbmQ9sUBSWeK6o+eBF4kFN1
         2aXhKTirA2bExsD5EL2+W1NXdu9+VCosiaoZOg7mHODfKRyTbOF8+V90XrMjHsXomz2f
         UnveEkNbAjDV384b/lmeK4nzCUiT9TdKLpaqeGD1XoD3l1iLd2OcfvxTYsxWneydXDp8
         /gGGEY/YXFHMrC9GSzF07NeJmksdGdXCzFRl9oYgU5BSnnSpGmqoYYTK48LUtetSvDMi
         1jsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777627250; x=1778232050;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0bfYkGp++VX2XGf/8Df8kQnMjnWB1zask25dl4NteK4=;
        b=jkCr5IDfplmvhxo1PZkP5KXRBZk1NfVllnBsAt5eC7GtYWN0r8AkMJd4ubmjxpYvwj
         7weFhArs6fxsf+P3tMTbZcG8nrMnr/JvYbAeF0oUz04plzkckuP9e8O6IT9JfkZZCf1n
         JCw234X5b/Q4Kca94mWAQCqJN+LcVi4wwcpATYxvAiBcMEvYVNOdV9v7cuJQUK9txZ+z
         wurwZYYAE4kRCpqPmO9OonTAQwPq3gShvSaV8BT87Q0tGhHSpgzerBqLHGwnIpSoJK65
         KiJc26qRKi3Af+T6xl+PaS3jDOPNpgAvy06yZRMPXc0ETPfTBamEjqYEjY67serwGHQf
         e28w==
X-Forwarded-Encrypted: i=1; AFNElJ9JAKwfLaU8xrVb6tFTyQRbZscWq84OR6MRCyV+rr7I/CiDrPiXSg2lK1xLH/LS+eLQawkZcjY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyzW0AeACZvZpdCuuumDGDiarmrXUtNEZteUXQUZW7elgtxWb7m
	0XAg4q/hrSI8hNpPPTe0FukvxuZp4WoYMLljvZ2FRDLkrEH8bSHsDI8M8hZZQqRANnA=
X-Gm-Gg: AeBDiesL8oah/4HW2CAATBVIqnV1cjrXPysFcr/V5eYCrY4hKbosjvn9GaonXR358WL
	S5u9v5phQRi231j/NR/ysde1GqNJrlhVrp9AvVEY1t9RGCAB/kxCULKz9y6S0XHAEeDr09LQbOJ
	C1ke60qNHpFLOZa6ifUR1IqNrXTjz3qOEJOCzU4cW4dD0dDfqLpACjsURMYPD9SXUP9IXd7YV/f
	lTG9ljLy7P21MHPZ5A/UBjbxM42+tU7wzgazs6dYI7ZycgZ1HBh9e0r9cIfUpBSsCNkkkEcux9p
	mxUdcMckr6HmUdzJeicdIHoy4lD5NcHr3GK/YcSkDX96T1QxfVkVntZjYlHQqBne0odTOE2A5du
	8XzFWF1kZUl+r+vJ182I+c9++E4X7buRCuHC5d05BjQ2DVoyZbMyTXTLmyR7lTSlwxXBrxkkWRm
	d8ySiZargoDigqwcY6v/xq+LJgjk21/pHbtiAbotgzwnMIURH22aTMC/h9HqeQvZsB3zS6q3buQ
	MlgoYtqJg==
X-Received: by 2002:a05:6000:240c:b0:43f:e43a:f4a6 with SMTP id ffacd0b85a97d-44a857c10e8mr3084632f8f.6.1777627250496;
        Fri, 01 May 2026 02:20:50 -0700 (PDT)
Received: from localhost (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a98b768fdsm3583191f8f.33.2026.05.01.02.20.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 02:20:49 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 May 2026 11:20:47 +0200
Message-Id: <DI789NOBWJHK.1V3SFQLCFLS4P@fairphone.com>
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
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Jeff Johnson" <jeff.johnson@oss.qualcomm.com>,
 "Baochen Qiang" <baochen.qiang@oss.qualcomm.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
 <20260403-milos-fp6-bt-wifi-v2-7-393322b27c5f@fairphone.com>
 <4fbs4arx6sez6fffy75ctmzecfvitr6aocau3cczlr2ps2ptld@v7wpa2irsihl>
 <2514523f-a43f-4470-a69b-3d5175d10385@oss.qualcomm.com>
In-Reply-To: <2514523f-a43f-4470-a69b-3d5175d10385@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_022053_142410_37CDE4C2 
X-CRM114-Status: GOOD (  14.36  )
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

Hi Konrad,

On Tue Apr 7, 2026 at 3:16 PM CEST, Konrad Dybcio wrote:
> On 4/3/26 9:35 PM, Dmitry Baryshkov wrote:
>> On Fri, Apr 03, 2026 at 03:52:53PM +0200, Luca Weiss wrote:
>>> Configure and enable the WiFi node, and add the required pinctrl to
>>> provide the sleep clock from the PMK8550 (PMK7635) to WCN6755.
>>>
>>> Thanks to Alexander Koskovich for helping with the bringup, adding
>>> the missing pinctrl to make the WPSS stop crashing.
>>>
>>> Link: https://lore.kernel.org/linux-arm-msm/DBF7OWAWQ94M.FSCP4DPF8ZJY@f=
airphone.com/
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 19 ++++++++++++++++=
++-
>>>  1 file changed, 18 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/ar=
m64/boot/dts/qcom/milos-fairphone-fp6.dts
>>> index db72418b7195..d8ac495ca7c8 100644
>>> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>> @@ -242,7 +242,7 @@ wcn6750-pmu {
>>> =20
>>>  		clocks =3D <&rpmhcc RPMH_RF_CLK1>;
>>> =20
>>> -		pinctrl-0 =3D <&bluetooth_enable_default>;
>>> +		pinctrl-0 =3D <&bluetooth_enable_default>, <&pmk8550_sleep_clk_defau=
lt>;
>>>  		pinctrl-names =3D "default";
>>> =20
>>>  		regulators {
>>> @@ -766,6 +766,17 @@ &pmiv0104_eusb2_repeater {
>>>  	qcom,tune-usb2-preem =3D /bits/ 8 <0x6>;
>>>  };
>>> =20
>>> +&pmk8550_gpios {
>>> +	pmk8550_sleep_clk_default: sleep-clk-default-state {
>>> +		pins =3D "gpio5";
>>> +		function =3D "func1";
>>> +		input-disable;
>>> +		output-enable;
>>=20
>> Hmm, if it's a sleep_clk, should it not be handled via the power
>> sequencer?
>
> If you mean that it may be needed to toggle it with specific timings,
> possibly..  seems that WCN6855 has a "xo-clk" GPIO defined. I requested
> access to some docs that I think should have the answer, hopefully should
> get it soon.

Did you manage to get anything there yet?

Regards
Luca

> Or maybe +Jeff/Baochen could answer faster?
>
> Konrad


