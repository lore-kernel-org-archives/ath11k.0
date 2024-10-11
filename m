Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D313D0D791
	for <ath11k@archiver.kernel.org>; Fri, 11 Oct 2024 13:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r7SEOWo2TItqUv0ycD+sGD/yn3hMJOF7PM7SskMyyO4=; b=NUvLJ2aZjSoikrf2AXeftQgs++
	4gyPLptQ/VLICBgDgKoMQzhnbkvTOWr0EIeTrgFHgCOee7XrnptGyuiw5jKJQnVkXWaGgaqKuUHb5
	5hCLeCsnzh5ghAm8OhK7V/zv5cGCaEgEWNGUrclWia9LJwjHox/g+cTNX9omzZ04qfWct4f+Sol9e
	sV/RM0/Fi2pBJCIIMVqeXM9DW5Xpr7aeAmp/byprP/OybIlWJ3C20m+bmn+xWRR897bAJ6CEcV8DE
	D9ADzTvGaIze/8rr2b83racTKdl3zrtTyzYlCeIDYK00KT9Lo0imBPQLGPy9wAP57Bi6KM/6r7rBZ
	cmyTk02w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szFzh-0000000GVeR-0w06;
	Fri, 11 Oct 2024 13:47:49 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szFyH-0000000GVOA-2v4X
	for ath11k@lists.infradead.org;
	Fri, 11 Oct 2024 13:46:23 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so20212861fa.3
        for <ath11k@lists.infradead.org>; Fri, 11 Oct 2024 06:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728654379; x=1729259179; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r7SEOWo2TItqUv0ycD+sGD/yn3hMJOF7PM7SskMyyO4=;
        b=W7Sy4ZDgipdR2zmLBM3V7e4nHcT6gEgIc0n9C15mVQJsS4ir95bed2qzi3vIerTVsU
         tPZ6m9gEmVSAghbg1b33FA/xNxk3FcV513z3CmZXbEOgGXQKclxMthhWKmo4GS9ynB3H
         zb4HhGeaFS42p/e5zj1bOC02DTlFPT7gBhqp90hV8diqtjht3fw7P/JrOUcJCVDLkmB3
         Nuin7VnxT5f35x7WAIDVfhAn5SsFZwNunaHEBiqCVg5UNB6eHJe88gYhlXDxv8sLSJJ2
         GleqqbrMK649E/pEa56K0NtjT8cuqPvdCVk/Nb5h01L87zJj1ZQabyg1RPQ9CpuiemD1
         UPfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728654379; x=1729259179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7SEOWo2TItqUv0ycD+sGD/yn3hMJOF7PM7SskMyyO4=;
        b=AW8ov/zrBKRuH8fmuzry5fnKmi40f0D9zDadRSq9MOM4iY6rqCs/yZaC8d2Z4Eg711
         4TNo5CGqUkZDkp0M8H6P+6gVdpEApB7GG+lU6f7fmjmY9BFhCOsaVkFUCVGcjMsUGcNH
         p1b4NFqY+fCjrpaSj7+MTSlQOtK2KDLJwvlCgkubW30ecl199OKebE9xfoBA+KAdGL4L
         qcL3DtaXBSN5IiykEV8jRdhBOwWOxIZoQLgxpIgmSVdXq02twCE6auhBSRWtwAJrQJ7k
         8j8noobnRsnWg2lVAC0E+cmMRjnFXDqDy1oewCB4bMQE/SMpfcepGRj5jxgiOm+Y4/9D
         IoXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRomBVLTCL4Zl3qjOU97qXdovQ2zK+vL1tLjYxPH6nj6sDpkRRg0686zjcaeVrlyJDLB992Bs=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywf5tLTIjMHrBdMh3Rofgt9fhp6o0xz4IlQe7orE8a/pvMz6ZiS
	9nvtnmsH+bnc+32hJM5mpCRiHz3GuNRsJsiVihdLMj48xLM8Oh3p0nfmGg82ggU=
X-Google-Smtp-Source: AGHT+IG0BjU/TLr2o6JJJ2hysZ+nJgvyqDtiTBfydl6C/4djbRMDY5pNlzeGH3tNFx9ay8FMRX171w==
X-Received: by 2002:a05:651c:512:b0:2fa:c5e5:629d with SMTP id 38308e7fff4ca-2fb326f7418mr16195141fa.3.1728654379037;
        Fri, 11 Oct 2024 06:46:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb2474bdbbsm4938051fa.103.2024.10.11.06.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:46:17 -0700 (PDT)
Date: Fri, 11 Oct 2024 16:46:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Jianhua Lu <lujianhua000@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ath11k@lists.infradead.org
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add wifi
 node
Message-ID: <p4j7i6fbr7htsh44vumlsziuhbl4phqok4zxnubdvyrjo2cllt@cez4iynfjayt>
References: <20241010072243.10227-1-lujianhua000@gmail.com>
 <20241010072243.10227-2-lujianhua000@gmail.com>
 <pbsooimr6l65hgyxezyp6ha3zqibgdlphmeb7vtghgy2wti66b@fsmptbss2zvi>
 <87h69i7v8c.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h69i7v8c.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_064621_767631_C69BFD32 
X-CRM114-Status: GOOD (  11.75  )
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

On Fri, Oct 11, 2024 at 02:08:19PM +0300, Kalle Valo wrote:
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
> 
> >> --- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
> >> @@ -680,6 +680,25 @@ &pcie0_phy {
> >>  	status = "okay";
> >>  };
> >>  
> >> +&pcieport0 {
> >> +	wifi@0 {
> >> +		compatible = "pci17cb,1101";
> >> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> >> +
> >> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> >> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
> >> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> >> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> >> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> >> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> >> +		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
> >> +		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
> >> +		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
> >> +
> >> +		qcom,ath11k-calibration-variant = "Xiaomi_Pad_5Pro";
> >
> > Let's wait for Kalle's response.
> 
> Sorry, I don't know what you refer to here. I have been extremly busy
> with MLO patches so drowning with mail right now :/

Just an ack for the calibration variant name. Jianhua has also sent the
BDF file, [1]

[1] https://lore.kernel.org/ath11k/ZwR1hu-B0bGe4zG7@localhost.localdomain/

-- 
With best wishes
Dmitry

