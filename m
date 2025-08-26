Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD1ACA0FEB
	for <ath11k@archiver.kernel.org>; Tue, 26 Aug 2025 14:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wBcHbZvVFk9s7ggVtgAQD1SCZ9nQD0upHN+BmMke/4o=; b=x66qGfRSUAsCU49vD3/l2q4/Yy
	f/xskQ0HNhVf9romxTM/7d/ZrUP57IcA0c+EXn28urK05/rGnokqHplBuGJuTV3Vwe0cJXjBvcdhC
	zkIolixtYOzl9Myw9H8rTpZx1Bbwb8WVW+kA4ls8kMHBvowz8EJdh5GV2RAEmoqGWvnHNaIh2YZGb
	BLe4k5WnAz+fpAJFUO7NWvgy6cOk9j+KIeYzhsNSCLW8qP8uyyKaIc4rJWzTW1TIhrpxvWkvzDYMi
	1ZjX8oatZy8dA4nXE1wyBvJs/XENK6cKWEu0aM0AXmTifk8lDu8t9ZkQBsf8d6ym2dWOvys0/gnGa
	Lg2dT9PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uquno-0000000CI08-3Um1;
	Tue, 26 Aug 2025 14:37:37 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uquMx-0000000CCmB-3ONN
	for ath11k@lists.infradead.org;
	Tue, 26 Aug 2025 14:09:53 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250826140948euoutp02e3727d761792d4d672a026db8a75c3fa~fVmjaFW-h0621906219euoutp02m
	for <ath11k@lists.infradead.org>; Tue, 26 Aug 2025 14:09:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250826140948euoutp02e3727d761792d4d672a026db8a75c3fa~fVmjaFW-h0621906219euoutp02m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756217388;
	bh=wBcHbZvVFk9s7ggVtgAQD1SCZ9nQD0upHN+BmMke/4o=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=X6J9OUrQ7BR5debZpJiXGZcozru4A55OVKrgUE78bZXQkcOtUDojIK7rUUwRiN+PP
	 NppBs+pNEuGrG3XOy6hflYRtDmCXQ2weKnQLFWhrlRueTyxW3IbLm2zxB21B4qNaIo
	 Ebdt812kxsxIs94sfDA0pQIdu2wdXF/MHncWI65I=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250826140947eucas1p1e89d3b343d1190005a9901f4b5f6189d~fVmjKdmyn1026010260eucas1p1y;
	Tue, 26 Aug 2025 14:09:47 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250826140946eusmtip1f96cd40ac9cc7376ac863b1e398b0b5e~fVmh-Eunp2654726547eusmtip1N;
	Tue, 26 Aug 2025 14:09:46 +0000 (GMT)
Message-ID: <89954593-8236-464e-8848-e7cdcf639c0a@samsung.com>
Date: Tue, 26 Aug 2025 16:09:46 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: is dma_mapping_error() check necessary for
 dma_alloc_noncoherent()?
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>, Robin Murphy
	<robin.murphy@arm.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: iommu@lists.linux.dev, "linux-kernel@vger.kernel.org >> linux-kernel"
	<linux-kernel@vger.kernel.org>, "ath11k@lists.infradead.org"
	<ath11k@lists.infradead.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <ff6c1fe6-820f-4e58-8395-df06aa91706c@oss.qualcomm.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250826140947eucas1p1e89d3b343d1190005a9901f4b5f6189d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250826094453eucas1p178ff4a39db0c655f3505128a5cfb0a6a
X-EPHeader: CA
X-CMS-RootMailID: 20250826094453eucas1p178ff4a39db0c655f3505128a5cfb0a6a
References: <CGME20250826094453eucas1p178ff4a39db0c655f3505128a5cfb0a6a@eucas1p1.samsung.com>
	<ff6c1fe6-820f-4e58-8395-df06aa91706c@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_070952_117596_62033AE0 
X-CRM114-Status: GOOD (  14.41  )
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

On 26.08.2025 11:44, Baochen Qiang wrote:
> Hi guys,
>
> I have a driver which allocate noncoherent DMA buffer and get the returned CPU addr tested:
>
> 	vaddr_unaligned = dma_alloc_noncoherent(ab->dev, rx_tid->unaligned_size, &paddr,
> 						DMA_BIDIRECTIONAL, GFP_ATOMIC);
> 	if (!vaddr_unaligned) {
> 		spin_unlock_bh(&ab->base_lock);
> 		return -ENOMEM;
> 	}
>
> while free the buffer
>
> 	dma_free_noncoherent(ab->dev, rx_tid->unaligned_size,
> 			     rx_tid->vaddr_unaligned,
> 			     rx_tid->paddr_unaligned, DMA_BIDIRECTIONAL);
>
> I get below warnings:
>
>   DMA-API: ath11k_pci 0000:03:00.0: device driver failed to check map error[device
> address=0x00000000f3ad7000] [size=639 bytes] [mapped as single]
>   WARNING: CPU: 15 PID: 64303 at kernel/dma/debug.c:1036 check_unmap+0x7e2/0x950
>   RIP: 0010:check_unmap+0x7e2/0x950
>   Call Trace:
>    <TASK>
>    ? free_to_partial_list+0x9d/0x350
>    debug_dma_unmap_page+0xac/0xc0
>    ? debug_smp_processor_id+0x17/0x20
>    ? rcu_is_watching+0x13/0x70
>    dma_free_pages+0x56/0x180
>    [...]
>    </TASK>
>   ---[ end trace 0000000000000000 ]---
>   DMA-API: Mapped at:
>    debug_dma_map_page+0x7c/0x140
>    dma_alloc_pages+0x74/0x220
>    [...]
>
> Checking code gives me the impression that I should do dma_mapping_error() check as well.
> And indeed with below diff the warning is gone:
>
> +       dma_mapping_error(ab->dev, paddr);
>
> However this does not make sense to me since IMO testing the CPU address is good enough, I
> can not imagine a valid case where DMA alloc/map fails while returning a valid CPU
> address, no?
>
> If I was right, should we remove invocation to debug_dma_map_page() in dma_alloc_pages()?

Simply replace "if (!vaddr_unaligned)" with "if 
dma_mapping_error(ab->dev, paddr)" and the debug code will be happy.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


