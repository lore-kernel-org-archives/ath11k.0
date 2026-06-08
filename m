Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5B2CD8C9F
	for <ath11k@archiver.kernel.org>; Mon,  8 Jun 2026 10:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=syxAqA1GpHDDzXsNOy0fUEopeINEejRQ7IctKWUkbK0=; b=xsX0+cNfYYQu0CiN5TwBJmqtGW
	GXcMDwiS+iYX+OcY5L2CDcOpOIJq7ii7UOYMz9rhfTDX2gAWKtRszaT92qEiJn/I9XyIyskTBbF4J
	MDVBM4yKyUPh78IEQ2/dwnAqtRYrWWQEDNxMm+Vxq+4KxBHwBiS/O4gk3IozD9jR4ncsiLuCxwMPM
	A79I6rYdkChQC1F0R+reAJeF9TgTD8A1ymReJFG6S8A2DOWWcGOj8K2vuPc2wXqtyYzpt/h0wWpOB
	/0FWfc29vHiqHCCVXIcoQbF9Sdo+fPQ0Dhp3PwFXzM1EzS+2n24DpaVydei3dcjPrgs37kkqzy3LY
	wMAe7iiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWpr-00000003GW9-26FN;
	Mon, 08 Jun 2026 10:03:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWpq-00000003GVi-229L
	for ath11k@lists.infradead.org;
	Mon, 08 Jun 2026 10:03:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0635D41A2F;
	Mon,  8 Jun 2026 10:03:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E513A1F00893;
	Mon,  8 Jun 2026 10:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780913037;
	bh=syxAqA1GpHDDzXsNOy0fUEopeINEejRQ7IctKWUkbK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lLs6JzroULacjuDhh+j6BEMxqMvGaSNLLlS+EgKPDn66NrtTLIALRjC352qlREBul
	 M1PeJ/dB297qBslVWaiGKQqja5XXBx7eFCirUyVAe9Ojr8h/I9M/Aw+FMhLY+obZ8H
	 BCqzoWaknh+0GUQymm0YpROl3LGKuCNcn2oHPenLtjJFn7xoWmo7WfV1koaxk4Gvj1
	 n2XlO766dQbpPY+o4sjL7p+1ygWh0laT8GrBGqbgud8s1menxONvPvxBK/1eIbvtoH
	 SNlEbDJC4IYngpX3N+28ZOem+yfTehhzNxKsuOhBt4ztZx21D2HJcpabdIFIsdsxoX
	 uS6Ednx0sKAQg==
Date: Mon, 8 Jun 2026 12:03:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Qiang Yu <qiang.yu@oss.qualcomm.com>, 
	Jeff Johnson <jjohnson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, devicetree@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-bluetooth@vger.kernel.org
Subject: Re: [PATCH 3/7] regulator: dt-bindings: qcom,qca6390-pmu: document
 WCN6851
Message-ID: <20260608-grateful-armadillo-of-potency-d8aad0@quoll>
References: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com>
 <20260601-sm8350-wifi-v1-3-242917d88031@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260601-sm8350-wifi-v1-3-242917d88031@oss.qualcomm.com>
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

On Mon, Jun 01, 2026 at 12:46:51PM +0300, Dmitry Baryshkov wrote:
> WCN6851 is an earlier version of WCN6855 WiFi/BT chip, compatible with
> it. Add a device-specific compat string with the fallback to WCN6855
> one.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


