Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE0ECD98C7
	for <ath11k@archiver.kernel.org>; Wed, 10 Jun 2026 19:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=hU4IFAsCcxyohAC1uRq1LnazIL9Yv+87ae0nhmv5w/w=; b=bdFfRTYTAEyvNy
	JmLMEn9QsE7M5rYjk6Q8086dd6f32IZaOKIxC2rWnRteNQFZgDN6g5XYKwMKobEZhctD1dzRki7tt
	OsP39NlFd68ZQowukhJpYCKCER6Wx9mexM8StYDHuBrFTFtRTkU7hk4ZhJ/5g/+ZndEhbifGdVQbO
	6jwqTCyOLO/WPShkS4XqJcFROZJ8GaKLelQ4GOKHVka1jBwC/hVgsG0Js1NIt4VCxYaK+UlJO3aic
	Z3ZqxElvW4Ge3BZWZkwnUu4OJ9DjIHQG/dRbLrNSAGNAqhsrV4a3hVAA81cXXQah0LfqQ3+kl3URT
	9yrT0mAGxvOGhPJiqo0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXOmc-00000008H7P-3msJ;
	Wed, 10 Jun 2026 19:40:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXOma-00000008H7F-2rQO;
	Wed, 10 Jun 2026 19:40:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 971CB4189E;
	Wed, 10 Jun 2026 19:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46B231F00893;
	Wed, 10 Jun 2026 19:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781120411;
	bh=hU4IFAsCcxyohAC1uRq1LnazIL9Yv+87ae0nhmv5w/w=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=fuMIkcdDIet4CZe8638VWQL4JFeHHAUP8aGPm0y/OUNfRu7oRuyobu308+m4CWYby
	 x04kSR8CWKYXUWx9EKINlOlOBAjtE++to2622W6NiU+kKWW6WzRf2mRNNawRVMRoQJ
	 FRiQTfjW8awttH9aBnO6ievQxb49J78gbdbWvuvkzuPFdI04MSC/zjJnAg6qt6YW9K
	 ymHozcyl9AV43dbS/J23W7nCAn/XWAE51nq+OQGMKEa2j+Q49WTrBzOOPITBafgc8I
	 XUyaJKvlZ25QbHDhbTyQgA8T1VSJw7H8tuMvOA/nZWEsyitKi8cYdcuZcAGmribmhl
	 Y4AaIXlbT/2OA==
Date: Wed, 10 Jun 2026 14:40:10 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: bhelgaas@google.com, alex@shazbot.org, jjohnson@kernel.org,
	mani@kernel.org, linux-pci@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	ath12k@lists.infradead.org, mhi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 3/3] PCI: Disable broken bus reset on Qualcomm devices
Message-ID: <20260610194010.GA376413@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609163649.319755-4-jtornosm@redhat.com>
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

On Tue, Jun 09, 2026 at 06:36:49PM +0200, Jose Ignacio Tornos Martinez wrote:
> Some Qualcomm PCIe devices (WCN6855/WCN7850 WiFi cards, SDX62/SDX65 modems)
> do not properly support Secondary Bus Reset (SBR).
> 
> Testing confirms this is device-specific, not deployment-specific:
> MediaTek MT7925e successfully uses bus reset through the same passive
> M.2-to-PCIe adapters where Qualcomm devices fail, proving PERST# is
> properly wired through the adapters.
> 
> This quirk acts as a safety net, preventing the broken bus reset from being
> attempted if users override reset methods (device_specific or d3cold when
> available) via sysfs.
> 
> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>

Applied this patch (3/3 only) to pci/virtualization for v7.2, thanks!

It looks like the D3cold parts are still being ironed out.

> ---
> v8: code unchanged from v7
> v7: https://lore.kernel.org/all/20260603105853.326290-4-jtornosm@redhat.com/
> 
>  drivers/pci/quirks.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index 000000000000..111111111111 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -3789,6 +3789,9 @@ DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_ATHEROS, 0x0030, quirk_no_bus_reset);
>  DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_ATHEROS, 0x0032, quirk_no_bus_reset);
>  DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_ATHEROS, 0x003c, quirk_no_bus_reset);
>  DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_ATHEROS, 0x0033, quirk_no_bus_reset);
>  DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_ATHEROS, 0x0034, quirk_no_bus_reset);
>  DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_ATHEROS, 0x003e, quirk_no_bus_reset);
> +DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_QCOM, 0x1103, quirk_no_bus_reset); /* WCN6855 */
> +DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_QCOM, 0x1107, quirk_no_bus_reset); /* WCN7850 */
> +DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_QCOM, 0x0308, quirk_no_bus_reset); /* SDX62/SDX65 */
> 
>  /*
>   * Root port on some Cavium CN8xxx chips do not successfully complete a bus
> --
> 2.53.0
> 

