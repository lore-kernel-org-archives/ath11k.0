Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692D0C5B549
	for <ath11k@archiver.kernel.org>; Mon,  2 Jun 2025 09:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QwFkbJcMYwHaXi45PYPb11QatP3IgyE/G4Mx+kASJwk=; b=FTe0NiTugI21QF1vIyobXSPgCO
	98thE2zm8Arn4DhVAc/mmwj8wp2QCaT3Ihsz10cRytly+f/F0dg1K3EOUAM6rsYrZ51IiNktFjW11
	jfTl5bNY0rJCCtKiKirFyFucDOVavG5tfsv4S5mNSA5Z4S9QFV09cmNL5D76kwbiQSbaZzUkRysY/
	sCG96dOv9y3jK1E4oaTxj9PGduOGQdUpN2583yyXkMScXe7CeuyImih/XjCgf9FplVKGsNavbykGH
	O7Q8GgEr4j15WWIAAWCTLnOqyLrgeWLOkp1JZGUS3QKiwH5bvrciuPvne/VcxrwC74jZqaOGdBegQ
	+Sh0sDMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM1EN-000000073K1-3KLl;
	Mon, 02 Jun 2025 09:13:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM08i-00000006xaN-0K8n
	for ath11k@lists.infradead.org;
	Mon, 02 Jun 2025 08:03:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 84DBC4A587;
	Mon,  2 Jun 2025 08:03:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 634DCC4CEF1;
	Mon,  2 Jun 2025 08:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748851403;
	bh=pRRYoIgu54ppeU32xD5VW+LrdjfzHD2C8cuKElm78PU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FLeoGhj+y2PlPKFs2kkIYEOqtUe1ScNoqI+pQheGIWfb31whJcZC61LbdbWAQ+Q3F
	 LR9kNpKaZWpmctJ+lUh4oEzP9ruEiTTcOsan8hE2sXem2mHFAxojOw6wN1KaJpd9RU
	 rPo4v0SIVQ5xW9F4ZJlz1BbsGHBh0QLcrNJkXESubMjzCX3mhPnQXjxAC4xs8s/V8Y
	 NE1h5ESc7AvYeGYthyzjgOmHDIDUsvn9W44eV7qkCLwKKd7PTswWFYECJ2pMn6KLRO
	 aTAWzdQsExJiEsfwTcpOsBI3Gy1U0K/QqoEwnnP8XEteiXYXxWw6FLm9xsmx7tnWvV
	 S8dLTeoXMdo4A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uM08d-0000000028E-22Ru;
	Mon, 02 Jun 2025 10:03:19 +0200
Date: Mon, 2 Jun 2025 10:03:19 +0200
From: Johan Hovold <johan@kernel.org>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/3] wifi: ath11k: fix dest ring-buffer corruption
Message-ID: <aD1axxSAJsbUfnHH@hovoldconsulting.com>
References: <20250526114803.2122-1-johan+linaro@kernel.org>
 <20250526114803.2122-2-johan+linaro@kernel.org>
 <026b710f-b50f-4302-ad4f-36932c2558ff@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <026b710f-b50f-4302-ad4f-36932c2558ff@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_010324_160232_2EB90FA5 
X-CRM114-Status: GOOD (  25.51  )
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

On Thu, May 29, 2025 at 03:03:38PM +0800, Miaoqing Pan wrote:
> On 5/26/2025 7:48 PM, Johan Hovold wrote:
> > Add the missing memory barriers to make sure that destination ring
> > descriptors are read after the head pointers to avoid using stale data
> > on weakly ordered architectures like aarch64.

> > @@ -3851,6 +3851,9 @@ int ath11k_dp_process_rx_err(struct ath11k_base *ab, struct napi_struct *napi,
> >   
> >   	ath11k_hal_srng_access_begin(ab, srng);
> >   
> > +	/* Make sure descriptor is read after the head pointer. */
> > +	dma_rmb();
> > +
> 
> Thanks Johan, for continuing to follow up on this issue. I have some 
> different opinions.
> 
> This change somewhat deviates from the fix approach described in 
> https://lore.kernel.org/all/20250321095219.19369-1-johan+linaro@kernel.org/. 
> In this case, the descriptor might be accessed before it is updated or 
> while it is still being updated. Therefore, a dma_rmb() should be added 
> after the call to ath11k_hal_srng_dst_get_next_entry() and before 
> accessing ath11k_hal_ce_dst_status_get_length(), to ensure that the DMA 
> has completed before reading the descriptor.
> 
> However, in this patch, the memory barrier is used to protect the head 
> pointer (HP). I don't think a memory barrier is necessary for HP, 
> because even if an outdated HP is fetched, 
> ath11k_hal_srng_dst_get_next_entry() will return NULL and exit safely. 

No, the barrier is needed between reading the head pointer and accessing
descriptor fields, that's what matters.

You can still end up with reading stale descriptor data even when
ath11k_hal_srng_dst_get_next_entry() returns non-NULL due to speculation
(that's what happens on the X13s).

Whether to place it before or after (or inside)
ath11k_hal_srng_dst_get_next_entry() is a trade off between readability, 
maintainability and whether we want to avoid unnecessary barriers in
cases like the above where we strictly only need one barrier before the
loop (or if we want to avoid the barrier in case the ring is ever
empty).

> So, placing the memory barrier inside 
> ath11k_hal_srng_dst_get_next_entry() would be more appropriate.
> 
> @@ -678,6 +678,8 @@ u32 *ath11k_hal_srng_dst_get_next_entry(struct 
> ath11k_base *ab,
>          if (srng->flags & HAL_SRNG_FLAGS_CACHED)
>                  ath11k_hal_srng_prefetch_desc(ab, srng);
> 
> +       dma_rmb();
> +
>          return desc;
>   }

So this will add a barrier in each iteration of the loop, but we only
need a single one after reading the head pointer.

[ Also note that ath11k_hal_srng_dst_peek() would similarly need a
barrier if we were to move them into those helpers. ]

Johan

