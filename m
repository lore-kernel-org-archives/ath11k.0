Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 603ACC61DD6
	for <ath11k@archiver.kernel.org>; Tue,  1 Sep 2026 07:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x1XZqBPHN0ntygf3/sUmkFR/mSTqD3HugbTSHCQc+5A=; b=Uo0N4ikoTz38MQb/cnRI8h81bk
	5lOrlGqcWzZ+y2v50Www1lJXwnvH74M2/g8T18NTYmNRm5vRlaD0h+zs0gD5DYBs0SPH49JUZ2aTl
	tmZI0Qr36XQkAHmUFLThcG4wWJn8cK+WEFes/qU6GvSv01mTTgcZ7v+VPTIC39TuOU0+fSljEOouN
	+yxNjmKqrzi3XDEZ1UlSTbVLwH4ZUsym29N+NGlpFlBNzTFqr86+zD48nwuCcGhlYJrnxnh/hq9cn
	PKXAHKliHr4RA19mhxVI1Kqh2g7khdg5UPZjVHGeUBvdRdETtDIZFFu+TcCXs6iBEqZhpFMgTr2uc
	loBxlbUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JGQ-0000000BAkL-0FlP;
	Tue, 01 Sep 2026 07:50:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JGO-0000000BAif-15Lv
	for ath11k@lists.infradead.org;
	Tue, 01 Sep 2026 07:50:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D92E600D1;
	Tue,  1 Sep 2026 07:50:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 978FB1F00A3E;
	Tue,  1 Sep 2026 07:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788249035;
	bh=x1XZqBPHN0ntygf3/sUmkFR/mSTqD3HugbTSHCQc+5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Lmzf1UMbiB39d1gc12cr4PVgNp41UnVkAi4mZKGEy4OqkYosoNwTR2BRsXte2Is3I
	 d2vSAXjExa6n5mANF3a/0flakPB2Y7973LmP3bCiZoYlST3a9Nq82NXz/gVae0/Rmm
	 nZKxEuItT/UTr8/EO/1MX3qgiIBGWeXwZzoorELlCZIsT4s3IHHfHxY9Y/lCtBgWT/
	 6xaf6manuipM75QWrRlmpNwxurmMi0hppVKkB0oz3/MbOaxPD2TI1xOkVmooPyQuma
	 sjXfT3BdbvTQQc5c41DRETIZJ7PXxlI/YotQQzOi+xT6sxCHLnVe0wuxamvW3Z9VKx
	 4PeY2RWDLmcRw==
Date: Tue, 1 Sep 2026 09:50:15 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, qiang.yu@oss.qualcomm.com
Subject: Re: [PATCH v5 3/6] PCI: Add pci_lnkctl2_bus_speed() to convert
 lnkctl2speed to pci_bus_speed
Message-ID: <lcljoi3djqgtxuqqtvb43n6z6ns3kzmjwcceqhvovmiqe4eqhs@chgulo7facny>
References: <20260819-bwscale-v5-0-6dea79786b37@oss.qualcomm.com>
 <20260819-bwscale-v5-3-6dea79786b37@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260819-bwscale-v5-3-6dea79786b37@oss.qualcomm.com>
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

On Wed, Aug 19, 2026 at 06:55:54PM +0530, Krishna Chaitanya Chundru wrote:
> Add a exported function to convert lnkctl2speed to enum pci_bus_speed,
> so that other kernel drivers can use it.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/pci.c   | 15 +++++++++++++++
>  include/linux/pci.h |  1 +
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 77b17b13ee61..cda7d210ddbf 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -5939,6 +5939,21 @@ int pcie_link_speed_mbps(struct pci_dev *pdev)
>  }
>  EXPORT_SYMBOL(pcie_link_speed_mbps);
>  
> +/**
> + * pci_lnkctl2_bus_speed - convert Link Control 2 Target Link Speed to pci_bus_speed
> + * @speed: Target Link Speed (TLS) value from Link Control 2 register (0-4 for Gen1-Gen5)

Use GT/S instead of Gen.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

