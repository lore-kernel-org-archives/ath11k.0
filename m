Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00D5C52D7B
	for <ath11k@archiver.kernel.org>; Wed, 14 Aug 2024 15:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mg23CNEDMD4zHjO1hlkwyk+loYx0YTVZ8r/y6/PQnrA=; b=dWpm78f/LiUpZ5QrT0gtErWRhE
	PLikIIdsjw4IWlYtnevaZVitboVbUOvsdYXz/k4Ic2M2qW8M9+ya3ZscMy3xOjeV2c/33YNtw+JyE
	lJanYOPMtdpx0W5msQKjD7ClNchKpmyRsDnCpQOsLZ7Ni0eaFx0AQUq+IouLUugR4y31bvqX6ni/Q
	4wqWUePc1rnN29d5A3mJOPCdpkvoag6Ad5ams71ZkmHMrxJG+1wvtwWYlBH08VxVH4hu7zZqJXAcH
	2ugCMnmlZChamDMnt1EJQgH9brW1MkJ3kFkfE0cL5V15nctpQFhnqNg3n/xoJgDJBvODxZSQ8miOy
	R4KAnEBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seFnf-00000007SRg-3iaU;
	Wed, 14 Aug 2024 15:20:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seFne-00000007SQk-0nKw
	for ath11k@bombadil.infradead.org;
	Wed, 14 Aug 2024 15:20:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Mg23CNEDMD4zHjO1hlkwyk+loYx0YTVZ8r/y6/PQnrA=; b=o05eyA8+T+ubhZP+cKWQS18S5E
	vwMfUTvF8iW2DDL8XYlQxSum6A4JRNzmw6vLpd7KUoCUJoK+mlMYQdR4JXNcREcG94dnbEMTmUSOs
	ZC6PPsDNt5/vh/IA92l0hy/ghJ6WQ8A1fLQG9VXuAZB0SlkpREAxWwmaALWSOYtM76F4dOnAuEi1p
	Aw+yeDQoGU8OV9DmfTgPhajSaIkSsm1cUKhWzqN09Lw40xCBjljE5vWYTDn+ROc81FL6sVQTMNWpE
	RHAjhh4snnc1bldDriABkhvvTwImPv3nKxDERXfsAm7WB31fv+RghxUqnOdakv5rek9deYk7/dERb
	aqOBnqfw==;
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seFnZ-000000086Ej-3pF0
	for ath11k@lists.infradead.org;
	Wed, 14 Aug 2024 15:20:32 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6b7b28442f9so73979586d6.3
        for <ath11k@lists.infradead.org>; Wed, 14 Aug 2024 08:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1723648827; x=1724253627; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mg23CNEDMD4zHjO1hlkwyk+loYx0YTVZ8r/y6/PQnrA=;
        b=TDMcveTfmwcMNSu2zFwzeZAv8oWsII/cjxvOAgX4Djwfn9edDv+9uxSft9ViSrXQpB
         xYX+lomEvsnMm6QLUgHrlwj4GJ1VLN3ieSP2FLVrlFK7no6TrD2IMUN2gBvjuSgXXywU
         h+FeHLbjyxXvjgGXyjxfwpmEHgdpwR2Q50goN64Tz1QybHM5JzKfFgzocf2oCOVZ1kTO
         QekyMS6v3/IDWxqn4gV7vJVBSYFtHntizqcyGHA/mt6twvU+X4NFIFvlGjrciN9sb8Bd
         58x+IFE/SLqp+ArN+LJtxKuFblowJRqe1SWbXYtl1nwxj/cXVoEpks4EeV5y8rGWJKKQ
         6RZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723648827; x=1724253627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mg23CNEDMD4zHjO1hlkwyk+loYx0YTVZ8r/y6/PQnrA=;
        b=GEye1OBV+j3xI2x0N83jbaoqNMd73NAWnLQpQEYMYMhjb5DPlzAxhVY6QMumKSCJ+J
         6XQUvg5nxbu2NjUBuSJR7PrasMwnZpb8VkQ19kFhlW9RjXbUZuvIrVaHvNxrcVsH993k
         ZVAId8E+dKqAEByBqM9bu+g0SZipwyyGV2Gc8yQGg++OsD978qctPIdOUyAn//RDjC6y
         axMcYNbjCNLjmR+oSEmWAml7COa/aNvfPFTRVwLIaMVMk0Cat91qNRqnMpGJob1M8A0G
         Lw80mPAga82cBs0vz/AF/6sdJFLKBIWGBWo4aISLzM6tCqMDIgNpRWw0V6QybKrXTJmi
         X5DA==
