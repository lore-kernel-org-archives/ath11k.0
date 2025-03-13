Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3381DC282DE
	for <ath11k@archiver.kernel.org>; Thu, 13 Mar 2025 17:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=cxKmF1qlTT+Hkg0NTayu+8URRP0hQXDcuwTRAD7/pqY=; b=CpB1FrL5SqkVzc
	GfugcmYB6/tPdUUq3iPGRUK7diYUQpAd6oUztwVcj9Pkemcg3cVMfEjkKVI59eTN3tMBszUI0Fttb
	WNISitt6YsWRmTz7jACwUSl0J2ZzEioeqHNSmYWftgU+tXpkypHFN45urA8dK+s3GR2X5Kw6nbuyc
	0vGUHUqu9jADG3oNirdd3HbUfBo8Y3+UGQGUl6HcpkVG3r+3ATBzeC/qKhrdZDbf3x8UNJ8iCUqOn
	t73H7ElzrO1eEqKAnaW2tcU0RSvUdSvuEy7RCpwp3JEcVTDHthrME+2VvlOomYZRnTFMnVtnZSSzF
	b5q9S9b8dk4aXMNOIwHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsmAk-0000000C09t-1Rj9;
	Thu, 13 Mar 2025 17:16:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsmAi-0000000C087-1wfy
	for ath11k@lists.infradead.org;
	Thu, 13 Mar 2025 17:16:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A7047A4781B;
	Thu, 13 Mar 2025 17:11:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DD82C4CEDD;
	Thu, 13 Mar 2025 17:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741886199;
	bh=zWvKTNAKlfaKyLmnxPyqzWeB+4hJOUxXXjAo9PVxwlw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=pLb1BgxlqzOdfw15QvV14UuHOIGAwS0A0KCRTc/zF4KFJ7WyCwHGxUQIcnFJAKREH
	 K9p9N6lwlw4tnSxiEogbx+3fsQUSRRuqWPIaBKn7WeUAjzZxR6oL+s7ZiCgBUbDMdp
	 q4ekXP7Ufa8kTZ7QrGo9tILd3LPsGdUe7+NLVD81D4IAfAGQDFNL+j3Yz1C3vPqZvg
	 wmIEzGBxozhlPGNvcRAaLdJZehx8vOqsUfWBRVdrSuIZy2BYykPdMdQPB0qBm8sDvZ
	 7ktxPUB+rmqCKWUyjY6BJ8Jg5ZRBv6995rtd7Nxsb9pRKIt0tPnAsWvnTL+Wt9m5xH
	 0lDyuwxydXp4w==
Date: Thu, 13 Mar 2025 12:16:37 -0500
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
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH v2 09/10] PCI: Add function to convert lnkctl2speed to
 pci_bus_speed
Message-ID: <20250313171637.GA739165@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313-mhi_bw_up-v2-9-869ca32170bf@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_101640_572711_DBC00406 
X-CRM114-Status: GOOD (  13.69  )
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

On Thu, Mar 13, 2025 at 05:10:16PM +0530, Krishna Chaitanya Chundru wrote:
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
> index 869d204a70a3..75505437a9c9 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -6011,6 +6011,18 @@ int pcie_link_speed_mbps(struct pci_dev *pdev)
>  }
>  EXPORT_SYMBOL(pcie_link_speed_mbps);
>  
> +/**
> + * pci_lnkctl2_bus_speed - converts lnkctl2 speed to pci_bus_speed

I try to use imperative mood ("convert lnkctl2") to match commit log
style.

> + * @speed: LNKCAP2 SLS value
> + *
> + * Returns pci_bus_speed

Not sure how strict kernel-doc is about this, but I've been told
it wants "Return:" with a colon here:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/doc-guide/kernel-doc.rst?id=v6.13#n142

