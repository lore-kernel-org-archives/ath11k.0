Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D288CD6E4A
	for <ath11k@archiver.kernel.org>; Tue,  2 Jun 2026 07:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G/HpCIqlG2HxGomUFcoIVzuyzpu9MWocyL926EjXgmk=; b=18pJl8WvjfONDKPpVomjPgY9w9
	WV0QbSnzL+r6tQy6GeujQyXxvqtMAkAzKLUVnKNyNVrTgMYfCDp+ue6Nj9IVnExmXeivrtI8k8ooK
	ahJ0xOENnlRgWJWKjgKtlxmbPCUpsZgcZzs0ep9sKFbFFHP7YiXqXhnHeYx6WHfA48/qAqfpeK88J
	4OqksjOIWyTIikIfcJR+Ucc1A3jifB8GQIgD25DGjkEZdthhPlVi4iDNIDBiQI9pjLxO7XgXFwjyc
	wAaQLbaIUuxrfMag4iW+GztI66LQyc9y6pycRH84iRd74VNaNrVQ2o1UYwIkuiW5CpPoX/2tWuWHi
	YrusZqVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUK1w-0000000CWQ6-1Kf4;
	Tue, 02 Jun 2026 07:59:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUK1s-0000000CWPK-0ZtW
	for ath11k@lists.infradead.org;
	Tue, 02 Jun 2026 07:59:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C65824090A
	for <ath11k@lists.infradead.org>; Tue,  2 Jun 2026 07:59:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9A7E1F00899
	for <ath11k@lists.infradead.org>; Tue,  2 Jun 2026 07:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780387155;
	bh=G/HpCIqlG2HxGomUFcoIVzuyzpu9MWocyL926EjXgmk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=VU56cKixBIDeC2J/S3kuGNTkdWzTND796sQiRbvRjPsWIIxdR5AQTls/gapJ2Kpz4
	 CP7v+v/I6a+Hb66HaYbyE4LUTpx3UPrkYmtHQy/d4PAVJyNxz4nPgaPzgBiYcthFNI
	 D3hPSHH+PDZXPAofn1wbxBiY1Cn0Hq25kS8/spmGAMHUaxlXt9EZNLrS2LwTdzogUp
	 TtOT1oTZXVGf6vLEJC7NzyJYEapDmkadUxV1BscXVTw6VZJJht4ikMmgLXDm1sLN9d
	 HIpFP9J+wzk58cp+Z7ZDpVcbtBflzOZZBVQaiXNTs7//x5FCI9dSkIyMRegbC41DdW
	 zdd8ZwBNJtLJA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39676ff4674so22842261fa.0
        for <ath11k@lists.infradead.org>; Tue, 02 Jun 2026 00:59:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9u4Ah3WkNCivOmJasyvrtrVL3+AlwcRbO5LvbOKlxkspPSU/JpKNWldOVnEluD50V+OK/+Smk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt4fyL/V+qrlitR4+QumZI93/rwIbSVF/NqacuiJRCfHt/Lndg
	SgKKcYwBIi16/wMMwEETS1TJry7Jl0p9wXxFJnzdLQor57myuk27gnps0yIdNLxTKx2Y2R57doI
	DJ5fpikSy97kMVlOgvWH6OQxisZ4wBfH2lG94CTCbTw==
X-Received: by 2002:a2e:bea6:0:b0:396:9897:4cc5 with SMTP id
 38308e7fff4ca-3969a852edamr10861651fa.5.1780387154481; Tue, 02 Jun 2026
 00:59:14 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Jun 2026 07:59:12 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Jun 2026 07:59:12 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260601-sm8350-wifi-v1-6-242917d88031@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com> <20260601-sm8350-wifi-v1-6-242917d88031@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 07:59:12 +0000
X-Gmail-Original-Message-ID: <CAMRc=Me1OFX9YO9bqBKFffaCS8FH7-_bSS4BsVgW+qoYQmDjVg@mail.gmail.com>
X-Gm-Features: AVHnY4Jj6PQ-4DZSgjCutJzrmJiIfEI2Eoc9MefyrTPUsszRaLc0Op3HHJ1m_C8
Message-ID: <CAMRc=Me1OFX9YO9bqBKFffaCS8FH7-_bSS4BsVgW+qoYQmDjVg@mail.gmail.com>
Subject: Re: [PATCH 6/7] arm64: dts: qcom: sm8350: modernize PCIe entries
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, devicetree@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-bluetooth@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Qiang Yu <qiang.yu@oss.qualcomm.com>, 
	Jeff Johnson <jjohnson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_005916_214683_51672FB9 
X-CRM114-Status: UNSURE (   6.74  )
X-CRM114-Notice: Please train this message.
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

On Mon, 1 Jun 2026 11:46:54 +0200, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> said:
> The recent suggestion is to have PERST# / WAKE pins and PHYs in the PCIe
> port rather than RC device. The kernel recently started warning about
> the older style of DT. Modernize DT for SM8350 platform by moving the
> entries under the root port device node.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

