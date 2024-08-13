Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2187C52D7C
	for <ath11k@archiver.kernel.org>; Tue, 13 Aug 2024 21:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RLndxOVhMGnGk0ZQ33snLsOErJZzv8Txl/Ym94gCWEQ=; b=rCnzBtMJvPjyzNhvu4Pn66J7lz
	FTTR0kSZDe7DWQv0U1FifmgjBudb4yFmjBLvlXNIMg9x9rJ3ulGOL9RpOpqpDzVLUD18KCltxMDwd
	YFWb3ULDnzx8BVbhTdxPOTAo28wYJHUd3lZFf89JSNHM3iw10HMgkr93/4rp3D9hZA7zA01I+bhLA
	Z+YWbTMMMOXjB3LOnphGWOlYJwpiwlQ00L2neXvWE1KiXuBO/9wD01zRXjjnp8iS8iux4b/ZM/RsQ
	FwoL+qZl8nxUqNQPmKyXaS21WKoydLZDJEw3o3LDvdkIRRcJxwsUn+5JruwniUCMxCYM/1nhAoVU6
	135ACBDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdyqH-00000004xvs-1hQN;
	Tue, 13 Aug 2024 21:14:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdyqE-00000004xta-1got
	for ath11k@lists.infradead.org;
	Tue, 13 Aug 2024 21:14:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723583645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RLndxOVhMGnGk0ZQ33snLsOErJZzv8Txl/Ym94gCWEQ=;
	b=cZnIOvirxhfADjqx3lB2xCkA5PYNgM8hWW4AR4ME7J9PJPQVHbyo96E8Qvkz3zo6GVTbiG
	soVVW2W5pLB7/7L5C0XXih2c4a+aaqmnRyk5GkCbkPkzTnOOPlggbyaeeWLhDvg5LeiFEs
	U++0aLk8+NMvGRTpTuC4OuuJJTHznng=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-tz4SC_sBPv-w3sEBqdBL6w-1; Tue, 13 Aug 2024 17:14:04 -0400
X-MC-Unique: tz4SC_sBPv-w3sEBqdBL6w-1
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-39b3245b20eso2771285ab.1
        for <ath11k@lists.infradead.org>; Tue, 13 Aug 2024 14:14:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723583643; x=1724188443;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RLndxOVhMGnGk0ZQ33snLsOErJZzv8Txl/Ym94gCWEQ=;
        b=tcwv+OMd9SN2h0JGjmu8LZs6EvYPlYBQiCaioYHPbwgE5RLUVOSOAoe1W1m5HNfTEt
         MJVnhXsTnbxCAX4bbMCeb0bhTtkUsL3QiajSmMFG5MfgjomiFJIhaSSYjCSuKaHOmruD
         VJ2gHRQ0cA5lSiBDuv0yAzUN3jTr3GCh9lRdiP90fLU/+4y5RTkgewRDv7HXtULffUO8
         Dh2OmbBb8ZbAxANd0d0HqZyE3aDj7EFptmjBcMySsi+gNo6LM/yRoVEhOl5ScYQfVL/o
         0gHlwWCZSvGYtLwUOdwvx9L6EAr3kbhSU3YVT/35gfuLaZKtzUpxqAnG654Nmd+Iz9Q1
         EG2w==
X-Forwarded-Encrypted: i=1; AJvYcCUPrDmwBCRwJhpogRVF6p0AyRJrSDeoB7DUPpAwN1NKHF5tkxEYDUwgx5mJt6igUmmSSOmX0Z3CjCRhA8eZxZz5V69wYb3ljXBvUQ==
X-Gm-Message-State: AOJu0YxMlpz10iigK5mnRBFMnDdguLqDpwXrEl12Z00bix9td3UbuOY0
	695Ly4kPWZ/i6d+wUoyqLWNrixDQVzAPRYljI6+9vWGOpv0Z1HINfdMedC0nJpTiKHUt/3MXoE6
	YeTplXCZ+6zUBeuO4hE6j1LuRs41kD7WHhgBlhxVHqSpecZvfcli04DXGv5fVTh+kxYg=
