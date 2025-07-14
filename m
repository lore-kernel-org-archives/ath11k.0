Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD384C83F1A
	for <ath11k@archiver.kernel.org>; Mon, 14 Jul 2025 19:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=CFU/UOysJkkqVB19cfSzrW/e6XiHiwgyLb28qHpTssA=; b=eqvVahAdLmC4GwjUUYyriac7i0
	vlo2gJ2d3nHVS/J7sUqHisW4/YAfo9IEnzvKfnGJhM+8PLlNyg8PxvN8ltY9pMmUGazN0g6Uvycxt
	j0KO0k6dQWhM5R2l6ihcNwJMivdr+wNvg5a4PYZMhcCm8i3WnQnQ4NByydCf9msp98TeFWDPqrvqA
	QOumGaPW+gQND/52BltZ7mKDI2k489IHB6WBKxjWbyK+HJeG3RIGPhig2gabH1l7bva7518TyrQ/6
	k/c0Hw/E4AbBPaFi82yZN8iVTbh8sZG7k7YqJZCuMZE/3SShovFz8uU0OCWqlW27+MsLvBE9ooxBC
	0dMq8OlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubOjz-000000038Uk-0HkX;
	Mon, 14 Jul 2025 19:21:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubOjx-000000038Ua-3goX
	for ath11k@lists.infradead.org;
	Mon, 14 Jul 2025 19:21:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 56BE161462;
	Mon, 14 Jul 2025 19:21:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D403C4CEED;
	Mon, 14 Jul 2025 19:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752520886;
	bh=ssDIZ6lVVA4nrtzbmsJMiQpIz0j9r1OlWlOQVhLVCvs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=IfcY4L78k/3SXQBULobxN/UA/xkUaUJv8YvUlHtFq8SQMkkvrTOf57L0/xtif0kSb
	 AARXv/2u9T6tCh5t0Ghqm6rXXPwMEkw0jIBAkQ3on7G3+sn65Tn11RUlZlmeagaLct
	 7KrF4B+138fcR1lYKla5ELX244Pnt1tU4EmObeUmmOgN6u5o+1yG1Vlo5SwJ6OOi+5
	 zweksJIKL/m41i3EEmooQWe5YQa45PY1e2CW3Gwq2N51QsKmGXxVkQWrz9FAaOwe2C
	 u5xJm958+ifYl/pNM/j/Jlzzt+nqfMINOoEjn13jtGRFsIFLYlsOgEkswevC4D9i5W
	 K63r8BywQb3Iw==
Date: Mon, 14 Jul 2025 14:21:25 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
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
Message-ID: <20250714192125.GA2414954@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <qay63njqf7z7mchizt5sm66i67rvxxxicikxmfuvllmmxfy7ek@mulnjvde5q7w>
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

On Sat, Jul 12, 2025 at 03:05:28PM +0530, Manivannan Sadhasivam wrote:
> On Fri, Jul 11, 2025 at 06:00:13PM GMT, Bjorn Helgaas wrote:
> > On Fri, Jul 11, 2025 at 04:38:48PM +0300, Ilpo Järvinen wrote:
> > 
> > > +++ b/include/linux/pci.h
> > > @@ -1826,8 +1826,8 @@ static inline int pcie_set_target_speed(struct pci_dev *port,
> > >  #ifdef CONFIG_PCIEASPM
> > >  int pci_disable_link_state(struct pci_dev *pdev, int state);
> > >  int pci_disable_link_state_locked(struct pci_dev *pdev, int state);
> > > -int pci_enable_link_state(struct pci_dev *pdev, int state);
> > 
> > AFAICT there's no caller of this at all.  Why do we keep it?
> 
> I'm just working on a series to convert the ath{10/11/12}k drivers to use this
> API instead of modifying LNKCTL register directly:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/wireless/ath/ath12k/pci.c#n961

Awesome!  It will be great to get more of the ASPM gunk out of
drivers.

