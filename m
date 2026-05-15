Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384EFCD4F25
	for <ath11k@archiver.kernel.org>; Fri, 15 May 2026 01:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4uAqE+q2UzPII5vnt4wx5yy+f2NRVPMEBmYSwydEl30=; b=LlNsmD40ROnn+kYlFZiqvm2+yr
	B0udHdc0N3Hkag4dohaEjr7A5bk4k2iIhGQVhzsXkuFyz/W3xo3JeDVnDx5oeboqZvAtX+C7GGqpk
	8UpcbWyqwGF+fX/7e9IO5X4Q42rHjy7st2IOktVCUEIqiz/vKwmY4HPbAiSxSNrKLkIBg5aQ68dbr
	296n/3RqEpFV4CswREg1ty9QGDA9XKdXPBVKgcrQ3k6GhR3hdBqI4S2Zfc/TSps9ByM8K+oi6Q3Ie
	84v8cAjguM0FmyPzcw1s+ZuVz72kv65ufBKzOXBtOFG3mC4a/4LaZJjF3PWl/l1stu9dQy70faS+J
	1JzP6EzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNh2S-00000006yfe-1ypq;
	Fri, 15 May 2026 01:08:28 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNh2P-00000006yey-2xN3
	for ath11k@lists.infradead.org;
	Fri, 15 May 2026 01:08:27 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-7dbccf6a23dso7132446a34.2
        for <ath11k@lists.infradead.org>; Thu, 14 May 2026 18:08:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778807304; cv=none;
        d=google.com; s=arc-20240605;
        b=Sc8TOIhPNaJrC7ePmw4lfi++WfrA16LOD5hQWa8/54BXWwmg22qdMOcjZYzLzbDWQC
         ku1QgbX+eSv5bVmMoRpmsBTdJJOlTVv1XBOlQphQMUHXHDyoVa5tixRooHvQKSMBpp1L
         SUUvZCRP7Hv0jSvLRY6ACrOAMViraqyrB9PFOhTcm3Fc0XNXap4OgPpUJ0VqrAoKERQh
         wRag6iSijqxEVNmJl12FQlydJ2Dy8okLC8kdSPrzBau1ef0wM2IBfoEPfKCohVU+jb+o
         8ZNqhBguKQPCbYEAfqbi7WWz766khXn0A0DR0k0NoJ/BseSnm5bphgCjy0d8UyetMc82
         /aDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4uAqE+q2UzPII5vnt4wx5yy+f2NRVPMEBmYSwydEl30=;
        fh=G+3/IsV8lCHLoOUPlRTaYMp0sjMqexWWT1mR230oXrA=;
        b=NtaNR6gOpEralWao//3IwoEivZc1uSzcNNXHmcyiR0czWXQO4ejLph4wyxEOIrvaI0
         EsSfAs5/DhNDfXCuXBBphlvIwdFT7lk8uDUvS5O+NPXIAa0mFFkZHtLjFabooMcTTYQN
         CQvbK422+4iB04gPH6fg2hARQdeLYTBHkETT7iJoC5FtSGGgTpRNepLtDra+b8AkLyRj
         HWdlyPwuOquE9yyHMur/vRu+TEdpxS419MawqoY9n/P2+kRaNT/l6gsbKAa+BcrrJ5f/
         d8JtNAB15FAOnRQz8oVPzV0Xi38Gn0dBzg6AqWfXyT8ZEItkxxt1KFQAi4LuBEoEE7gV
         4JSw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778807304; x=1779412104; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4uAqE+q2UzPII5vnt4wx5yy+f2NRVPMEBmYSwydEl30=;
        b=pOGATvK4a5x9AzjJ6lwtySf+D2p5ZQ3igiIQ/u5fZN1ZBSu/hJhKDFLaISQDSEd5cQ
         /IvDCPoLhP/G97Qx22JKWi55v6+BFUrelrhQgyCyd9y9GSloMU63LMHtOVV20hYjjTzQ
         1s5s2XzCNxLbwb1H5aAHz7UYc3dDW1TcBp/vvJgIUw8j7T1C5CsXPR7xs/yJi4DDWSDz
         mRgbg6FhyUZU0mnKJnkxxjOQQOUzNb3hKXSOIZB39V4DRcb8bv/4BmXjL7Awz/+2j3t2
         TfrEuB8ChZqZCYVIm2KKPppSxftCi/cnf9jYwSOjKQKIuBH5AOWuTZ3uP/c3l0bDAEdP
         26Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778807304; x=1779412104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4uAqE+q2UzPII5vnt4wx5yy+f2NRVPMEBmYSwydEl30=;
        b=RTH0cVgps8aiOf1JRaWKgvSEvNeogADRIFQ8c8gKZAzxr09dqCUhHbjA5OxjsXhhdV
         DfLZfrx3xTKUGdBKBqCPnZiKGzfXcCqlFlbs70RwEQrAxF/yq1X4evhpRv7LcbLmy/Rg
         wxy/BYdNtAChyy4XcMeyT3UCf7SKnTZIOsja3Gs0pEsC3gq1xbH96X862ebQqUwOf4bb
         OWaOZxwfNg1i5l3oxX5Xr3hbWy2HklioEEmgqd8VMoqSY2+Yb7NNV3kmsLxBwR/IIAnP
         hxNYi9jG0DSGawwZ9LILRVVfduK1G06JICmpnyVdFcEUgRq7vvSxIuZEBFcZrdvE1MoO
         sbFQ==
