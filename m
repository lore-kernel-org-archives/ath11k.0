Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3AAC5B543
	for <ath11k@archiver.kernel.org>; Wed,  4 Jun 2025 07:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OvKi2iKFQzGnUv5U1DqnvTrpYH/jc/na2vGfcLBlsBI=; b=WVs55F1mUgaLcXaBVL6nLTEyqu
	vu74enHXs7KSlenLTLmYqHAGw6NFkPje+0UviO9Vv5qZroBIlkSePURjOHW1PiV/BmTwWEotDlHcU
	Wa/PqWOVyzrHkSQrrXC7Vp1B56BlfRm1lGZAoUlRQsVQs3ymIgsznjJD9hsPIU38puXNKx7D71vnb
	A6kQByeB58BhLVrNcYJRUZASwIUmlwNsNNah690oxqD9U/PKmoF7i4IrNUcOHK+R9cZYUmbX3L0Uq
	mmAlffIQASkOLmraVlkwwVUofGHIfS0ppK1VcG/nXFncnM2XTAXYTVV0HR8ULzUQDBr1GvUwLszkc
	Nm3dSbwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMi7K-0000000Cj9C-1gb6;
	Wed, 04 Jun 2025 07:00:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMi5Y-0000000CiwY-1gdU
	for ath11k@lists.infradead.org;
	Wed, 04 Jun 2025 06:59:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1FA5644AD8;
	Wed,  4 Jun 2025 06:59:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA577C4CEE7;
	Wed,  4 Jun 2025 06:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749020344;
	bh=4ool76+h1avcafnskE13QYqw2AH9ovgrTOZlRy9qy/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qxe/+MNyLJK2XBp+DPCdAolW1uXjLECZndM1av0cBQ3NFB4bfJ9G/B50FtMPNM5Tg
	 lQjURFC/E1w00f+3YhVciE7pv/AVMQAryUhTb+k/T4vtP9+EpPKu3ysuspARoMZymX
	 K/mkhP9iD5LgIMnYG5zmdAp9I7S0aWt9O9KEqanhMfZznfT6XSrdrhc5jNNGnTFgoc
	 MCQMHe24bmwDCuGq4oNh7GNY/QJ3JUVUFZrKNi3MfMibO49ytzt9Adjner7WDZWuE1
	 fuk0+AwQ40uhZ0Q3sUY+vqxYZXUMncZeZ4NVFOzbsI/NgYErzaZskoLu1jHsF5ujMb
	 q+ebW7suBpNvw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uMi5U-000000004PS-0kaw;
	Wed, 04 Jun 2025 08:59:00 +0200
Date: Wed, 4 Jun 2025 08:59:00 +0200
From: Johan Hovold <johan@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/3] wifi: ath11k: fix dest ring-buffer corruption
Message-ID: <aD_utNk4q23ewRAC@hovoldconsulting.com>
References: <20250526114803.2122-1-johan+linaro@kernel.org>
 <20250526114803.2122-2-johan+linaro@kernel.org>
 <026b710f-b50f-4302-ad4f-36932c2558ff@quicinc.com>
 <aD1axxSAJsbUfnHH@hovoldconsulting.com>
 <5268c9ba-16cf-4d3a-87df-bbe0ddd3d584@quicinc.com>
 <aD7h0OOoGjVm8pDK@hovoldconsulting.com>
 <b303ba1c-b521-44b4-9afc-cf1766f549ee@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b303ba1c-b521-44b4-9afc-cf1766f549ee@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_235904_465409_BF1667C1 
X-CRM114-Status: GOOD (  16.47  )
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

On Wed, Jun 04, 2025 at 10:16:23AM +0800, Baochen Qiang wrote:
> On 6/3/2025 7:51 PM, Johan Hovold wrote:
> > On Tue, Jun 03, 2025 at 06:52:37PM +0800, Baochen Qiang wrote:
> >> On 6/2/2025 4:03 PM, Johan Hovold wrote:
> > 
> >>> No, the barrier is needed between reading the head pointer and accessing
> >>> descriptor fields, that's what matters.
> >>>
> >>> You can still end up with reading stale descriptor data even when
> >>> ath11k_hal_srng_dst_get_next_entry() returns non-NULL due to speculation
> >>> (that's what happens on the X13s).
> >>
> >> The fact is that a dma_rmb() does not even prevent speculation, no matter where it is
> >> placed, right?
> > 
> > It prevents the speculated load from being used.
> 
> Sorry, still not get it. To my knowledge whether the speculated load (steps 3 and 4) would
> get used depends on whether the condition check pass in step 2. How does a dma_rmb() make
> any difference in this process?

It orders the two loads from the device so that the descriptor is not
(speculatively) loaded before the head pointer.

When the CPU sees the updated head pointer it may otherwise proceed with
using stale descriptor data. The barrier prevents this.

Johan

