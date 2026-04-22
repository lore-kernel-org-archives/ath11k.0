Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157F2F94CB2
	for <ath11k@archiver.kernel.org>; Wed, 22 Apr 2026 05:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BGRoVhdV4jNn1YmYO77SkM8eXp5npTqH4DszknBbQ4A=; b=KA0zdDa0D0Mkpq9FZhdoqB8ZC/
	GWeNmamHp1NE3MdWwE45zVLXgv5pvXYuLohKaWNONHvmLOv+/Ddn5cgowZ/XUgtU3/mhpgYi48b63
	UHoX6HzFwcZ9ZWcQHNz+ePsSti1cN0UDfvR/idZ5A8kHOBdiV2myy93F0Xwdgv3Wnea1a2S8YvuKw
	9vT4qeqj4F7XCKBH0YLUAJR6wDKZ5joruYzFeGNCO5i68DJ4yRS3trOv457kE49tJFE4vxADqB5Oh
	6l4qmFQNWzZiLecttCGjDf6fR/hfGFqZfBo557dS0N5FrKbHKEdzkeGOFqVDSMsEwQeIUraYSx7N5
	TOVh1mpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFQQB-00000009ceW-0lNY;
	Wed, 22 Apr 2026 05:46:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFQQ8-00000009ce2-3nyM;
	Wed, 22 Apr 2026 05:46:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 45D2743D1F;
	Wed, 22 Apr 2026 05:46:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5EF7C19425;
	Wed, 22 Apr 2026 05:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776836803;
	bh=iHTuLIFezrha1k24YoDSo0U0QgoHN5U9b98UCvK+v+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CeguupGckqDP65N6NF+5nNirF0NNyfRUq2q5YVLXoZ+NJ8CHpzN1MtrNDFeiOXOMI
	 3IAP92r5zyTS/ZiNdu71HsVN4guqNuX5OnjQtKC82hXq6MmRAFVPTbyifXRNIzuJAR
	 ckL2rE5jWjyh1XNHoBUwdn5WTA5UFCdSUZP4TGLM=
Date: Wed, 22 Apr 2026 07:46:40 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jeff Johnson <jjohnson@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Mark Brown <broonie@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Yang Xiwen <forbidden405@outlook.com>,
	Alex Elder <elder@kernel.org>,
	Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Rao Mandadapu <quic_srivasam@quicinc.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
	ath11k@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Fix phandle-array constraints, again
Message-ID: <2026042233-barometer-backroom-d544@gregkh>
References: <20260421195836.1547469-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421195836.1547469-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_224645_013787_A44C399C 
X-CRM114-Status: GOOD (  11.77  )
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

On Tue, Apr 21, 2026 at 02:55:25PM -0500, Rob Herring (Arm) wrote:
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

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

