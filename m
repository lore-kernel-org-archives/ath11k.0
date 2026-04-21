Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F8AF94CB4
	for <ath11k@archiver.kernel.org>; Tue, 21 Apr 2026 21:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pj+ZVcQEPmH4qxu2L24IFturo4+OF2h+9wWxx6eGO/Q=; b=fqs7tux2xQSbo9vf/c8fZytjdq
	r2pn6XooVSvfoSngqXQFB7yNGjSz3+bO4r6y64Aq6NofdydBWn/9S2jc/61DzIaak6b9laaPMsSRS
	1LDngFxNCySUd3Ftanlxs//+2EnlHix4452/D2pXZvkEf0UBnpHYpHCBEXVlK8TPUKpHIuVxXjSwd
	J3qqoARuktwvSqopfSVxMLpR9MBcGpq3dep4ywsj261wTw9vNNCxQCYerbJYxTkGCdIR5U0W59ZEo
	akLSyWesWPey/Ieqyc+NNBTpv3TmMo2qQQ87EibEo6R8rOwO0SvsgcZBBDhnot17BhiEIC4jPA+4Q
	rM/4U3kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFIis-00000009BQl-35Xp;
	Tue, 21 Apr 2026 21:33:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFIir-00000009BQR-2jq0;
	Tue, 21 Apr 2026 21:33:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E59A61335;
	Tue, 21 Apr 2026 21:33:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1D63C2BCB0;
	Tue, 21 Apr 2026 21:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776807212;
	bh=vatupuq4WrABpSuEUMYUtujivXgVDiHk3e1MmNVxM+Q=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=RfEYijh7XhOIIxtCBiZK1gn5IXNLv5qcn5amQw5CqC2XQ0mRjsWMy0SwC/jKxN8Ha
	 +lGNHgaycbYUVz/8qUQTAV87+keU8WY1I1fe4qL/Cubm0CmcRljTFyT4oCGT3XsCWG
	 21JAOI+XCTuLyqtAQ0JY89PQj9ztU0bsVRSzsv4sAV4REIQeaAk9EIXe86axCL8Lcv
	 P49oQppEQE3W5ysKk35W1yekjIPJzFLIHvqS9YHqLVNNeeeAs1gWZnOJuQHTbQ76Mo
	 fn4ArOBoMvEaOR/5jHbzodnC5RnVkOGNRxUq58/UbFZ0QTUKrwlb9kjzN5QiQ3GPHQ
	 wuq7UQCA8GLiQ==
Date: Tue, 21 Apr 2026 16:33:30 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, ath11k@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xu Yang <xu.yang_2@nxp.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, linux-spi@vger.kernel.org, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Rao Mandadapu <quic_srivasam@quicinc.com>, Mark Brown <broonie@kernel.org>, 
 linux-sound@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, linux-wireless@vger.kernel.org, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Yang Xiwen <forbidden405@outlook.com>, 
 Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
 Alex Elder <elder@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Stephan Gerhold <stephan@gerhold.net>, 
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 Bjorn Helgaas <bhelgaas@google.com>, Jeff Johnson <jjohnson@kernel.org>, 
 linux-mmc@vger.kernel.org, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ath10k@lists.infradead.org, 
 netdev@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
In-Reply-To: <20260421195836.1547469-1-robh@kernel.org>
References: <20260421195836.1547469-1-robh@kernel.org>
Message-Id: <177680720998.183058.5012840252939438533.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Fix phandle-array constraints, again
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


On Tue, 21 Apr 2026 14:55:25 -0500, Rob Herring (Arm) wrote:
> The unfortunately named 'phandle-array' property type is really a matrix
> with phandle and fixed arg cells entries. A matrix property should have 2
> levels of items constraints.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> Can someone from QCom provide some descriptions for 'qcom,smem-states'
> properties.
> ---
>  .../display/rockchip/rockchip,rk3399-cdn-dp.yaml         | 2 ++
>  .../bindings/mmc/hisilicon,hi3798cv200-dw-mshc.yaml      | 7 ++++---
>  Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml | 6 ++++++
>  Documentation/devicetree/bindings/net/qcom,ipa.yaml      | 6 ++++++
>  .../devicetree/bindings/net/wireless/qcom,ath10k.yaml    | 5 ++++-
>  .../devicetree/bindings/net/wireless/qcom,ath11k.yaml    | 5 ++++-
>  .../bindings/net/wireless/qcom,ipq5332-wifi.yaml         | 9 +++++++++
>  .../devicetree/bindings/pci/toshiba,tc9563.yaml          | 5 +++--
>  .../bindings/remoteproc/qcom,msm8916-mss-pil.yaml        | 3 +++
>  .../bindings/remoteproc/qcom,msm8996-mss-pil.yaml        | 3 +++
>  .../devicetree/bindings/remoteproc/qcom,pas-common.yaml  | 4 ++++
>  .../bindings/remoteproc/qcom,qcs404-cdsp-pil.yaml        | 4 ++++
>  .../bindings/remoteproc/qcom,sc7180-mss-pil.yaml         | 3 +++
>  .../bindings/remoteproc/qcom,sc7280-adsp-pil.yaml        | 3 +++
>  .../bindings/remoteproc/qcom,sc7280-mss-pil.yaml         | 3 +++
>  .../bindings/remoteproc/qcom,sc7280-wpss-pil.yaml        | 3 +++
>  .../bindings/remoteproc/qcom,sdm845-adsp-pil.yaml        | 3 +++
>  .../devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml   | 3 +++
>  Documentation/devicetree/bindings/sound/samsung,tm2.yaml | 2 ++
>  .../devicetree/bindings/spi/st,stm32mp25-ospi.yaml       | 5 +++--
>  .../devicetree/bindings/usb/chipidea,usb2-common.yaml    | 2 ++
>  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml  | 7 ++++---
>  22 files changed, 81 insertions(+), 12 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/remoteproc/qcom,qcs404-cdsp-pil.yaml:99:1: [warning] too many blank lines (2 > 1) (empty-lines)
./Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml:67:1: [warning] too many blank lines (2 > 1) (empty-lines)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.example.dtb: i2c-mux3 (i2c-demux-pinctrl): i2c-parent:0: [2, 3, 4] is too long
	from schema $id: http://devicetree.org/schemas/i2c/i2c-demux-pinctrl.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/samsung,tm2.example.dtb: sound (samsung,tm2-audio): i2s-controller: [[4294967295], [0], [4294967295], [0]] is too long
	from schema $id: http://devicetree.org/schemas/sound/samsung,tm2.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260421195836.1547469-1-robh@kernel.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


