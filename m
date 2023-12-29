Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68468C47073
	for <ath11k@archiver.kernel.org>; Fri, 29 Dec 2023 17:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hba9+v2e5Ip+utOTf8qoUw5D916pCyMx3vgd/QN+zDM=; b=UWg4CC3JHMqFMkF1H+t9qU5k9K
	/3PGXEnWaw9/SH21B3+o4p5sAfLHiQT4e68ToeaRP1EPbLWQoHfF04RafyAIHfomE+AB1wuWPtfzX
	pllqwTToqoW0dNCsGv8C6yWaLtDPQC1GmzmbNqzqN2kPsY7lVwf+cZDxATknJ4ritiQsWLytVIlXs
	h95Ul/cEhEukCkkV36f9xdMi9lLYEEr3wAK1biG8vh8WfzB/UFUWRqFg7WtHfKtH8nYO+9liypndX
	w0wlI7+ju2/XnaLioYZCS64U+wF9c6WNbTsxGQ0QJAVQkGiSkYCrR7aoQLWhb4fxsG0O/uJAe199B
	SQuY8RPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJGp7-001GJi-2M;
	Fri, 29 Dec 2023 17:39:05 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJGp5-001GJJ-0T
	for ath11k@lists.infradead.org;
	Fri, 29 Dec 2023 17:39:04 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5553cc31f1cso4752793a12.1
        for <ath11k@lists.infradead.org>; Fri, 29 Dec 2023 09:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703871541; x=1704476341; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hba9+v2e5Ip+utOTf8qoUw5D916pCyMx3vgd/QN+zDM=;
        b=TObrbOuB3i4n+8KZDgGp87YSDpu+2+KNviHrjwtf2rspgAUiCHdOhhYmMwRwPBaNgF
         kFpSrbOEMoEY45m+dhZs2hm6xTkOhLROpmYljhH+eaYYOItTqZjKbL+iO13OyUCymW0j
         fHljsepiCJjPlafgSn+BakLbO8nadtXN3+fH2QWuuIObFu9TDV4o3WNZPJcKDOkEEJDA
         P6k+tsAhuaZG5qNqBset3xuXSVeKBmIdVqCvhYjX2ipiopw0YNF7Y9gv3N4/XpwjpaFN
         Acfu/FigGysxPa9REU64zVHmHAZcIbGBJHLaf8L8HN641qui/58OiDPThU/80hIhdtiJ
         QVEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703871541; x=1704476341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hba9+v2e5Ip+utOTf8qoUw5D916pCyMx3vgd/QN+zDM=;
        b=NrK8x9xu3KtdeXJJQrsZ4wrwGcDDl36tSWcxaNWfRLk7VimFlkfXJNNbcI+8asAo4d
         h2RInJ2Ig/ngTFmFtD6FkEXxbbGch/L+8/8ADKPaTlZdk7fQTXI1fK8VvRVe3Umk/dFl
         nRRCuLM/NU4xAa7ZezcPK3fuh9+qtg54yNicFsuehQKlvdyBiZfl0ATpHVR71WRv9ejy
         nmA2LcfBWUq06cg5SFyvAN0PoZ+iEvnqdb7wZZeHDVgEDJCq7/hOBwhSeTuSuEq9xk8U
         Ik8JezHzeEF3Iy5pTFgCl5Tuh1Q1UfzHai7SE9oFQs5FQvSGLxNbu/2e1W48uzyamN8V
         JJIQ==
X-Gm-Message-State: AOJu0YzR+DghoCOo06nHagkezbArarPkkrchdR077sMDW5UL1NpMwkD6
	CgDr8z+tFfEdZ3xdxdx08T0ed1cvgqbtsO1QEFI=
X-Google-Smtp-Source: AGHT+IFXPj4BjqfD+PWHPrHkyhzX9OoSyAe6BUY2UetjmEQep5DdtGQrMFRQjhHKTztkQO/e0XnheCs5C5LkX18RbcY=
X-Received: by 2002:a17:906:9ac9:b0:a26:f2d9:d284 with SMTP id
 ah9-20020a1709069ac900b00a26f2d9d284mr6245346ejc.23.1703871541264; Fri, 29
 Dec 2023 09:39:01 -0800 (PST)
MIME-Version: 1.0
References: <CADS+iDVE8GB_+H+1DAPwcwdpjddUqzsvRmnygtXv7yUxRwLTZQ@mail.gmail.com>
 <87a5qeof5m.fsf@kernel.org> <CADS+iDXNkGWba7cM31CNTeaAJFdr48Zi8HGtYKQutYWiKnxjdA@mail.gmail.com>
 <87o7esn7j2.fsf@kernel.org> <CADS+iDV5eGc6RpWpzPMyO83xmiV1GgbZfqgeLnAukVaPv3BnJw@mail.gmail.com>
 <CADS+iDX1aU9h_OuR3K+r6hTX+zUrCyN0sG4uzyKm9+tThS9LZw@mail.gmail.com>
 <CADS+iDXMTRYN86PMuGRBcHtPB-hsax_X_XUAPajXsUYTRnwk-A@mail.gmail.com>
 <CADS+iDX2c17iaoXkNDbPxYr3FMwQHZDbEfkuycR52vo0hLy1hQ@mail.gmail.com> <c5d1124b-ad4a-b5f0-db29-7050f1f04bb1@candelatech.com>
In-Reply-To: <c5d1124b-ad4a-b5f0-db29-7050f1f04bb1@candelatech.com>
From: Yaroslav Isakov <yaroslav.isakov@gmail.com>
Date: Fri, 29 Dec 2023 18:38:50 +0100
Message-ID: <CADS+iDV276z5CHcnPVf5A0dUZtKStW6M1zEe6H44nOz0hn6crg@mail.gmail.com>
Subject: Re: wcn6855 - stuck in 20Mhz on rx, but full 80mhz on tx
To: Ben Greear <greearb@candelatech.com>
Cc: ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231229_093903_210210_F88C7D0D 
X-CRM114-Status: GOOD (  14.95  )
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

=D0=BF=D1=82, 29 =D0=B4=D0=B5=D0=BA. 2023=E2=80=AF=D0=B3. =D0=B2 18:20, Ben=
 Greear <greearb@candelatech.com>:
>
> On 12/29/23 9:06 AM, Yaroslav Isakov wrote:
> > =D0=BF=D1=82, 29 =D0=B4=D0=B5=D0=BA. 2023=E2=80=AF=D0=B3. =D0=B2 17:46,=
 Yaroslav Isakov <yaroslav.isakov@gmail.com>:
> >>
> >> Hello! I managed to get another router, Asus TUF-AX6000 (with openwrt,
> >> too), and on this one, there is the same problem with rx
> >> bitrate/channel width display, in AC mode.
> >
> > Looks like the issue was with GCMP-256 cipher. I changed all ciphers
> > to the AC ones (CCMP+BIP), and now upload and download speeds are
> > around 1gigabit. I'll try different ones, to see if there is issue
> > with only one, or with all modern ciphers.
> >
>
> The linux kernel's software decrypt performs poorly, partially due to
> the crypto folks' refusal to add in the aesni crypto accelerator logic.
>
> Thanks,
> Ben
>
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
>
I thought, all such ciphers are implemented in hardware? I tried to
load ath11k with crypto_mode=3D1, to see, if it will make any difference
- and yes, it made - download speed becomes even lower.

I've tried different pairwise_cipher options, and the only one giving
me expected speed was CCMP (not even CCMP-256). mgmt_group_cipher
makes no difference, so, I can set BIP-GMAC-256, and if
pairwise_cipher is CCMP, I'm getting 1+ gbit.

