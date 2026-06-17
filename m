Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E7FCD98E2
	for <ath11k@archiver.kernel.org>; Wed, 17 Jun 2026 16:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JAaKztVtAjTEh5iAYKxqFq8EDcZvRu/sAfJLhlyALxw=; b=Nz/xvUcch+lzCm2aYvjPpQpOuk
	XRB1Bv3TVrZwnoHDIuxOL6SoJ0N7P7N5f8BfrHxQkJpIQG99NqGLkMPP25q9TAkouaYT0vm5JbR/K
	6H5ErsmFQc2qGmg3nDe5bOZ2gIuZAPkOZDEvg/jezQuXaMwkhL0dfnA9JDnfsWwfmHfP6u/YTNKdH
	DAQjFBfUe85thg9ZUzokWbouvxZslH/+m1XnQZnX6k0qGgTo7ixk4sblrEn2KADwwZuXPOs7za7rQ
	DPSxb3DZXGcdHARe2ThU7zbVNt0T4RtayMWtRITk9kAt73KaZxfDdZ33v2X4/B3T8o4uGBNdjrsMg
	PsRyj9wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZtYD-000000004mg-0lzg;
	Wed, 17 Jun 2026 16:55:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZtYB-000000004mP-1ePI;
	Wed, 17 Jun 2026 16:55:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D6306436CA;
	Wed, 17 Jun 2026 16:55:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5FDA1F00A3A;
	Wed, 17 Jun 2026 16:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781715338;
	bh=JAaKztVtAjTEh5iAYKxqFq8EDcZvRu/sAfJLhlyALxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hbuXaWAmadyEloMTRkxwYTceWjSbsRB709unQQIxxZzdYO4DtDwS/hyfSV8WMimN7
	 12twiOzWkcbSAQAyaMSjfJ3MoeMx9SBSJciSR9gGWqqngog5vBgL4VZTHE2XMrEIdx
	 AjFDYa1YkDVoo1S7vkUFwxwdxNXcmg6qyToMdYkWJQ6Q3f0kJIi+kw19hZEQigcoaW
	 l2xNblS91FLQeHs+3XrJWq4GEFmjlEMViRnTT/rB6hbgEbEmJHxT7lt9820bVCXo88
	 q9j0nf5A/o/WO6BLLR/ACPrfUgi/RjWQvXp6TQtvmDcSzS+iwJjs/i6H3MzpcfFjce
	 cy2EYCpvUA8Kg==
Date: Wed, 17 Jun 2026 18:55:30 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: alex@shazbot.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, bhelgaas@google.com, jjohnson@kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org, 
	mhi@lists.linux.dev
Subject: Re: [PATCH v9] PCI: Add device-specific reset for Qualcomm devices
Message-ID: <n3maiuu5cctivlal4fozysz37ir6ecdfws5u2xxw2neclsfdfj@nsvwvlh7b4j5>
References: <6nivb5fncfd5dwqkzlxwhtgbsiqvifazcbgpsgukp44iib45ke@65qpwgrvtkgn>
 <20260617154709.186286-1-jtornosm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260617154709.186286-1-jtornosm@redhat.com>
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

On Wed, Jun 17, 2026 at 05:47:04PM +0200, Jose Ignacio Tornos Martinez wrote:
> Hi Mani,
> 
> Thank you for the internal clarification and sharing this information.
> 
> I understand the behavior is firmware error recovery, not a proper reset.
> However, these devices are widely used, and the inability to use them in VMs
> is a significant problem. Could we explore options to achieve safe VFIO
> operation?
> 
>   1. Are there ANY alternative reset mechanisms besides D3cold? For example:
>      - Device-specific registers or commands?
>      - MHI bus-level operations?
>      - Firmware commands that could trigger proper reset?
> 
>      If such mechanisms exist, I'm willing to implement whatever is needed.
> 
>   2. If firmware error recovery is the only option available on platforms
>      without _PR3, could we add software steps to make it VFIO-safe?
>      For example, before/after the D3hot transition:
>      - Explicit MHI state teardown?
>      - Firmware commands to clear sensitive device state?
>      - Additional verification or cleanup steps?
> 
>   3. The practical challenge is that _PR3 support is not available on most
>      platforms where these devices need to be deployed (desktops, servers).
>      Additionally, the general d3cold reset method has limitations and
>      remains unimplemented due to the concerns raised earlier (ACPI
>      portability, bridge issues, runtime PM complications).
> 
>      If D3cold is the only proper reset but requires _PR3, and no alternative
>      mechanisms exist, could we consider accepting the firmware error recovery
>      behavior as a last resort - clearly documented as a platform-specific
>      workaround?
> 
>      Currently these devices have no reset capability on most platforms,
>      making them completely unusable for VFIO. Even an imperfect reset is
>      significantly better than no reset at all.
> 
> My goal is ensuring these devices can be safely reassigned between VMs.
> I'm open to implementing any of the above approaches - or others you might
> suggest.
> 

Can you share the exact steps that you tried for passthrough? I'm curious to see
whether you unbinded the MHI host/WLAN driver from the device or not. For the
modem devices, the MHI Host driver's (drivers/bus/mhi/host/pci_generic.c) remove
callback should've quiesced the device and moved the MHI state to RESET if the
driver was unbinded before binding the device with vfio-pci.

I certainly feel that the MHI/WLAN driver should be able to reset the device
during unbind. But I'm not sure if that reset will affect only the firmware
state or the device's config state also. This is something I need to
investigate.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

