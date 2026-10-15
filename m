Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E8ACC6B30
	for <ath11k@archiver.kernel.org>; Thu, 15 Oct 2026 00:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3XFik+OiPTKZRBTKKsNSHHZcnVJeKmiSTNRzSNQWFTw=; b=AMbgrAnSfqz0V+Jt4pbpPTrqzb
	66G/+CMfYPekm21RQRMdcTqh+sRBt0yzH0Rc0QWtzqR9BL7zLimKWxVyElGK6d8zyWoM6HAYe/PqL
	2SKe5hbiMmi/VDWi+Y19RIw9RFtHlxhGfbzu6VzF7HAFjiGLJoCxFUVQzbUFWmtXT7CIKOzsM+MrJ
	teGCZFjAqp4sm2VAEo+Rzr0t14Jw6Snq7tNj7eyCQ+I2q8bhX6EztcaWl4Omj7EpFrtTYS5nP5Cp7
	og0vbB3ASower/CDS28/ifDtu8HvpilwirKuR9N81U0uWtEjUbWyLQJlYkO/PafpSIOrhI5EuBR1t
	EXpUgT2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH8zn-0000000GUH7-2Q6n;
	Thu, 15 Oct 2026 00:06:55 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH8zk-0000000GUGN-2BTA
	for ath11k@lists.infradead.org;
	Thu, 15 Oct 2026 00:06:53 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-93e64d52949so446445885a.1
        for <ath11k@lists.infradead.org>; Wed, 14 Oct 2026 17:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792022811; x=1792627611; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3XFik+OiPTKZRBTKKsNSHHZcnVJeKmiSTNRzSNQWFTw=;
        b=W6JfZZIeqPOAXlLUZbDOn3Fa6oNtkFs1/rzXYbYLAHZbG+HiYH2Qb3szRe60b/yjPb
         lgm46R/R//zwY7/tRCp9TL6FDIYstpuipk5XXCP8xEAnI+k4MtYGU8i43v8UFUnmXcHE
         MS7LopZ2fKYn4ULeSC5wbsGigwYey9Fo0YGnBplociG4pPXTq30JhFHmSjPWJkSfp6+x
         EyiwotNmcy0qwlSAAvsgUylqlLBTfaTJiCp8zE9flxu44XGb2O9vtaGaHXe9N10Ofsdg
         ACYnopyGxiUoOk8pDL6/AsnqEkwp9z/Qx1NsAZ3+JBO7uUw0WyfYExCyg44/gPcfaWWT
         67IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792022811; x=1792627611;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3XFik+OiPTKZRBTKKsNSHHZcnVJeKmiSTNRzSNQWFTw=;
        b=NpDWbRLIFt/x9uLxq72ik5zJ7vQkpJYIrwDxXUoUfaLsmRRDMDLDgJpWuopE/E7nP8
         GpOq8Ib87G4nXHSIHW93SdtuENtdogaSxgSjPLuJLNG9kLpJwtwYDEZ84g26hN+baYqA
         jHEhLAGKrZMNpH7LWkY38W2V9Hphptp12lxRb2q6MXj4vmrV/+RxWD9rlU8VidrFp5OL
         2SAS2kgKdhXd/50HLHUC3rQc30l/DzsWN2gEpzukVJiBzcOMIYp+rLoRLGoYCgem9Kjn
         9VJlL128VJp76lJicBlpOKuYKX+Y/FRROX+hf3Y7sRFSap/zXNcGytnlGZ6qh95+vIQg
         Dfpg==
X-Forwarded-Encrypted: i=1; AKwUvBx3zYlhOzo6UyFTdzmXnW+tO1rspkKdzB9VGWDfF0EnGeAL8TV/Zpp6lsrC/raTmQC8W6wKHV4=@lists.infradead.org
X-Gm-Message-State: AFq9FYI2QPmZFWBgKxtgI7i42BhRiq4MIg3MmuA/3JPMJMUc4PR9JBc1
	dST8SG5Fp+tY3dpNVH0RvfHbg3WSWUYl0JY/P2mp5JQF+78MrTypWhHNJmG+IZblzk8=
