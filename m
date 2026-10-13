Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BD9CC6B08
	for <ath11k@archiver.kernel.org>; Tue, 13 Oct 2026 14:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sxRXmPGGOdI1+4/8LW6E01BCp/MjtS9NyfOV1SrhfSY=; b=RZa+XG705X52QisXpd6MqHd9XE
	pLPl/mTWp+jStD2LVl+F4ZyHi3axO5oFsQjZhgsNjWmjQQXcr5Q5D29KBOv0fvL0NBnmVTWfh+zJw
	m5RsnGaPp24fF6LKJ1cnE+MNFMmTpRqFGq8q+ksjxs18RiY2+rEoy+pb2OSeRWOn6O3Adhfet0r5/
	riGFANcwC18gmWs2EoZGLtLBWeWnZf6agHK9r2aJT8gzNS0gSYqJBzGeEP5WZbN3pc0UqDtz64V74
	n/HzTl0AySwXrVZOYqRWLOPU1yzSmwwS+nH/hSaSotkNjwslS7vh31Ja0/paKZDGWxjdLrpcpC3fC
	Bf8sp6Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGd6e-0000000D1zx-26dR;
	Tue, 13 Oct 2026 14:03:53 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGd6c-0000000D1yk-02nf
	for ath11k@lists.infradead.org;
	Tue, 13 Oct 2026 14:03:51 +0000
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-98929bb8eb0so790091241.0
        for <ath11k@lists.infradead.org>; Tue, 13 Oct 2026 07:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1791900229; x=1792505029; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sxRXmPGGOdI1+4/8LW6E01BCp/MjtS9NyfOV1SrhfSY=;
        b=BgTG3MB7k+nAbiRCbEWRFc3S8TSOo5DdcuhDUkwt/lxiOUzJhx/Yvj5ski+gTkzXVE
         vep7AcC0WTVWzRZKQVZhWbwfIuG/cWZJZr5sSUyxPsNgqpWlG2f2IBcT3MbUyDn6O0nv
         iMRHmm9H9OLtcJkJ/6IZXmDbhzYNB/pYYdTTzoYgUUFV3ot8+28qeLLtsp7d4KZRQOCU
         cKJcH2NiC/WbuIgpvF45Ujb4EZgb5lLU6scvX0ZXxbVfsgJJKZ0FxJU6kskJBpGtYNoX
         OUl1POTeBhSSnAEP4icuxS25IhQMrqudqjE8tFZBqWXy/5ut0I8rha6dXPJjxz5JwfkI
         bpJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791900229; x=1792505029;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sxRXmPGGOdI1+4/8LW6E01BCp/MjtS9NyfOV1SrhfSY=;
        b=BvEBu69OqeJ9WTJ94ZeWVJxMDYz+DObXO7BHQ6ENu4Y5uklX1FLsCf5jzv3yo+y20+
         Z/OtgRTAHbl2jdPP6c1tr5CQex7AKcmB/N3/2i7C9hlsGRYEL0JBWCj9w7ilLB285Hto
         vY+pbONLVjGLcbPuTzin55sYBBGyNxA1Z5mpLzFPOfDWcEaBTpB/RjA7WO8KbNfV2UsD
         7MvHkC3fdSNuFbYiDaMljoQp85PAY/QhaxrYNnNMRbZyCGo7OYiAx+eFJpQGHS3XkL7y
         0+VuBYOoCGplR99bmmORYEituKpXWV/MobDFqg3DQCOY/WhvO2TURlvOXhC6VnWnMNfQ
         VQIA==
X-Forwarded-Encrypted: i=1; AKwUvBxQg+2EHc0hXKymcy0+SrenIWMBBpD+Qt+H0v6VckggYxgZBz84K5S3oOVRfUIHSDQRFZtn6dU=@lists.infradead.org
X-Gm-Message-State: AFq9FYKa8tmu9xHb4dryAEXl0ZLhnsiLs9WVq6EZ79XHgdwfJ6T4l7GY
	4WPT8d5otABwIY0vyEqcrsauoKvLHuYVFYUPySdjCh9538E0lRsM54rKkJZ6YKtQ2XM=
