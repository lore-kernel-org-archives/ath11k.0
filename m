Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187B6C83F1B
	for <ath11k@archiver.kernel.org>; Fri, 11 Jul 2025 21:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=KnouNH6B/9EBIwqVC/QaB1mh/2dYO6n+r5f4tgtW/rA=; b=yDaMB0MNZ9P3J5
	n3A0GPKlhZ5FEX8j1MMIvp+nOQiT+Ppu1zW85JWw/pepVfLU2q8iKFMcUtIEmfLGID2zqYSlbK/lB
	SCxKSTbNiSjCLEGVSkCNEg0ozHwpLaEfiHCnDexgwWwTpav5W3uxw19gTN695IbYbHe+miZkQ5ghN
	JSVNlXzSN6aEprPMmbH8/KraRsWNGcuuJwJob8gZpt7y332ImdLdbBk8JOHzAFm4we9SGX7QpW51y
	Zjovb06y/XzaBzJmxnBiYeO1oUZm+qoxdX7U7l18e0MocWdjf0mV1WhcNxVa3/pHLFmPIyF1aQRAu
	aQRRyiAEhEztTEByO1wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaLPb-0000000Fu5x-2ggw;
	Fri, 11 Jul 2025 21:36:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaLPZ-0000000Fu5b-25tw
	for ath11k@lists.infradead.org;
	Fri, 11 Jul 2025 21:36:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F7DB43A12;
	Fri, 11 Jul 2025 21:36:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49C7DC4CEED;
	Fri, 11 Jul 2025 21:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752269764;
	bh=6vFUYFx/VhN3Xm63hxLlS9XvwMe/jnHsYahek8vfgTI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=OxanN+Z43huYfALidhi0ROpjH9PpXq7t9mMZrUH4TSYanrqRwi8nkqjE56+aGjBy+
	 YFZZgvzoI+OeDWdipSfxD1AuW+Xd8OGrquYI9BJdPH4yLhyqWrEkrmqBohkwDray5f
	 f6qdjzW9zngI7xFlClSOgDRnRZIKFj9PF4TMCl6n1iRsHeuOEBnGOA7oFIPcxBafbj
	 stBDdIPaAlrO7MlH0yFZp5aiczKaXnSIb5fg3ys2AySgREE4orAbFhG9jPW4h6RGc8
	 2t+QBZO6AR9bY4CrZTFKZmUpffq3MSa9aWWqj1t6BeHtHu6IBCpHZqJvbAHUGvFmnE
	 bTHQlrHT1SmYA==
Date: Fri, 11 Jul 2025 16:36:02 -0500
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
	qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
	quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH v4 02/11] PCI/bwctrl: Add support to scale bandwidth
 before & after link re-training
Message-ID: <20250711213602.GA2307197@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-mhi_bw_up-v4-2-3faa8fe92b05@qti.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_143605_577989_3BA46C3C 
X-CRM114-Status: GOOD (  20.14  )
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

On Mon, Jun 09, 2025 at 04:21:23PM +0530, Krishna Chaitanya Chundru wrote:
> If the driver wants to move to higher data rate/speed than the current data
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
> In case of PCIe switch, if there is a request to change target speed for a
> downstream port then no need to call these function ops as these are
> outside the scope of the controller drivers.

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

No need to repeat the entire comment.  s/.././

These pointers feel awfully specific for being in struct
pci_host_bridge, since we only need them for a questionable QCOM
controller.  I think this needs to be pushed down into qcom somehow as
some kind of quirk.

> +	 */
> +	void (*post_link_speed_change)(struct pci_host_bridge *bridge,
> +				       struct pci_dev *dev, int speed);

