Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F05C83F17
	for <ath11k@archiver.kernel.org>; Sun, 13 Jul 2025 16:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=68tf9z4Wea5dAjES3gO9S/dcMlfbzKvEen0uUrwXZEM=; b=bqdBjHNbc2nTFcm2ZHJekSLGJo
	YiLoJtHjrxsYk9TX2OF0L22aW89DQPPtwQVujqDcfHA8EEV2mbbDT5XmdghH3iRYUgAiqisuogGG/
	18TJ66ek2m7X8RbqmWzwk7rscp7idbEv+voiarInq1BuQoV6JoxwQE02LWAKssEzdi3RN3b6pfR56
	p/1oN2iMZGwpCaN5mtJq4J4IUO0C50bprDbfmc/Vaf+HftC9LNbTbECCr/rIQcY1s+D9SAL2ZjRHP
	YTZBAKiKuaeRDzj193tLXNRrPH2S16K/WEFxVWcwQlSI9zAQD6QbKNmwiWgrFv+8Lq0McGqWQ4I75
	xtbJUgXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uazah-00000000NvX-0eOH;
	Sun, 13 Jul 2025 16:30:15 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uazYf-00000000No7-45GL
	for ath11k@lists.infradead.org;
	Sun, 13 Jul 2025 16:28:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752424090; x=1783960090;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ifpdTOGwI1rhrSXr9K9a0r6Seeyr+cw10DFMmHo8Udg=;
  b=nLMdBwCrcCyfEcUO8sh5hRgaIxVWWpNaOq4YUkyA6uScEptMyQqS43To
   4AL3hjH2AoVteXgbGqq3WgrN/02vpYRKscl9bBtIP6JMM3joFOtDRPmHZ
   oF30Imre+fBLwhOypqmGzWS+A9aq/78jZNNVsqJyUy9hgaBPx5C4+HcbO
   zo8YXswuVappgTfy2DgE/OXq4CKib77yeoqCuanZ/0HgeZfy838RkTNZQ
   cnMPPCqZ5HB6asXn7MRP6qhLDttUVbj1vGx1XvQFvvphlqzxbaCMHtAfN
   tLaW4wpAJ9IqG4/jpH0NYPRTtcYl7M9vi7FCI2Ju87NcYn75/kdrykwnk
   w==;
X-CSE-ConnectionGUID: Y3XonQSpS9azqkz12hsVJw==
X-CSE-MsgGUID: So5tz9MaTciNvTLwxM9uDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54344679"
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; 
   d="scan'208";a="54344679"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 09:28:09 -0700
X-CSE-ConnectionGUID: gK+e7tQVQIOInWqljWHVmA==
X-CSE-MsgGUID: aLHxtV24T2WZICr7KJ1bcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; 
   d="scan'208";a="160767417"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.175])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 09:28:01 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Sun, 13 Jul 2025 19:27:57 +0300 (EEST)
To: Manivannan Sadhasivam <mani@kernel.org>
cc: Bjorn Helgaas <helgaas@kernel.org>, 
    Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
    Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
    Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
    Jeff Johnson <jjohnson@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
    =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kwilczynski@kernel.org>, 
    linux-pci@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, 
    linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
    qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com, 
    quic_vpernami@quicinc.com, quic_mrana@quicinc.com, 
    Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH v4 06/11] PCI/ASPM: Clear aspm_disable as part of
 __pci_enable_link_state()
In-Reply-To: <qay63njqf7z7mchizt5sm66i67rvxxxicikxmfuvllmmxfy7ek@mulnjvde5q7w>
Message-ID: <9543b1eb-5bd2-bea1-742f-60cbc28bb365@linux.intel.com>
References: <604ffae3-1bfc-0922-b001-f3338880eb21@linux.intel.com> <20250711230013.GA2309106@bhelgaas> <qay63njqf7z7mchizt5sm66i67rvxxxicikxmfuvllmmxfy7ek@mulnjvde5q7w>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1313851053-1752424077=:951"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_092810_090072_DA73DAE8 
X-CRM114-Status: GOOD (  27.64  )
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1313851053-1752424077=:951
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sat, 12 Jul 2025, Manivannan Sadhasivam wrote:
> On Fri, Jul 11, 2025 at 06:00:13PM GMT, Bjorn Helgaas wrote:
> > On Fri, Jul 11, 2025 at 04:38:48PM +0300, Ilpo J=C3=A4rvinen wrote:
> >=20
> > > +++ b/include/linux/pci.h
> > > @@ -1826,8 +1826,8 @@ static inline int pcie_set_target_speed(struct =
pci_dev *port,
> > >  #ifdef CONFIG_PCIEASPM
> > >  int pci_disable_link_state(struct pci_dev *pdev, int state);
> > >  int pci_disable_link_state_locked(struct pci_dev *pdev, int state);
> > > -int pci_enable_link_state(struct pci_dev *pdev, int state);
> >=20
> > AFAICT there's no caller of this at all.  Why do we keep it?
> >=20
>=20
> I'm just working on a series to convert the ath{10/11/12}k drivers to use=
 this
> API instead of modifying LNKCTL register directly:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/net/wireless/ath/ath12k/pci.c#n961

Great. I assume but "this API" you meant disable/enable link state that=20
are real pair unlike the current pci_enable_link_state()?

Did ath1xk need to do some hw specific register updates when changing ASPM=
=20
state?

I tried to do similar conversion in r8169 (and actually also ath1xk too)=20
but it was a while ago already. If I understood the code correctly, r8169=
=20
seems to write some HW specific registers when changing ASPM state so I=20
would have likely need to add some ops for it to play nice with state=20
changes not originating from the driver itself but from the ASPM driver,=20
which is where the work then stalled.

> > > -int pci_enable_link_state_locked(struct pci_dev *pdev, int state);
> >=20
> > We only have two callers of this (pcie-qcom.c and vmd.c, both in
> > drivers/pci/), so it's not clear to me that it needs to be in
> > include/linux/pci.h.
> >=20
> > I'm a little dubious about it in the first place since I don't think
> > drivers should be enabling ASPM states on their own, but pcie-qcom.c
> > and vmd.c are PCIe controller drivers, not PCI device drivers, so I
> > guess we can live with them for now.
> >=20
> > IMO the "someday" goal should be that we get rid of aspm_policy and
> > enable all the available power saving states by default.  We have
> > sysfs knobs that administrators can use if necessary, and drivers or
> > quirks can disable states if they need to work around hardware
> > defects.
>=20
> Yeah, I think the default should be powersave and let the users disable i=
t for
> performance if they want.

I'm certainly not against improvements in this front, but I think we need=
=20
to get rid off custom ASPM disable code from the drivers first.

--=20
 i.

--8323328-1313851053-1752424077=:951--

