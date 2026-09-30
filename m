Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93394CA5FC5
	for <ath11k@archiver.kernel.org>; Wed, 30 Sep 2026 15:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i3zztcZwHv33xTSBhcuuRwUuO/mC2YE/oPR+7vCHXWU=; b=ff4LEYfGBczSDguJLr+AtX0Nmg
	EZ2x/xqwzNTvfWtJD0CteO7w4GPvExyAlv9nnoUDszi/r8z9Yt3RF/BCvW47TL1mqAhtAA7ZiaVmy
	MGsuq0YeGCtsaAik637hIhfi5WSxf5Obb+OpA0BEcurk2abpIYLmvGIdyFIx2/111feHTkeASqBLd
	dF85Vwu0TtmyYKTI0KLmssvNhpBwSJ7ApedFqOWgMq41gtaDc6JMMWef6ksPL7lr8VaG8qr0eit9x
	IFTefwpshTrngYcEr3VxJ3IGhSwGrmtnGmC3sGbc+Zt3vnh19UZsIzfOfuwbHv/YRSetIgUo1gXfa
	k1UVCaRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvz2-00000006RgK-0xl3;
	Wed, 30 Sep 2026 15:12:36 +0000
Received: from mail-oa2-x23.google.com ([2607:f8b0:4864:30::23])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvyz-00000006Rfb-1KHU
	for ath11k@lists.infradead.org;
	Wed, 30 Sep 2026 15:12:34 +0000
Received: by mail-oa2-x23.google.com with SMTP id 586e51a60fabf-47b8afe046dso2914203fac.2
        for <ath11k@lists.infradead.org>; Wed, 30 Sep 2026 08:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790781152; x=1791385952; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i3zztcZwHv33xTSBhcuuRwUuO/mC2YE/oPR+7vCHXWU=;
        b=gRcBsUL9GouC2ujqD/qZgC1OK+OQGZ+iUIrdncFg6hoQ4AcVhk9Hmj/pdq2yxrJmw2
         p+LPEP9Wi+3pMvsLer1Biu5ZBDVicvlZBEuuIJo2iRQr4Shq+Q7duJ5HnrdggJ6ZdZ2p
         el+yBuj+tOfn6et3g9BLKIDrExSKhrvtlZ2WduyZjk9YI4OZY4mtFOwPwp6TQVdzSMKO
         /icJH4qoHO7sddE0iAoklv4FBlVJJwCJgFGFJlH0FFUMoBWB0vfi9ckt0toQG3FJca0y
         /HhNDq+jSD8LpsrowgZCN9xUXGJMLCdiL0HfTYLFrvvyjTBbGkeFSA6aG9IZf7UkylkC
         vS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790781152; x=1791385952;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i3zztcZwHv33xTSBhcuuRwUuO/mC2YE/oPR+7vCHXWU=;
        b=0boC5Cl6oNUDto2qkDNUH+Eze5+5njamPEAUlD00VDw4Tu11VpEK20jv4b9ffoEN9l
         a21gWEdgsptxi2NAjbn2jSuD5geYmPXkSOGXcTNPPssImnCaNxmqnwtE7UUPyAekbept
         5iby5kiO6wFZE93TeqRdZ5KMW9wN4Mj1eUgmy0yVHOsR6SDdLYhXWpgOSwxNk6xnKTI2
         Z3btjPXj3dmfUVmdsdUM43o+CdI1HxCg6l40uIkouOwKqVtRir79c33E/tsliGXKMYLM
         oH7+rYxfGfPTAgYIgvD0JkddNAHOAOQjkA9BvhuuQRM02UtPARnH5q08jRmcVaoy6Tlb
         HG2A==
X-Forwarded-Encrypted: i=1; AKwUvBwx9/viRDi+/15TuaJk1FfJRqlO6INuW16MOSh18tv69MFo5NuR7qI/FAWw8mbB0nNEJSZ0xvA=@lists.infradead.org
X-Gm-Message-State: AFuF++kan6XDmrZuYH/ThJdZ7zW/LPmIWlKhw9n/M2JvGnkTzmr1DAMj
	mOkuEQtgxHk+AiC753KmcO2ZSNfYckOrcE0X9FkDSzEvQPpJxxG7XjDJVa/3MmZBO2E=
