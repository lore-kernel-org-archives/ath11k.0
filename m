Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE398C83F03
	for <ath11k@archiver.kernel.org>; Wed,  9 Jul 2025 10:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fbNNCtjsNlTPrIz54GXVd3F7cUD5z7XdrJIkSTayNvk=; b=4Gc2BGWqivZd802LRN/iVd0pPB
	sXMM2+KwQeE7J40fP9iFh+E1lB9iLFb36dIsT9+ieQ3kUYqmGHzfA00+XR/kXnvzjylxt3sTEajch
	ErPJRsxGcfTsbJg9MWWxO8FP9sr8xF8/C4tRmhOoI1JaYl5W0CtdFr1R65N405ealtBHPhp/7mx6o
	QqRyUog8lWmiier+STkKshfNEeCXBqYRKvjRyw3HL5lOVOwCl1nQcHlobBinz3VXCZoDZmMgFxWLE
	mmp0oSROnNxcQct86ZQtWRwthX6qCxaBbT46ECGEG3YmMjtKOjW9ECpy3ED+KoP+NvWaRWkY5gOev
	+9hP+zPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZSI7-00000008LtW-1f54;
	Wed, 09 Jul 2025 10:44:43 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZQpW-0000000850V-2JyE
	for ath11k@lists.infradead.org;
	Wed, 09 Jul 2025 09:11:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752052266; x=1783588266;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=e+AlNfEIWLEOUZb0WGiJuKUfwZfi9mwK1UILrKSjqnk=;
  b=gJ/tuJ2WqHFlnaxYw+SHsVEHxY+55+c7yr6ssmF/jnXj38/dUCJTU6fa
   vT0aG8dS8GcsGrm+plP2vHfNuNfWDAdyjpANqpZ6TwvJv9qxyZenQmPwF
   +oqC83y0IgVv6m1I18Ig85b4nfOlfYTn2bdSJHaLTB422jg8fuqDcrAv9
   6lemH+O0nuaI0i+2Z5ib2CyvAb6AWgajF2GivFDHyAd36JdHkI3fL5f8V
   emGS3uI9mpbrP7+PLyM6EjlZtR342YNBTHjKiwTy3Z4jlYdxVZUe97Tsy
   M11SycM864q4I8k0ITpTuFCn8SBN7d5S9ADasbvgl2NgF2JFHzc4QFYrs
   Q==;
X-CSE-ConnectionGUID: r/67xekHTaaojsZvUgYg9g==
X-CSE-MsgGUID: W5d8DHsDSnG5he1EL9IzXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54163412"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="54163412"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 02:11:04 -0700
X-CSE-ConnectionGUID: 2YofaDi1Rfa2S2hif6cl5Q==
X-CSE-MsgGUID: uvbwgx//RiSED5u6g+R/jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="155458540"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.168])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 02:10:56 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 9 Jul 2025 12:10:52 +0300 (EEST)
To: Manivannan Sadhasivam <mani@kernel.org>
cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
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
In-Reply-To: <qo6mb3qlt3xpuvhepwcv6be4wd53neee2t6buzk4tdiy22xsub@vu7lykp3rnu2>
Message-ID: <226bab3a-54e5-94ad-9d84-0b82f9dc4e2f@linux.intel.com>
References: <20250609-mhi_bw_up-v4-0-3faa8fe92b05@qti.qualcomm.com> <20250609-mhi_bw_up-v4-6-3faa8fe92b05@qti.qualcomm.com> <qo6mb3qlt3xpuvhepwcv6be4wd53neee2t6buzk4tdiy22xsub@vu7lykp3rnu2>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_021106_627761_982EF896 
X-CRM114-Status: GOOD (  27.22  )
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

On Tue, 8 Jul 2025, Manivannan Sadhasivam wrote:

> On Mon, Jun 09, 2025 at 04:21:27PM GMT, Krishna Chaitanya Chundru wrote:
> > ASPM states are not being enabled back with pci_enable_link_state() when
> > they are disabled by pci_disable_link_state(). This is because of the
> > aspm_disable flag is not getting cleared in pci_enable_link_state(), this
> > flag is being properly cleared when ASPM is controlled by sysfs.
> > 
> 
> A comment in pcie_config_aspm_link() says:
> 
>  /* Enable only the states that were not explicitly disabled */
> 
> But the function is called from both aspm_attr_store_common() and
> __pci_enable_link_state(). So I don't know if this is behavior is intentional
> or wrong. 

Hi,

I think it's intentional. Whether the behavior is useful is another good 
question but the current behavior aligns with the explanation in the 
comment.

My understanding of the situation is:

pci_disable_link_state() and pci_enable_link_state() are not symmetric 
despite the names, never have been (this is one of those many quirks ASPM 
driver has which should be eventually cleaned up, IMO).

It might be appropriate to rename pci_enable_link_state() to 
pci_set_default_link_state() to match the name to its functionality (and 
the function comment):

 * pci_enable_link_state - Clear and set the default device link state

Note: "the default ... link state".


I've already raised this concern earlier! As you see, my comment are 
not getting addressed. I'd like to see the author does one of these:

1) Renames pci_enable_link_state() to pci_set_default_link_state()

1b) If pci_enable_link_state() is still needed after that, a new function
is added to symmetrically pair with pci_disable_link_state().

or alternatively,

2) Changelog justifies very clearly why this change is okay with the 
existing callers. (And obviously the function comment should be altered to 
match the functionality in that case too).

If approach 2 is chosen, it should be very carefully reviewed when it 
comes to the callers.


> > Clear the aspm_disable flag with the requested ASPM states requested by
> > pci_enable_link_state().
> > 
> > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> 
> Fixes tag?
> 
> - Mani
> 
> > ---
> >  drivers/pci/pcie/aspm.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
> > index 94324fc0d3e650cd3ca2c0bb8c1895ca7e647b9d..0f858ef86111b43328bc7db01e6493ce67178458 100644
> > --- a/drivers/pci/pcie/aspm.c
> > +++ b/drivers/pci/pcie/aspm.c
> > @@ -1453,6 +1453,7 @@ static int __pci_enable_link_state(struct pci_dev *pdev, int state, bool locked)
> >  		down_read(&pci_bus_sem);
> >  	mutex_lock(&aspm_lock);
> >  	link->aspm_default = pci_calc_aspm_enable_mask(state);
> > +	link->aspm_disable &= ~state;
> >  	pcie_config_aspm_link(link, policy_to_aspm_state(link));
> >  
> >  	link->clkpm_default = (state & PCIE_LINK_STATE_CLKPM) ? 1 : 0;
> > 
> > -- 
> > 2.34.1
> > 
> 
> 

-- 
 i.


