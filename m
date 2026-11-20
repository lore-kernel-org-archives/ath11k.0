Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FC4606A325
	for <ath11k@archiver.kernel.org>; Fri, 20 Nov 2026 17:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BtopkW4Z;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Da7eOPDc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Unsubscribe-Post:List-Owner;
	bh=phOjL0w+VRiN+NhcbEJ2zR/nluvM+fUE8X10MN17x2s=; b=BtopkW4ZVVs+vCPz5ZjodIlWmL
	kyMPkhxOtSjxRknIZckXs23uxsjqd0bOvRoDsfRderncc0XmPN5L8Sgx6uFwncCmzZl5z/6zMpm4h
	Ssi3bRaGukA5uZeEvCpMQYsx6UQ1bCXfnomMXumFHgX01xhbDQjQzo26nTfU1a9ZhLOEB8HtPSzW5
	nG2XPs9aBz37qzIhK2D1Cd1sQBmFdu2eHJ7C82XQ+/GnQbvzmKz5jJgKvYJerXVX6QrtR4M16b7EB
	dE1G9jiRHn2NRk3uViJ+bL8HKzPcAyPKnLQ1aLLKKQCZBktNrANukc/Iu7EFlOrgJ6SEAuzO3Ed3X
	0fGzzBFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUS5A-0000000FchV-0i1Q;
	Fri, 20 Nov 2026 17:07:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUS58-0000000FchM-3U54
	for ath11k@lists.infradead.org;
	Fri, 20 Nov 2026 17:07:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2236845555;
	Fri, 20 Nov 2026 17:07:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EB201F000C6;
	Fri, 20 Nov 2026 17:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795194445;
	bh=phOjL0w+VRiN+NhcbEJ2zR/nluvM+fUE8X10MN17x2s=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=Da7eOPDchXz2Kj3exn9wy+clU1mj33INfXEXB8ylea+f2OvZrSHNdgtxpKwQNSSWW
	 uAKHXidzc7d6LAMV4oYvljXMhyLCRT47HEQQMcYSbPz+1kttrMdd6G4v5wfZ0UITVf
	 eOwBtH8Ln/DwSgxnQXZZWDDRnRP71OSc8sj9DOvH6Xq+vshEZBlk8wZ7CTSBJcSKV4
	 WVK1ntZnq/5L02Vzle4vy0CzpF0qoupHIkEObrEwm/dni7AFXPiO472N+R5j94qF94
	 gmo7zhl5IS9PMk39p/O5BzH9813fi2RGInHrUjBUY8cU3q5KRgRUZJNQARg/1HBz4f
	 c7wxZc87suYPA==
Date: Fri, 20 Nov 2026 11:07:24 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	qiang.yu@oss.qualcomm.com, Val Packett <val@packett.cool>
Subject: Re: [PATCH v6 1/7] PCI/bwctrl: Set host bridge OPP and optionally
 disable ASPM around link retraining
Message-ID: <20261120170724.GA889135@bhelgaas>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119-bwscale-v6-1-9a9a715fcb46@oss.qualcomm.com>
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 06:26:33PM +0530, Krishna Chaitanya Chundru wrote:
> PCIe host bridge devices may need their operating point raised before
> retraining to a higher link speed so that hardware resources (e.g., RPMh
> votes on Qualcomm platforms) are available at the requested data rate.
> After retraining, the operating point must be updated to reflect the
> actual negotiated speed.
> 
> Add pcie_set_opp() to look up an OPP on the host bridge parent device
> using a key of (total link rate in kHz, LNKCTL2 Target Link Speed
> level). The total link rate is the per-lane rate multiplied by the
> link width, so that OPP tables can carry separate entries per generation
> and width, e.g. Gen 3 x1 and Gen 3 x2.
> 
> In pcie_set_target_speed(), call pcie_set_opp() before retraining only
> when upscaling (speed_req > cur_bus_speed), since only raising the
> operating point requires pre-staging hardware.  After retraining, call
> pcie_set_opp() unconditionally with the actual cur_bus_speed to settle
> the votes.  Both calls are skipped for downstream ports of PCIe switches,
> as those are outside the host controller's scope.
> 
> Some controllers also require ASPM to be disabled around link retraining.
> Add a disable_aspm_for_retrain flag to pci_host_bridge; when set,
> pcie_set_target_speed() saves the child device's ASPM state, disables
> all ASPM link states before retraining, and restores them afterward. The
> child device is used because the ASPM core ignores requests made on the
> Root Port itself and configures the link through its downstream device.
> The states are restored with pci_force_enable_link_state(), as a
> plain enable does not undo pci_disable_link_state().

This ASPM part looks like it should be split into a separate patch.
Apparently the ASPM retrain issue is controller errata, not PCIe spec
behavior, so it should be separated and described that way.

> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
> ---
>  drivers/pci/pcie/bwctrl.c | 65 ++++++++++++++++++++++++++++++++++++++++++++++-
>  include/linux/pci.h       |  1 +
>  2 files changed, 65 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
> index 3b1122461ffd..c1e749df5bbe 100644
> --- a/drivers/pci/pcie/bwctrl.c
> +++ b/drivers/pci/pcie/bwctrl.c
> @@ -28,9 +28,11 @@
>  #include <linux/mutex.h>
>  #include <linux/pci.h>
>  #include <linux/pci-bwctrl.h>
> +#include <linux/pm_opp.h>
>  #include <linux/rwsem.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
> +#include <linux/units.h>
>  
>  #include "../pci.h"
>  #include "portdrv.h"
> @@ -98,6 +100,37 @@ static int pcie_bwctrl_change_speed(struct pci_dev *port, u16 target_speed, bool
>  	return pcie_retrain_link(port, use_lt);
>  }
>  
> +static int pcie_set_opp(struct pci_dev *pdev, struct pci_host_bridge *host,
> +			enum pci_bus_speed speed)
> +{
> +	struct device *dev = host->dev.parent;
> +	struct dev_pm_opp_key key = {};
> +	int ret, freq_mbps, width;
> +	unsigned long freq_kbps;
> +	struct dev_pm_opp *opp;
> +	u16 lnksta;
> +
> +	pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &lnksta);
> +	width = FIELD_GET(PCI_EXP_LNKSTA_NLW, lnksta);
> +
> +	freq_mbps = pcie_dev_speed_mbps(speed);
> +	if (freq_mbps < 0)
> +		return -EINVAL;
> +
> +	freq_kbps = freq_mbps * KILO * width;
> +	key.freq = freq_kbps;
> +	key.level = pci_bus_speed2lnkctl2(speed);
> +	opp = dev_pm_opp_find_key_exact(dev, &key, true);
> +	if (!IS_ERR(opp)) {
> +		ret = dev_pm_opp_set_opp(dev, opp);
> +		if (ret)
> +			dev_err(dev, "Failed to set OPP for freq (%lu): %d\n",
> +				freq_kbps, ret);
> +		dev_pm_opp_put(opp);
> +	}
> +	return 0;
> +}
> +
>  /**
>   * pcie_set_target_speed - Set downstream Link Speed for PCIe Port
>   * @port:	PCIe Port
> @@ -118,9 +151,12 @@ static int pcie_bwctrl_change_speed(struct pci_dev *port, u16 target_speed, bool
>  int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
>  			  bool use_lt)
>  {
> +	struct pci_host_bridge *host = pci_find_host_bridge(port->bus);
> +	bool is_rootbus = pci_is_root_bus(port->bus);
>  	struct pci_bus *bus = port->subordinate;
> +	struct pci_dev *child = NULL, *dev;
> +	int aspm_state = 0, ret;
>  	u16 target_speed;
> -	int ret;
>  
>  	if (WARN_ON_ONCE(!pcie_valid_speed(speed_req)))
>  		return -EINVAL;
> @@ -130,6 +166,27 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
>  
>  	target_speed = pcie_bwctrl_select_speed(port, speed_req);
>  
> +	/*
> +	 * Host Bridge resources may need to be scaled for targeted speed
> +	 * otherwise link might not come up at requested speed.
> +	 */
> +	if (bus && is_rootbus && host) {
> +		/* Get function 0 of downstream device */
> +		list_for_each_entry(dev, &bus->devices, bus_list) {
> +			if (PCI_FUNC(dev->devfn) == 0) {
> +				child = dev;
> +				break;
> +			}
> +		}
> +
> +		if (child && host->disable_aspm_for_retrain) {
> +			aspm_state = pcie_aspm_enabled(child);
> +			pci_disable_link_state(child, PCIE_LINK_STATE_ALL);
> +		}

The current pci_disable_link_state() only works when called for the
downstream device, but it's sort of weird to have to look up a
downstream function 0 here.  I wish we had a way to say "this device
(either a Downstream Port or an Upstream Port (an endpoint)) doesn't
support this link state; please configure the link accordingly".  But
I don't think we have that today, so this is probably the best thing
we can do.

> +		if (speed_req > bus->cur_bus_speed)
> +			pcie_set_opp(port, host, speed_req);
> +	}
> +
>  	scoped_guard(rwsem_read, &pcie_bwctrl_setspeed_rwsem) {
>  		struct pcie_bwctrl_data *data = port->link_bwctrl;
>  
> @@ -154,6 +211,12 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
>  	    !list_empty(&bus->devices))
>  		ret = -EAGAIN;
>  
> +	if (bus && is_rootbus && host) {
> +		if (child && host->disable_aspm_for_retrain)
> +			pci_force_enable_link_state(child, aspm_state);
> +		pcie_set_opp(port, host, bus->cur_bus_speed);
> +	}
> +
>  	return ret;
>  }
>  
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 9cbcadd08f3d..352079393edb 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -673,6 +673,7 @@ struct pci_host_bridge {
>  	unsigned int	msi_domain:1;		/* Bridge wants MSI domain */
>  	unsigned int	broken_l1ss_resume:1;	/* Resuming from L1SS during
>  						   system suspend is broken */
> +	unsigned int	disable_aspm_for_retrain:1; /* Disable ASPM before link retain */

s/retain/retrain/

>  
>  	/* Resource alignment requirements */
>  	resource_size_t (*align_resource)(struct pci_dev *dev,
> 
> -- 
> 2.34.1
> 

