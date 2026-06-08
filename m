Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 242F6CD8C92
	for <ath11k@archiver.kernel.org>; Mon,  8 Jun 2026 15:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sTLCZKrnRtrIRJXJzO4FzQsnVEhHnjPYOb7yuw7wgNo=; b=0vjqXcmyPl0yTJgREXs6fpJvQy
	BClsca5a6DxLo/Qt78Xy0+c3ifMC3EMmZV5DC+bMFXGiNbxYYLpApBTH08lf4NBL/OL0CpJ9DBC5Q
	8TfG+aLBfVN7qLCfAIBFv3e/f0lJKq1NbW+AKEg0w/PINi7KJ9wVmOR2oo5iS9H331B69pzYKCdG/
	DIFxj6z4+wqOYLaGK/E/kAp/uzbODnc431kglos2uGj/4/YoGnjawbZpmnd1TWd7x8hJgWPHj3RLH
	DYkJvoy1dMG8txpVGyphVA+eUqK0tsnuHyxBhKyaESp0pC49y/SfU+FfTMDELJ6Ud2W/LROyytKz5
	Ius14MRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbkN-00000003wQk-1Ebw;
	Mon, 08 Jun 2026 15:18:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbkL-00000003wQT-3nsc
	for ath11k@lists.infradead.org;
	Mon, 08 Jun 2026 15:18:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DDD58601F1;
	Mon,  8 Jun 2026 15:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 702691F00898;
	Mon,  8 Jun 2026 15:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780931916;
	bh=sTLCZKrnRtrIRJXJzO4FzQsnVEhHnjPYOb7yuw7wgNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fRs+R4j7/J1Yn4/cFT+KTS79N/Xda5tsPWkpeG2flEfh2ea4eOBOkoB7ARKhDyB4p
	 xYo/mNKG5ERQfWzfjw5FMPAvTEPzBlLTOO+6O+NHI/goeAdhvnCCZs16Cq78YCUPSa
	 8CwHyh50xzXgT+8mxPOvYIKiN9cUzt06Wp8JnYlnsGcZMqdOqFKx01/bpz3JrObu5V
	 3OvPqn/HrnTbyd3vyY5ggAJXjYrhGluVABNtSZAwo0q/G01HaWB6C/4JsDDrA7IzhT
	 VrDxF9G/9u7LhpGwET19n9BD9+BjGbMhQfZxSvQJfd2gHjdpQmVWeagA/qMkOPfDF9
	 uKHR34IqaOPQA==
Date: Mon, 8 Jun 2026 10:18:35 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Jeff Johnson <jjohnson@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
	Rocky Liao <quic_rjliao@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org, devicetree@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-bluetooth@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/7] arm64: dts: qcom: enable WiFi/BT on SM8350 HDK
Message-ID: <20260608151835.GA2707238-robh@kernel.org>
References: <20260608-sm8350-wifi-v2-0-efb68f1ff04c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608-sm8350-wifi-v2-0-efb68f1ff04c@oss.qualcomm.com>
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

On Mon, Jun 08, 2026 at 09:59:18AM +0300, Dmitry Baryshkov wrote:
> The SM8350 HDK has an onboard WCN6851 WiFi/BT chip, which for a long
> time was not supported. Bring up different pieces required to enable
> this SoC.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Changes in v2:
> - Bumped num_vdevs to 4 to follow other similar devices (Jeff)
> - Link to v1: https://patch.msgid.link/20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com
> 
> ---
> Dmitry Baryshkov (7):
>       PCI: qcom: fix parsing of PERST# in the legacy case
>       wifi: ath11k: enable support for WCN6851
>       regulator: dt-bindings: qcom,qca6390-pmu: document WCN6851
>       dt-bindings: bluetooth: qcom,wcn6855-bt: document WCN6851
>       arm64: dts: qcom: sm8350: expand UART18 to 4 pins config
>       arm64: dts: qcom: sm8350: modernize PCIe entries
>       arm64: dts: qcom: sm8350-hdk: describe WiFi/BT chip

Before adding new devices, can you (Qcom) fix the all the existing DT 
warnings related to QCom WiFi/BT:

      6 (qcom,wcn6855-bt): 'vddrfa1p7-supply' is a required property
      6 (qcom,wcn6855-bt): Unevaluated properties are not allowed ('vddrfa1p8-supply' was unexpected)
      2 (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
      2 (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
      2 (qcom,wcn6855-bt): 'vddbtcmx-supply' is a required property
      2 (qcom,wcn6855-bt): 'vddaon-supply' is a required property
      2 (pci17cb,1103): 'vddwlmx-supply' is a required property
      2 (pci17cb,1103): 'vddwlcx-supply' is a required property
      2 (pci17cb,1103): 'vddrfacmn-supply' is a required property
      2 (pci17cb,1103): 'vddrfa1p8-supply' is a required property
      2 (pci17cb,1103): 'vddrfa1p2-supply' is a required property
      2 (pci17cb,1103): 'vddrfa0p8-supply' is a required property
      2 (pci17cb,1103): 'vddpcie1p8-supply' is a required property
      2 (pci17cb,1103): 'vddpcie0p9-supply' is a required property
      2 (pci17cb,1103): 'vddaon-supply' is a required property

Rob