X-Gm-Gg: AYBFou3QrBnBKFmkdkdgsx2gF5uEO9Uadiikwwquhw+WoLnkhqS7x6zi08FEBqdExwf
	3aUZhcyxTQF//E/3d3O26EeoO5fYAXAqiYxeE/zhn0t1YfzX07JhVQhC5jhPi9uiJW1kfb19FWg
	PpbFpFnnhHuMkTbyAEhMQxlQnzNRF7sYnECDESEnNGNFFunvzbn0ZkF0MEA4dYcUeBVXCxOm/ab
	HOIMxTFAeh3qMP0gLo66c2+2OOCLcoRQHDNjGOmAMjNyU4qhNVXRBe8Wga7uhkAKvTg+uYNH9yP
	FANcA02PZhU1aPC8K4XUCAt30sZ3tjHIrcJODec7A+3ot1f3uWYmXIxEvBzYApF2HIdav6x7i28
	2LANaAlu84FT2xArHCck/+vMy0XyywmqAoHAVConbHez4OnREahnuVq0IwargnyJE1AgR5AL8QW
	uAyT2okIx9PIuSksv1KAEYYvrfpk8K/79StuI5q/oQ7Xei
X-Received: by 2002:a05:6808:23cd:b0:4d6:90d3:e187 with SMTP id 5614622812f47-4f1b9a4dd1fmr1463609b6e.48.1790781151901;
        Wed, 30 Sep 2026 08:12:31 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4f1b61be7d8sm1076055b6e.17.2026.09.30.08.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:12:31 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xBvyv-0000000BwZW-3H3V;
	Wed, 30 Sep 2026 12:12:29 -0300
Date: Wed, 30 Sep 2026 12:12:29 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: bhelgaas@google.com, alex@shazbot.org, jjohnson@kernel.org,
	johannes@sipsolutions.net, mani@kernel.org, yishaih@nvidia.com,
	skolothumtho@nvidia.com, kevin.tian@intel.com,
	linux-pci@vger.kernel.org, kvm@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	ath12k@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] vfio/pci: Add qcom-vfio-pci variant driver
Message-ID: <20260930151229.GR163130@ziepe.ca>
References: <20260930140833.576941-1-jtornosm@redhat.com>
 <20260930140833.576941-4-jtornosm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930140833.576941-4-jtornosm@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_081233_363286_8C5B98B1 
X-CRM114-Status: GOOD (  17.58  )
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

On Wed, Sep 30, 2026 at 04:08:29PM +0200, Jose Ignacio Tornos Martinez wrote:
> Add VFIO variant driver for Qualcomm PCIe devices that require
> MSI address passthrough for VM operation.
> 
> Qualcomm ath11k and ath12k WiFi devices have embedded interrupt
> controllers that require physical host MSI addresses programmed to
> device registers. In VMs, the driver only sees virtualized guest
> addresses, causing firmware initialization to fail.
> 
> This variant driver:
> 1. Caches physical host MSI values after allocation
> 2. Writes them to extended config space with magic signature "QMSI"
> 3. VM drivers discover and use these values automatically

You should probably explain a little be more here

1) Linux VM driver fills up the normal MSI-X table
2) HW has some non-MSI-X table registers
3) Linux VM driver pokes into the interrupt layer and extracts
   one of the MSX-X table entries addr/data pair
4) Linux VM driver now programs that copied addr/data pair into #2

This is, of course, all wrong. These days it should be using one of
our mechanisms to allow devices to have their own private MSI
registers.

I forget if this is the right way for PCI, but the driver can call

  platform_device_msi_init_and_alloc_irqs()

And directly program the MSI registers with their own special
interrupts vectors, no copying from MSI-X.

If the driver is fixed to work like this, as it should be, then it
fully breaks the scheme you propose here. That's not good.

The problem here is not really a qcom problem, and treating it as a
qcom quirk is why it keeps being stuck, IMHO.

The real issue is that this device MSI scheme does not work in VMs at
all. It does not work because the VM IRQ design requires the VM to
trap and modify all the MSI addr/data pairs at the register write.

The technically clean solution is to redo the VMMs so they don't
require that, ie use interrupt remapping so the VM's view of the
addr/data pair matches physical. That's super hard and will probably
never happen.

But! Now that we have these device MSI domains I wonder if there is
some half option to provide a hypercall so the device MSI domains can
call out to the hypervisor to get the true physical addr/data pair to
program?

This is fundamentally an irq layer issue in Linux, not a qcom one.

Jason

