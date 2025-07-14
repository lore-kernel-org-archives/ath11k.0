Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0457FC83F1A
	for <ath11k@archiver.kernel.org>; Mon, 14 Jul 2025 19:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=BF2/q/xXFq0PwZtu4TIzPr9mcBMQVtT/L3B/17YKD9w=; b=Oz8lZr2K+hoMseJcMnCZ5Zg2q5
	WaQNQ9q02ktw60Zzd/CG6ap0b2s/Og0gUdSHeOMzqByvntbRZ8D/lTs9VCPO10c4krRoVrSx+cNmQ
	RnbnVZ+zFWoMLfLnKuDJhwhFhgGT/krNpJDxePD7chSeWo+AYxCXeWOsxKwuCqkm8LciPJ2ysQ42Y
	Zph5gTYEvjT4wN0c4xzIpR57Er7urqAlQ4cyi1S8/DNrBb4PXLqVvPOtzJ3a+Y+FPMYNEPY4NTI50
	zsG5YX2L5s9QSDX7YQTOeofLzgv6uVa+kjQrBcB/4e8VvoH9+ymVZZUaWkSP6wERbfcA0GAeu8u6M
	9wjIST0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubP42-000000039kp-3rxi;
	Mon, 14 Jul 2025 19:42:14 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubP3z-000000039kM-3GxO
	for ath11k@lists.infradead.org;
	Mon, 14 Jul 2025 19:42:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 062A3A5736E;
	Mon, 14 Jul 2025 19:42:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7978DC4CEED;
	Mon, 14 Jul 2025 19:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752522130;
	bh=ZwfxCQTzGcagrhNN128iX8ZCx0f/OBRMMJHaiqxxpiM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ecMBadbjd7FZqxSx5x58d/jEVKcEidTJa/y2tEB91mpgRzILb/XNeffNmHfcve2at
	 Bfu/oNAn0YGbWYgbGvB7St73SXCvXih8WZCa20Sfp4N5Slw/Jz1GVQn7FrHoJDX4w3
	 DVmrHZso9y/CxNND/f7hplvFfiJbBTVs5nfv3lDnHta/jrKE8ACVOCef4lY1p20DRW
	 iipvykN6PuX4S3ek4w1Iqk5wvRbAkDexurWSHWFpuyxLw/DgnwyMQ9nRQBpymbNQTL
	 wp+2fshCBaFY6LY1sI1L8C/yLD1oVWjJ/qHQR//JYsEsQ1Xw5v+NLKUgeDRcoIoAH3
	 G3ijQrgYbpjzg==
Date: Mon, 14 Jul 2025 14:42:09 -0500
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
Message-ID: <20250714194209.GA2415586@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <gwpn5no4i2wwwk3qo4tcgp6z6floo6k2ymzfuucg3tbwtmccte@ydsupmrd2nqu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_124211_951697_E94FFD50 
X-CRM114-Status: GOOD (  33.05  )
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

On Mon, Jul 14, 2025 at 07:21:21PM +0530, Manivannan Sadhasivam wrote:
> On Sun, Jul 13, 2025 at 07:27:57PM GMT, Ilpo Järvinen wrote:
> > On Sat, 12 Jul 2025, Manivannan Sadhasivam wrote:
> > > On Fri, Jul 11, 2025 at 06:00:13PM GMT, Bjorn Helgaas wrote:
> > > > On Fri, Jul 11, 2025 at 04:38:48PM +0300, Ilpo Järvinen wrote:
> > > > 
> > > > > +++ b/include/linux/pci.h
> > > > > @@ -1826,8 +1826,8 @@ static inline int pcie_set_target_speed(struct pci_dev *port,
> > > > >  #ifdef CONFIG_PCIEASPM
> > > > >  int pci_disable_link_state(struct pci_dev *pdev, int state);
> > > > >  int pci_disable_link_state_locked(struct pci_dev *pdev, int state);
> > > > > -int pci_enable_link_state(struct pci_dev *pdev, int state);
> > > > 
> > > > AFAICT there's no caller of this at all.  Why do we keep it?
> > > 
> > > I'm just working on a series to convert the ath{10/11/12}k
> > > drivers to use this API instead of modifying LNKCTL register
> > > directly:
> > > 
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/wireless/ath/ath12k/pci.c#n961
> > 
> > Great. I assume but "this API" you meant disable/enable link state
> > that are real pair unlike the current pci_enable_link_state()?
> 
> Yes. I actually based my series on top of this series, but I guess I
> should just merge the API change patch to my series as it is
> relatively small compared to this one (so it will get merged
> quicker).
> 
> > Did ath1xk need to do some hw specific register updates when
> > changing ASPM state?
> 
> Fortunately, no.
> 
> > I tried to do similar conversion in r8169 (and actually also
> > ath1xk too) but it was a while ago already. If I understood the
> > code correctly, r8169 seems to write some HW specific registers
> > when changing ASPM state so I would have likely need to add some
> > ops for it to play nice with state changes not originating from
> > the driver itself but from the ASPM driver, which is where the
> > work then stalled.

Pffft.  Device-specific configuration when changing ASPM state is a
device defect in my book.  ASPM is clearly designed to be managed
outside the driver.  What is the driver supposed to do about this if
the platform retains control of ASPM?  There's no possibility of a
driver hook for that.

> ath driver changes are straightforward, but I need to add an inline
> function to convert lnkctl setting to aspm states:
> 
> static inline int ath_pci_aspm_state(u16 lnkctl)
> {
> 	int state = 0;
> 
> 	if (lnkctl & PCI_EXP_LNKCTL_ASPM_L0S)
> 		state |= PCIE_LINK_STATE_L0S;
> 	if (lnkctl & PCI_EXP_LNKCTL_ASPM_L1)
> 		state |= PCIE_LINK_STATE_L1;
> 
> 	return state;
> }
> 
> Currently, it is in ath/ath.h, but if you feel that we should move it to
> include/linux/pci.h, let me know!

I haven't looked at the implementation here, but I don't think drivers
should check LNKCTL to decide this.  If the device doesn't work with
L0s or L1 or whatever, that's what the driver should tell us.

Bjorn

