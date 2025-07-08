Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34B1C83F09
	for <ath11k@archiver.kernel.org>; Tue,  8 Jul 2025 17:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NNdreMZw6q/3oKGgXtWvUpGnqTfr0XyMnkpR0zpxpU8=; b=cpVa1vm1f2yxroSSbkmoia2bb6
	qAQNXZ4A5suPuO31nD505YTKw4gCzLI5AzPz75XXZ6Uuuk6AcgdGvw2NNWzGLYl/Y03rjqeh40frZ
	9RzuNs89ejjRXoB1Qunh8BDRfNvtFeYrr0D2dQpz2wzpP7Yydg/gI8gtTV3Z6KhlnLMsTMjKA/9FV
	Mc0XcU2BwUCvnk7DL4ixbh5gyqqGNwDd8Nz5/jwU0CHrXzW3c0DYEYywoOrknG8W3Dd4oVdUSrnaT
	g5ejiOgkD9+mN4QenhmesHNXuy5O4cNl96EgvSXmqhM7b5t4ST3T7lesV4crJhWfnaCmAlbYmrMLK
	skO8DOBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCCY-000000067hk-0S6y;
	Tue, 08 Jul 2025 17:33:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBut-000000065It-0Yms
	for ath11k@lists.infradead.org;
	Tue, 08 Jul 2025 17:15:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4FDDEA541A6;
	Tue,  8 Jul 2025 17:15:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1992BC4CEED;
	Tue,  8 Jul 2025 17:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751994938;
	bh=G4hnyLkgMkEeeDP4WcFeZOCQ5C1IlFKdxpJ/+mu5LgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=opKIuaAO3BlnWsujF70bvZupBRhBGMdopxt6dvx4EIpWv7+JtK1FiOG9bC2ms/5Dl
	 UtIFxU6eIZzcBfCQzHG9wCpg2RD1/ncADtxx5593QMZ7KWs0ZQ2zuCOC10BiG9e3dl
	 4fIlE40BK7oDwyZTsFR+1fGDdBNxxBUz3J4njjPFEgsT5EKZlGCZQykEGXQqIM3pfd
	 rkoV+6TKYCXt7epwhNGfWO1vmQxkX8kKF7vU0cojOXBVLCL8A4hV+eRACYuwCRPhVR
	 ZexmNG3rUFetp196JBhzhjo5Lazi87u5HkzaW0+v/1gCZ1UcYnpLh3OvkDB74i11nZ
	 RR2kyMm0/AK0A==
Date: Tue, 8 Jul 2025 22:45:26 +0530
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
Subject: Re: [PATCH v4 06/11] PCI/ASPM: Clear aspm_disable as part of
 __pci_enable_link_state()
Message-ID: <qo6mb3qlt3xpuvhepwcv6be4wd53neee2t6buzk4tdiy22xsub@vu7lykp3rnu2>
References: <20250609-mhi_bw_up-v4-0-3faa8fe92b05@qti.qualcomm.com>
 <20250609-mhi_bw_up-v4-6-3faa8fe92b05@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250609-mhi_bw_up-v4-6-3faa8fe92b05@qti.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_101539_235872_80C528E6 
X-CRM114-Status: GOOD (  16.95  )
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

On Mon, Jun 09, 2025 at 04:21:27PM GMT, Krishna Chaitanya Chundru wrote:
> ASPM states are not being enabled back with pci_enable_link_state() when
> they are disabled by pci_disable_link_state(). This is because of the
> aspm_disable flag is not getting cleared in pci_enable_link_state(), this
> flag is being properly cleared when ASPM is controlled by sysfs.
> 

A comment in pcie_config_aspm_link() says:

 /* Enable only the states that were not explicitly disabled */

But the function is called from both aspm_attr_store_common() and
__pci_enable_link_state(). So I don't know if this is behavior is intentional
or wrong. 

> Clear the aspm_disable flag with the requested ASPM states requested by
> pci_enable_link_state().
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Fixes tag?

- Mani

> ---
>  drivers/pci/pcie/aspm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
> index 94324fc0d3e650cd3ca2c0bb8c1895ca7e647b9d..0f858ef86111b43328bc7db01e6493ce67178458 100644
> --- a/drivers/pci/pcie/aspm.c
> +++ b/drivers/pci/pcie/aspm.c
> @@ -1453,6 +1453,7 @@ static int __pci_enable_link_state(struct pci_dev *pdev, int state, bool locked)
>  		down_read(&pci_bus_sem);
>  	mutex_lock(&aspm_lock);
>  	link->aspm_default = pci_calc_aspm_enable_mask(state);
> +	link->aspm_disable &= ~state;
>  	pcie_config_aspm_link(link, policy_to_aspm_state(link));
>  
>  	link->clkpm_default = (state & PCIE_LINK_STATE_CLKPM) ? 1 : 0;
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

