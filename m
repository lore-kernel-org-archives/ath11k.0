Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D1BC83F1B
	for <ath11k@archiver.kernel.org>; Fri, 11 Jul 2025 23:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Fwau9BGD3qxuGHS9ko5wB0jro/J04ETtEqTUQ/UIHmM=; b=ys27PsJDWO7cwRMBhqRApYgx2R
	VH2PRoxKUoldueFuxNvSurjAa/Ru2/tJMVFjlUGV2FfCXrJI1yLowV5d6FLAoBFvGW1uOGfh53UKO
	WMmkbgRyjZdi37h7D1xcG7+vyOxE9M+4ocYn0v6sxBPubiyDYu1eneDUzj8rSZ6dC62ArHRuRv+gN
	YofEuLQTvU7eNzlPNzblw9NesqeT1zhiplcpSVnyvq0XYsWhjCC0MaPb2Zxa/PjioUZ8dGLFiHXv6
	NMBrIb6d/QKuyHes5rv4GniL0yVMsMHgGXoXXrov9N7t3Rgq3sRraWpn/5g9Gpj+M0WqoGLJtvWZj
	/f+RlZ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaMj6-0000000FzLY-0yI7;
	Fri, 11 Jul 2025 23:00:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaMj3-0000000FzKr-0CiF
	for ath11k@lists.infradead.org;
	Fri, 11 Jul 2025 23:00:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 96D725C5E3E;
	Fri, 11 Jul 2025 23:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2460DC4CEED;
	Fri, 11 Jul 2025 23:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752274815;
	bh=I/WYWVtYM4EC/upgYCe6fwOOyi0ZjnLy4T8UxOcBMNg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=B1910RDgevOjKAnH5ke4u1MUJuUNgfkaBqgr/BQLtOBt1fxIS7pqRbFSRnLY0Yqvp
	 y8jmPFHe9c3Y8XsL6JI7P2hlZ5h6hkXysZYTD2vm3nzfz8vAVRxdw6bjawGH7f7v9x
	 FoGqGXteH3zJkoa8KUS4yNoYKCxHfIbXmL7nCMymcl7QyA2baqALxdShLSjdYgFrbF
	 vJMOZg/kpgPGDmWCJuDPwcf0yc0WaFZZxM0bkceOGYGl5MUeXw88aHd5R3iWyaBrRT
	 tnrC34A+VtQHKtiaQr1MI9g4L525RZg/ImWIFuZp7vxygrY2Zb6BLUJsFwzzhVzCZ4
	 cNobNaAiQE+3A==
Date: Fri, 11 Jul 2025 18:00:13 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-pci@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
	quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH v4 06/11] PCI/ASPM: Clear aspm_disable as part of
 __pci_enable_link_state()
Message-ID: <20250711230013.GA2309106@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <604ffae3-1bfc-0922-b001-f3338880eb21@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_160017_129634_6D6FED56 
X-CRM114-Status: GOOD (  10.39  )
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

On Fri, Jul 11, 2025 at 04:38:48PM +0300, Ilpo Järvinen wrote:

> +++ b/include/linux/pci.h
> @@ -1826,8 +1826,8 @@ static inline int pcie_set_target_speed(struct pci_dev *port,
>  #ifdef CONFIG_PCIEASPM
>  int pci_disable_link_state(struct pci_dev *pdev, int state);
>  int pci_disable_link_state_locked(struct pci_dev *pdev, int state);
> -int pci_enable_link_state(struct pci_dev *pdev, int state);

AFAICT there's no caller of this at all.  Why do we keep it?

> -int pci_enable_link_state_locked(struct pci_dev *pdev, int state);

We only have two callers of this (pcie-qcom.c and vmd.c, both in
drivers/pci/), so it's not clear to me that it needs to be in
include/linux/pci.h.

I'm a little dubious about it in the first place since I don't think
drivers should be enabling ASPM states on their own, but pcie-qcom.c
and vmd.c are PCIe controller drivers, not PCI device drivers, so I
guess we can live with them for now.

IMO the "someday" goal should be that we get rid of aspm_policy and
enable all the available power saving states by default.  We have
sysfs knobs that administrators can use if necessary, and drivers or
quirks can disable states if they need to work around hardware
defects.

I think the compiled-in aspm_policy default and the module parameters
are basically chicken switches that only exist because aspm.c and some
devices aren't robust enough.

Bjorn

