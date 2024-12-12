Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D3AAE7717F
	for <ath11k@archiver.kernel.org>; Thu, 12 Dec 2024 07:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bj8/EIoY8Qi/YpzIxjmN5uN59FrJ0roPK2JNqJrf+QY=; b=YlOV/hrptKt6A5M2CxCl2jpyk8
	LeJerrZDy79MYEDizrGXfRDsQH0eGe8o2cMmbBb+oU+dwY206wQOTQcHJBPN8r6uFzikz/1Kq8eLg
	Df39mtdhg7t+t18Df1PmR22e6ceR9JCk6f1aLanCe0kuwk0m8ll5GAkTVmk2uNve51dbe/nlB8oHk
	o5+waNywPUcVqY3LWLV9kt0OURu+eH1hCVcErY/xelA3qlbM/zazFXaQ+Gtxy10lbGE+ksSJ4wup3
	mq5piK+smLDvvASRu9L1HvNnnVvvkOE6wHr+VrRIhOwbhbMb8iZNWdAD/TMlEWeMtkSsiUhW/omNg
	m3d8ffyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLdTP-0000000H8hR-2I86;
	Thu, 12 Dec 2024 07:18:59 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLdTN-0000000H8h2-3bbp
	for ath11k@lists.infradead.org;
	Thu, 12 Dec 2024 07:18:59 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 21C0068D07; Thu, 12 Dec 2024 08:18:49 +0100 (CET)
Date: Thu, 12 Dec 2024 08:18:48 +0100
From: Christoph Hellwig <hch@lst.de>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Tim Harvey <tharvey@gateworks.com>,
	Christoph Hellwig <hch@lst.de>, ath11k@lists.infradead.org,
	linux-wireless <linux-wireless@vger.kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>, iommu@lists.linux.dev
Subject: Re: ath11k swiotlb buffer is full (on IMX8M with 4GiB DRAM)
Message-ID: <20241212071848.GB6638@lst.de>
References: <0282be95-9094-4d49-b79e-4f7c976dad00@quicinc.com> <CAJ+vNU32EMHjtchJRb1sODBrUKG2vZW4ZEu1_F0+dCCEjCn7Dg@mail.gmail.com> <20241209081714.GA25363@lst.de> <593c0d63-d8fd-4439-a57a-97340212c197@arm.com> <CAJ+vNU2ypE_Mn_6iKCmf5LYk9Sth=ryWXyewc5MhOKK8VoAKCA@mail.gmail.com> <20241210041133.GA17116@lst.de> <CAJ+vNU03Cqsc+O5anwmvJW8Wfd-06LbDMVHjxVFdixf01ZLczQ@mail.gmail.com> <5fe372df-ae51-4a8b-9fa3-a4a0ea2d33e3@quicinc.com> <9b2e8ffa-ba2c-46da-a478-eb1fb44b693e@arm.com> <80992ae5-e329-4a34-94c8-9345b2e8a9a0@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80992ae5-e329-4a34-94c8-9345b2e8a9a0@quicinc.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_231858_037079_568DB06F 
X-CRM114-Status: UNSURE (   9.07  )
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

On Thu, Dec 12, 2024 at 01:24:45PM +0800, Baochen Qiang wrote:
> yeah, you are right, Robin. didn't know there are convenient interfaces
> like these already.

FYI, the DMA-API documentation says pretty straight forward to not
use the streaming API and documents these interfaces.  But maybe it's
not clear enough, so I'm open to suggestions on how to make it more
obvious.


