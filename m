Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413B2CD8C9F
	for <ath11k@archiver.kernel.org>; Mon,  8 Jun 2026 10:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=987+ZkDZJxNuFnm2MmcF2sfXZO6A3YzQGr1a0DWPqhE=; b=JsvagVct2b4rG7rqXo0gRXBJZ2
	A92SekEkMN1LD81cvEXBnPTjI+6C8mEG/O7+BBZ6DqZG0TZAcctZzG16qhtV/IocSqJkPE6QlnPpE
	M438fchksMA7gbIy4tVTn4xEPPQhrwrc8X6kBfat7y5BqwatesBQ6FM94ExM32QuGCzqYNGihKBod
	GyCn3ShDkOTGvYaCYb9ZBOdqfHaHkTkMN3s08j5E96qoldMA/lbZ2mWkIMjOzevmegeeqsPiL4IYi
	ir+CsCDNadE3Y7buDqVVCoQGLhs9n8Gmup8P66bR/C90cpJN8CjW99oiltLH0o8U0M3gwR5OIJpbj
	z1IIiWcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWrq-00000003H43-15NT;
	Mon, 08 Jun 2026 10:06:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWrp-00000003H3r-3222
	for ath11k@lists.infradead.org;
	Mon, 08 Jun 2026 10:06:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7BE2740C10;
	Mon,  8 Jun 2026 10:06:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CF5B1F00893;
	Mon,  8 Jun 2026 10:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780913161;
	bh=987+ZkDZJxNuFnm2MmcF2sfXZO6A3YzQGr1a0DWPqhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WjZA/1yFpnWI5gu9okoF7ljichwl5GJx8v58SXaOA7svy6lfCG4P+BQyc1MDtzJkv
	 E9Tx9VzimZsN9NlMBWTlom0SDBhUDUJXYSg9neGYr3JKD8mVgoyDoNEWzdopRBXFx0
	 oSW4UY6Lhio6akwHEolIh/fZrbztHA60ccRTGNgcGZkEEDhVoeUeChHT5vD+3qxlZ0
	 6vEI81rk4gDdcEwByiFM+ir2gyYcySsP4uacN1fY41UWHESE3T6EL4qhizsYuJvpho
	 viZko6JkuoqC/3YIrRws3h744SybNGcH0osiUH+AflKw72p9/kVham3jMI3Ox3ZNVa
	 vYK0Ly3Ch/dJA==
Date: Mon, 8 Jun 2026 12:05:58 +0200
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
Subject: Re: [PATCH 4/7] dt-bindings: bluetooth: qcom,wcn6855-bt: document
 WCN6851
Message-ID: <20260608-robust-ringtail-of-atheism-5f2ece@quoll>
References: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com>
 <20260601-sm8350-wifi-v1-4-242917d88031@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260601-sm8350-wifi-v1-4-242917d88031@oss.qualcomm.com>
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

On Mon, Jun 01, 2026 at 12:46:52PM +0300, Dmitry Baryshkov wrote:
> WCN6851 is an earlier version of WCN6855 WiFi/BT chip, compatible with
> it. Add a device-specific compat string with the fallback to WCN6855
> one.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml        | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


