Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5873C83F12
	for <ath11k@archiver.kernel.org>; Tue,  8 Jul 2025 17:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OGPFhfdRv6iZrbR+EOaxBbf/mRblTj+dZHKCjap1gpY=; b=f0EY9zyYv7onHombO5xH8HOUKD
	K8wV9N3hbgs40f/gtXsaEAeWznoUrWVYfqm72AK4LsY5B7W6cAhiMdBFdtz+Vi+ONBN2+z315rnqo
	7XkdHrgXkdnWgyoKFieDN2z5S6gEEA4CgyMkTAdOhT9OVvJqOeo0q1X80hNSs1+x/b4BmncFt12v5
	P7RR9gxAQreYU89XPASTTZWjRxtuDyVly8Lw3bv/RMMb6kPmvlNqHUAXblffRnTTJpRobX2SdQcRV
	tMBFBeY70l1V+b0mzHW/IuydUk5G/AnN7p3yBxniwV31xkqD3BI/OQIOXjskUYwb6/v+lVu0HDgv6
	5aSTsPUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCVq-00000006Aqg-05XA;
	Tue, 08 Jul 2025 17:53:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZC0a-000000066Ph-2I9a
	for ath11k@lists.infradead.org;
	Tue, 08 Jul 2025 17:21:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A75646111C;
	Tue,  8 Jul 2025 17:21:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A893C4CEF0;
	Tue,  8 Jul 2025 17:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751995291;
	bh=0jKN9yLyuUzZoTSKclNzmjrqBtw7qPEn82fZPQz9HdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AA34ANRfTjhjbg9q1k9s5CXv3MmUQBbwaX4ag5QailbUXF93dj+cjrejTe8+l20jP
	 JK3jGVwK9BGQrSuYcyTiK9NqDZ6ZNMJ+i2fDDWzwJqoOw+Xjk29uyxEqiN9LRuk3mF
	 Doybj0JlarxxsEtsYQ6XCPzS/3OQKlUg9ZJRIY1BDKzAW0l7PDqpLCSCzElvcldLXk
	 eiHuzfKkNsy167itNA2bmUhxgGHIq8T7Ichki/V5QYs14K7KfhH7ncfTGbcApjWmFq
	 dfnB2nuA71QeywH9imBEjhsar1A145rgb7Vyp5Ic5KtdHA5Q83JyAjN3vh/wJgnMaY
	 22NYZrmTmc87A==
Date: Tue, 8 Jul 2025 22:51:20 +0530
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
Subject: Re: [PATCH v4 10/11] PCI: Add function to convert lnkctl2speed to
 pci_bus_speed
Message-ID: <rb6hftwnewb5qv7vvimlve6mdofe4yqzmnvhpmypmt3v2n4eka@wm2eihy3wpu2>
References: <20250609-mhi_bw_up-v4-0-3faa8fe92b05@qti.qualcomm.com>
 <20250609-mhi_bw_up-v4-10-3faa8fe92b05@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250609-mhi_bw_up-v4-10-3faa8fe92b05@qti.qualcomm.com>
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

On Mon, Jun 09, 2025 at 04:21:31PM GMT, Krishna Chaitanya Chundru wrote:
> Add a exported function to convert lnkctl2speed to enum pci_bus_speed,
> so that other kernel drivers can use it.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/pci.c   | 12 ++++++++++++
>  include/linux/pci.h |  1 +
>  2 files changed, 13 insertions(+)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index e9448d55113bdfd2263d8e2f6b3ec802f56b712e..8950e88826e27accfe699e31fba8f4077c26296f 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -6018,6 +6018,18 @@ int pcie_link_speed_mbps(struct pci_dev *pdev)
>  }
>  EXPORT_SYMBOL(pcie_link_speed_mbps);
>  
> +/**
> + * pci_lnkctl2_bus_speed - convert lnkctl2 speed to pci_bus_speed

nit: pci_linkctrl2_to_bus_speed()?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

