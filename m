Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093C7C52D7C
	for <ath11k@archiver.kernel.org>; Tue, 13 Aug 2024 21:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1UOf/e3HcQ+l94OWXrCwdSK3TbHtvFPHwqfrVahjAnI=; b=Rglg4gBmU9f+Y6olkCWBCmd6x5
	e+EanlcaiKjx0XuYKm1Oox/VgAKcimrXHM0i7FwobqlqdFqbeZUWCJdRaHJekxkY8bSWdCM70bjPr
	qD5KLTMvZLWTOKWqA65ecNgBTCjrdmm13WEpgz39D6QCmPp9Mcqk2ZzIYSIl+Cvo8h3SStZHuhDPq
	Sx7lrdgwdS6o2ic5M3eJ4nENep3FSljJBI9SuJHbvqYlgPpAPWO42eR6+ohGo3y+vegSvEpdExr23
	YnUf/9b8Z8YhUIfjkf0YZ6NTBQ7pI73JpHfa65py0M4STdMhiIrc9hVYyPMi4P72lF351OfvXkTp2
	nXfATDAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdyg0-00000004waw-0ivE;
	Tue, 13 Aug 2024 21:03:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdyfw-00000004wa5-3x7x
	for ath11k@lists.infradead.org;
	Tue, 13 Aug 2024 21:03:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723583005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1UOf/e3HcQ+l94OWXrCwdSK3TbHtvFPHwqfrVahjAnI=;
	b=HzZPKLdmzl9SfUMMYWJITFd9JXtrdorv7WolYXcogxGZTwKSAKv1H2cpdHiss7rLBprePA
	1JTkHWGsRIi5aHPMmcZjtdmIqmRHxcf2q85Eq7cXSu8UktEGheGfJtU92WgydJzbp6OTWc
	vtTpEUgoVarlN/HBi/pu73aIU06I6yU=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-L6AjgXfVN1Wudd48J9kzkw-1; Tue, 13 Aug 2024 17:03:24 -0400
X-MC-Unique: L6AjgXfVN1Wudd48J9kzkw-1
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-82237e575f7so753474539f.3
        for <ath11k@lists.infradead.org>; Tue, 13 Aug 2024 14:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723583004; x=1724187804;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1UOf/e3HcQ+l94OWXrCwdSK3TbHtvFPHwqfrVahjAnI=;
        b=qzCZNzO76s0Yiezsi1yERdI18QWPtnpWz7r7zxQChIV44udSABoZz77daj1Iqi6Vuk
         HOFYDHF8jUOTOazDhQHGQCGRXd+6hcMxANsgqWZO1CZRIFCKQQTmPEKcthY01f1g6oh8
         V4Kh7YaTV0fzoMyGbjS8bHfiyPhs5HHSs+XiG/p51hi2XfehmZHyFE29O0cfTIqkhwaH
         KXla7lQE7szzrsJ7hs+8JGJQ4eeHDqY/3WkEVdvCH98xvbSto3lkXTeqdo45qR2T8iO7
         5End5HXxnZGaaBfBLVOw8jnQisg4DNexZo4ac4i7Yg0aEHZPJgK7UeeJjXEMQIgszAfr
         ZKiQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3pCmMKbH5nA+l2Djh/HFKzL3i9+lfwhSh/gIkYM8OL+E+JsJZmeUtsygpVHmOKacsoNVwQPF+VnZLsEUZlK95WdItOiLaLRB/VA==
X-Gm-Message-State: AOJu0Yzc+ScwwaSj95HfVLd0OZPuFlnSA0pmAvLIZBXKxUlaRe4xeYSM
	kjLMwbtDnERDkeLOeVAvWsP5YVMuGSjigQML+Xm/t3XC7gxiM1TFmIQqMlpf0IOVB7TYmoHtKrg
	DwpTfQdLLZ3Y5aQQ9fiF3rdnLRaTeFNmiE95BTB8sQ+VG08TcvDBxCPt0WcB6CyCKOq0=
X-Received: by 2002:a05:6602:14d2:b0:804:9972:2f8c with SMTP id ca18e2360f4ac-824dad04265mr122543939f.8.1723583003655;
        Tue, 13 Aug 2024 14:03:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUG+Ra/4MLDKrpbcdWTsiFMgCKM25UlSCbFVfALG5nTggblaB3Mjb05rv1rYcf1nGj/+3LVA==
