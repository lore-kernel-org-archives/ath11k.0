Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDF0C28B2E
	for <ath11k@archiver.kernel.org>; Mon, 10 Mar 2025 10:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4vfCMpGAaIinc2L27soT/gCFxu1Ut6sglGjPmIPuvko=; b=WuJ9dceCe7yJrJ/zsnGUBBI2m5
	qRCe/s0bh/Ji6HHtrN0/b5C6Pohlz+cqOK/6NNw3Kh/vOhb7GgesvXlJb/csyweLPhH86LqlNbmhW
	V3HfAibBDpDfKP8/KYxqAxITm7u3oD9EhstNbRWM2RWvl5COl5c/PkZYSlJbGcHTVMuLHnbD1Ry/B
	a/fwWHwiq7DsV0+e9g6RFOty07eMp74BADySHADaZ+BRCrigiPu5/afVnwUxdxcsidlCcUDOSvcG0
	JOxxFar/lq10ri1Ev12LMsFNg4+i5idadEj/ZrCYUk8oOug494qL5CoDWPsC/BRYZB8Hv95HmU0pD
	i4DOwWhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1traDq-00000002Eer-3Vl9;
	Mon, 10 Mar 2025 10:18:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tra5A-00000002D7R-0LDW
	for ath11k@lists.infradead.org;
	Mon, 10 Mar 2025 10:10:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 28EF05C0295;
	Mon, 10 Mar 2025 10:07:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D14FC4CEE5;
	Mon, 10 Mar 2025 10:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741601397;
	bh=lfgb+4yconhWI0GihEGvBTzUmrfm3IiGF84oD4PW/BI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t4Y00iF/XZiFLpxSZjMhOXUB3swUXhsjOtQn11daJRKHt/bIiWQSILaMpudvcGeTT
	 kF4YXcjvEQOj5xrMM5VbsNBimcQvXmc0cdk9dHbiQrJSI3LDy5zcfMjPNBBKQGz6C/
	 3YfkL3pnsQrek9w0uvkFGJflrKFjQcWH82XHXOYr1L5zjOD5eYC3AzWc0ieIiQXMKW
	 xbc2b9xRgmbaQYEG6PiMKIH8wcJs09Cz1hMeq5Muxx6zHn1wPGa6fxDQtJfdD+NjyJ
	 BqIoLzPvbnShbwYYEtlFuKOqW50LyMG0fZKyEGQsN7I6QREtJiES1tad6fhf8nV435
	 BoVFCe9UC99tQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tra52-000000006bM-3NnW;
	Mon, 10 Mar 2025 11:09:52 +0100
Date: Mon, 10 Mar 2025 11:09:52 +0100
From: Johan Hovold <johan@kernel.org>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: quic_jjohnson@quicinc.com, ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org
Subject: Re: [PATCH v2 ath-next 2/2] wifi: ath11k: fix HTC rx insufficient
 length
Message-ID: <Z866cCj8SWyZjCoP@hovoldconsulting.com>
References: <20250310010217.3845141-1-quic_miaoqing@quicinc.com>
 <20250310010217.3845141-3-quic_miaoqing@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310010217.3845141-3-quic_miaoqing@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_031000_249877_BBADBEB5 
X-CRM114-Status: GOOD (  22.78  )
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

On Mon, Mar 10, 2025 at 09:02:17AM +0800, Miaoqing Pan wrote:
> A relatively unusual race condition occurs between host software
> and hardware, where the host sees the updated destination ring head
> pointer before the hardware updates the corresponding descriptor.
> When this situation occurs, the length of the descriptor returns 0.

I still think this description is too vague and it doesn't explain how
this race is even possible. It sounds like there's a bug somewhere in
the driver or firmware, but if this really is an indication the hardware
is broken as your reply here seems to suggest:

	https://lore.kernel.org/lkml/bc187777-588c-4fa0-ba8c-847e91c78d43@quicinc.com/

then that too should be highlighted in the commit message (e.g. by
describing this as "working around broken hardware").

> The current error handling method is to increment descriptor tail
> pointer by 1, but 'sw_index' is not updated, causing descriptor and
> skb to not correspond one-to-one, resulting in the following error:
> 
> ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1488, expected 1492
> ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1460, expected 1484
> 
> To address this problem, temporarily skip processing the current
> descriptor and handle it again next time. However, to prevent this
> descriptor from continuously returning 0, use skb cb to set a flag.
> If the length returns 0 again, this descriptor will be discarded.

The ath12k ring-buffer handling looks very similar. Do you need a
corresponding workaround in ath12k_ce_completed_recv_next()? Or are you
sure that this (hardware) bug only affects ath11k devices?
 
>  	*nbytes = ath11k_hal_ce_dst_status_get_length(desc);
> -	if (*nbytes == 0) {
> -		ret = -EIO;
> -		goto err;
> +	if (unlikely(*nbytes == 0)) {
> +		struct ath11k_skb_rxcb *rxcb =
> +			ATH11K_SKB_RXCB(pipe->dest_ring->skb[sw_index]);
> +
> +		/* A relatively unusual race condition occurs between host
> +		 * software and hardware, where the host sees the updated
> +		 * destination ring head pointer before the hardware updates
> +		 * the corresponding descriptor.
> +		 *
> +		 * Temporarily skip processing the current descriptor and handle
> +		 * it again next time. However, to prevent this descriptor from
> +		 * continuously returning 0, set 'is_desc_len0' flag. If the
> +		 * length returns 0 again, this descriptor will be discarded.
> +		 */
> +		if (!rxcb->is_desc_len0) {
> +			rxcb->is_desc_len0 = true;
> +			ret = -EIO;
> +			goto err;
> +		}
>  	}

I'm still waiting for feedback from one user that can reproduce the
ring-buffer corruption very easily, but another user mentioned seeing
multiple zero-length descriptor warnings over the weekend when running
with this patch:

	ath11k_pci 0006:01:00.0: rxed invalid length (nbytes 0, max 2048)

Are there ever any valid reasons for seeing a zero-length descriptor
(i.e. unrelated to the race at hand)? IIUC the warning would only be
printed when processing such descriptors a second time (i.e. when
is_desc_len0 is set).

Johan