X-Received: by 2002:a05:6e02:1c48:b0:399:4525:c2bc with SMTP id e9e14a558f8ab-39c48dccd95mr35434745ab.10.1723583643362;
        Tue, 13 Aug 2024 14:14:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG80cLRVSOvRn9w9qz+VrLxVLNgcf2C34EALlspiOzLOxMt0M7/SH6xPKbhukHFZiTHKZOB1A==
X-Received: by 2002:a05:6e02:1c48:b0:399:4525:c2bc with SMTP id e9e14a558f8ab-39c48dccd95mr35434605ab.10.1723583642975;
        Tue, 13 Aug 2024 14:14:02 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ca769102d4sm2731540173.36.2024.08.13.14.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 14:14:02 -0700 (PDT)
Date: Tue, 13 Aug 2024 15:14:01 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Thomas Gleixner <tglx@linutronix.de>, kvm@vger.kernel.org,
 quic_bqiang@quicinc.com, kvalo@kernel.org, prestwoj@gmail.com,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 dwmw2@infradead.org, iommu@lists.linux.dev, kernel@quicinc.com,
 johannes@sipsolutions.net, jtornosm@redhat.com
Subject: Re: [PATCH RFC/RFT] vfio/pci: Create feature to disable MSI
 virtualization
Message-ID: <20240813151401.789c578f.alex.williamson@redhat.com>
In-Reply-To: <20240813163053.GK1985367@ziepe.ca>
References: <adcb785e-4dc7-4c4a-b341-d53b72e13467@gmail.com>
	<20240812170014.1583783-1-alex.williamson@redhat.com>
	<20240813163053.GK1985367@ziepe.ca>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_141406_557826_255EDADD 
X-CRM114-Status: GOOD (  27.79  )
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

On Tue, 13 Aug 2024 13:30:53 -0300
Jason Gunthorpe <jgg@ziepe.ca> wrote:

> On Mon, Aug 12, 2024 at 10:59:12AM -0600, Alex Williamson wrote:
> > vfio-pci has always virtualized the MSI address and data registers as
> > MSI programming is performed through the SET_IRQS ioctl.  Often this
> > virtualization is not used, and in specific cases can be unhelpful.
> > 
> > One such case where the virtualization is a hinderance is when the
> > device contains an onboard interrupt controller programmed by the guest
> > driver.  Userspace VMMs have a chance to quirk this programming,
> > injecting the host physical MSI information, but only if the userspace
> > driver can get access to the host physical address and data registers.
> > 
> > This introduces a device feature which allows the userspace driver to
> > disable virtualization of the MSI capability address and data registers
> > in order to provide read-only access the the physical values.  
> 
> Personally, I very much dislike this. Encouraging such hacky driver
> use of the interrupt subsystem is not a good direction. Enabling this
> in VMs will further complicate fixing the IRQ usages in these drivers
> over the long run.

Clearly these _guest_ drivers are doing this regardless of the
interfaces provided by vfio, so I don't see how we're encouraging hacky
driver behavior, especially when it comes to Windows guest drivers.

> If the device has it's own interrupt sources then the device needs to
> create an irq_chip and related and hook them up properly. Not hackily
> read the MSI-X registers and write them someplace else.

This is how the hardware works, regardless of whether the guest driver
represents the hardware using an irq_chip.

> Thomas Gleixner has done alot of great work recently to clean this up.
> 
> So if you imagine the driver is fixed, then this is not necessary.

How so?  Regardless of the guest driver structure, something is writing
the MSI address and data values elsewhere in the device.  AFAICT the
only way to avoid needing to fixup those values is to give the guest
ownership of the address space as you suggested in the other patch.
That also seems to have a pile of issues though.

> Howver, it will still not work in a VM. Making IMS and non-MSI
> interrupt controlers work within VMs is still something that needs to
> be done.

Making it work in a VM is sort of the point here.  Thanks,

Alex