X-Gm-Gg: AYBFou1i7+Bu46s+aqdeHXuLiFnE+lQ8npG0Ndq+c1HkimE6MEQeocdnkWZOo8ZRxDC
	N00FuYm+w9WxgoAkfm7a8tc0D7mjiFCQMlO8IqC0rxMRGM6rpJrdPAv1DPG0oNyFqTemhVZjpcQ
	a89HpRcxBxSq6lmxps4QNjiCG7WoFiM9t/LVZjOkSACEhP9L4cjj2h8DzWdZm1MGPyNhrWHJ0C9
	3eLWG4htuKP0ZRzbijQ91kVzCu+vwHfsgXceV3/Vpdzwf0Nud6NeJ9phKJbA76RqIKbme8tE5/2
	wJep5e+YBu26dADB+nZpUGP0iEcp2qcZIBBeg0PAzieGkzleuCQOKJOb1HoTshhM0fgvA2JlPyx
	MJeRr6vW4vE7H/osfLhEumgGgpez485ICzIGwvKann2dT5r7yyS+1cO/X5rrASi08KIcrtBwKQE
	kXuLZdP7EdlgZMzgTgJcxYI0K9BX7CQk0s+aZbrLpWdhbm/+vUWazqjjV09Ol5LxyDqvCxbb7bZ
	U/2ihOWuRiOtaNwjkxsnqORcrTVBeC1JcCpCsMOXfGSZ2EUYPSaf4u/
X-Received: by 2002:a05:620a:2992:b0:93b:e5e9:23d9 with SMTP id af79cd13be357-93ebd229343mr2677174285a.23.1792022810691;
        Wed, 14 Oct 2026 17:06:50 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef5051333sm620942285a.28.2026.10.14.17.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 17:06:49 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xH8zh-0000000EzB1-0n38;
	Wed, 14 Oct 2026 21:06:49 -0300
Date: Wed, 14 Oct 2026 21:06:49 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Michael Kelley <mhklinux@outlook.com>
Cc: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
	"alex@shazbot.org" <alex@shazbot.org>,
	"ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
	"ath12k@lists.infradead.org" <ath12k@lists.infradead.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"jjohnson@kernel.org" <jjohnson@kernel.org>,
	"johannes@sipsolutions.net" <johannes@sipsolutions.net>,
	"kevin.tian@intel.com" <kevin.tian@intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"mani@kernel.org" <mani@kernel.org>,
	"skolothumtho@nvidia.com" <skolothumtho@nvidia.com>,
	"yishaih@nvidia.com" <yishaih@nvidia.com>
Subject: Re: [PATCH 0/7] Enable Qualcomm WiFi PCIe passthrough to VMs
Message-ID: <20261015000649.GP14213@ziepe.ca>
References: <20261013140345.GK14213@ziepe.ca>
 <20261013154225.214531-1-jtornosm@redhat.com>
 <20261014150047.GO14213@ziepe.ca>
 <MN2PR02MB68639A3F262110A6E9B96683D49D2@MN2PR02MB6863.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MN2PR02MB68639A3F262110A6E9B96683D49D2@MN2PR02MB6863.namprd02.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_170652_669376_B81F4FDD 
X-CRM114-Status: GOOD (  24.57  )
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

On Wed, Oct 14, 2026 at 08:46:33PM +0000, Michael Kelley wrote:
> From: Jason Gunthorpe <jgg@ziepe.ca> Sent: Wednesday, October 14, 2026 8:01 AM
> > 
> > On Tue, Oct 13, 2026 at 05:42:25PM +0200, Jose Ignacio Tornos Martinez wrote:
> > > Thank you for the direction on device MSI domains. The Hyper-V
> > > reference is difficult for me to follow for this case. Could
> > > you point me to some existing KVM/VFIO equivalent, or similar
> > > example for my use case? Any pointers to relevant code,
> > > documentation, or previous discussions on this topic would be
> > > very helpful to get started in the right direction.
> > >
> > > Also, where would this need to be implemented? Kernel only
> > > because it is already supported in QEMU in a general way, or
> > > kernel and QEMU for some specifics?
> > 
> > I spent some time with AI to research this and drafted up some slop
> > for you that outlines a bunch of ideas and explains how some of the
> > bits work today. Not saying this is something to follow but it should
> > be a good starting point to come up with a good idea.
> 
> This is a nice summary of what Hyper-V does. It looks right to me
> based on my experience with that driver (pci-hyperv.c) over the
> years.
> 
> I wrote the documentation in Documentation/virt/hyperv/vpci.rst.
> With your permission, I'd like to adapt some of your material below
> and add it to vpci.rst, primarily to provide some broader context
> on the "why" and the implications of the overall approach. I'm
> not sure how soon that will be, but it will go on my "to do" list.

Sure, no worries do with it as you like!

Jason

