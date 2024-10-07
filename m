Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E1DCFB443
	for <ath11k@archiver.kernel.org>; Mon,  7 Oct 2024 13:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wl8n/9TAPqgHKrSdwENGKR05xh35YHjoavZofuJF+rs=; b=XCwHEdX8k9GQ8patQZwJNqhf7O
	lJ1aXqQqI131sukACAAb/8s1Vp6ipsUTZ/V7xD5arVJcZOl7Zuqqld8kvZFizJuR8eHSE3ZdjHKma
	H5uIdoQxIc362VqU/z7gsO1dqQU5DLXPIJEpDcQF03PNMUsWlcjjT47FbUiG9tZOqqVqY92COMaXy
	RRltetxdV5P4Z4oSeqELrwbBBTAz1C9QY2AIIVrzmK+tMz8vB28sujsHWfEHEAFPymuSrWmoNe8ub
	2RorNYuKPru0m1m2eztKnDk296bs7QPNA8ogLNNGK5Z8KsxyAXWjQF7P6YxXpujoAAas8/esQVIhA
	iAx35epw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxnhX-00000002Urw-1GOT;
	Mon, 07 Oct 2024 13:23:03 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxnV5-00000002S7I-38pB
	for ath11k@lists.infradead.org;
	Mon, 07 Oct 2024 13:10:12 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2e09d9f2021so2994604a91.0
        for <ath11k@lists.infradead.org>; Mon, 07 Oct 2024 06:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728306610; x=1728911410; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wl8n/9TAPqgHKrSdwENGKR05xh35YHjoavZofuJF+rs=;
        b=iav+rHV2GgtZfxjFNGipDUz4vFbiV4KjaIA0rxXbeDCUsem9OOQbvDIrBm2l1+P077
         h3NXwumMMTFNeCFaY4aqmBFWkR3sjW8nV9/DSrfWGTbX2+XE/KkCo74LadtWBakkmoaP
         zhFp7h0FFCFoZclLsrreyv0mB6ReAq78lz23hFMdTSgzQJY5fDmFv2oGe8Mlk6+Vwdxz
         SHSB+Xs1gbM68KZwjXK2euix4wNcFuSwV79xLkWiVFAvdec59Hw6ZIp4lheWw9UGONoh
         FbQamiOWZW3lv4GFxIxpVxkxHiF/K5XhJcuZIyX0oR77gLH19ZmcBf9tRRCRNroyA5oA
         W20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728306610; x=1728911410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wl8n/9TAPqgHKrSdwENGKR05xh35YHjoavZofuJF+rs=;
        b=Rpnsz8QD9feO8BtXfVFbUv2WGHImwxrpdmrxTSrik1TLvek+kDM/kPiGQd0LnkBac4
         FxpYHEjDwulmNazvsHq9ptS4ZRxVIBju1BJ+gALaVWPSWliGh82WIn2d0q1JOaHl6MYZ
         LY7qzkUKejHyqikxocE0A2KhshR6+fHeszY7z9uhd0HzcvbrpvQYJUECNM3sHwP/EyKu
         M3aIIxscBdsMafOTj8BRj84d+bDDqRn3TelYot6XbBXvNUy7E26nDYwerfbpvchLdg2p
         KryIFvUnOGQhxdJhZ/a+VTxBltcr5htnGlpRkNE1UEM0vky/ZcDaU27zU/qmE/MYd0FM
         JMUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYVaAADd5pZlRhNynNnDS06sbbD4eQhnmpwmWbf8c+v3cbDTmBSHKztmo7Z2GbnKG+asDyti8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwQpzSGqHbzi33T80TsueJw0Eic73Hf7echCAhxlP4J75GX0tHz
	C5sBPK+7cHiit9wqRZ7KhEg1kfO97o48KLUkfP+OBv7dpLj3tjQ4
X-Google-Smtp-Source: AGHT+IH6dkdmoCABOb5rzM+ePQDA5F0ivfidowVx++O9LwE8IbPiZigqZNzfL+ryQGYC2Bfr1FfH2Q==
X-Received: by 2002:a17:90a:c393:b0:2d3:ba42:775c with SMTP id 98e67ed59e1d1-2e1e620eb83mr14850209a91.1.1728306610132;
        Mon, 07 Oct 2024 06:10:10 -0700 (PDT)
Received: from localhost.localdomain ([103.149.249.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e1e85c99c3sm7018643a91.23.2024.10.07.06.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 06:10:09 -0700 (PDT)
Date: Mon, 7 Oct 2024 21:10:27 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add wifi
 node
Message-ID: <ZwPdw-O-LnohVV0Z@localhost.localdomain>
References: <20241007130251.125022-1-lujianhua000@gmail.com>
 <20241007130251.125022-2-lujianhua000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007130251.125022-2-lujianhua000@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_061011_811114_AA2833C3 
X-CRM114-Status: GOOD (  15.19  )
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

sorry, I forget to CC Dmitry Baryshkov.

On Mon, Oct 07, 2024 at 09:02:50PM +0800, Jianhua Lu wrote:
> Add wifi node and this wifi module is connected to pice port.
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
> changes in v2:
> 1. add ath11k-calibration-variant property.
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
> +	};
> +};
> +
>  &pm8150_gpios {
>  	vol_up_n: vol-up-n-state {
>  		pins = "gpio6";
> -- 
> 2.46.0
> 

