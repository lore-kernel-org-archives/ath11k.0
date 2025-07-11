Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A5F6C83F1A
	for <ath11k@archiver.kernel.org>; Fri, 11 Jul 2025 04:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=81p5tnhNzCXq2TBt4u1PpqrYa7AiyMz6g/KzjSd5pv0=; b=wUSf1y+yVG+uEBLSzzOKvp/YAZ
	LYsNiJfC/JqtwWQGBWC8zYJPQSF+ERkABmWuMVrxV5kocOIvP3MlIzt/erpqru/Am19SeZLtvODZi
	UY6jEANUQ3oU0i35gmverKrRGPDBL+id0F27QCkVe9fqiPrvsWDVwg62aUrp3t+P47endzoaII3j/
	BlT/lM0hgFNZtNFZgQTfPHf/cOJ7FjNu9vYOPTdCB8OHuGdBCOEQNkU11rykvU0TQ8+9TKELJpYRY
	GNxo0dOpUIX8OO4WpBY3VNUjuBxMYaU7HvirMhG2tZEPXtgu3CcW+cYZnfVZuEQnP+Zke7XgT8z92
	MGAOT0wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua5Mx-0000000Derx-1NEx;
	Fri, 11 Jul 2025 04:28:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua5Mv-0000000DerN-0CAj
	for ath11k@lists.infradead.org;
	Fri, 11 Jul 2025 04:28:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C194F43EC5;
	Fri, 11 Jul 2025 04:28:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F05D6C4CEF0;
	Fri, 11 Jul 2025 04:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752208096;
	bh=0C/vTM5o8IziGLnZ32LREb0cwoermYkw/D2NJ31Q1Kw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EM9K4lNx63NPSpJcWku7gT+TNpc/STC2mPEwXLxkY6CNZFu3oHUeQpQJTPJ7yh/BG
	 vVfKwUW1YnCt9l2SWBhwIDcq+fOWLtf/jz4y6wBiYzK84HKnNGG5tZbLMQZsNM+0d4
	 +CC4CQnXB2QZK6cvSWydVEhZVdXu1X3ZAcxvZO9UKHOhNPtyvjfgfQv7JMO1PSXsH5
	 RpPiUuRMM898YgxNMagM1cykHlL+9D64GaMlIpKxmst2VCpRURptimLoFJQDj7L+I8
	 3HuxEKFFuqgwiynVx34jdQCS+x6kY/OUwMnhPreAFRpj6BjIbIacn0k+eputxVO9cW
	 OwmD1qzHwTpRw==
Date: Fri, 11 Jul 2025 09:58:05 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
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
Message-ID: <irnkdlrmlozp7joydgnawfuivl2nnuxsb2t4osgxzbtyrfzd3n@7dhzjcd42aiw>
References: <20250609-mhi_bw_up-v4-0-3faa8fe92b05@qti.qualcomm.com>
 <20250609-mhi_bw_up-v4-6-3faa8fe92b05@qti.qualcomm.com>
 <qo6mb3qlt3xpuvhepwcv6be4wd53neee2t6buzk4tdiy22xsub@vu7lykp3rnu2>
 <226bab3a-54e5-94ad-9d84-0b82f9dc4e2f@linux.intel.com>
 <2a18cf9e-1dd2-4e09-81f4-eb1d07324c8e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a18cf9e-1dd2-4e09-81f4-eb1d07324c8e@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_212817_121953_02679BED 
X-CRM114-Status: GOOD (  37.24  )
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

On Wed, Jul 09, 2025 at 06:01:22PM GMT, Krishna Chaitanya Chundru wrote:
> 
> 
> On 7/9/2025 2:40 PM, Ilpo Järvinen wrote:
> > On Tue, 8 Jul 2025, Manivannan Sadhasivam wrote:
> > 
> > > On Mon, Jun 09, 2025 at 04:21:27PM GMT, Krishna Chaitanya Chundru wrote:
> > > > ASPM states are not being enabled back with pci_enable_link_state() when
> > > > they are disabled by pci_disable_link_state(). This is because of the
> > > > aspm_disable flag is not getting cleared in pci_enable_link_state(), this
> > > > flag is being properly cleared when ASPM is controlled by sysfs.
> > > > 
> > > 
> > > A comment in pcie_config_aspm_link() says:
> > > 
> > >   /* Enable only the states that were not explicitly disabled */
> > > 
> > > But the function is called from both aspm_attr_store_common() and
> > > __pci_enable_link_state(). So I don't know if this is behavior is intentional
> > > or wrong.
> > 
> > Hi,
> > 
> > I think it's intentional. Whether the behavior is useful is another good
> > question but the current behavior aligns with the explanation in the
> > comment.
> > 
> > My understanding of the situation is:
> > 
> > pci_disable_link_state() and pci_enable_link_state() are not symmetric
> > despite the names, never have been (this is one of those many quirks ASPM
> > driver has which should be eventually cleaned up, IMO).
> > 
> > It might be appropriate to rename pci_enable_link_state() to
> > pci_set_default_link_state() to match the name to its functionality (and
> > the function comment):
> > 
> >   * pci_enable_link_state - Clear and set the default device link state
> > 
> > Note: "the default ... link state".
> > 
> > 
> > I've already raised this concern earlier! As you see, my comment are
> > not getting addressed. I'd like to see the author does one of these:
> > 
> Hi llpo,
> 
> I replied to your comment on v3 patch[1], and I feel instead of having
> new function() we can use same API to our purpose.

You replied to Ilpo, but never got an agreement. Please try to close the
discussions before posting next rev. If reviewers forgot to reply to your query,
feel free to ping them in the same thread itself.

> > 1) Renames pci_enable_link_state() to pci_set_default_link_state()
> > 
> > 1b) If pci_enable_link_state() is still needed after that, a new function
> > is added to symmetrically pair with pci_disable_link_state().
> > 
> > or alternatively,
> > 
> > 2) Changelog justifies very clearly why this change is okay with the
> > existing callers. (And obviously the function comment should be altered to
> > match the functionality in that case too).
> > 
> > If approach 2 is chosen, it should be very carefully reviewed when it
> > comes to the callers.
> > 
> I am in favor of approach 2 which you suggested, but lets wait for other
> reviewers feedback on this. Based up on the response i will make
> necessary changes in v5.
> 

I would go for (1). It is always going to be a problem to change a legacy API
like this. We might end up causing regressions. So it is safe to rename to
reflect the purpose and try to come up with a new API that does what you want.
If callers want to migrate to the new API, they can also do it in the future.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

