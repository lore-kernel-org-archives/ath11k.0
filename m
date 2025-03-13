Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12742C282EC
	for <ath11k@archiver.kernel.org>; Thu, 13 Mar 2025 17:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fu0bM7ENTtE2pDqZbWrosO5ZjOVXjAMAdp2o409CUzw=; b=UUOwcwaPWd6BUJGjhHA4g6A0ay
	mstJihI0kAg8MimOSyKM5XVwau8auTM0Z8cKWtpnHoMJBjVQbqcHsUFDp/EICmnT6oUPFXnBOXcvl
	7RvMvYR+Qs7ia0pIZ0RRijb44agHdqqp0b+ZtWkVeSBtzpoSk+QFYmPcT8Kb3NQtkYfg6MKCbffQy
	pFo8OisK6tTCHMuiX2nAexEqrhLAsZsK1VDXO6jhQO7yBmC8+YlRljD0cTSlJJFPcBiCebCs5srOT
	LMeyl9D1uGzsuHX9QI9Txp4CSodpIZxdz50QD9d4IrsBawTAxxQNrgZ3v5YemGAKLhKnzVidsm32U
	BEERIUfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsm8V-0000000Bwkb-0fK6;
	Thu, 13 Mar 2025 17:14:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tslCD-0000000Bmhk-2SaN
	for ath11k@lists.infradead.org;
	Thu, 13 Mar 2025 16:14:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2C56D5C5F38;
	Thu, 13 Mar 2025 16:11:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95E72C4CEDD;
	Thu, 13 Mar 2025 16:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741882448;
	bh=kVIx3poAd8OW3CFGk9U2phX4eDoS4t+1NFLX/Hlc1pY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B3ILvSVdjvltJY5TAkSIGJLsm90dXJMo1cCW7jVod3QaKlVR248Tyy4SWj3pfrW/k
	 ZAdMDvgIKudqgO3z6zXzKrLpnDrjecypY5YDKmRk+blojfDQVQfIc4HOJWykrWPl5y
	 kjHor3ltS0EnB7oPfm5KB+B+1lza9saKjbTLt01hSPSTIkO/tx+EC1C7bbOLelX3KQ
	 wxANO0E47bx926Cevku1AyqdMWmx7/D3dNmXY0yGs7EGEo9wWFaLA5R8vVob8Q9oTB
	 wX7tRu2PRPeKEmelIBgyZYdw1ULpfz0nTdp/EyMklez35o25vglBAunEzW5ma046Uz
	 G2g4fyBv9UNjQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tslC9-000000000xS-3nxk;
	Thu, 13 Mar 2025 17:14:06 +0100
Date: Thu, 13 Mar 2025 17:14:05 +0100
From: Johan Hovold <johan@kernel.org>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, johan+linaro@kernel.org
Subject: Re: [PATCH v2 ath-next 2/2] wifi: ath11k: fix HTC rx insufficient
 length
Message-ID: <Z9METTzUJe9yqVEI@hovoldconsulting.com>
References: <20250310010217.3845141-1-quic_miaoqing@quicinc.com>
 <20250310010217.3845141-3-quic_miaoqing@quicinc.com>
 <Z866cCj8SWyZjCoP@hovoldconsulting.com>
 <7b1c5e40-b11d-421b-8c8b-117a2a53298b@quicinc.com>
 <c0cdcaf2-655b-4d22-a949-1519c552e6a4@oss.qualcomm.com>
 <72d95d77-674e-4ae7-83b0-ab58748b8251@quicinc.com>
 <Z9G5zEOcTdGKm7Ei@hovoldconsulting.com>
 <8ea7fe7c-7b4d-4a6f-ae03-b9ca127c23f8@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ea7fe7c-7b4d-4a6f-ae03-b9ca127c23f8@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_091409_696305_68102C9F 
X-CRM114-Status: GOOD (  22.34  )
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

On Thu, Mar 13, 2025 at 09:31:56PM +0800, Miaoqing Pan wrote:
> On 3/13/2025 12:43 AM, Johan Hovold wrote:
> > On Wed, Mar 12, 2025 at 09:11:45AM +0800, Miaoqing Pan wrote:
> >> On 3/11/2025 11:20 PM, Jeff Johnson wrote:

> >>> That didn't answer Johan's first question:
> >>> Are there ever any valid reasons for seeing a zero-length descriptor?
> >>
> >> The events currently observed are all firmware logs. The discarded
> >> packets will not affect normal operation. I will adjust the logging to
> >> debug level.

Have you looked at the device side of things as well? Could it be that
the firmware is doing something wrong when forwarding the logs?

How sure are you that you only see this with firmware logs?

> > I've taken a closer look at the driver and it seems like we're missing a
> > read barrier to make sure that the updated descriptor is not read until
> > after the head pointer.
> > 
> > Miaoqing, could you try the below patch with your reproducer and see if
> > it is enough to fix the corruption?
  
> > +	/* Make sure descriptor is read after the head pointer. */
> > +	dma_rmb();
> > +
> >   	*nbytes = ath11k_hal_ce_dst_status_get_length(desc);
> >   	if (*nbytes == 0) {
> > +		WARN_ON_ONCE(1);	// FIXME: remove
> >   		ret = -EIO;
> >   		goto err;
> >   	}
> 
> This issue can still be reproduced.
> 
> [ 3283.687469] WARNING: CPU: 0 PID: 0 at 
> /drivers/net/wireless/ath/ath11k/ce.c:405 
> ath11k_ce_per_engine_service+0x228/0x3e4 [ath11k]

Thanks for verifying.

Which platform are you testing on and which kernel are you using?

I'm still waiting to hear back from some people testing my patch on the
X13s (sc8280xp).

Johan

