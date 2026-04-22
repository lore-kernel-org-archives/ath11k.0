Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDA4F9B60A
	for <ath11k@archiver.kernel.org>; Wed, 22 Apr 2026 10:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RTVj7TLWP0O68NmxAPpxhXsIlo8LHLwlyKS0dEzJKBE=; b=rFsNi/F0n0YQ6TGW5rsX9I/cQR
	s0Iz4wL2ubsxjyX6HHMnn+FjNgcLOKd75SjfH9fnNd+LJtY9djBN6m/xdouOa+NLQcU2BnYH43GXH
	gHZFulD6FmBvpbFLgLalNB2KVuJ1toLpnHoZc9Oxu/6BeJqBJeRNq4fx6uMlrhZHmm4kY6X/S0RA8
	ZrpHlHEu+Oj608wcPZusiz38Fw9VUDC26KfenfAOkOHiesbJ4mIx78+zmPtQnlXs/PoD8CAMXk8Jr
	ponGvhBcyvbtWA6438d22RgRpYLbopBq7N4c46nfJTPPQwq7hXbepO+QECUQTWp0nCO5RnTclwFzC
	G2Kh+t+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFUik-00000009wRD-25Cr;
	Wed, 22 Apr 2026 10:22:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFUig-00000009wQh-0Sgv;
	Wed, 22 Apr 2026 10:22:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3DA8F43E02;
	Wed, 22 Apr 2026 10:22:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83F42C19425;
	Wed, 22 Apr 2026 10:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776853329;
	bh=OPAbtCeUFu5JQU7TB2Kk6V+iYdS0gEp+U2RDLrMxNU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ISHZRTRAUYJFeJR/cUWU0CBCQXfQw0RozDpWLUic3YUtoO9VlWqIk8NUOTGRQ0dTE
	 /oQxzoWYcTaQZuJF77gP0B61fvks1hoCvpyZ+66ezYOgllbvO62vuIN2bwxrnqO67b
	 RJoGnM7tiICpF4IgqQ+9Fjko4m9aFnObl/Zj6JJcs3Y38Jeko8QYgDu18V8wk3dNN8
	 3VubBO+riGP0xCjaU+LNgxt32MbYM1a1cZTjTnk6muBifbpFzz7k5EYnGI7RQ2OB3X
	 2eln2Le6dSfccx4GyyIIPtxB2Mpbeu4bl9bShgWH+sdP+Mv3GkkvtL2BeQuV5W7Nma
	 lK5iblz9HoOJg==
Date: Wed, 22 Apr 2026 12:22:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Stephan Gerhold <stephan@gerhold.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Jeff Johnson <jjohnson@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Mark Brown <broonie@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Yang Xiwen <forbidden405@outlook.com>, Alex Elder <elder@kernel.org>, 
	Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
	Rao Mandadapu <quic_srivasam@quicinc.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, ath11k@lists.infradead.org, 
	linux-pci@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Fix phandle-array constraints, again
Message-ID: <20260422-spectral-caped-albatross-9debf2@quoll>
References: <20260421195836.1547469-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260421195836.1547469-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_032210_192935_D38DA2AC 
X-CRM114-Status: GOOD (  12.00  )
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
> diff --git a/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml b/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
> index b30544410d09..e47e1e09300a 100644
> --- a/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
> @@ -42,7 +42,13 @@ properties:
>      description: State bits used by the AP to signal the modem.
>      items:
>        - description: Power control
> +        items:
> +          - description: Phandle to ???
> +          - description: ???
>        - description: Power control acknowledgment
> +        items:
> +          - description: Phandle to ???
> +          - description: ???
>  

Here and in all cases except qcom,msm8916-mss-pil:

 - description: Phandle to the Shared Memory Point 2 Point device
     handling the communication with a remote processor

 - description: Single bit index to toggle in the value sent to
     the remote processor
   maximum: 32

...

> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
> index c179b560572b..3c614cb7ce88 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
> @@ -104,6 +104,9 @@ properties:
>      description: States used by the AP to signal the Hexagon core
>      items:
>        - description: Stop modem
> +        items:
> +          - description: Phandle to ???
> +          - description: ???

 - description: Phandle to the Shared Memory Point 2 Point or Shared
     Memory Manager device handling the communication with a remote
     processor

 - description: Single bit index to toggle in the value sent to
     the remote processor
   maximum: 32


Best regards,
Krzysztof


