Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CA6C83F1B
	for <ath11k@archiver.kernel.org>; Fri, 11 Jul 2025 22:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=cx+SICU5HeF3+aHaOMVYbh6PDdW3Zmb41bU67xAp8VQ=; b=nbqyH0fCIqnx4u
	PN18QaIMnUeuowpnZ2lsjDd1XCb3KbNcaPrb5z4zI/7GkCRB5Q9GdwGL9tGsvWcyI7x4KekzB9MWE
	AGOAnzhu4OE5Aj473v1SjtzzIHG+CjVMSH4/OoewD1KVdzoJKr7tnKFTcFjoE+0U+r7hK/P780WWF
	k2+jLkKh+we/inSfh27LskoEPOFRrUbNblPU9f/hkz5HBEzz+ymPBlVjJBOdM/ins+pxAMXrvcmsp
	3L1TJ9KWwctjMEDJQvlzXAX0+YShvey1rcBuTVtHMwbObaa1lZn6D3iZ51gPkgMUNOjrSaKMF39cw
	fDhcsjUDkgInqgRMSxKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaMi7-0000000Fz80-0QES;
	Fri, 11 Jul 2025 22:59:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaLZH-0000000FuZV-2JEh
	for ath11k@bombadil.infradead.org;
	Fri, 11 Jul 2025 21:46:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:References;
	bh=cx+SICU5HeF3+aHaOMVYbh6PDdW3Zmb41bU67xAp8VQ=; b=ZpFqtHJ/Jey4/2nNRo01W+L81B
	eeXQVYxxbfaxhx4RPDiDgtBkYIhLiXzLoFYP3lz6fPX9L2GX4YamHXqoMaYMJi2pryqu/4vfy4dXQ
	bXeFkEkNq66GRQ3+hpTZbS06MYUDEo9CVT9QjvHFPdSNX6nr9GRtk/fl7rHG6mKIwX8hpufp/5nrl
	FNKzTf5daMzUjMT7aYu3YUmuK+dBcSFQ8HzwGVmRO5SxTMFrd2nfUE8J78bx6WD2OenCYk1oTADP5
	HVP2dA5EqCWrsx8JyhrXtuQCFPqJuTf93a9jyk0RdzUBIAV+/2IBImNEZoWU7qoBmjvmRFrmU2yjc
	m5jL/uyQ==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaLZD-00000009MUC-3ze6
	for ath11k@lists.infradead.org;
	Fri, 11 Jul 2025 21:46:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1C00EA54DB0;
	Fri, 11 Jul 2025 21:46:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88FC7C4CEED;
	Fri, 11 Jul 2025 21:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752270359;
	bh=SVPARDXoIYbIvHPwhZO/owhQLfsvXzF2C36T9ofsUMM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=kkO5tjFTvYlRwsFVXavHXqv3/cX/fbjkQ5ZD0abSuCtvKz67RF0Y6voaYSgfGqYdV
	 nzW5jMO+XCzTjdQ/E/NVK0yxirB5G0HASdC/urQwijjw9WBAV7g3rBOaDHsoxgsW+n
	 1n4ZMT5UUKGVBp0m6j5aTKF2/KN/XnEytrJZgbeAGYeAQx56xVIjkwgUeGavQLZWqf
	 mBkDLD5BRXqxSssAOP84oYzI+/USVZgGwUKvJCjtEdK12phsUnqBufQ4y7SbB+wBBC
	 ZAZ0nAwDKshYiSS//mHTSFr55FHZQ4IT7dVvkmWsmTHDLcWwq+dXPx1eSGhHee8K6E
	 eBWen7SHORZig==
Date: Fri, 11 Jul 2025 16:45:58 -0500
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
Subject: Re: [PATCH v4 10/11] PCI: Add function to convert lnkctl2speed to
 pci_bus_speed
Message-ID: <20250711214558.GA2308483@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-mhi_bw_up-v4-10-3faa8fe92b05@qti.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_224604_431401_F7C2B893 
X-CRM114-Status: GOOD (  15.21  )
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

On Mon, Jun 09, 2025 at 04:21:31PM +0530, Krishna Chaitanya Chundru wrote:
> Add a exported function to convert lnkctl2speed to enum pci_bus_speed,
> so that other kernel drivers can use it.

Name the function explicitly in subject and commit log.

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
> + * @speed: LNKCAP2 SLS value
> + *
> + * Return: pci_bus_speed
> + */
> +enum pci_bus_speed pci_lnkctl2_bus_speed(int speed)
> +{
> +	return pcie_link_speed[speed];
> +}
> +EXPORT_SYMBOL(pci_lnkctl2_bus_speed);

You mention both "lnkctl2" and "LNKCAP2" and I don't know whether you
mean Link Capabilities 2 or Link Control 2, and I don't know what the
bits passed in are.

I expect something like FIELD_GET(PCI_EXP_LNKCAP2_SLS, value) here
that tells us clearly where it came from, so the caller isn't
responsible for extracting it.  And it takes some kind of unsigned
value, probably a u32 if it came from Link Capabilities 2.

Bjorn

