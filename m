Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D83C2D0CD
	for <ath11k@archiver.kernel.org>; Mon, 19 May 2025 13:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aqbsDMTwKk9x+WUXlNJNfL7IQjuWg7Hr2E6om4Q9jng=; b=VxRtnNefJYg4t0s3RZP1uVlQ9c
	kQjbNXraeD4X/I2uemOewsF7zPW86qRBj7OeJz23irxFx+8N756d94BjcnIharfl5UravhnqYzT4l
	qEcUVa2PYNL9FjAuT3SyQCOKozga1OtDiWqOvarCCx2H2xwsHFz7dftTuaqdxyo2fTSIaElyx7NYi
	WS1qoSZ8cqJXY0HJR5XWrQ0rR/y16ohF5YCuraT1eYbGTPjacUUtCFhkpVH3G0srRRn7OhKQ4Ts2W
	D2s3h/FyYq/WWqBuSgYB1yyK7ohqbdTMdHIZugtMjKayGlHCTpC+HbSQ1zmbR+YlB7qfkl5dKL/Tm
	lmwk66eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH0m5-00000009JZb-07Kh;
	Mon, 19 May 2025 13:43:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH0kJ-00000009JUE-3n2Z
	for ath11k@bombadil.infradead.org;
	Mon, 19 May 2025 13:41:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:Date:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aqbsDMTwKk9x+WUXlNJNfL7IQjuWg7Hr2E6om4Q9jng=; b=Fz5EKn/5FVnNX+737ExqMdrqO3
	uL6AtQ5NpbB0FD4CGGKgI73sb4cdlX+Rp7Y8eGwGJDn4DD1TnkhJ7sHNMJsIuZk+/U03UJNQxJPWi
	Nt4XU8BNwMVqz50dMAMfAIWNrPFExnbI919qqLtYjgXTpotDa0i7oduDZDscBcurZt6+WDQzv+4fl
	MDgrXSBi0Trj0FtrCphkPV5Zxg5wgGUyceMqzJGZuIzwytdkMvGUSndF5WuHhGzTQfVsZfHay2nrD
	LvjJUO1rhJLqcwkJOm3sfn93I6YyAcEBM0cuWizbSD/yuEBuCm7eScdJHAdPdpzaj/0z11zpNBEWR
	4fBdq4Hw==;
Received: from mgamail.intel.com ([198.175.65.9])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uH0kG-00000000dhc-1VpG
	for ath11k@lists.infradead.org;
	Mon, 19 May 2025 13:41:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747662093; x=1779198093;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=3IS3Ncoc5c73n48DFKYqt3CL6SCqQYzG/GBDtDeZIrs=;
  b=KMStJOvB4sNj+73quz/aE2/LMeKpoznUkFsBtu/X0dbimJB/vhscp/59
   TcRRly+2y5p5gNjvxavm+TXK2AttIHLsG/0RFCT/vrlFgWsenWbTCZD/B
   mlmdH3di6AuZ9guaEyY3axSHaIqjjlOmA0tSikFHKJzzjA+ulK4OaWyyB
   0c7FrO+bagieJIgqzPW38mLznEF5L8DPdE8CShCzCmopyV0Wzei89XK0M
   tBjn+9quLXNkpzSqEjODukQ3ay6BDwsC+eprFRWT5ofBFygqlG+UIEEbB
   /rJoa2ejm9O+aKqO6sOHBEDeQRumtai4oOTXQ1r/lpDR+OpM1+irOdFF9
   w==;
X-CSE-ConnectionGUID: nQ8NNni4Tk6vgULQaLL5Cg==
X-CSE-MsgGUID: gZFeTeXIRDa0CFuKLXf6Dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="72068380"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="72068380"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 06:41:24 -0700
X-CSE-ConnectionGUID: xiCe6jHWSFiukJ+4d5r18Q==
X-CSE-MsgGUID: QIi+kBBLR+qVO64ODwwDrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="139269228"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.35])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 06:41:18 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 19 May 2025 16:41:14 +0300 (EEST)
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
cc: Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
    Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
    Lorenzo Pieralisi <lpieralisi@kernel.org>, 
    =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kw@linux.com>, 
    Rob Herring <robh@kernel.org>, Johannes Berg <johannes@sipsolutions.net>, 
    Jeff Johnson <jjohnson@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
    linux-pci@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, 
    linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
    qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com, 
    quic_vpernami@quicinc.com, quic_mrana@quicinc.com, 
    Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH v3 02/11] PCI/bwctrl: Add support to scale bandwidth
 before & after link re-training
