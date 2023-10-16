Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA38ECDB482
	for <ath11k@archiver.kernel.org>; Mon, 16 Oct 2023 14:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-ID:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V3yNZGJ+rJpHomMcatn1T1MDK4EjOWQCx9RTT7lCqpA=; b=r3io0CFLbNprWxO/Iw9FU28eh5
	Vcya7L+Oy3gOe4NB95cAWIZA/lMN9QBEP6v0crE4PjpO+JYLv4NPn4b5emmttUin22pTBJZRxcO3T
	vvHyQvCUvmsIVhcLLR3DjL5zM79NVlTJ4l4ovcNKXIxqVel5XLLUPXUx4Uv0ymsLN++TJgWE6UZGi
	Yc/1kFAvb3YVIYmJ+fs+xIAPy6ldzYhkJT6cFl7rKC5O98Bs0T1xmDk9kakhE8Sjkh2Rdv29l93Y6
	t+18P4TNJRPQtfOk9F6VMSXwbSYY5ZHT1d2EooGviPYu/4DSloryr3bpX4EmjRfL/t4SUJybNBJJe
	ESVfeD3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsOZZ-009rj6-0l;
	Mon, 16 Oct 2023 14:27:57 +0000
Received: from mgamail.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsOZU-009rgf-2A;
	Mon, 16 Oct 2023 14:27:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697466472; x=1729002472;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=WAHtEU+QRIIV0hjjctV4dFUOMA87lFSZZckv/e6FmbI=;
  b=IkTX6lhlY1FuqijdSWvkIzdDkZDGD46bsHERHQbhLODCsVzoxC9LqPd4
   u9JsyuuJ8gq3jYan1Pttp8LidJ/z81B7hCN51dWkZ+AQp3vfQSBFAC2tr
   FLPggcUPSVWGNweI7nHriuXEBBWT95mwuqp0NdiZYc84CiZW8aAky7/+t
   ko3E9uGNo27Mst/GHEGrnZjNoUUHX3uQ3X8WclFs7xrduH6gAF8hKAsHW
   MHwl/xY/q4Y8wJjvv1NQ9GDtVZNGDhozt0mvMHk5N/VxuN5+HpgOll/lZ
   G1ADAo++W6ePndVIW34cJm5HFYjaDjTOwzHIUdM7W2WCRaBc7MhvALhIn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="388396816"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="388396816"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 07:27:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="759416190"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="759416190"
Received: from rhaeussl-mobl.ger.corp.intel.com ([10.252.59.103])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 07:27:40 -0700
Date: Mon, 16 Oct 2023 17:27:37 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>, 
    "Rafael J . Wysocki" <rafael@kernel.org>
cc: linux-pci@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
    Rob Herring <robh@kernel.org>, 
    =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kw@linux.com>, 
    Lukas Wunner <lukas@wunner.de>, Heiner Kallweit <hkallweit1@gmail.com>, 
    Emmanuel Grumbach <emmanuel.grumbach@intel.com>, 
    LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
    ath10k@lists.infradead.org, ath11k@lists.infradead.org, 
    ath12k@lists.infradead.org, intel-wired-lan@lists.osuosl.org, 
    linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
    linux-mediatek@lists.infradead.org, linux-rdma@vger.kernel.org, 
    linux-wireless@vger.kernel.org, Netdev <netdev@vger.kernel.org>
Subject: Re: [PATCH v2 03/13] PCI/ASPM: Disable ASPM when driver requests
 it
In-Reply-To: <20231013164228.GA1117889@bhelgaas>
Message-ID: <a434d9f-48ec-cfe5-900-8923361798a9@linux.intel.com>
References: <20231013164228.GA1117889@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-158890400-1697462044=:1986"
Content-ID: <58c8d854-b57c-582-1ba0-efeb857febe@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_072752_769021_2149A43A 
X-CRM114-Status: GOOD (  38.01  )
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

--8323329-158890400-1697462044=:1986
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <a321263b-cac2-11d0-6cb1-43cc78d1c6d1@linux.intel.com>

On Fri, 13 Oct 2023, Bjorn Helgaas wrote:
> On Thu, Oct 12, 2023 at 01:56:16PM +0300, Ilpo Järvinen wrote:
> > On Wed, 11 Oct 2023, Bjorn Helgaas wrote:
> > > On Mon, Sep 18, 2023 at 04:10:53PM +0300, Ilpo Järvinen wrote:
> > > > PCI core/ASPM service driver allows controlling ASPM state through
> > > > pci_disable_link_state() and pci_enable_link_state() API. It was
> > > > decided earlier (see the Link below), to not allow ASPM changes when OS
> > > > does not have control over it but only log a warning about the problem
> > > > (commit 2add0ec14c25 ("PCI/ASPM: Warn when driver asks to disable ASPM,
> > > > but we can't do it")). Similarly, if ASPM is not enabled through
> > > > config, ASPM cannot be disabled.
> > ...
> 
> > > This disables *all* ASPM states, unlike the version when
> > > CONFIG_PCIEASPM is enabled.  I suppose there's a reason, and maybe a
> > > comment could elaborate on it?
> > >
> > > When CONFIG_PCIEASPM is not enabled, I don't think we actively
> > > *disable* ASPM in the hardware; we just leave it as-is, so firmware
> > > might have left it enabled.
> > 
> > This whole trickery is intended for drivers that do not want to have ASPM 
> > because the devices are broken with it. So leaving it as-is is not really 
> > an option (as demonstrated by the custom workarounds).
> 
> Right.
> 
> > > Conceptually it seems like the LNKCTL updates here should be the same
> > > whether CONFIG_PCIEASPM is enabled or not (subject to the question
> > > above).
> > > 
> > > When CONFIG_PCIEASPM is enabled, we might need to do more stuff, but
> > > it seems like the core should be the same.
> > 
> > So you think it's safer to partially disable ASPM (as per driver's 
> > request) rather than disable it completely? I got the impression that the 
> > latter might be safer from what Rafael said earlier but I suppose I might 
> > have misinterpreted him since he didn't exactly say that it might be safer 
> > to _completely_ disable it.
> 
> My question is whether the state of the device should depend on
> CONFIG_PCIEASPM.  If the driver does this:
> 
>   pci_disable_link_state(PCIE_LINK_STATE_L0S)
> 
> do we want to leave L1 enabled when CONFIG_PCIEASPM=y but disable L1
> when CONFIG_PCIEASPM is unset?
> 
> I can see arguments both ways.  My thought was that it would be nice
> to end up with a single implementation of pci_disable_link_state()
> with an #ifdef around the CONFIG_PCIEASPM-enabled stuff because it
> makes the code easier to read.

Hi Bjorn,

Thanks a lot for all your feedback so far, it has been very helpful.

I think there's still one important thing to discuss and none of the 
comments have covered that area so far.

The drivers that have workaround are not going to turn more dangerous than 
they're already without this change, so we're mostly within charted waters 
there even with what you propose. However, I think the bigger catch and 
potential source of problems, with both this v2 and your alternative, are 
the drivers that do not have the workarounds around CONFIG_PCIEASPM=n 
and/or _OSC permissions. Those code paths just call 
pci_disable_link_state() and do nothing else.

Do you think it's okay to alter the behavior for those drivers too 
(disable ASPM where it previously was a no-op)?

I'm okay with going the direction you indicated but I just wanted to ask
this in advance before reworking the behavior so I can take that detail 
also into account.


-- 
 i.
--8323329-158890400-1697462044=:1986
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--8323329-158890400-1697462044=:1986--

