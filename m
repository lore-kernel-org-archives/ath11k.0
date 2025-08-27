Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E188CA0FF7
	for <ath11k@archiver.kernel.org>; Wed, 27 Aug 2025 07:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pkdlRrvzbQZi7w/IQQdZiZJdzjHiN51gRoy88Tqftwk=; b=VB0sJDLhVgTBNzfsJVkW8c0wNX
	mp/BvWn/1xAufizL0R1EamgILCGJEUafGIq2osjr+M3XVya6aXA3jHVk3UkeTEOydJ/rAnsn1DPBN
	oKHjQike71zscEf4mAaGHlNUS8d1zATU1WFCa7e0qxcQYkTMLgjN0v0Dyd4Ctzhuk+WVc/7r/YSFq
	rVA58OSscKo9WKmKIq/WsHOe37cjC2hRN1LaaMxU4gEUXqj11lIDsaAwrUBndAsVzC/7f9k2ll4nK
	6Jdev25Ed9d7KzzLSZoLl/s9wR26FpK/u3nTPlv85YhGIME5jBxT9b/aozrZeD39MXIRlGogdPtcB
	pO/ykJiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urAeg-0000000ER0l-40V3;
	Wed, 27 Aug 2025 07:33:14 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urAch-0000000EQbB-2OLB;
	Wed, 27 Aug 2025 07:31:11 +0000
Date: Wed, 27 Aug 2025 00:31:11 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Jeff Johnson <jjohnson@kernel.org>, iommu@lists.linux.dev,
	"linux-kernel@vger.kernel.org >> linux-kernel" <linux-kernel@vger.kernel.org>,
	"ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Re: is dma_mapping_error() check necessary for
 dma_alloc_noncoherent()?
Message-ID: <aK60Py3r25U43k1E@infradead.org>
References: <ff6c1fe6-820f-4e58-8395-df06aa91706c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff6c1fe6-820f-4e58-8395-df06aa91706c@oss.qualcomm.com>
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

On Tue, Aug 26, 2025 at 05:44:42PM +0800, Baochen Qiang wrote:
> Checking code gives me the impression that I should do dma_mapping_error() check as well.
> And indeed with below diff the warning is gone:
> 
> +       dma_mapping_error(ab->dev, paddr);
> 
> However this does not make sense to me since IMO testing the CPU address is good enough, I
> can not imagine a valid case where DMA alloc/map fails while returning a valid CPU
> address, no?

Yes, this doesn't make sense.  dma_mapping_error exists to provide a
error handling path for dma_map_*, which return the dma address only.

For the dma_alloc_* interfaces that return a pointer and can signal
with a NULL return it should not be needed and dma-debug needs to
be fixed.

> If I was right, should we remove invocation to debug_dma_map_page() in dma_alloc_pages()?
> 

That allocation still needs to be tracked, so it can't just be removed
but needs to be changed to record the kind of allocation.

