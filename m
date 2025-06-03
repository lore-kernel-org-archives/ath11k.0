Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7DADC5AE59
	for <ath11k@archiver.kernel.org>; Tue,  3 Jun 2025 11:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZSwKJpFhQU9pj49SIwHJy2tmUPEnUwTI4UeW8Xqc+0Q=; b=wHBAPjJcYGdhI/JYcZ/e3F9ldQ
	cRwReGeCI5iiw2sh+uhQE+V2YjRfjeGkfIw4IAbGE+w22qkT121yWaMOJmUMfQo3/XsLJgYVd9lKM
	YoGRzSNDgvoEVIqY+Q8Oz0l44tBqKCOaOlByfhPrqfNzpRwUX0GdBrUv9S/E4stDCz/G0+SqUbIC2
	aIG2dpMdJ4f9gZ4qOg0EOgeRfwehvwbav6hudt/o8iCkS4ksQw6m4fFNqEK/llvUGaRrjzv8e1/xN
	7peVF9nKRaet4uNyokcWPWuu+Q4jRC9H2EV3dFZUQd3eVAFiXHEkUz4IkmdGw+hMLc6TXvZwORfjA
	ekcPmnZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMQBL-0000000ApnM-3Tvh;
	Tue, 03 Jun 2025 11:51:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMQBI-0000000Apmo-3rMR
	for ath11k@lists.infradead.org;
	Tue, 03 Jun 2025 11:51:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4572B4A606;
	Tue,  3 Jun 2025 11:51:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 146F3C4CEED;
	Tue,  3 Jun 2025 11:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748951508;
	bh=+0+FjG1D5+BMAtWOeQZfZLKkO7QEDZvJWmT8YImYI40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MhM3ICakdOUq8YMMClJ+Aoem1yJe+icrKA7IEd+rPdVC3y6OyPe3x2Ua8ZLtD4y4F
	 NLRhmQHZPKtJXpP+Ys1fw2FEzvFYC/qnqmXa3F5Ve73EnS5kn8dHALzsJVSigeF8Tg
	 0A9mEsNgn8HKMQjFFyo975nKpA/cITqwIpEph2ZAq8FAGl9MYT33dMT7SsDQFlh+o1
	 JCxCZH2XJ5KiWQuG/u20Ir+5XWwj5bnsqDwRM+eSe2mlHq8etUwOrW2E/j6pGILH3g
	 Qqx04b+t/jqlgk8qSUcyWJ6QCYjZMN3/gZLVgJhP3HxgIP8zHg7qRW78WbPqCSP6SD
	 HsxqrHG8G51PQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uMQBE-00000000453-1hpd;
	Tue, 03 Jun 2025 13:51:45 +0200
Date: Tue, 3 Jun 2025 13:51:44 +0200
From: Johan Hovold <johan@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/3] wifi: ath11k: fix dest ring-buffer corruption
Message-ID: <aD7h0OOoGjVm8pDK@hovoldconsulting.com>
References: <20250526114803.2122-1-johan+linaro@kernel.org>
 <20250526114803.2122-2-johan+linaro@kernel.org>
 <026b710f-b50f-4302-ad4f-36932c2558ff@quicinc.com>
 <aD1axxSAJsbUfnHH@hovoldconsulting.com>
 <5268c9ba-16cf-4d3a-87df-bbe0ddd3d584@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5268c9ba-16cf-4d3a-87df-bbe0ddd3d584@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_045148_975822_43DB7C1E 
X-CRM114-Status: GOOD (  17.55  )
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

On Tue, Jun 03, 2025 at 06:52:37PM +0800, Baochen Qiang wrote:
> On 6/2/2025 4:03 PM, Johan Hovold wrote:

> > No, the barrier is needed between reading the head pointer and accessing
> > descriptor fields, that's what matters.
> > 
> > You can still end up with reading stale descriptor data even when
> > ath11k_hal_srng_dst_get_next_entry() returns non-NULL due to speculation
> > (that's what happens on the X13s).
> 
> The fact is that a dma_rmb() does not even prevent speculation, no matter where it is
> placed, right?

It prevents the speculated load from being used.

> If so the whole point of dma_rmb() is to prevent from compiler reordering
> or CPU reordering, but is it really possible?
> 
> The sequence is
> 
> 	1# reading HP
> 		srng->u.dst_ring.cached_hp = READ_ONCE(*srng->u.dst_ring.hp_addr);
> 
> 	2# validate HP
> 		if (srng->u.dst_ring.tp == srng->u.dst_ring.cached_hp)
> 			return NULL;
> 
> 	3# get desc
> 		desc = srng->ring_base_vaddr + srng->u.dst_ring.tp;
> 
> 	4# accessing desc
> 		ath11k_hal_desc_reo_parse_err(... desc, ...)
> 
> Clearly each step depends on the results of previous steps. In this case the compiler/CPU
> is expected to be smart enough to not do any reordering, isn't it?

Steps 3 and 4 can be done speculatively before the load in step 1 is
complete as long as the result is discarded if it turns out not to be
needed.

Johan

