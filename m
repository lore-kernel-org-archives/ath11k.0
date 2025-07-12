Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62BC8C83F21
	for <ath11k@archiver.kernel.org>; Sat, 12 Jul 2025 09:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=td1rLs5h+OGNhxFgzf8Ow3SNr3nG8yimc61V35MzU3I=; b=dJRB5Mps/kzqabL0bqaJFNoGb5
	CwxmPeHpH7+ZYsRIIX71LRPugJnwuBwdHUchGX2HQoaSxA7OOdKiP8yTMEEtBIr025256km+ESW74
	J83baQcLnfNmC5SZ0iR68XlV1agBLT9flr58htrnUp/xn2Jwc4erJV7+1zzl8rMR0mJVHiZAzBWWG
	52wRJAFMcGWF18ZaI+U6iX/FN5cTri4fQsOrpLdg8A8sJFlf0WhGTe2w5WQAsZShTO589HABRE2+U
	Lf5hyG4o5QWbxOgRkLTMj40mnQ3njshv8VOMVYnS6WzbkYRCurPpOQrFTEUhXhJYFjyGKNPkY4uvh
	cahAu7/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaWdy-0000000GUAT-1woM;
	Sat, 12 Jul 2025 09:35:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaWdv-0000000GU9y-2b2J
	for ath11k@lists.infradead.org;
	Sat, 12 Jul 2025 09:35:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6720044DE7;
	Sat, 12 Jul 2025 09:35:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DCDFC4CEEF;
	Sat, 12 Jul 2025 09:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752312938;
	bh=s7cj6oQ/BwxZRbAJNXkKJ5U3lAZkjlVFoTQUXhnxDU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ge0qYzlnIYod4rhihkSfZD4ko+Zfwd285rO3xx6MFDFopsXEmAzxZk4y8kUb7p5bz
	 NoH3sJU09ss7eDPcX0nI/XutJaWC5u2uzHholnqK20XB64GB/AuwkMmqbGT50z/3ET
	 weq8vk33lsZdhItHh6IEgA6Brae0ppGkQ+/w/NDyRuJFYNDRh9wm+/WvEGZx/XRkzi
	 xEdusyZDWLymZabqIHnCjCBR2bIU5cNrDIwuvtLdRM36e4yr4NuqIFKIs1hWymlieF
	 Js97lk0OQzyOHYVmLLPukwlqvCm40w/OxWDENmp5MVJNqObf54eVY8A9HwLt9h23PU
	 sPYGY1BBZTjiw==
Date: Sat, 12 Jul 2025 15:05:28 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Jingoo Han <jingoohan1@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	linux-pci@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com, 
	quic_vpernami@quicinc.com, quic_mrana@quicinc.com, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH v4 06/11] PCI/ASPM: Clear aspm_disable as part of
 __pci_enable_link_state()
Message-ID: <qay63njqf7z7mchizt5sm66i67rvxxxicikxmfuvllmmxfy7ek@mulnjvde5q7w>
References: <604ffae3-1bfc-0922-b001-f3338880eb21@linux.intel.com>
 <20250711230013.GA2309106@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250711230013.GA2309106@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_023539_684709_AA0FFB98 
X-CRM114-Status: GOOD (  18.86  )
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

On Fri, Jul 11, 2025 at 06:00:13PM GMT, Bjorn Helgaas wrote:
> On Fri, Jul 11, 2025 at 04:38:48PM +0300, Ilpo Järvinen wrote:
> 
> > +++ b/include/linux/pci.h
> > @@ -1826,8 +1826,8 @@ static inline int pcie_set_target_speed(struct pci_dev *port,
> >  #ifdef CONFIG_PCIEASPM
> >  int pci_disable_link_state(struct pci_dev *pdev, int state);
> >  int pci_disable_link_state_locked(struct pci_dev *pdev, int state);
> > -int pci_enable_link_state(struct pci_dev *pdev, int state);
> 
> AFAICT there's no caller of this at all.  Why do we keep it?
> 

I'm just working on a series to convert the ath{10/11/12}k drivers to use this
API instead of modifying LNKCTL register directly:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/wireless/ath/ath12k/pci.c#n961

> > -int pci_enable_link_state_locked(struct pci_dev *pdev, int state);
> 
> We only have two callers of this (pcie-qcom.c and vmd.c, both in
> drivers/pci/), so it's not clear to me that it needs to be in
> include/linux/pci.h.
> 
> I'm a little dubious about it in the first place since I don't think
> drivers should be enabling ASPM states on their own, but pcie-qcom.c
> and vmd.c are PCIe controller drivers, not PCI device drivers, so I
> guess we can live with them for now.
> 
> IMO the "someday" goal should be that we get rid of aspm_policy and
> enable all the available power saving states by default.  We have
> sysfs knobs that administrators can use if necessary, and drivers or
> quirks can disable states if they need to work around hardware
> defects.
> 

Yeah, I think the default should be powersave and let the users disable it for
performance if they want.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