X-Received: by 2002:a05:6602:14d2:b0:804:9972:2f8c with SMTP id ca18e2360f4ac-824dad04265mr122539339f.8.1723583003274;
        Tue, 13 Aug 2024 14:03:23 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ca76910393sm2733107173.7.2024.08.13.14.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 14:03:22 -0700 (PDT)
Date: Tue, 13 Aug 2024 15:03:20 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, quic_bqiang@quicinc.com,
 kvalo@kernel.org, prestwoj@gmail.com, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, dwmw2@infradead.org, iommu@lists.linux.dev,
 kernel@quicinc.com, johannes@sipsolutions.net, jtornosm@redhat.com
Subject: Re: [PATCH RFC/RFT] vfio/pci-quirks: Quirk for ath wireless
Message-ID: <20240813150320.73df43d7.alex.williamson@redhat.com>
In-Reply-To: <20240813164341.GL1985367@ziepe.ca>
References: <adcb785e-4dc7-4c4a-b341-d53b72e13467@gmail.com>
	<20240812170045.1584000-1-alex.williamson@redhat.com>
	<20240813164341.GL1985367@ziepe.ca>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_140329_093795_D653CFF2 
X-CRM114-Status: GOOD (  34.39  )
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

On Tue, 13 Aug 2024 13:43:41 -0300
Jason Gunthorpe <jgg@ziepe.ca> wrote:

> On Mon, Aug 12, 2024 at 11:00:40AM -0600, Alex Williamson wrote:
> > These devices have an embedded interrupt controller which is programmed
> > with guest physical MSI address/data, which doesn't work.  We need
> > vfio-pci kernel support to provide a device feature which disables
> > virtualization of the MSI capability registers.  Then we can do brute
> > force testing for writes matching the MSI address, from which we can
> > infer writes of the MSI data, replacing each with host physical values.
> > 
> > This has only been tested on ath11k (0x1103), ath12k support is
> > speculative and requires testing.  Note that Windows guest drivers make
> > use of multi-vector MSI which requires interrupt remapping support in
> > the host.  
> 
> The way it is really supposed to work, is that the guest itself
> controls/knows the MSI addr/data pairs and the interrupt remapping HW
> makes that delegation safe since all the interrupt processing will be
> qualified by the RID.
> 
> Then the guest can make up the unique interrupts for MSI and any
> internal "IMS" sources and we just let the guest directly write the
> MSI/MSI-X and any IMS values however it wants.
> 
> This hackery to capture and substitute the IMS programming is neat and
> will solve this one device, but there are more IMS style devices in
> the pipeline than will really need a full solution.

How does the guest know to write a remappable vector format?  How does
the guest know the host interrupt architecture?  For example why would
an aarch64 guest program an MSI vector of 0xfee... if the host is x86?

The idea of guest owning the physical MSI address space sounds great,
but is it practical?  Is it something that would be accomplished while
this device is still relevant?

> > + * The Windows driver makes use of multi-vector MSI, where our sanity test
> > + * of the MSI data value must then mask off the vector offset for comparison
> > + * and add it back to the host base data value on write.  
> 
> But is that really enough? If the vector offset is newly created then
> that means the VM built a new interrupt that needs setup to be routed
> into the VM?? Is that why you say it "requires interrupt remapping
> support" because that setup is happening implicitly on x86?
> 
> It looks like Windows is acting as I said Linux should, with a
> "irq_chip" and so on to get the unique interrupt source a proper
> unique addr/data pair...

The Windows driver is just programming the MSI capability to use 16
vectors.  We configure those vectors on the host at the time the
capability is written.  Whereas the Linux driver is only using a single
vector and therefore writing the same MSI address and data at the
locations noted in the trace, the Windows driver is writing different
data values at different locations to make use of those vectors.  This
note is simply describing that we can't directly write the physical
data value into the device, we need to determine which vector offset
the guest is using and provide the same offset from the host data
register value.

I don't know that interrupt remapping is specifically required, but the
MSI domain needs to support MSI_FLAG_MULTI_PCI_MSI and AFAIK that's
only available with interrupt remapping on x86, ie.
pci_alloc_irq_vectors() with max_vecs >1 and PCI_IRQ_MSI flags needs to
work on the host to mirror the guest MSI configuration.  Thanks,

Alex


