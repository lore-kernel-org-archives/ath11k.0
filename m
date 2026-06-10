Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A03DCD8CB2
	for <ath11k@archiver.kernel.org>; Wed, 10 Jun 2026 07:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EgV/NjGFw2TBnGNu1grd25blD1KwYsPIRIqEutCfpzc=; b=o9mP8TOM3ztzHOXIOr02NFhSmM
	J9OkTXg/BShkJWVwioORcgNb50iQW1tcnorHUPnhDWGY1KW0tdmxUGXIOzprJWDuQ2E2w2P2B3jXd
	hZK0p2agBdWkTok3yzH4RZdc0Y6Hp3Pg3dH9hnEdpSS1iVsyy+EhUFEr84zqs0OiPu3o1fpUv2RMy
	gpJXmuRIyqVsUbLvekaW1IMwFbWsnf7i5MX5eo9ZGGEKU7HkABWrjIwzuPZJrDlpcsn4iS1rkYFDg
	R/pkV/Vy7URrHOf5g9iUEHFtt7iAXWQJmdsAB3ub19EAAaXrk+Cv+p8bmvdM2s5AM6mjcOZ0Xv+Rv
	hkxZlryg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXDZ5-00000006yCt-40nN;
	Wed, 10 Jun 2026 07:41:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXDZ5-00000006yCm-2dSi
	for ath11k@lists.infradead.org;
	Wed, 10 Jun 2026 07:41:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5415B43FB4;
	Wed, 10 Jun 2026 07:41:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DBC11F00893;
	Wed, 10 Jun 2026 07:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781077291;
	bh=EgV/NjGFw2TBnGNu1grd25blD1KwYsPIRIqEutCfpzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N3yauVZSBrf47qf05zumLqq/Yg56bWYcjmWs3qicj1JFe4cQx7KkFLZPodz/lycsr
	 aaihNpg+Vq43zVq9abn/EkBkSOeY3BhN+4R/JyLPYnTCAXRRSrzc7GlCb/bmOA7IfK
	 qyzerJOFwCiszfXk4wEbGDQSN6abHyem5iag0vy1PPECpR8Ca5aZeoiP456d50WmXn
	 2tTdFGkVLD/lFEZKqu5b28jYpNGpKdzy35aB1qQxAn8OsOtI0jOBUK938yHgyoFvvT
	 VacH128cjlgDJz6a765Ae/xyrfrmsCtj2rJ11InHyeZCjsQ3XJbdv50WWFjoGujyv6
	 mxUHxrjjhwdvw==
Date: Wed, 10 Jun 2026 09:41:27 +0200
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
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-bluetooth@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/7] dt-bindings: bluetooth: qcom,wcn6855-bt: document
 WCN6851
Message-ID: <20260610-lush-mellow-dragon-3ed9fd@quoll>
References: <20260608-sm8350-wifi-v2-0-efb68f1ff04c@oss.qualcomm.com>
 <20260608-sm8350-wifi-v2-4-efb68f1ff04c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260608-sm8350-wifi-v2-4-efb68f1ff04c@oss.qualcomm.com>
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

On Mon, Jun 08, 2026 at 09:59:22AM +0300, Dmitry Baryshkov wrote:
> WCN6851 is an earlier version of WCN6855 WiFi/BT chip, compatible with
> it. Add a device-specific compat string with the fallback to WCN6855
> one.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml        | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


