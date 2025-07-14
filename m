Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92695C83F17
	for <ath11k@archiver.kernel.org>; Mon, 14 Jul 2025 19:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=ZdzQPg2QrZLlxLc6dyFgo0sJQxbLZVVXebZBirWRvQ0=; b=Ky+H4x/at3GYAH
	KycB9Szt1DGdv2JDXodcBXwa8KN6btppgt3XiVvXvOuxVw7MrKINVvPNsMiL6EQsJ2cK8b5DqVNZU
	MeFpO0GzG4Vi4m34igyujgnlbJYaP6DHD/o2/CyvHbmIvScfoKJvM100B8Ouh/5AaOUhGwxt5QmGC
	0+OBby/PWBplhuEdVrxUpzDrpwS46F8tSEhxPKA0F03K1OH1kZ3wfM8DrjZ2Z+X1d01VMUa0b+0qN
	rSK0i3KWvZrkqoYPO9rWCRQsysn8wmDDFiTDqkDBRfaShrVUQS1BDN5x1IGwYC3QSs9oxJbCArBhA
	bpkPTgexWJ6w2poNeE3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubOuU-0000000392m-3mRY;
	Mon, 14 Jul 2025 19:32:22 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubOuR-00000003929-43d0
	for ath11k@lists.infradead.org;
	Mon, 14 Jul 2025 19:32:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9DDF3A5738C;
	Mon, 14 Jul 2025 19:32:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 199CBC4CEED;
	Mon, 14 Jul 2025 19:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752521536;
	bh=AQrxO9GMuQ9aYr3Jm8n6Ii4kIOHde1vJf8LTBljYPok=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=kt2Y25vtysozivPuujqnU8y4JyYjsGSn7HGHKaj5Wh8im8SJ1Xp4AhW8AGo2lP1+5
	 zQEGTF+WevtHwlWsbyhKSwTxlET+cZv73pqoC8/5HHIVTIQ0twq6Iovw3U2pz4ue5j
	 r8L0vuloLaWvG/U1xJ3+3sALLbE6AZNV6/R/aByiqKxQEYiDjLiGmQTMyxiaD2bPe3
	 StjJOwSesK0gl0/B6TchmYHyagJ3VaUupNEVzqDfUZi8oDQe9ueKnLO4kpq221zmpT
	 ptb5CayJ9iFz5OOBWHkbyYDrRZBjKpBGeRRsEDSCQFAN6fN40wGIzb7/Gh4DPuThtc
	 mkMIBPsaLSQUQ==
Date: Mon, 14 Jul 2025 14:32:14 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
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
Message-ID: <20250714193214.GA2415073@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <470742a6-861e-498e-9da4-1fa213969c7e@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_123220_133839_3200308A 
X-CRM114-Status: GOOD (  22.61  )
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

On Sun, Jul 13, 2025 at 12:05:18AM +0800, Hans Zhang wrote:
> On 2025/7/12 17:35, Manivannan Sadhasivam wrote:
> ...

> > > IMO the "someday" goal should be that we get rid of aspm_policy
> > > and enable all the available power saving states by default.  We
> > > have sysfs knobs that administrators can use if necessary, and
> > > drivers or quirks can disable states if they need to work around
> > > hardware defects.
> > 
> > Yeah, I think the default should be powersave and let the users
> > disable it for performance if they want.
> 
> Perhaps I don't think so. At present, our company's testing team has
> tested quite a few NVMe SSDS. As far as I can remember, the SSDS
> from two companies have encountered problems and will hang directly
> when turned on. We have set CONFIG_PCIEASPM_POWERSAVE=y by default.
> When encountering SSDS from these two companies, we had to add
> "pcie_aspm.policy=default" in the cmdline, and then the boot worked
> normally. Currently, we do not have a PCIe protocol analyzer to
> analyze such issues. The current approach is to modify the cmdline.
> So I can't prove whether it's a problem with the Root Port of our
> SOC or the SSD device.

Have you reported these?

> Here I agree with Bjorn's statement that sometimes the EP is not
> necessarily very standard and there are no hardware issues.
> Personally, I think the default is default or performance. When
> users need to save power, they should then decide whether to
> configure it as powersave or powersupersave.  Sometimes, if the EP
> device connected by the customer is perfect, they can turn it on to
> save power. But if the EP is not perfect, at least they will
> immediately know what caused the problem.

We should discover device defects as early as possible so we can add
quirks for them.  Defaulting to ASPM being partly disabled means it
gets much less testing and users end up passing around "fixes" like
booting with "pcie_aspm.policy=default" or similar.  I do not want
users to trip over a device that doesn't work and have to look for
workarounds on the web.

I also think it's somewhat irresponsible of us to consume more power
than necessary.  But as Mani said, this would be a big change and
might have to be done with a BIOS date check or something to try to
avoid regressions.

Bjorn

