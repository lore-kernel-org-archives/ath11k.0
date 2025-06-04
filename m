Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38C1C5B552
	for <ath11k@archiver.kernel.org>; Wed,  4 Jun 2025 07:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+tYyr2Mb819c7AGmjBrWK/BOV2u3NfYx1GNk5fwOq+c=; b=gYBjzd8ZM1wNIfaFFKb5kEZJKY
	wtlJw2I9wjulQf6JmhbPGgYgzLeDSZheMaDZcEB7GQA0pYvQ+hK2Coc6XS5Fbl5Q4+ICReDlBXLBq
	zsLwQgGAWBuJMiBcunI66/Urm3fccV+NmLrFBAY2zwaUSMNhqEXwFpyfgk8STEXcAnElbe2JpOAyq
	h54j/wUHAhkLvHlgFh5/eHEmzjCSftR5QHOmo8G5LxfwglWj6gJwsnMSXO9OZ1qFwxQtgaPxTSs5A
	GsY1xh1aoeIFuUIcsdDdV5rH5iNn5xtywOoAw3bPgn/okROUy7/SOB3L7fKpeoug1EJFa4/BlspmP
	xxw0uDuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMiFF-0000000Cjf4-1ptV;
	Wed, 04 Jun 2025 07:09:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMiFC-0000000Cjeg-0iVv
	for ath11k@lists.infradead.org;
	Wed, 04 Jun 2025 07:09:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C36775C0FF4;
	Wed,  4 Jun 2025 07:06:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42222C4CEE7;
	Wed,  4 Jun 2025 07:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749020940;
	bh=iD+RZcjbKVDtFg3DEp6r0Fsk0DPdKsjlbg4GlDqQuaI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TteEiU4zeIjPp6LGl1PUi2UAQNWfbXR3tbndvdF73evDvvVAig3ccB4cbaYN717KC
	 tDEEsSq2SfsXG6xwJiWTyq8TXj8b1WLQoHZjd1tz+aAPKUzd9NgiHFTr6Uo15q5NfZ
	 gAn+qvOPE7KFeEfG6VxxCicJyVCIlnkkzbTKU33Ue/C/4hCTOdaxYWSeOvnQG1NYT+
	 uXtnGU+P/SDZT3qwmcBGUCgxPiyW5q9GIpw9KLvngmBg7awa56DnotkAwAs1oaX5WB
	 vs/ZrXBBJxd8ZOW1hhz1nlbqWBvTpJ0kv07DscoVlpx1/cvK93UiaaaScD7asGmBza
	 1nwroc3D2VNkw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uMiCu-000000004XS-40bA;
	Wed, 04 Jun 2025 09:06:41 +0200
Date: Wed, 4 Jun 2025 09:06:40 +0200
From: Johan Hovold <johan@kernel.org>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/3] wifi: ath11k: fix dest ring-buffer corruption
Message-ID: <aD_wgACEfm1_1GNz@hovoldconsulting.com>
References: <20250526114803.2122-1-johan+linaro@kernel.org>
 <20250526114803.2122-2-johan+linaro@kernel.org>
 <026b710f-b50f-4302-ad4f-36932c2558ff@quicinc.com>
 <aD1axxSAJsbUfnHH@hovoldconsulting.com>
 <5268c9ba-16cf-4d3a-87df-bbe0ddd3d584@quicinc.com>
 <aD7h0OOoGjVm8pDK@hovoldconsulting.com>
 <01634993-80b1-496e-8453-e94b2efe658c@quicinc.com>
 <7025db40-dda0-4cbb-80bd-09bd590584da@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7025db40-dda0-4cbb-80bd-09bd590584da@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_000902_298597_D93FA998 
X-CRM114-Status: GOOD (  20.23  )
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

On Wed, Jun 04, 2025 at 01:32:08PM +0800, Miaoqing Pan wrote:
> On 6/4/2025 10:34 AM, Miaoqing Pan wrote:
> > On 6/3/2025 7:51 PM, Johan Hovold wrote:
> >> On Tue, Jun 03, 2025 at 06:52:37PM +0800, Baochen Qiang wrote:
> >>> On 6/2/2025 4:03 PM, Johan Hovold wrote:
> >>
> >>>> No, the barrier is needed between reading the head pointer and 
> >>>> accessing
> >>>> descriptor fields, that's what matters.
> >>>>
> >>>> You can still end up with reading stale descriptor data even when
> >>>> ath11k_hal_srng_dst_get_next_entry() returns non-NULL due to 
> >>>> speculation
> >>>> (that's what happens on the X13s).
> >>>
> >>> The fact is that a dma_rmb() does not even prevent speculation, no 
> >>> matter where it is
> >>> placed, right?
> >>
> >> It prevents the speculated load from being used.
> >>
> >>> If so the whole point of dma_rmb() is to prevent from compiler 
> >>> reordering
> >>> or CPU reordering, but is it really possible?
> >>>
> >>> The sequence is
> >>>
> >>>     1# reading HP
> >>>         srng->u.dst_ring.cached_hp = READ_ONCE(*srng- 
> >>> >u.dst_ring.hp_addr);
> >>>
> >>>     2# validate HP
> >>>         if (srng->u.dst_ring.tp == srng->u.dst_ring.cached_hp)
> >>>             return NULL;
> >>>
> >>>     3# get desc
> >>>         desc = srng->ring_base_vaddr + srng->u.dst_ring.tp;
> >>>
> >>>     4# accessing desc
> >>>         ath11k_hal_desc_reo_parse_err(... desc, ...)
> >>>
> >>> Clearly each step depends on the results of previous steps. In this 
> >>> case the compiler/CPU
> >>> is expected to be smart enough to not do any reordering, isn't it?
> >>
> >> Steps 3 and 4 can be done speculatively before the load in step 1 is
> >> complete as long as the result is discarded if it turns out not to be
> >> needed.

> > If the condition in step 2 is true and step 3 speculatively loads 
> > descriptor from TP before step 1, could this cause issues?
> 
> Sorry for typo, if the condition in step 2 is false and step 3 
> speculatively loads descriptor from TP before step 1, could this cause 
> issues?

Almost correct; the descriptor can be loaded (from TP) before the head
pointer is loaded and thus before the condition in step 2 has been
evaluated. And if the condition in step 2 later turns out to be false,
step 4 may use stale data from before the head pointer was updated.

Johan

