Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13CDCA5FDD
	for <ath11k@archiver.kernel.org>; Fri,  2 Oct 2026 17:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BgakvInNsjTIuwI/HruggHJb8c52XKSKFB4qu//ilyk=; b=vq6jS2EwYkNjvm1j9HXhmaWCj6
	osRcrWn5BwSnr5nxg9mg/Ww9ilALhCc7THs8dxkcg67lrczWL9K/+1BQS7y10j4x26NFCEa1Uxjp6
	WSwBUkrPwA5QZcFDnL+4sQMY4R/3Yd9GRTyfw5QDV6X2CgTmQgRECK2Beo0QxqE2xo0zHIvc1xvqX
	kCBXQXpnlOs42o/Dx4Y2HFP4s+j4wAoq/xLd6LBN79Xxexy+KM+/axnDQjsIPeC2HDZYb4McJewoi
	q3sotyZXh4SdYz7QQVAYHz2+uLMT2E1OmQNsC25Y1va08GZsY3KP9bV6bjz4MQu0UvnUoxYu+OdFk
	Wp65GTeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgma-0000000C7Qg-2Hqm;
	Fri, 02 Oct 2026 17:10:52 +0000
Received: from mail-dy2-x0d.google.com ([2607:f8b0:4864:36::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgmX-0000000C7Pe-0N1j
	for ath11k@lists.infradead.org;
	Fri, 02 Oct 2026 17:10:51 +0000
Received: by mail-dy2-x0d.google.com with SMTP id 5a478bee46e88-34c4a0870d2so2987713eec.2
        for <ath11k@lists.infradead.org>; Fri, 02 Oct 2026 10:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790961048; x=1791565848; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BgakvInNsjTIuwI/HruggHJb8c52XKSKFB4qu//ilyk=;
        b=hx6TOBe8KvDe44823HfkVn/IlcY30A0RCiD0cCIQU0YlkQbvTdoN32m1/klHtxYNNm
         iLNkiWzKMjeQ73wHnfB5sgtaAsby0NSkHsEZ5yrsktIVM4mcSpaG+dG6Iy1ZCQXs21dX
         Yf8LtgWI12pc2v+pcrFmACK2Dr27v8vZIAt8t7vsz48V+Sp0iHT3W5hfCMtQAE7tR/g0
         SCkLpIsH8bY0tpBiJz6VYdH9hl1CUidcmPWMQZjAn8I1++ml/ITInkyerPQyICpDOTWL
         Ah+sX90TaY2kY1NYBd9RJpzSH366Yu8KfwHZOKbAW7vVxqnE2sGt0rlOArjzBIJ88MnW
         tckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961048; x=1791565848;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BgakvInNsjTIuwI/HruggHJb8c52XKSKFB4qu//ilyk=;
        b=OMnjVBnZywGL4RTKqBs+MoT4n0dnIusyFUPSWR4s77uhpc+5m37nRlrsgswfKVoTWw
         IRZssfgcYwkYJyfCykPlYoPLUiHflvfXROM2vIxDFNCMeP2EDOiUnQ7mmlhS5zGGNiKY
         M1N30A6jf8jRVAXGygSt6AKWqtSv5WWIjukL/q1dPR0LSDjI/zONbXtwAYnuzrFdIhmk
         vAFWUcnLgupIure5MtdQus3v6fdOCrFOfd6LkWudNFBXlXJytHl12AccP6UyX6C8HKNM
         /DXZ87oOClGZ5MxjCM/iJoJe8Oy56fOgq8rIAHSTUkrASeC9fawj8+lIZWe9agRR4U4h
         labA==
X-Forwarded-Encrypted: i=1; AKwUvBxQarA186/5Xtl3EWvuYJgJgL0HGt2pWMc7IvzgqWRVr8s7jZqdIhnFAL2qTzapJKWJzQDt8iA=@lists.infradead.org
X-Gm-Message-State: AFq9FYJNEuTVEyo4DDPa24y1VtspvhhEXJ1EP72jQ2rhTjcqp3T+K1e5
	4QX8zQ8hFqsBRmklIXpcdMGo1WJuoQsiVISPCrHINhTzWuCOtiMmQN27Bu9Oh2OCT/c=
X-Gm-Gg: AYBFou3X53HFZFbTFXZeBPobHs+UB74hJ8hF0D2X8Fd2HB0/SZWUVRZUH4w9gdIs4Ya
	5rNDyDd93Lpb+S6+e4iMpzdBqttuvVGFN2piWjLd3HzohiLGiYhTuYpgr9JWgs2iDA06vwkFxOg
	+U7Iab2r1pUmvT7x5SZN47W2ZmW8Nqq1elxHsWSBveXtP9vemkdynADqQcrmzEJpvWkQG961GmC
	dwgX+M/+oGSqKjzOl84D/fqgpn42nUhEQp38kbPM+i0lYoK0tuSm0+UF1GOrbVuoKH+lRu/Uld9
	RIZ2Kx8h8iSgr4iZpw1egjco0LB0wurW8TRRSy1TWO05h8FmzDhPtZuq5njxHCYddTCcwXP73BB
	hZO/VTMH6uv4w+h9MSaxJ9mqmdUDqaPtOGVi4PqV9HgETeZbS6buj1wLf5L6X5vwPbz51GFa5Aa
	9iIIyjmQSZcfveCYtGgzug9fNSjGveTh7RN7F7VN4bqrNq
X-Received: by 2002:a05:7300:e5c2:b0:34b:b410:9352 with SMTP id 5a478bee46e88-34f14f18c8cmr3725477eec.1.1790961048034;
        Fri, 02 Oct 2026 10:10:48 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3510850f86bsm4509703eec.11.2026.10.02.10.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:10:47 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xCgmU-00000000BiY-09Yw;
	Fri, 02 Oct 2026 14:10:46 -0300
Date: Fri, 2 Oct 2026 14:10:46 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: alex@shazbot.org, ath11k@lists.infradead.org,
	ath12k@lists.infradead.org, bhelgaas@google.com,
	jjohnson@kernel.org, johannes@sipsolutions.net,
	kevin.tian@intel.com, kvm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org,
	mani@kernel.org, skolothumtho@nvidia.com, yishaih@nvidia.com
Subject: Re: [PATCH 3/7] vfio/pci: Add qcom-vfio-pci variant driver
Message-ID: <20261002171046.GA32083@ziepe.ca>
References: <20260930151229.GR163130@ziepe.ca>
 <20261001071945.83116-1-jtornosm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001071945.83116-1-jtornosm@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_101049_129882_6764E013 
X-CRM114-Status: GOOD (  22.44  )
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

On Thu, Oct 01, 2026 at 09:19:45AM +0200, Jose Ignacio Tornos Martinez wrote:

> Regarding platform_device_msi_init_and_alloc_irqs(), I agree that
> moving the driver to device MSI domains would be cleaner on the
> driver side. However, even with that change, I think the VM problem
> remains exactly the same: the device MSI domain in the VM would
> allocate virtual addr/data pairs, and the firmware's private interrupt
> controller still needs the physical host values.

Yes, I'm not saying it fixes the problem..

> Also, the VFIO variant driver scheme would not fully break if the
> driver moved to device MSI domains. The variant driver caches host
> MSI values from the MSI descriptor, regardless of the allocation
> method. The hook point may need adaptation, but the fundamental
> approach (host caches physical values, VM reads them) remains valid.

It breaks because VFIO will only cache *actual* MSI-X table entries,
it does not have visibility into anything that
platform_device_msi_init_and_alloc_irqs()

The only reason this works for you at all is because the driver
hackily copies the vectors from the real MSI-X table so it can look in
the "cache" to find their true physical versions.

Which is my general objection, I would like to see the driver to use
platform_device_msi_init_and_alloc_irqs() and don't want to get stuck
unable to do that because it would break this.

> Regarding the hypercall idea for device MSI domains, I think that
> would be an interesting direction worth exploring as a generic
> solution, but that's a multi-subsystem effort that will take time to
> design and land.

Yes, but it does actually solve the problem in all its forms..

> I completely agree that this could theoretically affect any device
> with private MSI registers. However, in practice, I'm only aware of
> this specific behavior in Qualcomm ath11k/ath12k firmware, where the
> device's interrupt controller requires the host physical MSI
> addresses to be programmed directly. 

Everyone else seems to know this stuff doesn't work for
virtualization and doesn't try to do something like that.

> It's also worth noting that the PCI reset support for these devices
> has already landed in linux-next (commit 290153d46d1a "PCI: Add
> device-specific reset for Qualcomm devices") [1], solving the
> device reset path for VFIO passthrough. This MSI series is the
> remaining piece, with both in place, these Qualcomm WiFi devices
> would be fully operational in VMs for the first time.

Why do people care so much about this? I always thought it was a bit
odd?

Jason

