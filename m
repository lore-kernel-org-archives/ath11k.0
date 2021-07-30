Return-Path: <SRS0=zwws=MW=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,LOTS_OF_MONEY,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,MONEY_NOHTML,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D57ECC4338F
	for <ath11k@archiver.kernel.org>; Fri, 30 Jul 2021 21:57:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 695C26101C
	for <ath11k@archiver.kernel.org>; Fri, 30 Jul 2021 21:57:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 695C26101C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=technolu.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k4mJPSeaJUVK+zzkJZfgimEeD0+Ko4OmazkYdcqbsH0=; b=THmyYfhhUMsgdh
	qQExbtaKlLtJpZ9XskfJQ2GeW/S8LpznLCJ4tUGhqpxSBh3THs4ury0xqv+6SMoEDXL7Q27AqFYot
	p/xAce1CA0hVwTnIwM3Qj9EStL9U6I+MF6/8BccTwNEKKKCxjIRqg/+I2n90DKle6fyOjND9P7Wlb
	TPpaMYcJUhOr6MZvqjH5onMJqYXGVmXpeLl6efo2DcbWvj3QzSqorwr8LwDVq8ch/kTU0Eryn1Ji5
	277KH6mBkDJTk21hAxopVlf9ksSNqA31z2BpTA39fkz5QwYqUsDkRD1NcT8Bs7aqe3mBWIj/3x1Pm
	S78eBmnA2eWhcDc89E8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9aVY-00AM7J-UG; Fri, 30 Jul 2021 21:57:32 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9aVT-00AM4p-0e
 for ath11k@lists.infradead.org; Fri, 30 Jul 2021 21:57:28 +0000
Received: by mail-ed1-x535.google.com with SMTP id cf5so3593378edb.2
 for <ath11k@lists.infradead.org>; Fri, 30 Jul 2021 14:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=technolu-st.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EwLE2kPz3bCjyBbvwEc5gKP8rn9ppDub2QZ5srQ434k=;
 b=IoGzlVoE0ypTpR/Te4lBryO0i10Yu4VMFoJEa4/oqKfPBqq5HY8tq8erYJUQ6vM7DH
 wpQ2EF3AEtcg085ZWzLyi0h8IrQ8DOsREFHUcVXXtrUO+rhfBRV/y3ilwuguwNBRP5H+
 mvEdDbNwbOsOcutHBLwzjMN5hivhsZRU21XoXSI9XdVy7P62g2MtL3XBPksMAiGonQDL
 NYOYJygb2mSNPBlyVL1K4X+pJZpLCdN2/2pmp0toUP4uzxAttr41vYwb2W0D93ZKnec5
 XQ4lqVtTHh0Cu5sbWR0ibENctw18OMQmngw6RsENEwMqVXetOWBJGICGXTxxcrtboIlz
 gY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EwLE2kPz3bCjyBbvwEc5gKP8rn9ppDub2QZ5srQ434k=;
 b=naz4el0J0et09MODj8mMd8P0KQfaYEVlDhpYNFyQvhFhWpyFmRopCKrH6ONLlOEKHi
 e4SgwoLpBZMhbO8+IjyF3POPHpm92T2iIAJ1e4dqN4emrXeF46P7NIEp3QnQ8k/lwakf
 eNouYSJaa49nsVIs2tusW9pbdQ23hbPOECDQas12Jz+BwQ4wdwWscQgFJrx9dejNkDyI
 oTaAnjuQE66Sd/Y+1tUeqzM8jvfDyc5CjvijhXZFZevCyY7csjWFlBkpj0IWEb9fAhVw
 m8fdZOgShTm/cPC773N0MidYUHQg+Tutug0Z46M+7WiKpxZuED/fzQV+H0wGRC6AQ3BZ
 CaeA==
X-Gm-Message-State: AOAM532qiZ0SYXNJ0tw0uraaGAnbXgclAZDdYDdfo3xbGKcYHC6c/Yb7
 x/Zh7KKLzwPMaby5RG00YMVluLYw9f4DAnWaOMi7HQ==
X-Google-Smtp-Source: ABdhPJwlkVWnpuf9msVqnpCVs8fadPsl+Hh5lN8hL9Qyh8+Sy9pbXtP115LN1HF/c03CIdWkVclw2AyXsqmBZxVHIa8=
X-Received: by 2002:a05:6402:51c7:: with SMTP id
 r7mr5875190edd.150.1627682245367; 
 Fri, 30 Jul 2021 14:57:25 -0700 (PDT)
