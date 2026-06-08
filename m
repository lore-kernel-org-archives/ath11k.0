Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BE1CD8C9D
	for <ath11k@archiver.kernel.org>; Mon,  8 Jun 2026 14:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DgevYk+trI9a01XYiR93DkcK4FlvyCsJcciplo5M4a4=; b=EqmjNAiQF+SW95Of0QQIuQq18o
	q9UNcHItdzelLBsC7SQkNV/lPYphYWh4IxLDBAIyOe9SPOtYsuvAU27zJnLtSMxLMNMnci+Zvw+X9
	BZ9MYUJh4eDU0Jz3SwG37e+AcA1lY1bf6UslRdt/eGb8SMozRrJrKSUttXgaSxj9RUYRh+hr2IcIH
	tzrBgz5TdKJOIOXF60TP+XMuE0LjkOk8bTZo0W+7G1K9iULLnaYVj4bOzV1WohxVT/FCCvjKhiFar
	P8LUHyoML1drA6JMb2wp+MUxGYj5CUPa6H3PCpMMrAPv5bUxWGBH05dhaLYc4g2fMi5HPHQ1tsbR9
	3CPKJUXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWb01-00000003lJS-1oEJ;
	Mon, 08 Jun 2026 14:30:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWazz-00000003lJ8-2ZVi
	for ath11k@lists.infradead.org;
	Mon, 08 Jun 2026 14:30:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 12F84444FB
	for <ath11k@lists.infradead.org>; Mon,  8 Jun 2026 14:30:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3A191F0089C
	for <ath11k@lists.infradead.org>; Mon,  8 Jun 2026 14:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780929042;
	bh=DgevYk+trI9a01XYiR93DkcK4FlvyCsJcciplo5M4a4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Yq6+gp7o+t+YQI0mcfmczBWPQRT/vd6mpMnL5zm7lJV5zufTqvuUZFav2lmFFR1zr
	 vU2EVs2llYOb0dtHlYEy9NzYr8JNJOb9R1lU5oyaRfZwTC3rjT9WFZNADXH/tZMrle
	 rQWEi5ICOGsWewXIS0NwPziENp+foPhZM/T9FRSdghgNLaHkUvpi++XUTe79xgkI13
	 mJw1ghKOSb9H72lLnbQC9gNsmjTHJqMFItaCAHvhmMAdMrViPbYjMDv0qYB1s2n2AK
	 kjAgcHKa7c135LL3iv5tW2H8Cj5Lg7JHQ1PfB1H1fFtJmIM6y7uSF6hbjgUcRa/JXR
	 UDwXwOdmoqi8w==
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-137d464c47eso3243196c88.1
        for <ath11k@lists.infradead.org>; Mon, 08 Jun 2026 07:30:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+qZSP3l9HUw3shxknxQZBOx8p+Y4JfTCPOsH0ewaeAiORh71qa7zeP6cuSRrPoi/ce1auA6jc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzltwW2oB0zGm5x8OFZvD0E+T+l0+tMm+4uMGPHQ5FCF2jWkikL
	FDVzwlPuvZOIsWeN4wuPX0j2nk5AaFG8QqvOCaUyM+XMHLcZCtChnwg2ck0pWrKH9xdKrEo4THR
	Rc1XLWqczV53K8Co3r2K/YupcvcHJNn8ORHoLKHCLcQ==
X-Received: by 2002:a05:701a:c951:b0:12d:b8e5:5e2 with SMTP id
 a92af1059eb24-13807dbc1f2mr6212351c88.23.1780929042235; Mon, 08 Jun 2026
 07:30:42 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 07:30:38 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 07:30:38 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260608-sm8350-wifi-v2-1-efb68f1ff04c@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260608-sm8350-wifi-v2-0-efb68f1ff04c@oss.qualcomm.com> <20260608-sm8350-wifi-v2-1-efb68f1ff04c@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 07:30:38 -0700
X-Gmail-Original-Message-ID: <CAMRc=MctdRxo4WFf6F9A1pFOeTq8us6brdSEzTZsNPFwqrSnNQ@mail.gmail.com>
X-Gm-Features: AVVi8CcaZhXYOpCv2x74C9QF-11-iy12puwZY5pM4Q7NOmmptdOTSpcIOV1fL7E
Message-ID: <CAMRc=MctdRxo4WFf6F9A1pFOeTq8us6brdSEzTZsNPFwqrSnNQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] PCI: qcom: fix parsing of PERST# in the legacy case
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Qiang Yu <qiang.yu@oss.qualcomm.com>, 
	Jeff Johnson <jjohnson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, devicetree@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 8 Jun 2026 08:59:19 +0200, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> said:
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
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

