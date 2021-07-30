Return-Path: <SRS0=zwws=MW=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B45EFC4338F
	for <ath11k@archiver.kernel.org>; Fri, 30 Jul 2021 20:08:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 714FB60F42
	for <ath11k@archiver.kernel.org>; Fri, 30 Jul 2021 20:08:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 714FB60F42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=technolu.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QAR0hNhAbOz+QHLzh+6TL6UBaay/iif1EdfKE/bAmaI=; b=pEqnMeb07HCr3S
	TqfVWvCY1tUZOiXGtTTbxMdeZ9lkouzf7Vb+B3sIU9L+1/FWBIrwFDIkxZHNex9eh56W5u6IyqL1j
	oupdMlUy+gqYvrhp/XxDvbWV8JNUbie9K/UrazP8fTEyALZlYTnzZ9FxyTnHbd4BIAIgbOqKP3sIb
	8Um4Pheg/+pwpq5nnozuj1lCOrFWWUqspL7aGS2DP32zwXGbTSp/gzgFrKNvKfo6aQszxMlTjj7fm
	81GcJM218ZVWemcHlSfaA43ATroNO1Ny+zlEVl2NDncwrzEoCNqYfmMsACSuK+S5LQqUy7yRPGugy
	KHke+aL0ERc1c7UaZCdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9Yo6-00ADDJ-L6; Fri, 30 Jul 2021 20:08:34 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9Yo3-00ADCy-3z
 for ath11k@lists.infradead.org; Fri, 30 Jul 2021 20:08:32 +0000
Received: by mail-ed1-x536.google.com with SMTP id b7so14825608edu.3
 for <ath11k@lists.infradead.org>; Fri, 30 Jul 2021 13:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=technolu-st.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=033q29n+e1scDqUDDXqIPUe2GnAaxnrAJGNd5AizKNY=;
 b=yT1B6txc6fYjlFcAsCyWTkMvS0AlI1HeN7hO0grwW0ndZqxdx/El3p/WZk1NPQ14v7
 4wpRj8X3hTkrMCXhVCim9ON01vO8VoMK6nJkMuWahqR4SURS/AqTgJvGmN2e6NBqnO/t
 PySEyssWXHpUB1K8VI9NosN0Qhsm49dAaDvw8bGw35EpV68hOsRiyEFWhh9xp/SXtE64
 DZ+tdr6MzqW9d12MVL5bDNpMZK8RAKEre1sYGzXGUWfpAZi1QMb6SbS+YuUe3XkgZR+B
 gVis92qk8ZjCpFi/FBEEQgW62qVXNHft8/jwwnhFt+aCHstmvS1S8bFMcMGn8rTdfspC
 s1vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=033q29n+e1scDqUDDXqIPUe2GnAaxnrAJGNd5AizKNY=;
 b=aVlNX3/kaLyH9XpwXE54pykuFAv3ZR5Ds5h5caOTEtAHgqL0XB8U7suwjJLAMTEALN
 b+5qY3lE9PTfB17IfvMvZoHm0P6cBFjzAPTbTLZArqsf/c+QtJZo/ZI4voxg3rhMO84O
 j6SpfsO2dQPOUADXJdg7Ot6MtmmG5pGR1RnZsZPniicHKA7kwKs//3K1vUbMkvVos6hT
 DldwUvOXZQ1Z95SnJTH4KJVRQtJGXf+HSSEpdnMWfdpaV6L++cM2nYkKm5RU0rQKxl8O
 Q1gE5GvSopjkHAZIc8rb375Imxz5/8LnXJkAyfbuhvkJlaDNG4wteBn+BTTMAGkKOClk
 kdnA==
X-Gm-Message-State: AOAM530DlpBzEl6Rx9teQhB/z/iAOa39wWAsjMLdN+5qHkslrOo5fZQy
 r7aFabtOisd1xiGNAQ4363ShjhazR28htkuVO8+hhg==
X-Google-Smtp-Source: ABdhPJywOl0Dt29Q9L57jwiukUWkauLWewE/BGwwlQKXa8Ivi8LrDrHt/kSJFujkywkWGWz/X6RyvkyQYI6jTFGc9Es=
X-Received: by 2002:a05:6402:1603:: with SMTP id
 f3mr5074481edv.274.1627675708459; 
 Fri, 30 Jul 2021 13:08:28 -0700 (PDT)
MIME-Version: 1.0
References: <bP3y5saYYXBGS8eME0-maHlpNyii00kJNgq58St0q7PDo9pXsMd5zmUI-0Jou4dCD91Jf5fjwyPlQb8PaTOGvBBRu0FjYoW1XCjWpzZm-6E=@mitchellnordine.com>
 <87y29nefm7.fsf@codeaurora.org>
In-Reply-To: <87y29nefm7.fsf@codeaurora.org>
From: wi nk <wink@technolu.st>
Date: Fri, 30 Jul 2021 22:08:17 +0200
Message-ID: <CAHUdJJWAbwnjUgSXEwVCu7TL6byD26FxZyMN4ZaR4o1eHQypYA@mail.gmail.com>
Subject: Re: Have the QCA6390 patches for XPS 9310 landed yet?
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Mitchell Nordine <mail@mitchellnordine.com>, 
 "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_130831_255707_10FD1503 
X-CRM114-Status: GOOD (  20.89  )
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

On Fri, Jul 30, 2021 at 10:01 PM Kalle Valo <kvalo@codeaurora.org> wrote:
>
> Mitchell Nordine <mail@mitchellnordine.com> writes:
>
> > Hi kvalo and wink!
> >
> > It's been a while since I've had a chance to check in on this - have I
> > missed any QCA6390 progress?
> >
> > Currently the nixos-hardware repo is fixed to 5.10.18 along with most
> > of the patches on ath11k-qca6390-bringup, apart from two commits that
> > I'm sure were merged a while ago.
> >
> > https://github.com/NixOS/nixos-hardware/blob/31f61b90ddb9257b94888ee17ccf96236e180c76/dell/xps/13-9310/default.nix#L14
> >
> > Just wondering if the rest of the patches or some alternative fixes
> > have landed in a more recent version of the kernel yet, and whether
> > it's worth diving in and updating our nix expr yet?
>
> Basically all you need is a BIOS update for XPS 9310 (to get 32 MSI
> vectors working) and a recent Linux release. I don't remember the exact
> kernel release, and can't check it now, but something like v5.12 or
> v5.13 should work without extra patches.
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
>
> --
> ath11k mailing list
> ath11k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath11k


Hey Mitchell!

  Just to add a little, Dell released a BIOS update that now allows
the driver to obtain all 32 MSI vectors (I posted around the time that
happened if you need the earliest version, otherwise just grab the
latest version).  I've been running 5.12 and 5.13 without WIFI issues.
Occasionally I still have bluetooth problems and the i915 drivers are
causing video artifacts randomly, but the wireless connection seems
pretty solid at this point.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
