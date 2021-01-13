Return-Path: <SRS0=juds=GQ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B69E7C433E0
	for <ath11k@archiver.kernel.org>; Wed, 13 Jan 2021 12:02:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AF00233F7
	for <ath11k@archiver.kernel.org>; Wed, 13 Jan 2021 12:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AF00233F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=technolu.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+BJAFmz3RMPtaSF0VqOzXSggHUfikpY5FiLjSi3ajL4=; b=KnDjQEfIgmhBEDftLXJy68kWZ
	Cb7apkpwTJDLgqcv9mUGLJOQB2/0a625CO5vbFwOeIBJ9c6Jh2fS3WcENDwmNdum/e56JNHqm9/44
	l+//nmcw8XGcS2h2ytYkx0EUFphW0qSH6phrvEeuhUsciOkMVjigRBTNlmqHsy1c53eZFhOMsB9fr
	fWRBmzA0KAOcWUlH6CuwLTFD5NXZpszBpF4V1pEvRp7OOmdH1sAtNC5B6mqOM5CpVi2NSJbHdESJL
	SesO9tWqO+XiUI3LLnpD7Hr2zXKVEBr4uefIu/BTW9QKxxUDdtxLVMCOK4ljCzRznG6wpSE9dJypk
	7yBY2sMXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzerI-0008La-Uo; Wed, 13 Jan 2021 12:02:40 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzerD-0008Jd-CV
 for ath11k@lists.infradead.org; Wed, 13 Jan 2021 12:02:39 +0000
Received: by mail-ej1-x635.google.com with SMTP id g12so2674036ejf.8
 for <ath11k@lists.infradead.org>; Wed, 13 Jan 2021 04:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=technolu-st.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w2rm7GtPy68gGZZXhSbp+P1mrkX0O+XQB+xUWq6JHp0=;
 b=lqunWyrRuGH6ONVMjH8MppKcTUy8+y8UlZoc/IiyhfYdSwOdJQzqPSaRxVumY9I54q
 Cbuo3aSwNuODfg86SOci6lU/jZEr52EpeWezhPR72UXOLNw6mBnzwnfOszOkYjGtLaY6
 DzUbE0I7NJCIveLExMO2IOP3l9SDkU+utF0KQSczyRj4zuGGL8VWRK4TnozYPs/+u6rc
 VrqPCgDXqMjWM9HcSUXcR3jPiTVxfZ/9jOajFagZ0+VvTGowmsofHH5zL9Isfnyvzywk
 MZZBTbZGi/zVHkyFQjUQM+w7CtkgLgOELih/ujsKWfq8jtQ3onqHbQM4TgLf4mM8mVhz
 S48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w2rm7GtPy68gGZZXhSbp+P1mrkX0O+XQB+xUWq6JHp0=;
 b=qj9RbhEDUNPm7kKOfrujY0p8RBkid9nxIeu20gRYVNpgsa/VmdU74v3Xaw0xQVWoxZ
 F6EkEQ1j8vUUJ/IJQH65HWS6yvywh9HYaAXxAWVt214uU+5XXCUVa6bc1+d0qWzQ5Ub7
 uUsQuQxvMoSV4GqRL4NqBLHJLFAGQ8atFORTyzC6gv3AhbucIlgCqA1ofnwtlT0MDxhB
 xpyIjBIiFIACWHGJnBm/tg6MB6R/GAPRSfoKD0rQkj598JgkZ9urC4t0KWR7QHVjSyqa
 dCtHW+JrWbrejYwcNcRARLQGgG+keSG9NkrnaM5DH1ecZNaT4mgPOR7CBTrd8WIMOmu+
 Ow1A==
X-Gm-Message-State: AOAM531oHLK0Z7xkz8ogDVxqUyDO9PkQSCiZRDKv5s4CJQrz0dn3nIft
 NEzXb5Mw1K+ONnjInvQ0TKE03hhHfQrBBnXtEEh+9s+RJ3YXCcUY
