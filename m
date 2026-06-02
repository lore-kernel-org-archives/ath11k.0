Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E60FCD6E4A
	for <ath11k@archiver.kernel.org>; Tue,  2 Jun 2026 07:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y+nB6IjclCObNAHhbLPlcvSO9M8DxxTvdwCzmJ5QJZg=; b=hO2UKveR2MPk+qjMwUoAdWNpCU
	y335l7Ey6TmnFGMszcCMPNVJ63dFTUNRYHZA2A8IaKt92qzxJZOe9vSP83+IA1+dS9meYtBbjURHz
	SKYzFNnplOZTecaP8NuoZb5LfAl3rk0oRVwPgsU5mAqSd5aqF3cAhJCwYcvuS+oIO7TvWiGLwiAxN
	kIQ4Csl8juN4eDlyZpGbbkiuL8cVjvTZb1FuTjMER+zdQLcEWQgkqppyPuqKtPMusG3tn1hxP1enl
	/xgvg1npP34lLm1WedbsdWCCnuthIZZL2HXWqMaDMMojhsm9FuQSDD4qIFRlXVGFO5Ed7tHQPEk+9
	u5r3M0MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUK1P-0000000CWJn-0Xlw;
	Tue, 02 Jun 2026 07:58:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUK1M-0000000CWJS-28aD
	for ath11k@lists.infradead.org;
	Tue, 02 Jun 2026 07:58:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 101894442B
	for <ath11k@lists.infradead.org>; Tue,  2 Jun 2026 07:58:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBC531F00A05
	for <ath11k@lists.infradead.org>; Tue,  2 Jun 2026 07:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780387124;
	bh=Y+nB6IjclCObNAHhbLPlcvSO9M8DxxTvdwCzmJ5QJZg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=XR1cMO9XH2dQQ1a5oyTqYlnwZJSyzZlzzN5+ZM1bQ/evfwf/DSSGzrRzS0/dlTIMI
	 v763saQB4XMG0vVIgZhKVRHMeTbL/FqYo8tTy+IR32DEh13e+4IFSswqd+8KiMfxbs
	 SPMqid4GMRsrXBltONYi4ysuMLn0AVmkIOg0YYPP8mpFK6IzmOaYbwIWjItnFT/iOj
	 Q8Tz3CTQAG1pO5QezAkJPWXVLp4WVAAiotB/IVRtSdbi5/A5COBw8h7yAUhRVywJcG
	 PgUKyqirozeCDZrCo5VwROdcP9dVXj4cLGJwYPROvs+EbTQ8R4Yk/dkfqBv63njhqA
	 P+GfMOzgrrcAw==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39677245e15so24769151fa.1
        for <ath11k@lists.infradead.org>; Tue, 02 Jun 2026 00:58:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ80WN19zb65dDr4+lByHHyRLcoNFwYpp/Ufmf5E6/p6ohZDuT6lKBoY0Q7SqkB0APNsOnCqdlY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzJiKlB2EWNFvcnlfFfQqjSYTxd2I7gML+1DSejxuR2eUIrPLj6
	JX6ejAzyqcJKA0BoFcVjvvuUvNa/BIM4j7iHe0/FGSHiSmQC7q+nYXwESjBQ9HJbWa1+FK/xrhQ
	w2iQLmXq8UNba1PaleEkJoX+ddChJhbmK3ZPRaPWiXQ==
X-Received: by 2002:a2e:984d:0:b0:393:c6b5:993b with SMTP id
 38308e7fff4ca-39664f1631cmr31958381fa.24.1780387122616; Tue, 02 Jun 2026
 00:58:42 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Jun 2026 02:58:40 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Jun 2026 02:58:40 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260601-sm8350-wifi-v1-5-242917d88031@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com> <20260601-sm8350-wifi-v1-5-242917d88031@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 02:58:40 -0500
X-Gmail-Original-Message-ID: <CAMRc=MeDtwzBN2Hb7tZ9DLXRy9XjVnZpRCp4NZUNB8Ads6S_cw@mail.gmail.com>
X-Gm-Features: AVHnY4JkGrXXY2Io5k3AOPxVnoFnOn_nu0dA5WLYX-xPYi8QVC5JYyOfCFzeixs
Message-ID: <CAMRc=MeDtwzBN2Hb7tZ9DLXRy9XjVnZpRCp4NZUNB8Ads6S_cw@mail.gmail.com>
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sm8350: expand UART18 to 4 pins config
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, devicetree@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-bluetooth@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Qiang Yu <qiang.yu@oss.qualcomm.com>, 
	Jeff Johnson <jjohnson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_005844_634702_BE23FE9A 
X-CRM114-Status: GOOD (  15.01  )
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

On Mon, 1 Jun 2026 11:46:53 +0200, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> said:
> On SM8350 platforms the primary use of UART18 is a 4-pin UART (targeting
> Bluetooth or other similar applications). Add all 4 pins to the default
> pinctrl entry for the UART.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> index c830953156ec..eb2a795d8edb 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -3309,7 +3309,7 @@ qup_uart6_default: qup-uart6-default-state {
>  			};
>
>  			qup_uart18_default: qup-uart18-default-state {
> -				pins = "gpio68", "gpio69";
> +				pins = "gpio68", "gpio69", "gpio70", "gpio71";
>  				function = "qup18";
>  				drive-strength = <2>;
>  				bias-disable;
>
> --
> 2.47.3
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

