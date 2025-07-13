Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B513C83F1D
	for <ath11k@archiver.kernel.org>; Sun, 13 Jul 2025 16:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-ID:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:
	Reply-To:Content-Transfer-Encoding:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vyHQbXrlHr87ruEbCmXWncSfnXgSsRVy9JIAXGWn0mA=; b=k9J6M4VE5hXxK3jBoZTLCkI215
	PScDpZFZmRIUVC5D6FnNerwG0Vfyx+iPS/423IKLvowJz/YXX6wzrRf3smjgq4hNffbFeV4C6DHGc
	6SsNC0fD1LX9uzIQd6yG+Fd2J/9gGTfhpjlYIv/1MLKK3MgP1nwIYWekotl/6IIHHSTVIHB2aCg6j
	ik8ysvIkoZklER909LJXRrWI35j/hh0D9e8iguD9fh0UEM8OLmfK18pvbDmcag+bV9EXD12Berwrp
	EuYnteVS6Pk3aez9Pn+Cmap24T3tTILr5boq46f3NnrngP7sxiDXbbXcLDBSK8gD5pWG/bgXxm/Ug
	9XbWS2yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaznV-00000000Omv-47LF;
	Sun, 13 Jul 2025 16:43:30 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaziZ-00000000ORK-2XdZ
	for ath11k@lists.infradead.org;
	Sun, 13 Jul 2025 16:38:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752424704; x=1783960704;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=r9omAfQ62jAfsMfQ/qPf0fsbgkNejo1Y09cKhAXRXJ0=;
  b=jXFzvLN0cJxi56A2311uPc6ZwsJyQ5s+eLeamuE68QY5c7tSjP1LYFJ3
   pCVBX3m/R1PRMvLH0QoA/9tdNIECkXF5oHSwzqIz7PyvFoXSaTWbk4D0s
   5Pdca5+Z6p69MCiYJYSiry8X9Mowmp5Llq+NEn0zd+hsrp+VZ57HEhSl0
   oou4zKcXjAMPdnqbXphW0tSWuaf5wuEAON2ytTPEDeK2TxjfMXXswpArz
   qjfDXI0Tu4NLruuT3H6jlxowmQ/G6rPqaxWxAYvisbyySBU7kXsmim1zw
   RV/0nlSkm+lxJq4Uus/LGSUYH/WJdOJpJ8dve5b4H2a/ThzqBkKuhtODK
   Q==;
X-CSE-ConnectionGUID: zk2sSU08Q6GHeds0xU0/BQ==
X-CSE-MsgGUID: 8vivWFkgRdafjKYcN8sF2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="53854146"
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; 
   d="scan'208";a="53854146"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 09:38:21 -0700
X-CSE-ConnectionGUID: Is+ut3sfT++qm9bRIX89+A==
X-CSE-MsgGUID: DAa15wyZRYCmBidYqDsthQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; 
   d="scan'208";a="193961296"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.175])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 09:38:13 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Sun, 13 Jul 2025 19:38:09 +0300 (EEST)
To: Bjorn Helgaas <helgaas@kernel.org>
cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
    Manivannan Sadhasivam <mani@kernel.org>, 
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
In-Reply-To: <20250711230013.GA2309106@bhelgaas>
Message-ID: <84f1ddef-b4a1-958f-96f1-c84f2fe0baf3@linux.intel.com>
References: <20250711230013.GA2309106@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1407827006-1752423401=:951"
Content-ID: <47e4c48a-96af-e668-6d87-dc9de7a75f73@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_093823_663885_03460B43 
X-CRM114-Status: GOOD (  20.84  )
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

--8323328-1407827006-1752423401=:951
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <5ac44928-7118-d9fe-5985-2f62ffbf9046@linux.intel.com>

On Fri, 11 Jul 2025, Bjorn Helgaas wrote:

> On Fri, Jul 11, 2025 at 04:38:48PM +0300, Ilpo J=E4rvinen wrote:
>=20
> > +++ b/include/linux/pci.h
> > @@ -1826,8 +1826,8 @@ static inline int pcie_set_target_speed(struct pc=
i_dev *port,
> >  #ifdef CONFIG_PCIEASPM
> >  int pci_disable_link_state(struct pci_dev *pdev, int state);
> >  int pci_disable_link_state_locked(struct pci_dev *pdev, int state);
> > -int pci_enable_link_state(struct pci_dev *pdev, int state);
>=20
> AFAICT there's no caller of this at all.  Why do we keep it?

It was added to match the disable side despite not having users. I don't=20
oppose dropping the unused one.

> > -int pci_enable_link_state_locked(struct pci_dev *pdev, int state);
>=20
> We only have two callers of this (pcie-qcom.c and vmd.c, both in
> drivers/pci/), so it's not clear to me that it needs to be in
> include/linux/pci.h.
>
> I'm a little dubious about it in the first place since I don't think
> drivers should be enabling ASPM states on their own, but pcie-qcom.c
> and vmd.c are PCIe controller drivers, not PCI device drivers, so I
> guess we can live with them for now.

There seem to be some drivers which have issues if certain ASPM states are=
=20
enabled during some phase of operation, so they'd want to disable ASPM=20
for a while and re-enable it after past the danger zone, which is why I=20
had to create the symmetric pair for disabling states in a series trying=20
to remove custom ASPM code from other drivers (these patches are extracted=
=20
from that series). Currently those drivers mess with LNKCTL directly.

(The driver changes we not finished because it seemed I'd have needed to=20
add some ops to allow writing HW specific registers of ASPM state change=20
which the ASPM driver could invoke to infor the driver about state=20
changes.)

> IMO the "someday" goal should be that we get rid of aspm_policy and
> enable all the available power saving states by default.  We have
> sysfs knobs that administrators can use if necessary, and drivers or
> quirks can disable states if they need to work around hardware
> defects.
>
> I think the compiled-in aspm_policy default and the module parameters
> are basically chicken switches that only exist because aspm.c and some
> devices aren't robust enough.

There's also too much custom code in drivers currently.

--=20
 i.
--8323328-1407827006-1752423401=:951--

