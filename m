Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0AA60A2605
	for <ath11k@archiver.kernel.org>; Fri, 20 Nov 2026 17:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nQwQtRm8;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k6flx0zT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Unsubscribe-Post:List-Owner;
	bh=GmtUShSZk8dAryboQHhYbp46r+uxEVP1de+hNEmgKDY=; b=nQwQtRm8IrZ6/3epcbkdno5DU0
	sWXxIBx/KkemcPklMvcn0RJVRYZCsg0CL8IYHiDKBqNzm9ijB92yaBigeBIpOnOBc3ePrJhcANncS
	uqzmCMS+S+qM7REsatEhTaMBp7svzLyGE/pTBAbtQTpguEnC1DN9H5P9C182TEeThPlUZAIKKJmZ3
	1EC/phtlSW29azOpc33BsZ4D9VRgy3zXGedzFm6m+e8xFDLEY2AI3682Py+qtin3Z3+jGv2Wosz1v
	zYyhRwgt2F3rKI1/vo9kIgeKU+pXngJudWbitV3/fqh9sYK8R8+B0z66ujG3klo1SmrRp27+ZVYpO
	1lAGU1yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUS8X-0000000FdOm-1sAk;
	Fri, 20 Nov 2026 17:10:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUS8S-0000000FdOO-2lO6
	for ath11k@lists.infradead.org;
	Fri, 20 Nov 2026 17:10:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C518E625BC;
	Fri, 20 Nov 2026 17:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0943E1F000C4;
	Fri, 20 Nov 2026 17:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795194651;
	bh=GmtUShSZk8dAryboQHhYbp46r+uxEVP1de+hNEmgKDY=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=k6flx0zTNWTz/4HHWmMhyY7XQf2WCk/uNzeZZTqGKCzfu1dKOX7SgmCicX+0to2u8
	 Myl/hBnLWfHAB/5fDKCAagwnHqqrTiwho5PFTwQnlnNdI6JGh3ow/8zKU48W23rGgn
	 Ps7YuHNVPATTtC5KRjRNRFQqBGSetnFR27mmq0LlMWGvAhC0tiHOWGORsD8t8YfUEJ
	 SB1yCX7JvsbzXLH4slxguLnjoezNYUGQjHkBE2xzt6eCrwgay5usOmT/dluFSm+Tso
	 iEXLy3t7dvPYjvEHkktd4EVwfuUqIoFrw8uWLHhmp13xdDc+jjiGBKM5b1Ahro/ZhJ
	 E+pc9WXKmyTnw==
Date: Fri, 20 Nov 2026 11:10:50 -0600
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
	qiang.yu@oss.qualcomm.com
Subject: Re: [PATCH v6 3/7] PCI: Add pci_lnkctl2_bus_speed() to convert
 lnkctl2speed to pci_bus_speed
Message-ID: <20261120171050.GA891038@bhelgaas>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119-bwscale-v6-3-9a9a715fcb46@oss.qualcomm.com>
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

On Thu, Nov 19, 2026 at 06:26:35PM +0530, Krishna Chaitanya Chundru wrote:
> Add a exported function to convert lnkctl2speed to enum pci_bus_speed,
> so that other kernel drivers can use it.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

Nit below.

> ---
>  drivers/pci/pci.c   | 15 +++++++++++++++
>  include/linux/pci.h |  1 +
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 7c6f2aba8144..a89955617bec 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -6056,6 +6056,21 @@ int pcie_link_bandwidth_mbps(struct pci_dev *pdev)
>  }
>  EXPORT_SYMBOL(pcie_link_bandwidth_mbps);
>  
> +/**
> + * pci_lnkctl2_bus_speed - convert Link Control 2 Target Link Speed to pci_bus_speed
> + * @speed: Target Link Speed (TLS) value from Link Control 2 register (0-4 for 2.5 GT/s - 32 GT/s)
> + *
> + * Convert the Target Link Speed (TLS) field value from the Link Control 2 register
> + * to the corresponding enum pci_bus_speed.

Wrap these to fit in 80 columns like the rest of the file.

> + * Return: pci_bus_speed corresponding to the TLS value
> + */
> +enum pci_bus_speed pci_lnkctl2_bus_speed(u32 speed)
> +{
> +	return pcie_link_speed[speed];
> +}
> +EXPORT_SYMBOL(pci_lnkctl2_bus_speed);
> +
>  /**
>   * pcie_bandwidth_available - determine minimum link settings of a PCIe
>   *			      device and its bandwidth limitation
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 352079393edb..d12875c95491 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -1739,6 +1739,7 @@ int pci_cfg_space_size(struct pci_dev *dev);
>  unsigned char pci_bus_max_busnr(struct pci_bus *bus);
>  resource_size_t pcibios_window_alignment(struct pci_bus *bus,
>  					 unsigned long type);
> +enum pci_bus_speed pci_lnkctl2_bus_speed(u32 speed);
>  
>  #define PCI_VGA_STATE_CHANGE_BRIDGE (1 << 0)
>  #define PCI_VGA_STATE_CHANGE_DECODES (1 << 1)
> 
> -- 
> 2.34.1
> 