X-Google-Smtp-Source: ABdhPJzXzhMBQzc6gJ3bmtWDi1escnob2nz4Ht/jt6A0T9AzK6FbUZ4lyxLgLFgTZmFppSATfQFj0SlCRMUiwAqjqxo=
X-Received: by 2002:a17:906:a04e:: with SMTP id
 bg14mr1262271ejb.149.1610539353785; 
 Wed, 13 Jan 2021 04:02:33 -0800 (PST)
MIME-Version: 1.0
References: <tQQZLjnfaM2XZ-LdgoSYE_9yQQmGCtzT108xBh-SzpRhHN7o6_w_jdIcfp67hVNe-kkiNC72u_rhyo1AtUw-41nvcCo_K3pUhkR__6VF6ig=@mitchellnordine.com>
 <87mtydwy7v.fsf@codeaurora.org> <87h7nli16d.fsf@codeaurora.org>
 <CAHUdJJWpHWznHOhdtuRjbH2tr9F5kagGUbNsFO_f7MfY=w_3Gg@mail.gmail.com>
 <878s8xhx1s.fsf@codeaurora.org>
In-Reply-To: <878s8xhx1s.fsf@codeaurora.org>
From: wi nk <wink@technolu.st>
Date: Wed, 13 Jan 2021 13:02:22 +0100
Message-ID: <CAHUdJJVk3jDY9FGjPTuDTF2+QK+B8f8s6ZqMA+8uH-7Yd==Mmw@mail.gmail.com>
Subject: Re: Ordering Dell XPS 13 9310 to test QCA6390
To: Kalle Valo <kvalo@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_070235_567406_51AC2336 
X-CRM114-Status: GOOD (  17.60  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
 Mitchell Nordine <mail@mitchellnordine.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Wed, Jan 13, 2021 at 12:54 PM Kalle Valo <kvalo@codeaurora.org> wrote:
>
> wi nk <wink@technolu.st> writes:
>
> >> I got the XPS 13 9310 now and it indeed had AX500. But it also has an
> >> updated BIOS:
> >>
> >> [    0.000000] DMI: Dell Inc. XPS 13 9310/0MRT12, BIOS 1.1.4 11/23/2020
> >>
> >> And with that I can get 32 MSI vectors:
> >>
> >> [    2.758219] ath11k_pci 0000:56:00.0: WARNING: ath11k PCI support is experimental!
> >> [ 2.758778] ath11k_pci 0000:56:00.0: BAR 0: assigned [mem
> >> 0x8c300000-0x8c3fffff 64bit]
> >> [    2.758797] ath11k_pci 0000:56:00.0: enabling device (0000 -> 0002)
> >> [    2.759086] ath11k_pci 0000:56:00.0: MSI vectors: 32
> >> [    3.208447] ath11k_pci 0000:56:00.0: qmi req mem_seg[0] 0x3f000000 3522560 1
> >> [    3.208449] ath11k_pci 0000:56:00.0: qmi req mem_seg[1] 0x3f500000 884736 4
> >> [ 3.215355] ath11k_pci 0000:56:00.0: chip_id 0x0 chip_family 0xb
> >> board_id 0xff soc_id 0xffffffff
> >> [ 3.215358] ath11k_pci 0000:56:00.0: fw_version 0x101c06cc
> >> fw_build_timestamp 2020-06-24 19:50 fw_build_id
> >
> >   I did see the updated BIOS from a few weeks ago, but I've been a
> > little hesitant to update since I wasn't sure what would happen or if
> > I could downgrade.
>
> Makes sense, better to be careful.
>
> > So to confirm, the new BIOS is allowing the driver to obtain all 32
> > msi vectors removing the need for the single MSI patching? Does the
> > MHI / M2 behavior also change to work properly?
>
> I have not tested these yet as I only did a quick 10 minute test. I was
> offline over two weeks so I have a lot of catching up to do, but will
> get back to you in next few days on these. My plan is to also test this
> new BIOS with the official 5.10 release from Linus (tag v5.10).
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

Awesome, let me know how it goes.  I've got the 9310 branch running
5.10.2 with no issues (16 days uptime) so I wouldn't expect you to see
anything super new there, good luck :D.

ps - Happy new year

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
