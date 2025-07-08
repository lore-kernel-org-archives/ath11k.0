Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 688D6C83F0A
	for <ath11k@archiver.kernel.org>; Tue,  8 Jul 2025 16:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3/EKDk080QJAh5+rITJij+kXnsl2Kd464pchYVfDhwk=; b=fyAzTYFZb3sN4lYWlGFUiC3n0+
	pzWiAlB2AFATp8RvARXSgo+/BrKgWoqI1CPDBI8gHtKt+FV0Ov9EZUNfcphUwLbdf56W3kSxDj08a
	oEZG2pW67QSs+gfLkdh8PlJenLDRJTH24QhweOJc3agYQB1PAkBH37loeehKMYxCkpxFukAtxRnzk
	zkpZHsBDAMPKqLonQCBpOQZL29uWkS7W/JJUDLwm8HpQaVCxo6xtGYoxKoBQ0lWsC3JF27Cf46NmR
	WQMkXrTH0kV9imfzb1B6kLAcIxY0KOXZawqqLiYED4hPKIlLvWZjNd8ndAIH6HTc3IsBsly0HDyc4
	nlDdWXIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBdT-0000000627X-02aB;
	Tue, 08 Jul 2025 16:57:39 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZB8c-00000005xz3-035C
	for ath11k@lists.infradead.org;
	Tue, 08 Jul 2025 16:25:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 08EDEA5406E;
	Tue,  8 Jul 2025 16:25:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDBE8C4CEED;
	Tue,  8 Jul 2025 16:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751991944;
	bh=QmoHd8cC81xmIDIbZJg1nKxwCyWUf9E8OERsbTNGp54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fwzkQmWYtKwmnrBgCnqdCq4I0KvH45mkaufs0g2zpZphsVw0UrX4WEkPeny+dVWaw
	 M6AZK2sUINh5mh2Ry+BOP31dYkOZ+/mdz31oE6MwgCU8/kx+NLU4b9QF9QSwKguRYI
	 FIl2/JTGLBdDbv+oquP1D1XzoJcXFefS6Zp0J/u0AA2TIyur4qjm2nIG7PdYsVGKs6
	 reWPwpXw9y0Y/x/T4lVcbnYE/kfos1SMLIZmrqeWPEehNk5niV0pPeKHk7cAZwdgxb
	 zBjpN9lr4h7umBdF0vmo+B/aP8G47E+Db71104HEEjjkmtNoTrlcJ1ZODG8HXjfNVQ
	 NI2rF/+EjfqEQ==
Date: Tue, 8 Jul 2025 21:55:33 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com, 
	quic_vpernami@quicinc.com, quic_mrana@quicinc.com, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH v4 02/11] PCI/bwctrl: Add support to scale bandwidth
 before & after link re-training
Message-ID: <fhi7q5mbe75xbfmff6k4qe5pe6xveya5dsfqkm6bqpz7rcn3vr@jyn4uxl2exp7>
References: <20250609-mhi_bw_up-v4-0-3faa8fe92b05@qti.qualcomm.com>
 <20250609-mhi_bw_up-v4-2-3faa8fe92b05@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250609-mhi_bw_up-v4-2-3faa8fe92b05@qti.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_092546_181547_A3C311AB 
X-CRM114-Status: GOOD (  29.09  )
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

On Mon, Jun 09, 2025 at 04:21:23PM GMT, Krishna Chaitanya Chundru wrote:
> If the driver wants to move to higher data rate/speed than the current data

s/driver/PCI client driver

> rate then the controller driver may need to change certain votes so that
> link may come up at requested data rate/speed like QCOM PCIe controllers
> need to change their RPMh (Resource Power Manager-hardened) state. Once
> link retraining is done controller drivers needs to adjust their votes
> based on the final data rate.
> 
> Some controllers also may need to update their bandwidth voting like
> ICC BW votings etc.
> 
> So, add pre_link_speed_change() & post_link_speed_change() op to call
> before & after the link re-train. There is no explicit locking mechanisms
> as these are called by a single client Endpoint driver.
> 

What if client drivers of multiple endpoints connected to different RP of the
same Host Bridge call this API? Won't you need locking?

- Mani

> In case of PCIe switch, if there is a request to change target speed for a
> downstream port then no need to call these function ops as these are
> outside the scope of the controller drivers.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/pcie/bwctrl.c | 15 +++++++++++++++
>  include/linux/pci.h       | 18 ++++++++++++++++++
>  2 files changed, 33 insertions(+)
> 
> diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
> index 36f939f23d34e8a3b25a2d1b9059e015f298ca94..dafb8d4f1cfba987e1ff08edfc7caba527f0c76b 100644
> --- a/drivers/pci/pcie/bwctrl.c
> +++ b/drivers/pci/pcie/bwctrl.c
> @@ -140,6 +140,8 @@ static int pcie_bwctrl_change_speed(struct pci_dev *port, u16 target_speed, bool
>  int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
>  			  bool use_lt)
>  {
> +	struct pci_host_bridge *host = pci_find_host_bridge(port->bus);
> +	bool is_rootbus = pci_is_root_bus(port->bus);
>  	struct pci_bus *bus = port->subordinate;
>  	u16 target_speed;
>  	int ret;
> @@ -152,6 +154,16 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
>  
>  	target_speed = pcie_bwctrl_select_speed(port, speed_req);
>  
> +	/*
> +	 * The host bridge driver may need to be scaled for targeted speed
> +	 * otherwise link might not come up at requested speed.
> +	 */
> +	if (is_rootbus && host->pre_link_speed_change) {
> +		ret = host->pre_link_speed_change(host, port, target_speed);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	scoped_guard(rwsem_read, &pcie_bwctrl_setspeed_rwsem) {
>  		struct pcie_bwctrl_data *data = port->link_bwctrl;
>  
> @@ -176,6 +188,9 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
>  	    !list_empty(&bus->devices))
>  		ret = -EAGAIN;
>  
> +	if (bus && is_rootbus && host->post_link_speed_change)
> +		host->post_link_speed_change(host, port, pci_bus_speed2lnkctl2(bus->cur_bus_speed));
> +
>  	return ret;
>  }
>  
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 05e68f35f39238f8b9ce08df97b384d1c1e89bbe..1740bab514b0a9a61c027463a1fb154843312a22 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -599,6 +599,24 @@ struct pci_host_bridge {
>  	void (*release_fn)(struct pci_host_bridge *);
>  	int (*enable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
>  	void (*disable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
> +	/*
> +	 * Callback to the host bridge drivers to update ICC BW votes, clock
> +	 * frequencies etc.. for the link re-train to come up in targeted speed.
> +	 * These are intended to be called by devices directly attached to the
> +	 * Root Port. These are called by a single client Endpoint driver, so
> +	 * there is no need for explicit locking mechanisms.
> +	 */
> +	int (*pre_link_speed_change)(struct pci_host_bridge *bridge,
> +				     struct pci_dev *dev, int speed);
> +	/*
> +	 * Callback to the host bridge drivers to adjust ICC BW votes, clock
> +	 * frequencies etc.. to the updated speed after link re-train. These
> +	 * are intended to be called by devices directly attached to the
> +	 * Root Port. These are called by a single client Endpoint driver,
> +	 * so there is no need for explicit locking mechanisms.
> +	 */
> +	void (*post_link_speed_change)(struct pci_host_bridge *bridge,
> +				       struct pci_dev *dev, int speed);
>  	void		*release_data;
>  	unsigned int	ignore_reset_delay:1;	/* For entire hierarchy */
>  	unsigned int	no_ext_tags:1;		/* No Extended Tags */
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