X-Gm-Gg: AYBFou0gjlKhuOLO18HKeBAnzTDOTt1c+gh0QKWF9TlJirt/mcs+ZlD1T9eZcnfjnwi
	c9gbIC6EhtKA5ChCapGo+Vg0nry/X6v9/R96+wHWC9giZGCSCcBj1JWsAtB3m/Qrn3A+7j16BaD
	OZTtOYIB2vja7qA+PTRMNw4r6LV4SqwpHHeu6ST6YkI2tHSq770ImBQBb9zECIuKcm4FsnjeiDg
	crYRIrL+7yHSxJH/gednYMMpoi7k/6nKSITWK0qnVuRhBzygMV8Sq/+MDAnLHXTXoiJwB70teTC
	Q5J2O1ZDWEbvsx4rWcIGvkarapBUYIzNfehU+PCNGv56T6Ew5XQEWdH3Nd7powvNBgc3m5s3b9g
	JTlHYBWZ3REVEdCHhjw/dXxLSEuoSEfrp3GDZ+vgwVE5PKrz/cBsbNNaznl/EY2iJ0h2RVWtkHj
	lmh/mR7/rxlTwE9PmaHeKN/mT7vR3d4fJwW8XhYDEdzDIBayfJyRPoKaIVu8ApcJsVOy0N1id8F
	Ulnt0IIvYR7b0wqCmimHIVA9gw1xdAq0Jx5JysJhjziXsuED1lTN+EopQ==
X-Received: by 2002:a05:6102:a48:b0:7c3:875e:593b with SMTP id ada2fe7eead31-7cb373fae29mr3183710137.32.1791900228555;
        Tue, 13 Oct 2026 07:03:48 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97bdfb89sm25903626d6.40.2026.10.13.07.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 07:03:47 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xGd6X-00000009i6J-387e;
	Tue, 13 Oct 2026 11:03:45 -0300
Date: Tue, 13 Oct 2026 11:03:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: alex@shazbot.org, ath11k@lists.infradead.org,
	ath12k@lists.infradead.org, bhelgaas@google.com,
	jjohnson@kernel.org, johannes@sipsolutions.net,
	kevin.tian@intel.com, kvm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org,
	mani@kernel.org, skolothumtho@nvidia.com, yishaih@nvidia.com
Subject: Re: [PATCH 0/7] Enable Qualcomm WiFi PCIe passthrough to VMs
Message-ID: <20261013140345.GK14213@ziepe.ca>
References: <20261011132558.GD14213@ziepe.ca>
 <20261013134317.174234-1-jtornosm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261013134317.174234-1-jtornosm@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_070350_504893_AB594EDD 
X-CRM114-Status: GOOD (  21.83  )
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

On Tue, Oct 13, 2026 at 03:43:13PM +0200, Jose Ignacio Tornos Martinez wrote:
> Hi Jason,
> 
> I understand the concern about compatibility implications, but to
> clarify, my intention is not to create an ABI or a "MSI caching
> concept". 

It very much is an ABI, you defined a new ABI in the config space a
layout between guest and host that we have to maintain forever.

Just for a hacky solution, it is not so nice.

> I can explore converting ath11k/ath12k to
> platform_device_msi_init_and_alloc_irqs(). However, if I understood
> correctly, the VM problem remains identical after that change — the
> firmware still needs physical host addresses, and device MSI domains
> in the VM would still provide virtual ones.

Yes, but it removes the solution of copying data from the existing
MSI-X table from consideration, which is the primary hacky thing here.

> I'm happy to do this refactoring if it opens a path to get these
> devices working in VMs. What VM mechanism would you accept for
> exposing physical MSI values through device MSI domains?

Once you have a MSI domain you just need a driver wired into it that
can request and get the physical addresses from the hypervisor. Then
when that domain is in use the guest will always see true physical.

That part is easy enough, it already exists and you don't need any
driver changes.

The bit that isn't clear is how you get the domain in the first
place. I suppose something like a virtio-msi is a good starting point,
but I don't know enough about ACPI/etc to imagine how to wire it into
the flow.

IIRC hyperv does this, so maybe there is something to follow there..

> Jeff is escalating to Qualcomm engineering again (thank you for
> that), but users with deployed hardware need something working in a
> reasonable timeframe.

Yes, but it has already been years, and Qualcomm doesn't seem to care
about these uses cases, so I'm not sure I see the urgency to do a bad
ABI hack..

Jason

