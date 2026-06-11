Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7E0CD8CB9
	for <ath11k@archiver.kernel.org>; Thu, 11 Jun 2026 06:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DxYpf2U0C53sMLriRY3htfPkTiuUmNi3d2UuSNLLb1k=; b=E7rBqVJqy0UilUPggA+uTMcajV
	iaNXqA5VYGAtMd3ToTzfB+OWnROo2NINpqNwhb71K3npfmip7KheP6ujCHZJPaf/u9Z6S98S0jQ/f
	wB1OW3lOkCcqiPl2zIgkFS5LSawVYFryUkDv8dk91R2h+Y/iZhnOWTMiyFIT1I3zUqrjuGQ34yn0t
	RMmN2unh19Ofaerm7cV6K4U8L4bSzlNcZTHkQppcHsHqcsUFpv2LaYck8zJ9OYgD2PrYK+O/Ak2ec
	vb5hndVwooko6yq9vGPccrN8X88P/5NAUCjBezek1Vc4UybvRRD9lEHKqw52mqlszO17yoDdggHin
	zBjXOd6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXYeh-00000008mry-09UT;
	Thu, 11 Jun 2026 06:12:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXYef-00000008mrl-2tK5
	for ath11k@lists.infradead.org;
	Thu, 11 Jun 2026 06:12:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ACF0D60208;
	Thu, 11 Jun 2026 06:12:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27C451F00893;
	Thu, 11 Jun 2026 06:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781158360;
	bh=DxYpf2U0C53sMLriRY3htfPkTiuUmNi3d2UuSNLLb1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DyQF+hs/aG2rKRYUzz85y5O3fU0Xse5+1w9iuDQQmnRQ+ehsgd9jJayZugQvqNZBC
	 IZ01El2IY07l9WqTKehUlYt+eq/3GzT8LRjdI2EZGQe8RLBr4FmWhR0ndQsH6m5vmi
	 a8A/TjwN67onTgt7GOU4Aj7GdJcxqZa6DJ6mLJT0yMQLCWBMvqKIJwjUud5LM0cCEB
	 g3WmOrfKDgGEsL3nbWKxelci3j5KEQQqGZ5MHuW7qERz8RU6ZjLrc8LKE0cOPYtcGZ
	 IeR4rF8FJXCidMidpVwr76lKev4yXLcggRbioAc8v8v7hH1+irYI8z8a0SETZ6fol9
	 LzXJd6ueiD3xQ==
Date: Thu, 11 Jun 2026 08:12:26 +0200
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
	linux-bluetooth@vger.kernel.org
Subject: Re: [PATCH v2 1/7] PCI: qcom: fix parsing of PERST# in the legacy
 case
Message-ID: <sqxjkxbw6k7dstj2wmcwwigjou3jpq3bk4xidkpupfdblocadc@rkts6nbun5ld>
References: <20260608-sm8350-wifi-v2-0-efb68f1ff04c@oss.qualcomm.com>
 <20260608-sm8350-wifi-v2-1-efb68f1ff04c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260608-sm8350-wifi-v2-1-efb68f1ff04c@oss.qualcomm.com>
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

On Mon, Jun 08, 2026 at 09:59:19AM +0300, Dmitry Baryshkov wrote:
> Commit deed8aec62dc ("PCI: qcom: Handle mixed PERST#/PHY DT
> configuration") fixed support for the "mixed" platforms which declare
> PERST# pin the RC node and the PHY in the RP node, however it also broke
> support for a majority of existing platforms, which declare both PERST#
> and PHY in the RC node, because now PERST# is first acquired in
> qcom_pcie_parse_ports(), which then returns -ENODEV (as there are no
> PHYs in the RP nodes). Later qcom_pcie_parse_legacy_binding() tries to
> acquire the PERST# GPIO again and fails with -EBUSY (as the GPIO has
> already been requested).
> 
> Move parsing of RC's perst-gpios to qcom_pcie_probe(), making it obvious
> that it's shared for both cases and skip parsing it in both functions.
> 
> Fixes: deed8aec62dc ("PCI: qcom: Handle mixed PERST#/PHY DT configuration")
> Closes: https://lore.kernel.org/r/gieaybsg2ckxpctvqj77nlwu7utama2yeyvebkonmexsxrra3v@v3fobqasxnmy/
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

This issue is fixed now. You can drop this patch in next revision.

- Mani

> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 25 ++++++++++---------------
>  1 file changed, 10 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 11fc60489892..7664c7c28c0e 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1907,15 +1907,6 @@ static int qcom_pcie_parse_ports(struct qcom_pcie *pcie)
>  	struct device *dev = pcie->pci->dev;
>  	int ret = -ENODEV;
>  
> -	if (of_find_property(dev->of_node, "perst-gpios", NULL)) {
> -		pcie->reset = devm_gpiod_get_optional(dev, "perst",
> -						      GPIOD_OUT_HIGH);
> -		if (IS_ERR(pcie->reset))
> -			return PTR_ERR(pcie->reset);
> -
> -		dev_warn(dev, "Reusing PERST# from Root Complex node. DT needs to be fixed!\n");
> -	}
> -
>  	for_each_available_child_of_node_scoped(dev->of_node, of_port) {
>  		if (!of_node_is_type(of_port, "pci"))
>  			continue;
> @@ -1942,7 +1933,6 @@ static int qcom_pcie_parse_legacy_binding(struct qcom_pcie *pcie)
>  	struct device *dev = pcie->pci->dev;
>  	struct qcom_pcie_perst *perst;
>  	struct qcom_pcie_port *port;
> -	struct gpio_desc *reset;
>  	struct phy *phy;
>  	int ret;
>  
> @@ -1950,10 +1940,6 @@ static int qcom_pcie_parse_legacy_binding(struct qcom_pcie *pcie)
>  	if (IS_ERR(phy))
>  		return PTR_ERR(phy);
>  
> -	reset = devm_gpiod_get_optional(dev, "perst", GPIOD_OUT_HIGH);
> -	if (IS_ERR(reset))
> -		return PTR_ERR(reset);
> -
>  	ret = phy_init(phy);
>  	if (ret)
>  		return ret;
> @@ -1970,7 +1956,7 @@ static int qcom_pcie_parse_legacy_binding(struct qcom_pcie *pcie)
>  	INIT_LIST_HEAD(&port->list);
>  	list_add_tail(&port->list, &pcie->ports);
>  
> -	perst->desc = reset;
> +	perst->desc = pcie->reset;
>  	INIT_LIST_HEAD(&port->perst);
>  	INIT_LIST_HEAD(&perst->list);
>  	list_add_tail(&perst->list, &port->perst);
> @@ -2107,6 +2093,15 @@ static int qcom_pcie_probe(struct platform_device *pdev)
>  
>  	pp->ops = &qcom_pcie_dw_ops;
>  
> +	if (of_find_property(dev->of_node, "perst-gpios", NULL)) {
> +		pcie->reset = devm_gpiod_get_optional(dev, "perst",
> +						      GPIOD_OUT_HIGH);
> +		if (IS_ERR(pcie->reset))
> +			return PTR_ERR(pcie->reset);
> +
> +		dev_warn(dev, "Reusing PERST# from Root Complex node. DT needs to be updated!\n");
> +	}
> +
>  	ret = qcom_pcie_parse_ports(pcie);
>  	if (ret) {
>  		if (ret != -ENODEV) {
> 
> -- 
> 2.47.3
> 

-- 
மணிவண்ணன் சதாசிவம்

