Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F03CF11F1
	for <ath11k@archiver.kernel.org>; Thu, 10 Oct 2024 13:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gbPdTZYOr9+jukOclQOWDxW0Bv1v/+wCabMme/SKc0A=; b=LlXCCIN+lLvGWXuKaGGw1YNrx6
	8VRUYAhdsXNPZFmMLhNCl3MYFYRzGiBashxDGHJ3f3NyQimr09uLLZnhpHHUi/Akxdza76Si6eIE+
	EGQf99D2Cj968yx9XTRac/kdcTy+8PMrbdacEGpzS8IbkANKkK8ZlHdAMZYudA/2LT/Zr59q88uMX
	QmyXLG5nMjzPCM7RmmNCHwDuKzuX9sBeFwo/p7S4YngTwANL3/L4ZUUcAybqwR4YZNO7p07fb1w4a
	gD9GHfUsCqcg0Xt7Y/UkafWAr5t6yENKOeLSccyrbZ6k1hvuz3UYu8Ywi7i2Uh+Frug+dvqT4a8LB
	L20ism3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sysuC-0000000CrBI-3cAm;
	Thu, 10 Oct 2024 13:08:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syseQ-0000000CnZ9-38i8
	for ath11k@bombadil.infradead.org;
	Thu, 10 Oct 2024 12:52:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gbPdTZYOr9+jukOclQOWDxW0Bv1v/+wCabMme/SKc0A=; b=pVlAj3W2YsjWAKe5I/KMU2JjEE
	Z54GAfCxrft0XzhApfCMOwufrA8fCQDLUB9p7+oRSeHv3dFS5u/1G5hsCg98WzRmNtYEFLpIKCdvM
	gkD8k5TDVr8AycjHLkMx0VkoIXU5rAhcVehzOiiDt636fwEaS7dyl6fUnhPcBALo8cU1v9spFheUd
	esbjWPp2c+0moNl48jlAiHaEip5W5UXioABCg7g8ElBlvypHPurFlQb4+r5PnBKbJJgFU+E8gyc1L
	l56T1Ietvgn4jBBct75zMpMxvYJVidzZVH4LKvarSnnfJ//ysrB2fXOXZ9qqvNGTxweHUO1IiNEO+
	tvXXtpUA==;
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syseN-00000005OC7-1S21
	for ath11k@lists.infradead.org;
	Thu, 10 Oct 2024 12:52:17 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2fabd2c4ac0so9419871fa.1
        for <ath11k@lists.infradead.org>; Thu, 10 Oct 2024 05:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728564729; x=1729169529; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gbPdTZYOr9+jukOclQOWDxW0Bv1v/+wCabMme/SKc0A=;
        b=UmdWlWUA4kAqOOpKgOK2fqT19WxLR/ftSfmNbJK8a+DW27BuM12MmicvZoO3WVZZ2U
         7+OdNY8NMC+K1IbEb+JlxrLo3hFvGcRjFK2IHNnLn0NnegMxHGhqJRQyGkhdwMBDaBJo
         gBul33RWuQM0538XraBTu1EY+WPYaNp8LOvZ00HjT4kWgmlauYha6Z+OhqcRAaDQs/UB
         AUh51ZjmG9c7g/kyb+rtxftpx7nEOp8sSCKXd5u5fM34ouc6CHR6fdJQ/93OxbNSlqjk
         vELJjY77dHUylp7R1+iPnuZ7zXBMJZC/m22GqU3+EV9nL/rQcgv0AXnEYziF/U14Q9UV
         mfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728564729; x=1729169529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gbPdTZYOr9+jukOclQOWDxW0Bv1v/+wCabMme/SKc0A=;
        b=rvnM6If1wn5F56LF4aMzN5EzoTi/YvYk0Uw7twL7fbLci91urzmeDXU/RdVXuQ8e+b
         91kLSyAeVP4YLoXY+MWSI8kJ8zVtVn9B/ML1pVCy8VElyEV3u2Y+B9jbs/IFPK89+MeW
         JnULXZeq+i2T752WB3i9n377Sv21EMBCcQ/5kxcGzYHxpKHC0py3gonAlc8VqTgPCGsg
         XITL/I6baFisRN8obp+Gp06y5peJnJMUBFSqXrqz4qn4ADWOqYhZKTfq9oPMUarwxHX7
         q/HDf5m95IHH+Ze9hg5RLz/gcZlNOSkCG7GFfhB0MCQhOndjrqp8JtuLj7zmwTSxcoBR
         3rsA==
X-Forwarded-Encrypted: i=1; AJvYcCVeHOSYDoCBVuFxKImYCyd6Br8RcyUdPwA6o4MRnpBQOUWCNs/gJxVU7LA6Vs4QQyExkMqYKLQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7XZyUETs6ULuyY7ftqDQsFfyfWe5QXF0iN7kWsr8zN3CeIdHt
	P77tDrs1MA5voJFTxmyIxTlhaeorYDHLQVPvATRhb3iPt3xhnS1wDL0L/l/kvaw=
X-Google-Smtp-Source: AGHT+IEEUTMX/pk5a4HSxBwIZWeBdAoCHQB/aKBVK7puY4U8VBsgKnZURDJmHJIdHOxBWR82hPQ6ug==
X-Received: by 2002:a05:651c:2126:b0:2fa:c9ad:3d36 with SMTP id 38308e7fff4ca-2fb1872bd83mr41533031fa.7.1728564729444;
        Thu, 10 Oct 2024 05:52:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb24707028sm1944381fa.80.2024.10.10.05.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 05:52:08 -0700 (PDT)
Date: Thu, 10 Oct 2024 15:52:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>, 
	Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	agross@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org, 
	konrad.dybcio@linaro.org, mchehab@kernel.org, quic_vgarodia@quicinc.com, 
	stanimir.k.varbanov@gmail.com, ath11k@lists.infradead.org
Subject: Re: [PATCH v3] arm64: dts: qcom: sa8775p-ride: add WiFi/BT nodes
Message-ID: <qf3wwrluqsytrlwclnp6limdnrsqs3odbk3cg67hyk6fad6zcf@yujf46ltsaad>
References: <20241009012738.2840558-1-quic_miaoqing@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009012738.2840558-1-quic_miaoqing@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_135215_625105_0DC247FC 
X-CRM114-Status: GOOD (  15.43  )
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

On Wed, Oct 09, 2024 at 09:27:38AM GMT, Miaoqing Pan wrote:
> Add a node for the PMU module of the WCN6855 present on the sa8775p-ride
> board. Assign its LDO power outputs to the existing WiFi/Bluetooth module.
> 
> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
> ---
> v2:
>   - fix wcn6855-pmu compatible to "qcom,wcn6855-pmu".
>   - relocate pcieport0 node in alphabetical order.
> v3:
>   - add 'qcom,ath11k-calibration-variant = "SA8775P"'.
> 
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 121 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi      |   2 +-
>  2 files changed, 122 insertions(+), 1 deletion(-)
> 

[...]

> @@ -702,6 +793,25 @@ &pcie1_phy {
>  	status = "okay";
>  };
>  
> +&pcieport0 {
> +	wifi@0 {
> +		compatible = "pci17cb,1101";
> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> +
> +		qcom,ath11k-calibration-variant = "SA8775P";

SA8775P what? Is it going to be the only device using SA8775P?  Please
take a look around how other calibration variants are defined.

Also please cc Kalle, Jeff and ath11k ML in future submissions

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
> +	};
> +};
> +
>  &remoteproc_adsp {
>  	firmware-name = "qcom/sa8775p/adsp.mbn";
>  	status = "okay";

-- 
With best wishes
Dmitry

