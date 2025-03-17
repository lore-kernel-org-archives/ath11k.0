Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F36C28B30
	for <ath11k@archiver.kernel.org>; Mon, 17 Mar 2025 13:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ydyNNw5BPc+dEFYVeeTi949XQbOoM75Z5Tucc9iNJmU=; b=qKveSKBiFIDtjxedOCWkTsNQVl
	N3UO1303oHqa0LwvoOGx4k9MUaquwXyB4bz4S4Ko2Wf9niwNFkrnr60mgGvyVTiT/cNCojxjwlLmj
	CCaE9j37JItEUUQDoF1OvKEA18zSyjMAOkOC94BNrQKWH4rahUJDmhkT0zke+x0yUvHazlHzBaaHZ
	5rf+enCoBoAfvYKqFFkQftE9LX+B0S9H1vgAd1tai/9clSaZM+gDGv52UNeLiAOCsmzg2n08qrNlm
	Sz+zYmZafH0ct0YAGFu/mRxqdjcrXITuVKF+RMgZlc/5XsVr447t4hu0I46MJhr+ihAX/2aaBWRNK
	TDS8IYHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuABy-00000002gBh-3Lma;
	Mon, 17 Mar 2025 13:07:42 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuA9G-00000002fck-2Xt9
	for ath11k@lists.infradead.org;
	Mon, 17 Mar 2025 13:04:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D2819A4050D;
	Mon, 17 Mar 2025 12:59:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CE46C4CEE3;
	Mon, 17 Mar 2025 13:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742216693;
	bh=08/mbPZq69oi0MPCJBNrNKVVKfY/AcsPcbrj1BV7nKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DaCJ5tGf1S5GGUAmNH+e9/xX3imM5/QsD7zEHFUFr+XbeqW++o5U42Y+USXpRF8MB
	 GrReIXM0ntTnyn/puhLoAkze+/FH9vnLBZB/Ybd907mkXBdc5Y46lOgno71XyvicAc
	 JUQjk8pbLZQjn6y0J4qmpsSR6nxOnsUyiJb4X20uyHqVKvB+Ot8YdgqQG1JKQ00twp
	 0sL6Fi17CE9PTwyLXg5AB0FxCNUXSm9MOPjPdjDGoi56LxtrhMsMCfEAlf+NlMQbzX
	 1pusoQuySYxBczB36aNbmYXQZ4MALX/EuuKbJSv5cJUkOywzRV09d1tlEHY08+io1e
	 7LGfQPPVC7WLg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tuA9E-000000008V6-0o8n;
	Mon, 17 Mar 2025 14:04:52 +0100
Date: Mon, 17 Mar 2025 14:04:52 +0100
From: Johan Hovold <johan@kernel.org>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, johan+linaro@kernel.org
Subject: Re: [PATCH v2 ath-next 2/2] wifi: ath11k: fix HTC rx insufficient
 length
Message-ID: <Z9gd9Aw5Bug8IKSV@hovoldconsulting.com>
References: <Z866cCj8SWyZjCoP@hovoldconsulting.com>
 <7b1c5e40-b11d-421b-8c8b-117a2a53298b@quicinc.com>
 <c0cdcaf2-655b-4d22-a949-1519c552e6a4@oss.qualcomm.com>
 <72d95d77-674e-4ae7-83b0-ab58748b8251@quicinc.com>
 <Z9G5zEOcTdGKm7Ei@hovoldconsulting.com>
 <8ea7fe7c-7b4d-4a6f-ae03-b9ca127c23f8@quicinc.com>
 <Z9METTzUJe9yqVEI@hovoldconsulting.com>
 <b1c79589-4fcd-4630-9551-a620087e0c23@quicinc.com>
 <Z9PjjDFBuSJ7exVj@hovoldconsulting.com>
 <ecfe850c-b263-4bee-b888-c34178e690fc@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ecfe850c-b263-4bee-b888-c34178e690fc@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_060454_781799_B41D570F 
X-CRM114-Status: GOOD (  26.86  )
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

On Mon, Mar 17, 2025 at 01:52:15PM +0800, Miaoqing Pan wrote:
> On 3/14/2025 4:06 PM, Johan Hovold wrote:
> > On Fri, Mar 14, 2025 at 09:01:36AM +0800, Miaoqing Pan wrote:
 
> >> I think the hardware has already ensured synchronization between
> >> descriptor and head pointer, which isn't difficult to achieve. The issue
> >> is likely caused by something else and requires further debugging.
> > 
> > Yeah, but you still need memory barriers on the kernel side.
> > 
> > It could be that we are looking at two different causes for those
> > zero-length descriptors.
> > 
> > The error handling for that obviously needs to be fixed either way, but
> > I haven't heard anyone hitting the corruption with the memory barriers
> > in place on the X13s yet (even if we'd need some more time to test
> > this).

> After multiple and prolonged verifications, adding dma_rmb() did not 
> improve the issue at all. I think this Status Descriptor is updated by 
> hardware (Copy Engine) controlled by another system, not involving DMA 
> or out-of-order CPU access within the same system, so memory barriers do 
> not take effect.

Then it seems we are looking at two separate root causes for the
corruption as the memory barrier appears to be all that is needed to fix
the X13s issue.

A user who hit the corruption after 2 h without the fix has been running
over the weekend with the memory barrier without any problems. I'll ask
further users to test, but it certainly looks like it is working as
intended.

And the memory barrier is de-facto missing as the head pointer and
descriptor are accessed through (two separate) coherent mappings so
there are no ordering guarantees without explicit barriers.

Now obviously there are further issues in your system, which we should
make sure we understand before adding workarounds to the driver.

Do you have a pointer to the downstream kernel sources you are testing
with? Or even better, can you reproduce the issue with mainline after
adding the PCIe patches that were posted to the lists for these
platforms?

Apparently the descriptors can also be passed in non-coherent memory
for some devices (.alloc_cacheable_memory / HAL_SRNG_FLAGS_CACHED). That
implementation looks suspicious and could possibly result in similar
problems. Are you using .alloc_cacheable_memory in your setup?

Does it make any difference if you use a full rmb() barrier?

And after modifying ath11k_hal_ce_dst_status_get_length() so that it
does not clear the length, how many times you need to retry? Does it
always work on the second try?

Johan

