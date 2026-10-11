Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 041D8CA9EC7
	for <ath11k@archiver.kernel.org>; Sun, 11 Oct 2026 13:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PVcr7aWiZ8GvYwkyY6ZnXaDcRM8rUn6uQRQ7DpHdIyE=; b=tRdqq9PQJVkqPuSpSDTc1eeMJT
	zlC4T05jJ2hl1m6C9pH51T+a2eOxai6K+4RDRxtL2bImSoZIoPgnl5vhghPO1dc8oBEa3bTed61Hw
	6u9xtmeX7OzrPu/ntTaQ1LFOnWice1AdhXV97mGcc2bP71W6ffk9sq+MjBdphVUE2dxJx9Q1qKu++
	5uO9Pf7yJrCXRULwyyNWaRXbjYao5w9PPqeXTguLue+R38R2mxfHRAysVBfQJoncWsznv39+LsXOc
	q4ZCqRkGrVbLhsWLnbTXeEebBaynXGVMvLfbryDai9TjrOTwTTYnFZ1gOyKbSeI0Ak6d8TUA2oDKr
	mNHzhjfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFtZ4-000000093MV-2dqc;
	Sun, 11 Oct 2026 13:26:10 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFtYv-000000093K7-1hpC
	for ath11k@lists.infradead.org;
	Sun, 11 Oct 2026 13:26:03 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-53397325663so12725521cf.1
        for <ath11k@lists.infradead.org>; Sun, 11 Oct 2026 06:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1791725160; x=1792329960; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PVcr7aWiZ8GvYwkyY6ZnXaDcRM8rUn6uQRQ7DpHdIyE=;
        b=OaK0V2IqNv4RJxv8tMAQih6lBd55XVZGWr+a+P8Rt6VGn2M+O3OUi/ravhEQAVlVlE
         U0vl60fPWz0NOWZXUdQXFw2dbRK9lfpDu8AOCUHXLfU7BR4YiWaNR/6con5FB/q8cSvL
         4HFN9DOWOwe1H5S89AnGZ+lSxlcLG7g0TRYaNFg4QL8nIUDX2qhk7mHfgWyr9TeJf9PG
         WOnDcPrZ1kHozF5D9GEEZfj71fXywp6zxxTVLuFaloWDNUONfgnOPdXaYVnwHkqYmnQB
         6GKhJJiipl95H5K+Uq59hbwmSXC/VFcxX5clRlvfT+uhMu6x9AOqdjat+0yNXx7mUW78
         /shQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791725160; x=1792329960;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PVcr7aWiZ8GvYwkyY6ZnXaDcRM8rUn6uQRQ7DpHdIyE=;
        b=EEJ3hAYnhl4w6m0OwzBu3pohvMpDPQfNVdlrnwAoHxv0c7rEuUgZJXJSFNG1wu/Pz1
         jalscEWYE3eqIOM4wntWZWB4lhiy56paDqoU/ctzMx+6Pzkq5vOCaXx+gakGtbS6lCgK
         zGZKUnKXBosVknWCUfKd0dMVCjIaD6d+qYnAv3YK7gxl7JxHynUG4xWy4+7cYRWt2l+E
         1j0AuhVBHQVOHjc58YIHGeP7TPdFap6O26OPQtLm5rf1GbGLt3iwed5TBjKrKvRBjBTX
         GxxvpK0ws2TmolW3tiFLwnQYqc+ic9t1dyrFT1zUzDoeFJZlNoztPewULRD26By1Zdb/
         Ywkg==
X-Forwarded-Encrypted: i=1; AKwUvBzaurxDw5/AeCDYCiDzIIXtXR7NDbN/SHTG8yQlh6XAdofSRorOrF3At0AUA77zs+vPU5g8YWw=@lists.infradead.org
X-Gm-Message-State: AFq9FYL3MYrtNb6mpibIa5zFelqUtQleKXmjgzXguX/MagnU6juPySvR
	fz6Bx9FOU/awURJLpY+XbkmLHabSCQ73ejZ6ME6YUqnh1AKVkq8ATm+Oe52lAljgZtk=
X-Gm-Gg: AYBFou022ZiWVCypdmwCAN+nrP3pe8OmCQQXb0dgWagGZYwlHj3ovpaEW8xi1v/KV20
	F4phx79LPqVaZ6PrigfVMqSDroA6N7+k6fpUhRjfBz9BL02xJklAYNjdABeI/EC7gQ0ZTkWtXgs
	VsF7fHJtR226AYyAYXZ4dOkgsgvri7Yp7uBbBkV8kUxEaiCy5ulaoSpu9Xhz9CTQt0cMkQZbNvO
	1LjtxeQL+1DEmj9ju3QeR8oUPGXDGVXMf8B6NPBA78O6wkxiU8uM/H/z5UPPEcZV5iWsilASPQb
	BOGGDO8wGrWPHzMjugnhix1MVUVNZCH19O2mIrwSivZAK7djf2mJtnQo7RHhlz7a1IZNCatJz71
	6HjuBrPCcC3dmWliRfC+cQmbyRAlQB6my8xud3Wmyterl19Z+RQOo4tqj8EBx2pzkM9E+DonTj+
	KxySFcL7Xsmt05crRuMWTZ+H7BicqlAx6Z8b3Mlbc9o0w+85hVyhiW3jE3YfUGSn3fggIYOGO4M
	VzoTwAY6BsJbE3NQOb3y3eMeK6JSCJbQXecMOnjc8BpWz0yn6avdDVJm1y1sZ2EhPBL
X-Received: by 2002:a05:622a:e111:10b0:535:a5f9:752e with SMTP id d75a77b69052e-535a5f9789bmr75892511cf.77.1791725159958;
        Sun, 11 Oct 2026 06:25:59 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b54e80353sm71122656d6.1.2026.10.11.06.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 06:25:58 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xFtYs-00000003FEK-1U1k;
	Sun, 11 Oct 2026 10:25:58 -0300
Date: Sun, 11 Oct 2026 10:25:58 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: alex@shazbot.org, bhelgaas@google.com, jjohnson@kernel.org,
	johannes@sipsolutions.net, mani@kernel.org, yishaih@nvidia.com,
	skolothumtho@nvidia.com, kevin.tian@intel.com,
	linux-pci@vger.kernel.org, kvm@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	ath12k@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] Enable Qualcomm WiFi PCIe passthrough to VMs
Message-ID: <20261011132558.GD14213@ziepe.ca>
References: <20260930140833.576941-1-jtornosm@redhat.com>
 <20261011075425.516927-1-jtornosm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261011075425.516927-1-jtornosm@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_062601_576002_CAD04FF2 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
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

On Sun, Oct 11, 2026 at 09:54:25AM +0200, Jose Ignacio Tornos Martinez wrote:
> Hi,
> 
> Since no further feedback was received after the last discussion,
> I proceeded with v2 addressing review findings (Sashiko):
> https://lore.kernel.org/all/20261011074514.515894-1-jtornosm@redhat.com/
> 
> I remain open to suggestions and happy to iterate further if needed
> to get this acceptable.

IMHO this is not OK, building a new crazy hypervisor interface that
only works with the broken driver design we have today is not OK. This
is not some "quirk", it is a permanent new ABI between VMM and kernel
that has real compatibility implications.

Go tell an AI to convert it to
platform_device_msi_init_and_alloc_irqs() and then solve for that so
at least we are not getting trapped into a completely broken ABI by
all the hacks here.

The whole "MSI Caching" concept is fully wrong to be an ABI to a VM.

Jason

