Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59104CF11FE
	for <ath11k@archiver.kernel.org>; Thu, 10 Oct 2024 15:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OOD5DwUqAaTqFWYMU+ma6xf+DD2ITHdyJRhnL7XRons=; b=lL/UxXmdHFkt73jYv5HV360D4y
	02km2Kga9ad5AHpr3iuu/DxLV29pDOv8uxbCHMYbIxQi8UkebegXh4lqZ3ET5MuxbYzGTtuRp1+JG
	wV6d/Xdsdq1vj0LUb5+Yx5M0V0/gfCs5Ngf9X875BlXZZxNlhR6ycyTdCsBnj/Wu0cyzW45WQAMpS
	0YIkVU4D8kFDXDnI3nCaOKBnqWhasdITOYt1ZwAoK3zsvnlPhwhHg2+Qpb4InVM/YsvmBNhbHD11+
	6IPmQkBQYEjfp3r0k570cHES21jvAHmQG+fG4IfmxholqQYOLey5399msK3SSUdHzREo9r78c/pOc
	SW03lg/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syvK5-0000000DNuf-39dg;
	Thu, 10 Oct 2024 15:43:29 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syv0b-0000000DJN4-1U7T
	for ath11k@lists.infradead.org;
	Thu, 10 Oct 2024 15:23:22 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2fadb636abaso10088871fa.3
        for <ath11k@lists.infradead.org>; Thu, 10 Oct 2024 08:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728573798; x=1729178598; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OOD5DwUqAaTqFWYMU+ma6xf+DD2ITHdyJRhnL7XRons=;
        b=X816AbrETipiPzeznuqJvUq/vO7Yj+uyafgxglLwBMTHHAFtQOlvx9F6cpZ1gK3qOf
         fKomAqkfdpF5pNtMqMeHYt/lZe4+frHOiPppCJlYHJqmxzWPgcDgYKEiMXnxpwzRgcGc
         DJAfkLJSAeo3VNsn43awhdlKPHyX3EJQjUa80rVIaTm/GO8/R49odgtYHUE97EdFW92w
         Uv/bZqy/o8S3MJ0TadPO0rohk5T7T+m2sXC9KXY0Hwnhgyk0T/ITatEsfDvIk0egDPLS
         p0JZVxlOpYXi1b5wuwwLtpYoZdX14tN/3q5vWm4rqxgy96qPN6Bnl/eyZZ+CEUx2RCR+
         f0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728573798; x=1729178598;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OOD5DwUqAaTqFWYMU+ma6xf+DD2ITHdyJRhnL7XRons=;
        b=gi6vXgFW4X381SQZkarG1ycNGFsLfF0xQ1VGQ6GYnF3CKvICFooCfZzUz4Bx0Gifvf
         06DMoAEeI791MEwtg96HFA5UcPDEMxm1a6H0zte7TSlXavP2OrKr0oR18F+ntu/Zi6DU
         6O6r2Dk9QsUK6zHLQLajNU5b5dsZlC8AlirdrgRhrfVlCPdTeSoQZpCZHlzZlBqF+7eE
         wpYhPHLXs5Od4bGJK3/O5bPrYtK0lujiQUBlmcotSIw3wiJWAVLym/NncvYrLPCEXSWl
         N1gLG9aM9gZitxTI0H+qP0q+c49s5KKHe+ruEK+d6cgLbfFmDb08IWFN+bqETJT3jQuj
         AwvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEXfzVvXX4BFbDQFz9HKsM/TZDMH9fo6/JC26B0+nRpflhgWd80ka22EOR7RV/mmA1aLS2EzI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzL9VornLDbSTwwrujnfhaHn+1xgkHcGzgTP8WnhmrJsM2roCPr
	1W74Np1IKGAGudlPyLicj41JwPWuB+FqHuOBeiGlXRyThAaeG9NKeCJfPIWQLd4=
X-Google-Smtp-Source: AGHT+IEa5hpavgqgZqGFwEHuAsxoJBx3cVv/1siI/qnLJ973fo+Si2V4A3zYjPXD22esXxAAbTEQUg==
X-Received: by 2002:a05:651c:1992:b0:2f5:2ba:2c99 with SMTP id 38308e7fff4ca-2fb187121d1mr44544341fa.9.1728573797764;
        Thu, 10 Oct 2024 08:23:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb2470646dsm2329581fa.85.2024.10.10.08.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 08:23:16 -0700 (PDT)
Date: Thu, 10 Oct 2024 18:23:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jianhua Lu <lujianhua000@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ath11k@lists.infradead.org
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add wifi
 node
Message-ID: <pbsooimr6l65hgyxezyp6ha3zqibgdlphmeb7vtghgy2wti66b@fsmptbss2zvi>
References: <20241010072243.10227-1-lujianhua000@gmail.com>
 <20241010072243.10227-2-lujianhua000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010072243.10227-2-lujianhua000@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_082321_427829_6ECD012B 
X-CRM114-Status: GOOD (  14.87  )
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

On Thu, Oct 10, 2024 at 03:22:42PM GMT, Jianhua Lu wrote:
> Add wifi node and this wifi module is connected to PCIe port.
> The following is qca6390 probe message:
>   ath11k_pci 0000:01:00.0: Adding to iommu group 12
>   ath11k_pci 0000:01:00.0: BAR 0 [mem 0x60400000-0x604fffff 64bit]: assigned
>   ath11k_pci 0000:01:00.0: enabling device (0000 -> 0002)
>   ath11k_pci 0000:01:00.0: MSI vectors: 32
>   ath11k_pci 0000:01:00.0: qca6390 hw2.0
>   ath11k_pci 0000:01:00.0: chip_id 0x0 chip_family 0xb board_id 0xff soc_id 0xffffffff
>   ath11k_pci 0000:01:00.0: fw_version 0x10121492 fw_build_timestamp 2021-11-04 11:23 fw_build_id
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
> changes in v3:
> 1. fix commit message typo (pice -> PCIe).
> 
> changes in v2:
> 1. add qcom,ath11k-calibration-variant property.
> 
>  .../dts/qcom/sm8250-xiaomi-elish-common.dtsi  | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
> index ebea283f56ea..7a55e271c3ac 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
> @@ -680,6 +680,25 @@ &pcie0_phy {
>  	status = "okay";
>  };
>  
> +&pcieport0 {
> +	wifi@0 {
> +		compatible = "pci17cb,1101";
> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> +
> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> +		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
> +		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
> +		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
> +
> +		qcom,ath11k-calibration-variant = "Xiaomi_Pad_5Pro";

Let's wait for Kalle's response.

Nevertheless,


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> +	};
> +};
> +
>  &pm8150_gpios {
>  	vol_up_n: vol-up-n-state {
>  		pins = "gpio6";
> -- 
> 2.46.1
> 

-- 
With best wishes
Dmitry

