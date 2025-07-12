Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB54AC83F1D
	for <ath11k@archiver.kernel.org>; Sat, 12 Jul 2025 17:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M7MENuVC1Ij9iiE8ZfB8hLNJnIPFgy8gOphKcRNgZ7s=; b=NNd0mSX91Z1wVbhYTkZ/Y/Wdbg
	esUUfFeQMUvEOH9vUWM+7Jy7QQ1SpT68suHKAZrKZ2cY9nmyESFNUHZGuLHdXw64c02+kd7o2WBBV
	7i61F/DjfmVEqy3Tmc9hOJaZ/nw5LPonO8UzZfdKM1l/FZMq6AH5aBo6QVklRCHAwRlLJhJ8pi04a
	Fx3qbbxMsOeRD5v8rAJV0zX5Vf4WfXy0Ec+DeYlFTlz022cyO+EYllb88298+yogZpC24NrlNgiiB
	7ggYESC7mjH2/kxFbMo3fk1JlX3eDxGz0XARXMd9m00IjO5jOzyKxJEEjYw+pJ+yLFHx5Tfz1e1n7
	NO5vaM7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uadc8-0000000GpMO-2n8S;
	Sat, 12 Jul 2025 17:02:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uadc6-0000000GpM7-34d4
	for ath11k@lists.infradead.org;
	Sat, 12 Jul 2025 17:02:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3084060007;
	Sat, 12 Jul 2025 17:02:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A062C4CEEF;
	Sat, 12 Jul 2025 17:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752339731;
	bh=1HY8c3/LmGoUrP3tyoScTxQmlAqVeoVJ3c1Lyp1DEdc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s7WoWwRFokdz7QDOrKE4h+u1d9Au7oDqmNWsM7XwvnxyFATLfVzrItCT2DRABwlx0
	 dp6wwxre5pFpYhOdC1JO+wdM+Ur78vjS9j89kcIpiLNW3Tv0VSaoFC5j2LQRqrBWZD
	 FvhcPFcLlEAbnpVWzJ8vjUD1Qkh3K3TKKruZJhHMsAhyXPLK7p8SswM9jOiE6chpg+
	 /ITIuLkKAsoovWme8T4v7+OCNRTfSAilLKSemsKZ3zVVyYQDjvk/iQqJG7zJfSdU4P
	 Dg+PNXJifWB+6dgtlcskTrw1DMVElBintfFo20ICsXELHarEFSxfG9lak4caOCnqnZ
	 POAbVYyLtBqEw==
Date: Sat, 12 Jul 2025 22:32:01 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, linux-pci@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com, 
	quic_vpernami@quicinc.com, quic_mrana@quicinc.com, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH v4 06/11] PCI/ASPM: Clear aspm_disable as part of
 __pci_enable_link_state()
Message-ID: <drj7qm65bfu7irnfyy2cfhzkqlrkvd2tuvlxrlpxyohhpjbs3x@ecgooujjynmx>
References: <604ffae3-1bfc-0922-b001-f3338880eb21@linux.intel.com>
 <20250711230013.GA2309106@bhelgaas>
 <qay63njqf7z7mchizt5sm66i67rvxxxicikxmfuvllmmxfy7ek@mulnjvde5q7w>
 <470742a6-861e-498e-9da4-1fa213969c7e@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <470742a6-861e-498e-9da4-1fa213969c7e@163.com>
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

On Sun, Jul 13, 2025 at 12:05:18AM GMT, Hans Zhang wrote:
> 
> 
> On 2025/7/12 17:35, Manivannan Sadhasivam wrote:
> > > We only have two callers of this (pcie-qcom.c and vmd.c, both in
> > > drivers/pci/), so it's not clear to me that it needs to be in
> > > include/linux/pci.h.
> > > 
> > > I'm a little dubious about it in the first place since I don't think
> > > drivers should be enabling ASPM states on their own, but pcie-qcom.c
> > > and vmd.c are PCIe controller drivers, not PCI device drivers, so I
> > > guess we can live with them for now.
> > > 
> > > IMO the "someday" goal should be that we get rid of aspm_policy and
> > > enable all the available power saving states by default.  We have
> > > sysfs knobs that administrators can use if necessary, and drivers or
> > > quirks can disable states if they need to work around hardware
> > > defects.
> > > 
> > 
> > Yeah, I think the default should be powersave and let the users disable it for
> > performance if they want.
> > 
> 
> Dear Bjorn and Mani,
> 
> Perhaps I don't think so. At present, our company's testing team has tested
> quite a few NVMe SSDS. As far as I can remember, the SSDS from two companies
> have encountered problems and will hang directly when turned on. We have set
> CONFIG_PCIEASPM_POWERSAVE=y by default. When encountering SSDS from these
> two companies, we had to add "pcie_aspm.policy=default" in the cmdline, and
> then the boot worked normally. Currently, we do not have a PCIe protocol
> analyzer to analyze such issues. The current approach is to modify the
> cmdline. So I can't prove whether it's a problem with the Root Port of our
> SOC or the SSD device.
> 
> Here I agree with Bjorn's statement that sometimes the EP is not necessarily
> very standard and there are no hardware issues. Personally, I think the
> default is default or performance. When users need to save power, they
> should then decide whether to configure it as powersave or powersupersave.
> Sometimes, if the EP device connected by the customer is perfect, they can
> turn it on to save power. But if the EP is not perfect, at least they will
> immediately know what caused the problem.
> 

We all agree that not all endpoints are standards compliant. So if they have any
issues with ASPM, then ASPM for those devices should be disabled in the quirks
or in the device driver.

That said, the change that Bjorn proposed is not going to happen in the
immediate future.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

