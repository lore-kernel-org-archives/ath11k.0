Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FB9E7717D
	for <ath11k@archiver.kernel.org>; Mon,  9 Dec 2024 10:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cimsqdyKXamBbNAmx4P+hTJb+SLCsb+4nwG/p6uKdbc=; b=nHNq+z3HfP9+vSdkBpqklJySzc
	uomYhzkujhMXB9dk7bvZZLuAwAb+2BPDLvM4kA5f43EAwusDAH0mW4ZfDP0bJyslGytvkNrObrlAK
	xdpGZx+eKxPDjeyZ1Vn68qUVHpim5XueUuCEW3IPYO+YMQeRGIJcMIn0OUzQ4BmoL/g/mssIiPmbC
	zn/Ao9Z6Bx/R8fXrJbtIkIkBN4AQRVqEvQFIK6U9Bfg4EbALwT9RhKzU8d89raF4r1EFU/0V81Ndu
	Z6HwZsa7O/ZetY6nDiNF8MFdh9wOwOXZZzR14cd+Bk4CCNHvwETQr79/ZiJgKBNRPSYXdtftAJ4gi
	GEDNgJiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKbKv-00000007NRM-2gVY;
	Mon, 09 Dec 2024 10:49:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKbKs-00000007NQg-0kMH
	for ath11k@lists.infradead.org;
	Mon, 09 Dec 2024 10:49:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23CE0113E;
	Mon,  9 Dec 2024 02:50:20 -0800 (PST)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 27C9D3F5A1;
	Mon,  9 Dec 2024 02:49:51 -0800 (PST)
Message-ID: <593c0d63-d8fd-4439-a57a-97340212c197@arm.com>
Date: Mon, 9 Dec 2024 10:49:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k swiotlb buffer is full (on IMX8M with 4GiB DRAM)
To: Christoph Hellwig <hch@lst.de>, Tim Harvey <tharvey@gateworks.com>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>, ath11k@lists.infradead.org,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, iommu@lists.linux.dev
References: <CAJ+vNU0EL3T+GyNAbVbGqYYQ5NM3h7cgAwqxxBMuZjh+-YQ3bA@mail.gmail.com>
 <1b2ea8b2-6fbe-4118-b6c6-742c8f0be476@quicinc.com>
 <CAJ+vNU1-OZ3y4p2L+zf64AiVtUv70yZNqkT20jTxyE0_gJb6Jg@mail.gmail.com>
 <0282be95-9094-4d49-b79e-4f7c976dad00@quicinc.com>
 <CAJ+vNU32EMHjtchJRb1sODBrUKG2vZW4ZEu1_F0+dCCEjCn7Dg@mail.gmail.com>
 <20241209081714.GA25363@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20241209081714.GA25363@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_024954_265094_60E11B53 
X-CRM114-Status: UNSURE (   4.90  )
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

On 09/12/2024 8:17 am, Christoph Hellwig wrote:
> I scrolled three pages before giving up as it was just quotes over
> quotas.  Can you please write an email that contains whatever you're
> trying to tell instead of just quotes?  Same for the person replying.

TBH I'm hesitant to look too closely since everything those Atheros WiFi 
drivers do with DMA tends to be sketchy, but from what I could make out 
from skimming until I also gave up, I think it might be an attempt to 
reinvent dma_alloc_pages(), or possibly dma_alloc_noncoherent().

Cheers,
Robin.