MIME-Version: 1.0
References: <bP3y5saYYXBGS8eME0-maHlpNyii00kJNgq58St0q7PDo9pXsMd5zmUI-0Jou4dCD91Jf5fjwyPlQb8PaTOGvBBRu0FjYoW1XCjWpzZm-6E=@mitchellnordine.com>
 <87y29nefm7.fsf@codeaurora.org>
 <CAHUdJJWAbwnjUgSXEwVCu7TL6byD26FxZyMN4ZaR4o1eHQypYA@mail.gmail.com>
 <bc4f75cb-89f9-fc15-b18e-2348e5d0c607@justinmp.com>
In-Reply-To: <bc4f75cb-89f9-fc15-b18e-2348e5d0c607@justinmp.com>
From: wi nk <wink@technolu.st>
Date: Fri, 30 Jul 2021 23:57:14 +0200
Message-ID: <CAHUdJJVh9v3VrsPQ6x3d4xGop=1oSmCfaVJfEJPxEwgVjcQeCQ@mail.gmail.com>
Subject: Re: Have the QCA6390 patches for XPS 9310 landed yet?
To: jmp@justinmp.com
Cc: Kalle Valo <kvalo@codeaurora.org>,
 Mitchell Nordine <mail@mitchellnordine.com>, 
 "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_145727_151485_D9617AC1 
X-CRM114-Status: GOOD (  30.31  )
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

On Fri, Jul 30, 2021 at 11:52 PM Justin Mazzola Paluska
<jmp@justinmp.com> wrote:
>
> On 7/30/21 4:08 PM, wi nk wrote:
> > On Fri, Jul 30, 2021 at 10:01 PM Kalle Valo <kvalo@codeaurora.org> wrote:
> >> Mitchell Nordine <mail@mitchellnordine.com> writes:
> >>
> >>> Hi kvalo and wink!
> >>>
> >>> It's been a while since I've had a chance to check in on this - have I
> >>> missed any QCA6390 progress?
> >>>
> >>> Currently the nixos-hardware repo is fixed to 5.10.18 along with most
> >>> of the patches on ath11k-qca6390-bringup, apart from two commits that
> >>> I'm sure were merged a while ago.
> >>>
> >>> https://github.com/NixOS/nixos-hardware/blob/31f61b90ddb9257b94888ee17ccf96236e180c76/dell/xps/13-9310/default.nix#L14
> >>>
> >>> Just wondering if the rest of the patches or some alternative fixes
> >>> have landed in a more recent version of the kernel yet, and whether
> >>> it's worth diving in and updating our nix expr yet?
> >> Basically all you need is a BIOS update for XPS 9310 (to get 32 MSI
> >> vectors working) and a recent Linux release. I don't remember the exact
> >> kernel release, and can't check it now, but something like v5.12 or
> >> v5.13 should work without extra patches.
> >>
> >> --
> >> https://patchwork.kernel.org/project/linux-wireless/list/
> >>
> >> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
> >>
> >> --
> >> ath11k mailing list
> >> ath11k@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/ath11k
> >
> > Hey Mitchell!
> >
> >    Just to add a little, Dell released a BIOS update that now allows
> > the driver to obtain all 32 MSI vectors (I posted around the time that
> > happened if you need the earliest version, otherwise just grab the
> > latest version).  I've been running 5.12 and 5.13 without WIFI issues.
> > Occasionally I still have bluetooth problems and the i915 drivers are
> > causing video artifacts randomly, but the wireless connection seems
> > pretty solid at this point.
>
> Which BIOS do you have?  I have 1.2.5.
>
> I'm currently running 5.13 with a patch that reverted
> 3579994476b65cb5e272ff0f720a1fd31322e53f.  I needed to do that or the
> 5.13 kernel wouldn't connect to my access point because the firmware
> crashed.  (I got that pointer from
> https://bugzilla.kernel.org/show_bug.cgi?id=212059.)  With 357999
> reverted, everything works well.
>
> I still have the memmap=20M$12M kernel argument set from the old qca
> bringup branch days.  Do you also use that?
>       --Justin

Interesting, I guess my AP / configuration doesn't aggravate that
issue...I also do not have to remap/reserve any memory
addresses...Everything from my side is basically off the shelf at this
point, even though the original smell of 32 vectors lingers...I will
be travelling for the first time in a while soon, I may very well bump
into this AP issue, I'll let you know...

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
