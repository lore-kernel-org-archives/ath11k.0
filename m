Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE1EC282EC
	for <ath11k@archiver.kernel.org>; Fri, 14 Mar 2025 08:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ORViJuPuwuNDhBPOHd6wNVeU2NL7GLaSlooeTdO5Vw=; b=1cDja9IZ81TlcPKBWGI6TEEDlp
	yzr3cjf6dGv5bbAjCNyItX0oaITvtOEFqcbstHBrnFqsKx+QMBqXQU/e1UqV9/u8sGV8P+NvM6mDT
	vPsc41qbgfaUFqM2IZnC8vftrc5SGeNsChgL/JtYKr8+3qfj5zifj1KtQ7GlV6pGLjsaN9gheCYvw
	VAfvhFpGW+MNcqQMyG0rlN9LG/YpR/GhVKQ0JkoTI3LtnjoSVq7YxHJudtqFX+XGzHxJJH5v1AKHY
	hCMCBiyoBLA2WZqcvw3qkyMykeeY2NHE6pP9JsB0xZpqPXDx9tIovhFg68OPHYPIJSndXfDyKyiiM
	1b7nPCnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt07j-0000000DOzC-3GoN;
	Fri, 14 Mar 2025 08:10:31 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt042-0000000DOPT-0BlI
	for ath11k@lists.infradead.org;
	Fri, 14 Mar 2025 08:06:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0B6DDA48842;
	Fri, 14 Mar 2025 08:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FD46C4CEE3;
	Fri, 14 Mar 2025 08:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741939598;
	bh=VyYjw56OkcWtxGlsD1Q0pmAELcgjWDeg6Y0yjbO9MKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UuWxy3xgJeaO5EBV2HlXILrL+kHOV1RsZOepnzBUvYpucbXwS8QguJHxwNUsBQKZ3
	 0ZhwQG097dpKueC6gfdUH7ByDZBrpnK9XMZQLeTyjsyxKT/9g1QUrXxFzXT0t6Owze
	 LNZBqxdX6FYyLsazVhYR2UIOtLzdraToYfAjdNbT/IRlbgPHstGIHUZxWzvcCSZiAG
	 cuaJvOdx25qiAa/Rj0cN370XNrZ+d7TPJqdvGtsMZDTFWQkWAEC3OMY5RlEKEobBO+
	 hUv7zi+WmdM9cBNO6MjwYxYjGY2wl+XlPkjkXKlINbcn3c/P3zmh1PZ/et1vW9V4Nu
	 EVVxwb4lZldFg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tt03w-000000002hh-0wbN;
	Fri, 14 Mar 2025 09:06:36 +0100
Date: Fri, 14 Mar 2025 09:06:36 +0100
From: Johan Hovold <johan@kernel.org>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, johan+linaro@kernel.org
Subject: Re: [PATCH v2 ath-next 2/2] wifi: ath11k: fix HTC rx insufficient
 length
Message-ID: <Z9PjjDFBuSJ7exVj@hovoldconsulting.com>
References: <20250310010217.3845141-1-quic_miaoqing@quicinc.com>
 <20250310010217.3845141-3-quic_miaoqing@quicinc.com>
 <Z866cCj8SWyZjCoP@hovoldconsulting.com>
 <7b1c5e40-b11d-421b-8c8b-117a2a53298b@quicinc.com>
 <c0cdcaf2-655b-4d22-a949-1519c552e6a4@oss.qualcomm.com>
 <72d95d77-674e-4ae7-83b0-ab58748b8251@quicinc.com>
 <Z9G5zEOcTdGKm7Ei@hovoldconsulting.com>
 <8ea7fe7c-7b4d-4a6f-ae03-b9ca127c23f8@quicinc.com>
 <Z9METTzUJe9yqVEI@hovoldconsulting.com>
 <b1c79589-4fcd-4630-9551-a620087e0c23@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1c79589-4fcd-4630-9551-a620087e0c23@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_010642_145560_59FD06D3 
X-CRM114-Status: GOOD (  20.86  )
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

On Fri, Mar 14, 2025 at 09:01:36AM +0800, Miaoqing Pan wrote:
> On 3/14/2025 12:14 AM, Johan Hovold wrote:
> > On Thu, Mar 13, 2025 at 09:31:56PM +0800, Miaoqing Pan wrote:
> >> On 3/13/2025 12:43 AM, Johan Hovold wrote:

> >>> +	/* Make sure descriptor is read after the head pointer. */
> >>> +	dma_rmb();
> >>> +
> >>>    	*nbytes = ath11k_hal_ce_dst_status_get_length(desc);
> >>>    	if (*nbytes == 0) {
> >>> +		WARN_ON_ONCE(1);	// FIXME: remove
> >>>    		ret = -EIO;
> >>>    		goto err;
> >>>    	}
> >>
> >> This issue can still be reproduced.
> >>
> >> [ 3283.687469] WARNING: CPU: 0 PID: 0 at
> >> /drivers/net/wireless/ath/ath11k/ce.c:405
> >> ath11k_ce_per_engine_service+0x228/0x3e4 [ath11k]
> > 
> > Thanks for verifying.
> > 
> > Which platform are you testing on and which kernel are you using?
> > 
> > I'm still waiting to hear back from some people testing my patch on the
> > X13s (sc8280xp).

> qcs615-ride, kernel 6.6.65.

Ok, so a downstream vendor kernel?

qcs615-ride does not even have PCIe enabled in mainline yet, but I
assume that's what you use here?
 
> I think the hardware has already ensured synchronization between 
> descriptor and head pointer, which isn't difficult to achieve. The issue 
> is likely caused by something else and requires further debugging.

Yeah, but you still need memory barriers on the kernel side.

It could be that we are looking at two different causes for those
zero-length descriptors.

The error handling for that obviously needs to be fixed either way, but
I haven't heard anyone hitting the corruption with the memory barriers
in place on the X13s yet (even if we'd need some more time to test
this).

Johan

