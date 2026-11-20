Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C4C606A330
	for <ath11k@archiver.kernel.org>; Fri, 20 Nov 2026 17:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GLLKvN7F;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T53bGmNz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Unsubscribe-Post:List-Owner;
	bh=M/TnF/JPDUYBbnDVZz77UYEHinNWNgD8WyG0zugAQds=; b=GLLKvN7FSgQbDfXu5hOczh5KmU
	aL/D5fCkB+3OipueTqnCRFUjSao94dyxnDkH0XVQGIvO94DbxeDMHQwtHF0iPCzW69yZG647L0DAT
	guIczZFH7fhm2Iq3cEa/SuNk+IfDWjq9g7JAp3mdGE13DL/2b/62oiPdmEt9q2O89hN2I/xT0H5xb
	zeBG4Y+1B+vo5WMnTnjee0p702o+oN5/L9AK4SWVPKzfwOoXUnK/eBPrtIli2w7mY3GsOZBAw+Mj7
	TdIF8LAATriY7K27waPpelNsfMMQ0Oy1IBUpz18SzvKPCoGuJZkjYz6/Vb/CHKbNknh25mpL6YDjV
	Z8U6kWKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUS6X-0000000Fd0v-2C6z;
	Fri, 20 Nov 2026 17:08:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUS6P-0000000FczX-0sYg
	for ath11k@lists.infradead.org;
	Fri, 20 Nov 2026 17:08:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A9A454435D;
	Fri, 20 Nov 2026 17:08:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE67C1F000C4;
	Fri, 20 Nov 2026 17:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795194524;
	bh=M/TnF/JPDUYBbnDVZz77UYEHinNWNgD8WyG0zugAQds=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=T53bGmNzn2por7HmMxXHcZFShi32TTJ7cWoglynDcHJyRL/EONqCWGUiEn5CX95uV
	 jyWOpzl5EFHFFTY6B/o4wCCm8awlzXOw3NWgL24INTGKneZeXhIfPcKEyCAjY9OrNv
	 j6YK93AaV3lWiN4IOaXpk+5JRoouYQ+zxyseJJPjK//2d3C3W4fAIV4sawJNh2xQt/
	 7tzeV+CX3qHjYlyTjRNKLr+cS5ek/VNbHEMDTtJJmWv2Hf1QDhtKo3Frwy+bPIWUPx
	 Y3TcYuk3t5ff102OVZVRz9H1igtl4oK7K/f5EBTATPAy+ZlnEoaPNdxo+wn5Frsw5S
	 h4Um7Siweo5Xw==
Date: Fri, 20 Nov 2026 11:08:42 -0600
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
	qiang.yu@oss.qualcomm.com,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v6 2/7] PCI: Export pci_set_target_speed()
Message-ID: <20261120170842.GA890036@bhelgaas>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261119-bwscale-v6-2-9a9a715fcb46@oss.qualcomm.com>
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

On Thu, Nov 19, 2026 at 06:26:34PM +0530, Krishna Chaitanya Chundru wrote:
> Export pci_set_target_speed() so that other kernel drivers can use it
> to change the PCIe data rate.
> 
> Acked-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

The bulk of this is in MHI, so I assume this series will be routed
that way; let me know if otherwise.

> ---
>  drivers/pci/pcie/bwctrl.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
> index c1e749df5bbe..0512ec62dd5b 100644
> --- a/drivers/pci/pcie/bwctrl.c
> +++ b/drivers/pci/pcie/bwctrl.c
> @@ -219,6 +219,7 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
>  
>  	return ret;
>  }
> +EXPORT_SYMBOL_GPL(pcie_set_target_speed);
>  
>  static void pcie_bwnotif_enable(struct pcie_device *srv)
>  {
> 
> -- 
> 2.34.1
> 

