Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A77C52D7C
	for <ath11k@archiver.kernel.org>; Tue, 13 Aug 2024 23:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5VO2vOXTYUzHNGoqXkty4CZXSIWZNXE+mZa+Oe/5P5M=; b=1m/g0Eu4hpbDitN7i2HrhCGcNC
	KQmJTSw4H+ROJp9TKcO5+9l+qNqCTPSQudrk+N+bQUhKghDavDx5ZNEHULUSyxydBJ/T7sJnc3QbZ
	5B6y8eyXY1Ho8DpAuORgfHrgl2eTT+Hs6y6PgtyI5HvtmIqDIoXUmCZrhyvUQi2KyHQ+MdnAxanmN
	qhny4BWao7g+S+FTrccn6rn+L/bR4os7HcDeh5XEN69RfGmr5gseWezqCcxah90O8LoqSvL1lTTQ/
	oYnk93jJJb0zWhuHrL6TvEBn/KayHaug1roR0HPFccl3QwTnti3ri9a4TzHxz6ariM1TF1an91Oyi
	Mol5+cNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se156-00000005CXo-2HLd;
	Tue, 13 Aug 2024 23:37:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se154-00000005CXC-43KC
	for ath11k@bombadil.infradead.org;
	Tue, 13 Aug 2024 23:37:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5VO2vOXTYUzHNGoqXkty4CZXSIWZNXE+mZa+Oe/5P5M=; b=HvBd8Y28OihaMTqp1IAG+wSYMi
	vv9/QwqsGB+SeF5/y1Iy0qHnBLn/9YZX2NYdhBddGHbrcWv8LtLy3FXKB2I5dviyewgr9aF6FI8Oa
	KOgDFrEbFKE23eubVzWOcDPYg/pY4MnVqqVR08nKbK7HN0qYILIsiImMHVmi6GI+GJxKt9icg4iyO
	fISXbslguC0hX9ZSHnBFYNVPZPSp9xUuSLzcTO2wXtlBYYNzz9VLfwchrjEMRjDlrINkeRIJzTN2Z
	93wXgaTGbVzulXW522g5QeoaS7D8aiwtA4uqufsJta7Z7pP0hE550nhTqu9vYooS9PvaRmmutPfy0
	vmKmmHEQ==;
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se150-00000007soX-05nB
	for ath11k@lists.infradead.org;
	Tue, 13 Aug 2024 23:37:32 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-45019dccc3aso33744391cf.1
        for <ath11k@lists.infradead.org>; Tue, 13 Aug 2024 16:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1723592246; x=1724197046; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5VO2vOXTYUzHNGoqXkty4CZXSIWZNXE+mZa+Oe/5P5M=;
        b=cdy/a72ffsHfe8tYiD5juUt5W/EVfVKhzGXbyiETvJtHqXl6DJKz9KLZr3iZRZQAO4
         28HzmBVZbveiUXzmdDer3c/fw5t9e+imZy7yr86Hje0AjjHOVlpz5Q4it1rGy6UjeD9B
         d24wCsnEYalsNTSQBIQPJ0LGkvRCJon50Y7ca0eftHH06OSQdG0ZH/K4AWs2KZg7m/Dh
         McyLzE2thCsMuXi+4HmiQ1pcNgDXgwieA/si9H2Nx5/QI/MDpo5KZncjVwQjX3rpnE6R
         YgKxYXJrEVdChd15XFDxVQdrrZQzlRsB3M3BIpL73ct6+sl9sGMBbgdyrHVCVGQukcSN
         MXbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723592246; x=1724197046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5VO2vOXTYUzHNGoqXkty4CZXSIWZNXE+mZa+Oe/5P5M=;
        b=IxROyUTu0gAbhX9CmhnoHklkLFEjyfuJjYOO3f8O/NDvbK/AkSYiaigHls+rMoc/hR
         3fqt0AN8D4YUYS9bkhkrlE+yVKZ25pSgzAy3yhuAZza+dYf7fz6sKddbBOGyCmz9Z7dy
         kpNqi7vP1iF/OlHB0VrVq5M1pB7zMXfQVHATwSmy+E2ItEXfo3ETQyS265zr4hCh1FsP
         GyWaOfIPIFVSJ7UZwJ8sUxF3jtG8Dy4l4r8nCxeaL9knY8vG8ERA/PVc+Rk9WIk00cKA
         klmgbyocLHNJULvMb12lhOCjkJy6n6DmFDZ3cX9e6/jGlfKRUZRYU2If/cUf0KoHLcsk
         A/mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkh0V/zuZkPLVo3GJavc3yH6IlJAvXa8Iu+xFcEUes2daWuU+i5cA4XhksGhr7/qpBnuu1b20fkZXGWZrHctFsw1paPqU7vViBuA==
