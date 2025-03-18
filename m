Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83ECC282EC
	for <ath11k@archiver.kernel.org>; Tue, 18 Mar 2025 17:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y9LJf/fL7QX2flZPVi7lOmAR9zvyZCC3k5njE3AjfdY=; b=DdQq9YpZ+7JwbOJuYqiwtI1dor
	b/0tbPERVRW17pfbJOnHpVNBRe5CcN2R94cVCpeZPaR0QA28kIlicKoO9liZ3SXJw4fff8rx5HXHT
	Xm7Qu+oT+13t0emlYegChgkIrN6/zACy1GK32D1sCJ46gnu+GkWjxfmQ+IlAegK5/AuFGpW1xZHe3
	4NNPFXo+YkgLVj86LFkU52LXjoJDIPPMctWXeH6WiXIYS1QPCn8Yn44FBwTH8o3y4XZe/LzlcvzlT
	4MSwO3aIprJ40qUHJdtAOOwyMc6iVan58cW0cSkBUihJeGaDIkmy4rn9+ovCNYU9O0CJErxtiq57o
	/HbdEqWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tub1l-00000006iqM-3C4T;
	Tue, 18 Mar 2025 17:46:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuaxs-00000006iFt-24sn
	for ath11k@lists.infradead.org;
	Tue, 18 Mar 2025 17:42:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 175B75C5925;
	Tue, 18 Mar 2025 17:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E991C4CEDD;
	Tue, 18 Mar 2025 17:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742319775;
	bh=7UfjllCdR6JB488sLvQIQSOghIh0F09d0d7BjGP7AKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fRwPBB89NwhX/vPxAPc3guEV+NVZu52CUcBCRPPD1kC/Xy+XANGy52n8UfMerGzQo
	 4bUOuyvGmTlLlyA8yhM/odYmVCouHCCiBTr+euCcokpONBVnlEhqo+IT9SfDvaXLdY
	 xlk9JYA7a2tdcAa1OQsW28FU9k75FiIJy097yZR9j4LyZTMIHJx5f1Js2VkZ3iarpV
	 Dfw8bhM4B4qBhYEDsLdnC5pi1lF7sL2yRClmAOlzXlvdovVbGp3mwEWlhyReQ6qcq7
	 FCcsO6Y/Z0Lv5xfyYFXNHepHj3SL5NC8M9rW1hGVsDmCFVWaKj7C35QDadj7ywQfRu
	 2zu3pleJUtqTg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tuaxr-000000001Bw-3gPJ;
	Tue, 18 Mar 2025 18:42:56 +0100
Date: Tue, 18 Mar 2025 18:42:55 +0100
From: Johan Hovold <johan@kernel.org>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, johan+linaro@kernel.org
Subject: Re: [PATCH v2 ath-next 2/2] wifi: ath11k: fix HTC rx insufficient
 length
Message-ID: <Z9mwn3GzpPPZSiTG@hovoldconsulting.com>
References: <c0cdcaf2-655b-4d22-a949-1519c552e6a4@oss.qualcomm.com>
 <72d95d77-674e-4ae7-83b0-ab58748b8251@quicinc.com>
 <Z9G5zEOcTdGKm7Ei@hovoldconsulting.com>
 <8ea7fe7c-7b4d-4a6f-ae03-b9ca127c23f8@quicinc.com>
 <Z9METTzUJe9yqVEI@hovoldconsulting.com>
 <b1c79589-4fcd-4630-9551-a620087e0c23@quicinc.com>
 <Z9PjjDFBuSJ7exVj@hovoldconsulting.com>
 <ecfe850c-b263-4bee-b888-c34178e690fc@quicinc.com>
 <Z9gd9Aw5Bug8IKSV@hovoldconsulting.com>
 <f30cf771-a9cd-4d8f-8d10-1640afd33c23@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f30cf771-a9cd-4d8f-8d10-1640afd33c23@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_104256_617265_6706DF12 
X-CRM114-Status: GOOD (  37.86  )
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

On Tue, Mar 18, 2025 at 03:53:39PM +0800, Miaoqing Pan wrote:
> On 3/17/2025 9:04 PM, Johan Hovold wrote:

> > Then it seems we are looking at two separate root causes for the
> > corruption as the memory barrier appears to be all that is needed to fix
> > the X13s issue.
> > 
> > A user who hit the corruption after 2 h without the fix has been running
> > over the weekend with the memory barrier without any problems. I'll ask
> > further users to test, but it certainly looks like it is working as
> > intended.
> > 
> > And the memory barrier is de-facto missing as the head pointer and
> > descriptor are accessed through (two separate) coherent mappings so
> > there are no ordering guarantees without explicit barriers.
> 
> This situation should occur when there is only one descriptor in the 
> ring. If, as you mentioned, the CPU tries to load the descriptor first, 
> but the descriptor fetch fails before the HP load because the ring 
> returns empty, it won't trigger the current issue.

It could if the CPU observes the updates out of order due to the missing
barrier. The driver could be processing an earlier interrupt when the
new descriptor is added and head pointer updated. If for example the CPU
speculatively fetches the descriptor before the head pointer is updated,
then the descriptor length may be zero when the CPU sees the updated
head pointer.

This seems to be what is happening on the X13s since adding the memory
barrier makes the zero-length descriptors go away.
 
> The Copy Engine hardware module copies the metadata to the Status 
> Descriptor after the DMA is complete, then updates the HP to trigger an 
> interrupt. I think there might be some issues in this process, such as 
> the lack of a wmb instruction after the copy is complete, causing the HP 
> to be updated first.

Yeah, possibly. At least it seems there are more issues than the missing
barrier on the machines you test.
 
> > Now obviously there are further issues in your system, which we should
> > make sure we understand before adding workarounds to the driver.
> > 
> > Do you have a pointer to the downstream kernel sources you are testing
> > with? Or even better, can you reproduce the issue with mainline after
> > adding the PCIe patches that were posted to the lists for these
> > platforms?
> > 
> https://github.com/qualcomm-linux/meta-qcom-hwe/blob/scarthgap/recipes-kernel/linux/linux-qcom-base_6.6.bb

Thanks for the pointer. That's a lot of out-of-tree patches on top of
stable so not that easy to check the state of the resulting tree.

> > Does it make any difference if you use a full rmb() barrier?
> > 
> I've also tried rmb() and mb(), but they didn't work either.

Thanks for checking.

Just to be sure, you did add the barrier in the same place as my patch
(i.e. just before the descriptor read)?

> > And after modifying ath11k_hal_ce_dst_status_get_length() so that it
> > does not clear the length, how many times you need to retry? Does it
> > always work on the second try?
> 
> Yes, the test has been running continuously for over 48 hours, always 
> work on the second try, updated in patch v4.

Good, at least the descriptor-length-sometimes-never-updated issue is
solved.

Johan