In-Reply-To: <20250519-mhi_bw_up-v3-2-3acd4a17bbb5@oss.qualcomm.com>
Message-ID: <2a539ddc-95d6-7c37-4cfe-3a54ffce0861@linux.intel.com>
References: <20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com> <20250519-mhi_bw_up-v3-2-3acd4a17bbb5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_144132_980959_089BB33B 
X-CRM114-Status: GOOD (  29.18  )
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

On Mon, 19 May 2025, Krishna Chaitanya Chundru wrote:

> If the driver wants to move to higher data rate/speed than the current data
> rate then the controller driver may need to change certain votes so that
> link may come up at requested data rate/speed like QCOM PCIe controllers
> need to change their RPMh (Resource Power Manager-hardened) state. Once
> link retraining is done controller drivers needs to adjust their votes
> based on the final data rate.
> 
> Some controllers also may need to update their bandwidth voting like
> ICC bw votings etc.
> 
> So, add pre_scale_bus_bw() & post_scale_bus_bw() op to call before & after
> the link re-train. There is no explicit locking mechanisms as these are
> called by a single client endpoint driver.
> 
> In case of PCIe switch, if there is a request to change target speed for a
> downstream port then no need to call these function ops as these are
> outside the scope of the controller drivers.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/pcie/bwctrl.c | 15 +++++++++++++++
>  include/linux/pci.h       | 14 ++++++++++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
> index d8d2aa85a22928b99c5bba1d2bcc5647c0edeeb6..3525bc0cd10f1dd7794abbe84ccb10e2c53a10af 100644
> --- a/drivers/pci/pcie/bwctrl.c
> +++ b/drivers/pci/pcie/bwctrl.c
> @@ -161,6 +161,8 @@ static int pcie_bwctrl_change_speed(struct pci_dev *port, u16 target_speed, bool
>  int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
>  			  bool use_lt)
>  {
> +	struct pci_host_bridge *host = pci_find_host_bridge(port->bus);
> +	bool is_rootbus = pci_is_root_bus(port->bus);
>  	struct pci_bus *bus = port->subordinate;
>  	u16 target_speed;
>  	int ret;
> @@ -173,6 +175,16 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
>  
>  	target_speed = pcie_bwctrl_select_speed(port, speed_req);
>  
> +	/*
> +	 * The host bridge driver may need to be scaled for targeted speed
> +	 * otherwise link might not come up at requested speed.
> +	 */
> +	if (is_rootbus && host->pre_scale_bus_bw) {
> +		ret = host->pre_scale_bus_bw(host, port, target_speed);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	scoped_guard(rwsem_read, &pcie_bwctrl_setspeed_rwsem) {
>  		struct pcie_bwctrl_data *data = port->link_bwctrl;
>  
> @@ -197,6 +209,9 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
>  	    !list_empty(&bus->devices))
>  		ret = -EAGAIN;
>  
> +	if (bus && is_rootbus && host->post_scale_bus_bw)
> +		host->post_scale_bus_bw(host, port, pci_bus_speed2lnkctl2(bus->cur_bus_speed));
> +
>  	return ret;
>  }
>  
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 51e2bd6405cda5acc33d268bbe1d491b145e083f..7eb0856ba0ed20bd1336683b68add124c7483902 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -601,6 +601,20 @@ struct pci_host_bridge {
>  	void (*release_fn)(struct pci_host_bridge *);
>  	int (*enable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
>  	void (*disable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
> +	/*
> +	 * Callback to the host bridge drivers to update ICC bw votes, clock frequencies etc

BW

> +	 * for the link re-train to come up in targeted speed. These are intended to be
> +	 * called by devices directly attached to the root port. These are called by a single

Root Port

> +	 * client endpoint driver, so there is no need for explicit locking mechanisms.

Endpoint

> +	 */
> +	int (*pre_scale_bus_bw)(struct pci_host_bridge *bridge, struct pci_dev *dev, int speed);
> +	/*
> +	 * Callback to the host bridge drivers to adjust ICC bw votes, clock frequencies etc
> +	 * to the updated speed after link re-train. These are intended to be called by
> +	 * devices directly attached to the root port. These are called by a single client
> +	 * endpoint driver, so there is no need for explicit locking mechanisms.
> +	 */

Please fold comments to 80 characters.

> +	void (*post_scale_bus_bw)(struct pci_host_bridge *bridge, struct pci_dev *dev, int speed);

I still don't like the names. Maybe simply pre/post_link_speed_change 
would sound more generic.

Not a show-stopper but the current name sounds pretty esoteric.

>  	void		*release_data;
>  	unsigned int	ignore_reset_delay:1;	/* For entire hierarchy */
>  	unsigned int	no_ext_tags:1;		/* No Extended Tags */
> 
> 

-- 
 i.


