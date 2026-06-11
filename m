Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C434FCD8CB9
	for <ath11k@archiver.kernel.org>; Thu, 11 Jun 2026 06:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M5WsnsZ4MAvmLf7nKfATl47R6VK/KMexUssZggzEOs4=; b=inAdB+Zjqh5jwhWUiqHOUuS0Bq
	i7DwOOzHzsdF76YUNS0HiGmE/GsoaKzSVvlcEpgPp9+PB1O72T0o90lkz1LpYoC+K9iGHSrn1MCJa
	iC+rrB45WV8lrWWtbBRPWJLp7gt0mLovPDCJu12IZu7I4WHcKPaQwn3hf3MOArsB1b5cGSz5xYBGe
	lZy5utrq8cvaEwqzx3kFEjFfXYzzzFqyOM4sWGCLwWnL/ZJ6X4Fmb5L+7NZ7cCD+D5eXijnvFqtnc
	Qj/iybnEbPHsChdxqMistm9Qz3fv9C0vYIY9uEMTY7WJa44KIOUatTXHJJI8fqiotjGcLawDJtx7L
	J/5hIXGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXYfu-00000008n28-15Un;
	Thu, 11 Jun 2026 06:13:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXYfs-00000008n22-3KSb
	for ath11k@lists.infradead.org;
	Thu, 11 Jun 2026 06:13:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 41B8760208;
	Thu, 11 Jun 2026 06:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5408B1F00893;
	Thu, 11 Jun 2026 06:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781158436;
	bh=M5WsnsZ4MAvmLf7nKfATl47R6VK/KMexUssZggzEOs4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IzmudD+B7ZucXc0KDJnmsz9xM1FnRQBwm/PIXROQNKj6CCc+H+5SGsBTgwBzN7Wzu
	 k9177ZHMbKTJJPj+iXvlHum/tr130j9U5FJ2tdQdqpjH4fjvqcunNJ+a3vx03yeLiF
	 bOnwBjnGOrrRCEHODZsB98PWCyovwmc3Zi07b1YVQ6Ndggo8QnhXt2pu4kOLA17836
	 xgb0BlQcTQyI72kjrHIkuVSxKSSC5iDYlBefSbE5xmJpGLSy12blUQ3cMWt+TXAxq2
	 jTxIykVDfebvWpq/74rFGbk+CpQtJRDmyC4NmI2hxqZne9DkhurG6flVCUgew9n3/G
	 zkO5RXSENaZUg==
Date: Thu, 11 Jun 2026 08:13:42 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>, Jeff Johnson <jjohnson@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
	Rocky Liao <quic_rjliao@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-bluetooth@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: sm8350: modernize PCIe entries
Message-ID: <3qq4afo425imn25yb74ag62vpd5lhil4ctjbmknd3yrsvq3tw6@3hq23lknpm23>
References: <20260608-sm8350-wifi-v2-0-efb68f1ff04c@oss.qualcomm.com>
 <20260608-sm8350-wifi-v2-6-efb68f1ff04c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260608-sm8350-wifi-v2-6-efb68f1ff04c@oss.qualcomm.com>
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

On Mon, Jun 08, 2026 at 09:59:24AM +0300, Dmitry Baryshkov wrote:
> The recent suggestion is to have PERST# / WAKE pins and PHYs in the PCIe
> port rather than RC device. The kernel recently started warning about
> the older style of DT. Modernize DT for SM8350 platform by moving the
> entries under the root port device node.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 18 +++++++++++-------
>  arch/arm64/boot/dts/qcom/sm8350.dtsi    | 12 ++++--------
>  2 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> index 5f975d009465..4973a3eb11b5 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> @@ -493,12 +493,14 @@ &pcie0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pcie0_default_state>;
>  
> -	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
> -	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
> -
>  	status = "okay";
>  };
>  
> +&pcie0_port0 {
> +	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
> +};
> +
>  &pcie0_phy {
>  	vdda-phy-supply = <&vreg_l5b_0p88>;
>  	vdda-pll-supply = <&vreg_l6b_1p2>;
> @@ -507,15 +509,17 @@ &pcie0_phy {
>  };
>  
>  &pcie1 {
> -	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
> -	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
> -
> -	pinctrl-names = "default";
>  	pinctrl-0 = <&pcie1_default_state>;
> +	pinctrl-names = "default";
>  
>  	status = "okay";
>  };
>  
> +&pcie1_port0 {
> +	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
> +};
> +
>  &pcie1_phy {
>  	status = "okay";
>  	vdda-phy-supply = <&vreg_l5b_0p88>;
> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> index eb2a795d8edb..136daa444865 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -1583,12 +1583,9 @@ pcie0: pcie@1c00000 {
>  
>  			power-domains = <&gcc PCIE_0_GDSC>;
>  
> -			phys = <&pcie0_phy>;
> -			phy-names = "pciephy";
> -
>  			status = "disabled";
>  
> -			pcie@0 {
> +			pcie0_port0: pcie@0 {
>  				device_type = "pci";
>  				reg = <0x0 0x0 0x0 0x0 0x0>;
>  				bus-range = <0x01 0xff>;
> @@ -1596,6 +1593,7 @@ pcie@0 {
>  				#address-cells = <3>;
>  				#size-cells = <2>;
>  				ranges;
> +				phys = <&pcie0_phy>;
>  			};
>  		};
>  
> @@ -1692,12 +1690,9 @@ pcie1: pcie@1c08000 {
>  
>  			power-domains = <&gcc PCIE_1_GDSC>;
>  
> -			phys = <&pcie1_phy>;
> -			phy-names = "pciephy";
> -
>  			status = "disabled";
>  
> -			pcie@0 {
> +			pcie1_port0: pcie@0 {
>  				device_type = "pci";
>  				reg = <0x0 0x0 0x0 0x0 0x0>;
>  				bus-range = <0x01 0xff>;
> @@ -1705,6 +1700,7 @@ pcie@0 {
>  				#address-cells = <3>;
>  				#size-cells = <2>;
>  				ranges;
> +				phys = <&pcie1_phy>;
>  			};
>  		};
>  
> 
> -- 
> 2.47.3
> 

-- 
மணிவண்ணன் சதாசிவம்

