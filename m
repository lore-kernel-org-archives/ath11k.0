Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68803C3ABD8
	for <ath11k@archiver.kernel.org>; Mon, 19 May 2025 13:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m2gdYtgua+ElW5lXbeYK3dRxmVT7wo8JdVQcY+FyNwk=; b=gLwnndxrnl834FFA/5HuC7A7JS
	RkN6HiigqfPxzADP5DOOMFrkHIh9b0gB55GImweNn3Cry0JL+SgZgHpN7qHKTUAZ7qbSdxvy+U5jr
	CPc0ss2CeWdQ0cprvx8/dnSYEJrkGKKw3hLWqFHCaEf/8b6NLfNHUDuoJ7shzEKWRCvZQlKc7i0SY
	q/GyXwmYzMycpgtX6q/qZREw8EryLFZ8x3ftq/0P3JYgzF0n7XEvc5gGTNq8anmX3HijxmWWYpoC/
	gTj6Hn5B6uci9W2n1XnrGvhbfK0Jkix6yoZuq2Cvh6hZUTTvrCOYojSEO8jtE5qwMLlTkynVQQ+E9
	OqWFj2jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH0M5-00000009GSv-3dzQ;
	Mon, 19 May 2025 13:16:33 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH0FT-00000009FSA-05SK
	for ath11k@lists.infradead.org;
	Mon, 19 May 2025 13:09:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747660183; x=1779196183;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=XkpJ6tPlbFlgCwUloxB4+DSdIpU5E6VB27qBjkhOUZY=;
  b=nD5NfoCWmHnTrX83+h1Z+vnBPwn7khHAiypQK83xI9vl0eBSWkbitj6J
   Tn2S6jgJAl46w5xjUmnwxj8ncjwN5+F1QUt7LkDhjI10b/+J7GhKCyfbo
   6DIB2CtAbkDGU2JgVZDAbUs3zgrbmDY87nnEuaoIiasWL4HtNZ1+m37vd
   FddAMKdyRbvSKZClC4I84HMtshi699UVp6EfeMdH7BKsAYw+Da5fvYX+M
   IVNeVYiLnDuekk+zxbEfpwBb2IWv0gfXMPW9jbXz1IfMOtbIAlbbf4ov0
   McpswYGWrwhv15DtlSNHOE2dKyUa7Yj/blgh3Av8rHCW7C8Z/5mtNqvhU
   g==;
X-CSE-ConnectionGUID: lWhIGhF0QsmfOb7sUowClA==
X-CSE-MsgGUID: a7CHeKrxThKVKhtsypWxwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49461255"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="49461255"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 06:09:40 -0700
X-CSE-ConnectionGUID: i7eVy+IHQsae7CF1FyJ1Zg==
X-CSE-MsgGUID: dqBI7AaxQyeWNq1kumUO4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="170396769"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.35])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 06:09:33 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 19 May 2025 16:09:30 +0300 (EEST)
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
Subject: Re: [PATCH v3 01/11] PCI: Update current bus speed as part of
 pci_pwrctrl_notify()
In-Reply-To: <20250519-mhi_bw_up-v3-1-3acd4a17bbb5@oss.qualcomm.com>
Message-ID: <10de35f5-bec6-5df3-768d-04f88c4e3d77@linux.intel.com>
References: <20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com> <20250519-mhi_bw_up-v3-1-3acd4a17bbb5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_060943_122185_96BFE6AF 
X-CRM114-Status: GOOD (  16.45  )
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

> If the link is not up till the pwrctl drivers enable power to endpoints
> then cur_bus_speed will not be updated with correct speed.
> 
> As part of rescan, pci_pwrctrl_notify() will be called when new devices
> are added and as part of it update the link bus speed.
> 
> Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/pwrctrl/core.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/pci/pwrctrl/core.c b/drivers/pci/pwrctrl/core.c
> index 9cc7e2b7f2b5608ee67c838b6500b2ae4a07ad52..034f0a5d7868fe956e3fc6a9b7ed485bb69caa04 100644
> --- a/drivers/pci/pwrctrl/core.c
> +++ b/drivers/pci/pwrctrl/core.c
> @@ -10,16 +10,21 @@
>  #include <linux/pci-pwrctrl.h>
>  #include <linux/property.h>
>  #include <linux/slab.h>
> +#include "../pci.h"
>  
>  static int pci_pwrctrl_notify(struct notifier_block *nb, unsigned long action,
>  			      void *data)
>  {
>  	struct pci_pwrctrl *pwrctrl = container_of(nb, struct pci_pwrctrl, nb);
>  	struct device *dev = data;
> +	struct pci_bus *bus = to_pci_dev(dev)->bus;
>  
>  	if (dev_fwnode(dev) != dev_fwnode(pwrctrl->dev))
>  		return NOTIFY_DONE;
>  
> +	if (bus->self)
> +		pcie_update_link_speed((struct pci_bus *)bus);

Why are you casting here?? (Perhaps it's a leftover).

> +
>  	switch (action) {
>  	case BUS_NOTIFY_ADD_DEVICE:
>  		/*
> 
> 

-- 
 i.