X-Gm-Message-State: AOJu0YyobfuZzc3a6vpk1SBkOdzZVQR4KkMk9X2YkyY4KJjcu/7pmNx5
	czHWPZbAcLhJE48p6zs9ert2VQcfxj5pR2071h1aTBcCaxtuGbGqOwnujOrTNSw=
X-Google-Smtp-Source: AGHT+IFbm4qDYxgXzWa97F1Ax4tIokMkCTO/HLZVYUI3NA9l3rLq2ilxoJLGeZFzAszYUnI+b4y72g==
X-Received: by 2002:a05:622a:5c17:b0:446:5c31:f268 with SMTP id d75a77b69052e-4535bb0821dmr11613701cf.30.1723592245902;
        Tue, 13 Aug 2024 16:37:25 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4531c26d30esm36041161cf.64.2024.08.13.16.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 16:37:25 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1se14u-00AOBJ-NG;
	Tue, 13 Aug 2024 20:37:24 -0300
Date: Tue, 13 Aug 2024 20:37:24 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, quic_bqiang@quicinc.com,
	kvalo@kernel.org, prestwoj@gmail.com,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	dwmw2@infradead.org, iommu@lists.linux.dev, kernel@quicinc.com,
	johannes@sipsolutions.net, jtornosm@redhat.com
Subject: Re: [PATCH RFC/RFT] vfio/pci-quirks: Quirk for ath wireless
Message-ID: <20240813233724.GS1985367@ziepe.ca>
References: <adcb785e-4dc7-4c4a-b341-d53b72e13467@gmail.com>
 <20240812170045.1584000-1-alex.williamson@redhat.com>
 <20240813164341.GL1985367@ziepe.ca>
 <20240813150320.73df43d7.alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240813150320.73df43d7.alex.williamson@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_003730_479663_67DD01DA 
X-CRM114-Status: GOOD (  25.85  )
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

On Tue, Aug 13, 2024 at 03:03:20PM -0600, Alex Williamson wrote:

> How does the guest know to write a remappable vector format?  How does
> the guest know the host interrupt architecture?  For example why would
> an aarch64 guest program an MSI vector of 0xfee... if the host is x86?

All excellent questions.

Emulating real interrupt controllers in the VM is probably impossible
in every scenario. But certainly x86 emulating x86 and ARM emulating
ARM would be usefully achievable.

hyperv did a neat thing where their remapping driver seems to make VMM
traps and looks kind of like the VMM gives it the platform specific
addr/data pair.

It is a big ugly problem for sure, and we definately have painted
ourselves into a corner where the OS has no idea if IMS techniques
work properly or it is broken. :( :(

But I think there may not be a terribly impossible path where at least
the guest could be offered a, say, virtio-irq in addition to the
existing platform controllers that would process IMS for it.

> The idea of guest owning the physical MSI address space sounds great,
> but is it practical?  

In many cases yes, it is, but more importantly it is the only sane way
to support these IMS like techniques broadly since IMS is by
definition not generally trappable.

> Is it something that would be accomplished while
> this device is still relevant?

I don't know, I fear not. But it keeps coming up. Too many things
don't work right with the trapping approach, including this.

> The Windows driver is just programming the MSI capability to use 16
> vectors.  We configure those vectors on the host at the time the
> capability is written.  Whereas the Linux driver is only using a single
> vector and therefore writing the same MSI address and data at the
> locations noted in the trace, the Windows driver is writing different
> data values at different locations to make use of those vectors.  This
> note is simply describing that we can't directly write the physical
> data value into the device, we need to determine which vector offset
> the guest is using and provide the same offset from the host data
> register value.

I see, it seems to be assuming also that these extra interrupt sources
are generating the same MSI message as the main MSI, not something
else. That is more a SW quirk of Windows, I expect. I don't think
Linux would do that..

This is probably the only way to approach this, trap and emulate the
places in the device that program additional interrupt sources and do
a full MSI-like flow to set them up in the kernel.

Jason

