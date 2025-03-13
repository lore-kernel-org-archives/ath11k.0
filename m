Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96432C282DE
	for <ath11k@archiver.kernel.org>; Thu, 13 Mar 2025 17:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=t8CNM3wfGDprp5WRz1wL06MGj9jB0wOgDG3/jCULtFo=; b=PPb3onaYQ+iz8F
	+WcFhz1D0E5xx71lxhC1HF1di7zAKTxWqC/94lqD2N9dNmlFZ0EtdkK5A79OdYqwywTnAx1Pa1OdZ
	5jthNm2fSKHMh+s0kTfmHnKiMQVatDbaNFc+bkbxggnQqMmuGuABWjvBdFzc/OiR50ICW6P0y1BpZ
	ADTTjjdb/m35SwqzF0Zg684XEy405Qy0tO4l4ubiZu85Istcv3RKXu1lmu8YgB+ek5Qy8f/Z160fw
	bqLs/Zdtf3yD9ezPq/gY+HLqOyh0KcjhYPFWWXHkO9nzPZFue1NldeNo4fii1/5ekjD8gzDdDkBT4
	K8IL/y3FdM9aCMzOz5jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsm9c-0000000BymN-4Abh;
	Thu, 13 Mar 2025 17:15:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsluh-0000000Bu1b-0ioH
	for ath11k@lists.infradead.org;
	Thu, 13 Mar 2025 17:00:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B1EE7A477B9;
	Thu, 13 Mar 2025 16:54:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 165B0C4CEDD;
	Thu, 13 Mar 2025 17:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741885203;
	bh=N/Sk6Qy4oI0JP7HDoZt5ci2IDjFnGW5PCPDjLtT2Uuo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=nOMJmpg1BHmbTTxLXiglAg+ddOPshoZfEp9X8pVRJTn+dGBoq7TLFiItX6j1wnSjL
	 1wzq8E0JrAcJLBIFmxPvuDMIE3cGpVjr73G6ExwhSMmKf6KWFxF9TI+PA15ZpHYY1r
	 VCnWVKKa81JvsT0ysDJ4xYi2o+qHCypxY9yWWmOTWzWUFRRjde0rVI+ZhdDrLLcVbV
	 X4v4ROwqE09VbDhNbCYB2i/adQtN3X4E7eDWzmnN2gVPUQFhHPoDfHRM9A9DQrZGIx
	 +cmIPM3YblbOXbPPyFfqvVJAReWWCxBxiQCD+inq1jw4+qgroOPXJnscqbVee9F6Tu
	 ZMOXPdj0NUaPg==
Date: Thu, 13 Mar 2025 12:00:01 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	mhi@lists.linux.dev, linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org, quic_pyarlaga@quicinc.com,
	quic_vbadigan@quicinc.com, quic_vpernami@quicinc.com,
	quic_mrana@quicinc.com,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 01/10] PCI: update current bus speed as part of
 pci_bus_add_devices()
Message-ID: <20250313170001.GA738398@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313-mhi_bw_up-v2-1-869ca32170bf@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_100007_275456_1BA30207 
X-CRM114-Status: GOOD (  19.49  )
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

[+cc Bartosz since this is related to pwrctrl]

On Thu, Mar 13, 2025 at 05:10:08PM +0530, Krishna Chaitanya Chundru wrote:
> If the link is not up till the pwrctl drivers enable power to endpoints
> then cur_bus_speed will not be updated with correct speed.
> 
> As part of rescan, pci_bus_add_devices() will be called and as part of
> it update the link bus speed.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/bus.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/pci/bus.c b/drivers/pci/bus.c
> index 98910bc0fcc4..994879071d4c 100644
> --- a/drivers/pci/bus.c
> +++ b/drivers/pci/bus.c
> @@ -432,6 +432,9 @@ void pci_bus_add_devices(const struct pci_bus *bus)
>  	struct pci_dev *dev;
>  	struct pci_bus *child;
>  
> +	if (bus->self)
> +		pcie_update_link_speed((struct pci_bus *)bus);

Why the cast?  I guess to discard "const"?  I would prefer to avoid
that if we can.

The only existing callers of pcie_update_link_speed() are from bwctrl,
where it obviously makes sense because bwctrl manages link speed, and
from pci_set_bus_speed() in the pci_alloc_child_bus() path.

If we call pcie_update_link_speed() here, do we still need the
pci_set_bus_speed() in pci_alloc_child_bus()?

Bartosz, so you have any suggestions?  Is there a point in pwrctrl
where it would make sense to do this, similar to what bwctrl does?

>  	list_for_each_entry(dev, &bus->devices, bus_list) {
>  		/* Skip already-added devices */
>  		if (pci_dev_is_added(dev))
> 
> -- 
> 2.34.1
> 

