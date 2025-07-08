Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC5D3C8303C
	for <ath11k@archiver.kernel.org>; Tue,  8 Jul 2025 15:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yX9GMZgwwzms6LUCPbNru7W5bl5qXtkOQXg9FqyjHiQ=; b=na2pRwaT0mmVVmevA9V8mxut58
	n9sjMQRWhTqdDoJ5SkvSCnb9AMXhfcQm2cVJCi7WNdCx3ODj9/uIounC8qceNLTu9D7R6qvK+FaWZ
	NY8R5XEzYWLfqdc1/uNxep/Ujhw1/ChzvzLThM1VrApkfbCwZbR0WedbTt7N83vypZs04HHsBFW6v
	1HAKnLJm3Cv4RCrJ7/fYp8SMvd2h2eJcBNhIrVb44czrbOj4wxO/GLd5H+DNsSolDNfy3xoTD4Zn3
	C+7Lfcv4pLFf608Kl3obiqpIx1f/1hWMnpQxcFwExcXipTM2t710LlnsbRH2bQ2Dpru90NT3PF252
	T2AOfzgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZA1J-00000005k8T-0AhJ;
	Tue, 08 Jul 2025 15:14:09 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZA1G-00000005k7t-1hZo
	for ath11k@lists.infradead.org;
	Tue, 08 Jul 2025 15:14:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A4C99A53E0F;
	Tue,  8 Jul 2025 15:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15A0FC4CEED;
	Tue,  8 Jul 2025 15:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751987645;
	bh=HLwJX5QT3UNWX3z8LqzLY6nx+EIVfmL3uCZ2H723Z0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jgbu+3uICnilzU7yt4gSm3YEVbHVhirbcQsISXRWu4gqnqi9Wa2emvrvgygt1EpFE
	 32I7u1RHIwC29A5oaKIMevVrhZ20ST2jMpVPoTGIwYotmQiPzNAIH5JdYxd5SkKYcO
	 PXE+xIggAcD1T/W7iXoXXkmiXuwar32bLf4jdlPoMxeIIYOqiAi6l0xxD4s0513u9N
	 j9yh75kAPe/6fqdPoY/4UUx9KCuaApckykXEIYugO5TnYZap60X2XZJy3weg2y3K5K
	 4WZWHlNYn0sob0oiI+smCF9Y2kLPR+E/YXFe+Cg6YhsuhgzxiGZUtScKeI9djQpCyL
	 GRlSdW5d7vgwQ==
Date: Tue, 8 Jul 2025 20:43:52 +0530
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
Subject: Re: [PATCH v4 01/11] PCI: Update current bus speed as part of
 pci_pwrctrl_notify()
Message-ID: <g4aynbh4kve3kdbnxhwgogxdvylynpdfu47lq3m3ngj6abuk7b@ross7a2ilqtz>
References: <20250609-mhi_bw_up-v4-0-3faa8fe92b05@qti.qualcomm.com>
 <20250609-mhi_bw_up-v4-1-3faa8fe92b05@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250609-mhi_bw_up-v4-1-3faa8fe92b05@qti.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_081406_510094_892E9495 
X-CRM114-Status: GOOD (  18.07  )
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

On Mon, Jun 09, 2025 at 04:21:22PM GMT, Krishna Chaitanya Chundru wrote:
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
> index 6bdbfed584d6d79ce28ba9e384a596b065ca69a4..4c1d3832c43503a7e434a3fe5e0bf15a148434dc 100644
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
> +		pcie_update_link_speed(bus);

I'm wondering why this should be in pwrctrl driver and not in pci_device_add()?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

