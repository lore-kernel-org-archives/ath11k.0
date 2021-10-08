Return-Path: <SRS0=PCnT=O4=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F90BC433F5
	for <ath11k@archiver.kernel.org>; Fri,  8 Oct 2021 08:14:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAFF260FE8
	for <ath11k@archiver.kernel.org>; Fri,  8 Oct 2021 08:14:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CAFF260FE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=131QLxDiGyvFPDkFLzx3UMTkyL3ipPJhAZHNgS6Or4E=; b=uEVmFokfJbEWg9
	YEiCXvy4xZtaraKmt0lHpiEvlvnl5Q01w4iZtZODhG3+fbX9ywSgA2DDRFIKiuM/6pUTb9Ji6Txtw
	naqBLnCjE3iIkA+9LYOtYBRpY7bHQwIJ4HtDReDi/y5mggsUXauDCJsRSQDo6jb9f6rGTVnOX8nkj
	f6VUIdWIozSlYnNfx0aK4PQmCoihy5YA/s0SAfcicYEbQfmd/mmaq+NSKMG3bk41MLbAQIRZDr7wW
	2azOyry/WLslfr9jbBJYnjrwwkJ98haFg0qqTLyMTX8bin0YYUka4N6TPrnqKaJeVq6iUjFCqggV1
	DZSNFfXw3L59im/gwkFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYl1c-0020LB-VF; Fri, 08 Oct 2021 08:14:40 +0000
Received: from mail-ua1-f52.google.com ([209.85.222.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYl1a-0020KX-BS
 for ath11k@lists.infradead.org; Fri, 08 Oct 2021 08:14:39 +0000
Received: by mail-ua1-f52.google.com with SMTP id y3so6194904uar.5
 for <ath11k@lists.infradead.org>; Fri, 08 Oct 2021 01:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7wO+xcQh6vNN08iok37rOCPRwho9ClVLbVfs6DvZcoU=;
 b=l9QVCIazaHYWl3CT9opTaRqmSk0QPi//eASGjko69Szt2AGtQ9PUaCV9p7wZnHwmr0
 saz2l5OA4BT1/CA9lspZphpBY/QV9VrCVZ7WhAmffHZB+Jjp3GHLiAFkSpD9miCUYgOU
 n7ynNdpw4f1KKHJ6ASX20xPECjwv+RsQ/yWbMwcF1qFX+miXImnFwUD2FcUw12Ue71Wn
 dY29kneoK4aDI0tP1anr4oSm5NBMwN1X1M4BhvIagPLiihasQXPVO7ezNK96Elv6/U5c
 k/vBKHa3whBso96s3915lRbJAFu4VAcOw3GKjPPbsmSgp6IGl6TI6QHus9EKJA1TLqhC
 h+zw==
X-Gm-Message-State: AOAM532zBNkRCFaMbnc6lFY1zot9Qk29h1juL++8jrgW3bi9uoK5lRaQ
 5t+3BD0SteTrRK80QNFOjylcAVTMg1BQFkmV5lo=
X-Google-Smtp-Source: ABdhPJxD3cm5x6NWNfsGlyqVJout9BqXENj3uvqqT6UeA6jfU03wynvPPBTZw2mQph2TScrcb7ByvBjOn/L2fjppPQ4=
X-Received: by 2002:ab0:16d4:: with SMTP id g20mr1204838uaf.114.1633680876846; 
 Fri, 08 Oct 2021 01:14:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211008162103.1921a7a7@canb.auug.org.au>
 <87tuhs5ah8.fsf@codeaurora.org>
In-Reply-To: <87tuhs5ah8.fsf@codeaurora.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 Oct 2021 10:14:25 +0200
Message-ID: <CAMuHMdUZa9o15_fGJ7Si_-bOQVcFOxtWgo_MOiKsV0FjoPeX6Q@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the net-next tree
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>,
 Networking <netdev@vger.kernel.org>, Jouni Malinen <jouni@codeaurora.org>, 
 Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 ath11k@lists.infradead.org, 
 linux-wireless <linux-wireless@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_011438_423689_2086180E 
X-CRM114-Status: GOOD (  31.87  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi Kalle,

On Fri, Oct 8, 2021 at 7:55 AM Kalle Valo <kvalo@codeaurora.org> wrote:
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
>
> > After merging the net-next tree, today's linux-next build (xtensa,
> > m68k allmodconfig) failed like this:
> >
> > In file included from <command-line>:0:0:
> > In function 'ath11k_peer_assoc_h_smps',
> >     inlined from 'ath11k_peer_assoc_prepare' at drivers/net/wireless/ath/ath11k/mac.c:2362:2:
> > include/linux/compiler_types.h:317:38: error: call to '__compiletime_assert_650' declared with attribute error: FIELD_GET: type of reg too small for mask
> >   _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
> >                                       ^
> > include/linux/compiler_types.h:298:4: note: in definition of macro '__compiletime_assert'
> >     prefix ## suffix();    \
> >     ^
> > include/linux/compiler_types.h:317:2: note: in expansion of macro '_compiletime_assert'
> >   _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
> >   ^
> > include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
> >  #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
> >                                      ^
> > include/linux/bitfield.h:52:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
> >    BUILD_BUG_ON_MSG((_mask) > (typeof(_reg))~0ull,  \
> >    ^
> > include/linux/bitfield.h:108:3: note: in expansion of macro '__BF_FIELD_CHECK'
> >    __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: "); \
> >    ^
> > drivers/net/wireless/ath/ath11k/mac.c:2079:10: note: in expansion of macro 'FIELD_GET'
> >    smps = FIELD_GET(IEEE80211_HE_6GHZ_CAP_SM_PS,
> >           ^
> >
> > Caused by commit
> >
> >   6f4d70308e5e ("ath11k: support SMPS configuration for 6 GHz")
>
> Thanks for the report, weird that I don't see it on x86. I can't look at
> this in detail now, maybe later today, but I wonder if the diff below
> fixes the issue?

It seems to be related to passing "le16_to_cpu(sta->he_6ghz_capa.capa)".
Probably typeof(le16_to_cpu(sta->he_6ghz_capa.capa)) goes berserk.
le16_to_cpu() is a complex macro on big-endian. I had expected to see
a similar issue on powerpc, but I don't.
Using an intermediate "u16 capa = le16_to_cpu(sta->he_6ghz_capa.capa)"
fixes the problem.

> At least it's cleaner than using FIELD_GET(), actually ath11k should be
> cleaned up to use xx_get_bits() all over.
>
> Kalle
>
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index d897020dd52d..3e7e569f284b 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -2076,8 +2076,8 @@ static void ath11k_peer_assoc_h_smps(struct ieee80211_sta *sta,
>                 smps = ht_cap->cap & IEEE80211_HT_CAP_SM_PS;
>                 smps >>= IEEE80211_HT_CAP_SM_PS_SHIFT;
>         } else {
> -               smps = FIELD_GET(IEEE80211_HE_6GHZ_CAP_SM_PS,
> -                                le16_to_cpu(sta->he_6ghz_capa.capa));
> +               smps = le16_get_bits(sta->he_6ghz_capa.capa,
> +                                    IEEE80211_HE_6GHZ_CAP_SM_PS);
>         }

Thanks, that works, too, so (compile)
Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