X-Forwarded-Encrypted: i=1; AFNElJ+GBMoDKnFGok8tckjiZ7V+Wz4uKwkP8igobTtMCmdzVvs7ys8LX15qARr5/TMp1etyu6UMQ9E=@lists.infradead.org
X-Gm-Message-State: AOJu0YzdPFRDLWvPRowTwD5rRUYpnk/UCTKfYTVZvOwQHW9gml3Y68fC
	poAVCxd/McrO9vwRfe7vkAefkNT8IRIhLHFn6MxUuH8Z3EUZDdrGAQRExzUYUNXAiUX27THVAFT
	9wUHEKa9f1GN9MdVmMm28yh6fw2wZpqs=
X-Gm-Gg: Acq92OGGGxnT0HT3lyf9JcjUW38qt8bSprkEdToSO3oqyNU9sdTc/N3ohNyLsy9ILvu
	eFN9Rr4CwtNGFA0QlrsTTHkXWP3tK/c6d+sOEyke6tstJxH5yWgq/7w7ovS1LE555TTvDfr0rlC
	UlXDEP0HQ9T44W1BIU4Xbf3SguvsbuYjN7mFFiGq6kBXoUhbnxc1Gdng0lV0y1bfHrmKqqICg5t
	3B3iGaqaHenuZJ1+dUHVmW+NmyI6P9r4X2rIgmNDU35UcbHGec0pP5MJIdgEIeO4wyU2DfAedMJ
	F8ad9GpWhCROzJ4Evc1AO5yctocDzVYQxOdzCJ+Ni8VgHCuj4w==
X-Received: by 2002:a05:6820:2982:b0:67e:160c:36ba with SMTP id
 006d021491bc7-69c9bfb1664mr1186419eaf.48.1778807304424; Thu, 14 May 2026
 18:08:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260513-kfarnung-ath11k-srng-clear-pointer-state-v1-1-bc700dd8b333@gmail.com>
 <ddd1601d-2eef-4a52-af16-594223449c8c@oss.qualcomm.com>
In-Reply-To: <ddd1601d-2eef-4a52-af16-594223449c8c@oss.qualcomm.com>
From: Kyle Farnung <kfarnung@gmail.com>
Date: Thu, 14 May 2026 18:08:12 -0700
X-Gm-Features: AVHnY4Lvlc5Ig89TV5C-ke-68Gt-iwIwGCcyok9295LT1kww5dL6ntxLMQaGick
Message-ID: <CAOPSVF3RgoV0e2EGbpy8t36mPKnn95_KWGt4_xSL7B9m6pv_RQ@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath11k: clear shared SRNG pointer state on restart
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Muhammad Usama Anjum <usama.anjum@arm.com>, 
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org, 
	santiagorr@riseup.net, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_180825_788821_F50F561B 
X-CRM114-Status: GOOD (  31.74  )
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

