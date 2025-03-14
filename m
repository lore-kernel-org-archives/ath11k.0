Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D4AC282EC
	for <ath11k@archiver.kernel.org>; Fri, 14 Mar 2025 08:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MVinQh6N7IHnBDRDP9T3qwLHwQpBAqsGbkm+iihWqTc=; b=C+t1x84qHV5ORF+/hJmNF5yg6s
	hPgZxC9mGXAQ4uSY2Vk8qQT0MM6oip7MS9OhlCFcELQOYYNcLcdvQONrfjrBPz5RbkIafinw0sb0W
	KRqFualjNHJDYQiL8XHP6ttbRmY9GAE7XN362RwQ7O2xvRGtROfJAYBlT3FkQJ5/Ne5y1B7TIyWfe
	eHswdGGSm/lfoUG1+LYOZohR81Pun0kHfIyEgNeWmuNK92P1ft8GfjZIIy67+kjumX6mZJ/FSu6bL
	J6EqH5v9xO//YgLvk/vb3sxWc57hfBeYUtlTJcEy2RQGDBfXunqEdduZqTroMlOXmLY7l2ozJJNAT
	PSIlb8/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0NP-0000000DSOT-25dy;
	Fri, 14 Mar 2025 08:26:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0Hq-0000000DR5m-19oo
	for ath11k@lists.infradead.org;
	Fri, 14 Mar 2025 08:20:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C21DA5C03CD;
	Fri, 14 Mar 2025 08:18:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C887C4CEE3;
	Fri, 14 Mar 2025 08:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741940457;
	bh=f/kStw48aQBGQy35frF+7V2aEEA00ieAtTWKjV0l8cg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TvofsQ9olLoE2wHocil0BEsP7JID4FC94pY7TNU+FzdCexy/ZRjuBqDuRRxTCuD4V
	 HGChAh+uSkdnuF24sOIJB0AAhrGn65lsZblrgEa8czF/E2c4aTXh5eZlMzdkeMCMuj
	 1GhCQbRNVhVXR4GYB9bjNaMQ2//WLJrK3I5ukrqOY/5xaXbjPGtkwJQUchGs0QfZ6B
	 MUVm/InIbotLdROlmorA9Uf+ehWYIO9hFE2Gm9pXYSMSjDJSmaO5pyzBHVOISJPad6
	 jKs1kEyJjQonXU2NlldsB6QFrVr5U+CHi0VRs2e/mDvZfl49qeqiCDdJD5LS+CtMIz
	 m1Z19QZz5CWXw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tt0Hn-0000000032G-0Xpi;
	Fri, 14 Mar 2025 09:20:55 +0100
Date: Fri, 14 Mar 2025 09:20:55 +0100
From: Johan Hovold <johan@kernel.org>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: quic_jjohnson@quicinc.com, ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org
Subject: Re: [PATCH v3 ath-next 2/2] wifi: ath11k: fix HTC rx insufficient
 length
Message-ID: <Z9Pm56Xx7kYZl8fk@hovoldconsulting.com>
References: <20250314061353.106194-1-quic_miaoqing@quicinc.com>
 <20250314061353.106194-3-quic_miaoqing@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314061353.106194-3-quic_miaoqing@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_012058_428301_536868E2 
X-CRM114-Status: GOOD (  22.07  )
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

On Fri, Mar 14, 2025 at 02:13:53PM +0800, Miaoqing Pan wrote:
> A relatively unusual race condition occurs between host software
> and hardware, where the host sees the updated destination ring head
> pointer before the hardware updates the corresponding descriptor.
> When this situation occurs, the length of the descriptor returns 0.
> 
> The current error handling method is to increment descriptor tail
> pointer by 1, but 'sw_index' is not updated, causing descriptor and
> skb to not correspond one-to-one, resulting in the following error:
> 
> ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1488, expected 1492
> ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1460, expected 1484
> 
> To address this problem and work around the broken hardware,
> temporarily skip processing the current descriptor and handle it
> again next time. However, to prevent this descriptor from
> continuously returning 0, use the skb control block (cb) to set
> a flag. If the length returns 0 again, this descriptor will be
> discarded.
> 
> Tested-on: QCA6698AQ hw2.1 PCI WLAN.HSP.1.1-04546-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
> 
> Reported-by: Johan Hovold <johan+linaro@kernel.org>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218623
> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>

> @@ -387,18 +387,36 @@ static int ath11k_ce_completed_recv_next(struct ath11k_ce_pipe *pipe,
>  
>  	ath11k_hal_srng_access_begin(ab, srng);
>  
> -	desc = ath11k_hal_srng_dst_get_next_entry(ab, srng);
> +	desc = ath11k_hal_srng_dst_peek(ab, srng);
>  	if (!desc) {
>  		ret = -EIO;
>  		goto err;
>  	}
>  
>  	*nbytes = ath11k_hal_ce_dst_status_get_length(desc);

As I mentioned elsewhere, this function also sets the length field in
the descriptor to zero. So if there's a racing update, you may never see
the updated length.

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

If you add the memory barrier and make sure not to clear the length
field above, do you still see the length sometimes always reading zero
if you retry more than once (i.e. drop the is_desc_len0 flag)?

Perhaps the device is really passing you a zero-length descriptor that
can simply be discarded straight away?

Johan

