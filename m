Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A75FC5B552
	for <ath11k@archiver.kernel.org>; Wed,  4 Jun 2025 08:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0CZIVXZ9/sz9F2op3zOTUXl5EO80XUJst6Y2GM71eK8=; b=ndnIq7trCyGSRPlOuY7cC6o9F4
	/FcMzntrsm1BrwL3QHrv65MnMDYmSDlW2FGYxK4MFQBjNAlnmDPDW73raVeoEXpjVoCKudAC4H+GY
	xk+6yUq/eFy0WbkfQUmwQNYdM1GlgYUu71H2AwG6amlG5rp+fncGFfh5yA1Gfrw2MtTxygM20HTNk
	5oUWmadfGSA/e6vgdNPkiGx/t3+jAnH+1mES3ByziUdDZMFlJxwedxe/I5SYvrfZC8yoBBLNjurfz
	KFFXE68ulDAFX2+Jj/TXRL74KyxRWN40fLtedXfirgFJyUwrpHTYcEHG2OSGqIKlqYCI7hrdBPl3s
	rxCPZAZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMjjw-0000000CvgQ-00Ie;
	Wed, 04 Jun 2025 08:44:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMjA3-0000000Cqf9-0WOG
	for ath11k@lists.infradead.org;
	Wed, 04 Jun 2025 08:07:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C1F165C33FE;
	Wed,  4 Jun 2025 08:05:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45DBFC4CEE7;
	Wed,  4 Jun 2025 08:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749024466;
	bh=udKDE2z3Dh+zqzXfzXV5t59Ts2YA2zBXT9lPczBGBS4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h3YIPlYLvNMuU/TEmJORHLVoAKjDkiS4dNNtm9kp1I8H+iv70L6zFAhK/z0GMrfMV
	 fooH7ILEVwS/0hX6w5gBlkSNwwvIntzKx2XWZJEadN3B7HIb1Caw/VrL5zyNLaPHD3
	 CWaWQkFUTbnHf/DbH+vZn3YKbpgmnTgxAf/OrvrsvA5lxd2dfotlkMgFgemItEg9pD
	 QrXgvoge4tcVUcIH33FC0HqNG9BI6VdL/uVjV5HDTsyUAYSj+XgBBSAY25LPAd0Eyo
	 1sKVXm3+0PYAyOokrAEVLCHMRWlAlVAKt3gdSUnRM/9Y/s4RJRAp1/Dpoe3PAOEMxo
	 E6aq92l0R2ONA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uMj9y-000000003m2-1ilT;
	Wed, 04 Jun 2025 10:07:43 +0200
Date: Wed, 4 Jun 2025 10:07:42 +0200
From: Johan Hovold <johan@kernel.org>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/3] wifi: ath11k: fix dest ring-buffer corruption
Message-ID: <aD_-zt755Jr_LsWM@hovoldconsulting.com>
References: <20250526114803.2122-1-johan+linaro@kernel.org>
 <20250526114803.2122-2-johan+linaro@kernel.org>
 <026b710f-b50f-4302-ad4f-36932c2558ff@quicinc.com>
 <aD1axxSAJsbUfnHH@hovoldconsulting.com>
 <5268c9ba-16cf-4d3a-87df-bbe0ddd3d584@quicinc.com>
 <aD7h0OOoGjVm8pDK@hovoldconsulting.com>
 <01634993-80b1-496e-8453-e94b2efe658c@quicinc.com>
 <7025db40-dda0-4cbb-80bd-09bd590584da@quicinc.com>
 <aD_wgACEfm1_1GNz@hovoldconsulting.com>
 <79b4bac1-6e55-408c-a334-006eded4229f@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <79b4bac1-6e55-408c-a334-006eded4229f@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_010747_244936_BA58583E 
X-CRM114-Status: GOOD (  19.60  )
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

On Wed, Jun 04, 2025 at 03:57:57PM +0800, Miaoqing Pan wrote:
> On 6/4/2025 3:06 PM, Johan Hovold wrote:
> > On Wed, Jun 04, 2025 at 01:32:08PM +0800, Miaoqing Pan wrote:
> >> On 6/4/2025 10:34 AM, Miaoqing Pan wrote:
> >>> On 6/3/2025 7:51 PM, Johan Hovold wrote:
> >>>> On Tue, Jun 03, 2025 at 06:52:37PM +0800, Baochen Qiang wrote:

> >>>>> The sequence is
> >>>>>
> >>>>>      1# reading HP
> >>>>>          srng->u.dst_ring.cached_hp = READ_ONCE(*srng-
> >>>>>> u.dst_ring.hp_addr);
> >>>>>
> >>>>>      2# validate HP
> >>>>>          if (srng->u.dst_ring.tp == srng->u.dst_ring.cached_hp)
> >>>>>              return NULL;
> >>>>>
> >>>>>      3# get desc
> >>>>>          desc = srng->ring_base_vaddr + srng->u.dst_ring.tp;
> >>>>>
> >>>>>      4# accessing desc
> >>>>>          ath11k_hal_desc_reo_parse_err(... desc, ...)
> >>>>>
> >>>>> Clearly each step depends on the results of previous steps. In this
> >>>>> case the compiler/CPU
> >>>>> is expected to be smart enough to not do any reordering, isn't it?
> >>>>
> >>>> Steps 3 and 4 can be done speculatively before the load in step 1 is
> >>>> complete as long as the result is discarded if it turns out not to be
> >>>> needed.
> > 
> >>> If the condition in step 2 is true and step 3 speculatively loads
> >>> descriptor from TP before step 1, could this cause issues?
> >>
> >> Sorry for typo, if the condition in step 2 is false and step 3
> >> speculatively loads descriptor from TP before step 1, could this cause
> >> issues?
> > 
> > Almost correct; the descriptor can be loaded (from TP) before the head
> > pointer is loaded and thus before the condition in step 2 has been
> > evaluated. And if the condition in step 2 later turns out to be false,
> > step 4 may use stale data from before the head pointer was updated.
> 
> Actually, there's a missing step between step 3 and step 4: TP+1.
> 
> TP+1:
> 	srng->u.dst_ring.tp += srng->entry_size

Sure, but that is not relevant for the issue at hand.

> TP is managed by the CPU and points to the current first unprocessed 
> descriptor, while HP and the descriptor are asynchronously updated by 
> DMA. So are you saying that the descriptor obtained through speculative 
> loading has not yet been updated, or is in the process of being updated?

Exactly.

Johan