X-Forwarded-Encrypted: i=1; AJvYcCXd6sqgC4d+HvFLaJTPZQwr3flGIT6uX3UEDUSSz6nMFpaZbU7jXlkn+A2Vfvlw3ivhG4EvJ95WUeW/fv0Si/YFa/hFT9a9817SHA==
X-Gm-Message-State: AOJu0Yyi7Y1WPLU/yuppteA5sDog+Tuv6Dsafb5MEPX0F9MhM91yLCN6
	dqdxBAsz1bZf+CtpINLQNZsnyKbbamAcMccsqqqqWiTWA4OWt6hTslzMUmHAksI=
X-Google-Smtp-Source: AGHT+IFs/BQEZjr8h6unAsrJ2o06RGnXrm/il5j+/wDCwXIvEtQlOlvpOhTjJBqTcjF825DsnYbpEw==
X-Received: by 2002:a05:6214:3c9f:b0:6bd:6ff2:bb3c with SMTP id 6a1803df08f44-6bf5d056a6dmr44429756d6.0.1723648826791;
        Wed, 14 Aug 2024 08:20:26 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bd82e4e5d3sm44550136d6.110.2024.08.14.08.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 08:20:26 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1seFnV-00EfQF-Mk;
	Wed, 14 Aug 2024 12:20:25 -0300
Date: Wed, 14 Aug 2024 12:20:25 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, kvm@vger.kernel.org,
	quic_bqiang@quicinc.com, kvalo@kernel.org, prestwoj@gmail.com,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	dwmw2@infradead.org, iommu@lists.linux.dev, kernel@quicinc.com,
	johannes@sipsolutions.net, jtornosm@redhat.com
Subject: Re: [PATCH RFC/RFT] vfio/pci: Create feature to disable MSI
 virtualization
Message-ID: <20240814152025.GA3468552@ziepe.ca>
References: <adcb785e-4dc7-4c4a-b341-d53b72e13467@gmail.com>
 <20240812170014.1583783-1-alex.williamson@redhat.com>
 <20240813163053.GK1985367@ziepe.ca>
 <20240813151401.789c578f.alex.williamson@redhat.com>
 <20240813231642.GR1985367@ziepe.ca>
 <20240814085505.60819623.alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814085505.60819623.alex.williamson@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_162030_796901_BBA64E7D 
X-CRM114-Status: GOOD (  20.70  )
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

On Wed, Aug 14, 2024 at 08:55:05AM -0600, Alex Williamson wrote:
> Let's imagine the guest driver does change to implement an irq_domain.
> How does that fundamentally change the problem for the VMM that guest
> MSI values are being written to other portions of the device?

If changed to irq_domain the VM will write addr/data pairs into those
special register that are unique to that interrupt source and will not
re-use values already set in the MSI table.

This means the VMM doesn't get any value from inspecting the MSI table
because the value it needs won't be there, and alos that no interrupt
routing will have been setup. The VMM must call VFIO_DEVICE_SET_IRQS
to setup the unique routing.

These two patches are avoiding VFIO_DEVICE_SET_IRQS based on the
assumption that the VM will re-use a addr/data pair already setup in
the MSI table. Invalidating that assumption is the fundamental change
irq_domain in the VM will make.

> The guest driver can have whatever architecture it wants (we don't
> know the architecture of the Windows driver) but we still need to
> trap writes of the guest MSI address/data and replace it with host
> values.

Yes you do. But the wrinkle is you can't just assume one of the
existing MSI entries is a valid replacement and copy from the MSI
table. That works right now only because the Linux/Windows driver is
re-using a MSI vector in the IMS registers.

I suggest the general path is something like:

 1) A vfio variant driver sets up an irq_domain for the additional
    interrupt source registers
 2) Somehow wire up VFIO_DEVICE_SET_IRQS so it can target vectors in
    the additional interrupt domain
 3) Have the VMM trap writes to the extra interrupt source registers
    and execute VFIO_DEVICE_SET_IRQS
 4) IRQ layer will setup an appropriate unique IRQ and route it to the
    guest/whatever just like MSI. Callbacks into the variant driver's
    irq_domain will program the HW registers.

Basically exactly the same flow as MSI, except instead of targetting a
vector in the PCI core's MSI irq_domain it targets a vector in the
variant driver's IMS IRQ domain.

Then we don't make any assumptions about how the VM is using these
interrupt vectors, and crucially, SET_IRQs is called for every
interrupt source and we rely on the kernel to produce the correct
addr/data pair. No need for copying addr/data pairs from MSI tables.

> As noted above, this does not provide any visible change to a QEMU
> guest, it only enables QEMU to implement the quirk in the other
> patch.

I see, I definitely didn't understand that it only reaches qemu from
the commit message..

Jason