On Thu, May 14, 2026 at 8:16=E2=80=AFAM Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
>
> On 5/13/2026 9:52 PM, Kyle Farnung via B4 Relay wrote:
> > From: Kyle Farnung <kfarnung@gmail.com>
> >
> > LMAC rings reuse the shared rdp/wrp pointer buffers without going
> > through the normal SRNG hw-init path that zeros non-LMAC ring
> > pointers. After restart, ath11k_hal_srng_clear() can therefore hand
> > stale hp/tp state from the previous firmware instance back to the new
> > one.
> >
> > Clear the shared pointer buffers while keeping the allocations in
> > place so restart still avoids reallocating SRNG DMA memory, but starts
> > with fresh ring-pointer state.
> >
> > Fixes: 32be3ca4cf78b ("wifi: ath11k: HAL SRNG: don't deinitialize and r=
e-initialize again")
> > Cc: stable@vger.kernel.org
> > Link: https://lore.kernel.org/all/CAOPSVF04q6uvVdq8GTRLHBrVMdpt9=3Do9wV=
cFMc6f-yhmSBcZqQ@mail.gmail.com/
>
> I'm going to change this to a Closes: tag in my pending branch

Thanks, that all makes sense.

I'm still running the fix locally and haven't seen the issue again after 9
suspend/resume cycles.

>
> > Signed-off-by: Kyle Farnung <kfarnung@gmail.com>
> > ---
> > This patch is the result of investigating suspend/resume failures on a
> > Lenovo ThinkPad P14s Gen 5 AMD with ath11k.
> >
> > I originally proposed extending the existing ath11k PM quirk for this
> > platform, but after discussion in [1] and bisection the issue appears t=
o
> > be a regression introduced by [2]. There is also a parallel report in [=
3]
> > that appears consistent with the same root cause. This patch keeps the
> > intended no-reallocation behavior from that change, but clears the
> > preserved shared SRNG pointer state so restart begins from a clean stat=
e.
> >
> > Testing so far has been limited to local suspend/resume cycling on the
> > affected system. The issue was originally reproduced on v7.0.4, and the
> > patch was also built and tested on top of ath-current with repeated
> > suspend/resume cycles on a Lenovo ThinkPad P14s Gen 5 AMD.
> >
> > [1] https://lore.kernel.org/all/CAOPSVF04q6uvVdq8GTRLHBrVMdpt9=3Do9wVcF=
Mc6f-yhmSBcZqQ@mail.gmail.com/
> > [2] 32be3ca4cf78b ("wifi: ath11k: HAL SRNG: don't deinitialize and re-i=
nitialize again")
> > [3] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1132343
> > ---
> >  drivers/net/wireless/ath/ath11k/hal.c | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wirele=
ss/ath/ath11k/hal.c
> > index e821e5a62c1c0..0c0aeb803018e 100644
> > --- a/drivers/net/wireless/ath/ath11k/hal.c
> > +++ b/drivers/net/wireless/ath/ath11k/hal.c
> > @@ -1387,14 +1387,21 @@ EXPORT_SYMBOL(ath11k_hal_srng_deinit);
> >
> >  void ath11k_hal_srng_clear(struct ath11k_base *ab)
> >  {
> > -     /* No need to memset rdp and wrp memory since each individual
> > -      * segment would get cleared in ath11k_hal_srng_src_hw_init()
> > -      * and ath11k_hal_srng_dst_hw_init().
> > +     /* Preserve the shared pointer buffers, but clear the previous
>
> Since you are touching it I'm going to change this from the obsolete
> networking block comment style to the universal block comment style with
> /* on a line by itself
>
> > +      * firmware instance's hp/tp state before handing them back to FW=
.
> > +      * LMAC rings reuse this shared memory without going through the
> > +      * normal SRNG hw-init path that zeros non-LMAC ring pointers.
> >        */
> >       memset(ab->hal.srng_list, 0,
> >              sizeof(ab->hal.srng_list));
> >       memset(ab->hal.shadow_reg_addr, 0,
> >              sizeof(ab->hal.shadow_reg_addr));
> > +     if (ab->hal.rdp.vaddr)
> > +             memset(ab->hal.rdp.vaddr, 0,
> > +                    sizeof(*ab->hal.rdp.vaddr) * HAL_SRNG_RING_ID_MAX)=
;
> > +     if (ab->hal.wrp.vaddr)
> > +             memset(ab->hal.wrp.vaddr, 0,
> > +                    sizeof(*ab->hal.wrp.vaddr) * HAL_SRNG_NUM_LMAC_RIN=
GS);
> >       ab->hal.avail_blk_resource =3D 0;
> >       ab->hal.current_blk_index =3D 0;
> >       ab->hal.num_shadow_reg_configured =3D 0;
> >
> > ---
> > base-commit: 54a5b38e4396530e5b2f12b54d3844e860ab6784
> > change-id: 20260513-kfarnung-ath11k-srng-clear-pointer-state-91d8ab07e5=
e2
> >
> > Best regards,
>

