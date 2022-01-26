Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1393DC5DF62
	for <ath11k@archiver.kernel.org>; Wed, 26 Jan 2022 11:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/h1UBMhjdrEzC8Ozp4T2oay3Z4YEvs1OctsN8JqUYuc=; b=IhiAS57gQMWvpwrLK44FpEsstV
	tLEvSWQ05YYfei20zz5uawVJVQ1jHqLuzL63oREmynpo3LBS08IrHJwwEJl4OVpv86knRjHaL8rTE
	32IptyD18NOhNBzWeQyFNTFTjC7vlUq8vyet2kwq0fS4QPGpCBdeEon2bk9EILylCp6/YxDX8GtFQ
	DDdACa2hq4hJWuNjgcIAkDNVckoF9tAuYe8m86LrJBPD30JY5vU2DtkfUK6aYZi4LkegoIgGNNGnT
	Ww6YBhlzePLv68jlkyBEMv6yGQEhSE6C9Wkb1dg1bh0Ol8jmLBS7vjYp9sbfaIcKHkZmhz3eOC00L
	ti2KfLkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCgGM-00BQBd-8H; Wed, 26 Jan 2022 11:14:54 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCg5S-00BNnt-6v
 for ath11k@lists.infradead.org; Wed, 26 Jan 2022 11:03:39 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id g14so70104427ybs.8
 for <ath11k@lists.infradead.org>; Wed, 26 Jan 2022 03:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=wHYKFbK5Q7MLfCPJxsj4JQ8RKTu7YkEcm72TlmcK6Ro=;
 b=f/NqX/mvsWd5gDOT4nX7CCTY5dk/jBajFMOVkLH7fwpfUE/R7JVIbNxzxYI6DSEJcD
 dRmH/5NOmPlNhNGI0PKZyNMl2cznQNwPlO+Dsrq12rpnjre0gjwvhDHTqh531u26isLR
 IdBzs8JaW4HjHEhF0UtgQrh2W71vlal0lxrn86kaiDXkNI6nIJELFRaUZVK2PuPUEWsF
 V01qgdUg43p8WGTE4arg9wzSIRuLkv9qANQi7XZe3z+KiY1m7lLf8PtSDT+I5kMnsIG3
 uEmpsGKlzQE9Q5yDzfe63IIccqimsss88ThJmb7XF76ICjHnrP/QJLdVkS5cjnhsGa+1
 I7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=wHYKFbK5Q7MLfCPJxsj4JQ8RKTu7YkEcm72TlmcK6Ro=;
 b=2gP4+G8FIk428dJb7a1mzqIAji7Jx8fdCYr2YSn+8rfS5fTX8tPoln47PV0FoI2Bt6
 mWjm0VzdeRg3CO+YVg2BjAFg3HEwI8QFHjfbt6X2TNrThkBq3OTB+FOsoV9ty1SH4k1X
 xSCUJ7kS1Gdg2Xx3hFxZnMtQ/OkjDFlzRqeoBYsAxlZ75Llhn2O9rccGPdKvNUrSgnkC
 w25C7mBTfBidbArkyrja5PT5DszsbSlTLhuoclsQSnefD8SNtCmT0I84RQS9v9Ml1l5y
 9+4j686hE41k9gg4bsjVKYNbzp6ePXkz/mVcNYLzPGF3u6b1VTX3vSy97sj59mHI44AO
 YiJg==
X-Gm-Message-State: AOAM5335IuWhNezouzi20mcMmgvLTgJ/5iP7PALEl6bU9dxMFxkKESll
 N1r4HnyPj2e8MyRuiLzVL/s+3f50n+Ew6I0SQxvpO4dQcNQS5Q==
X-Google-Smtp-Source: ABdhPJwMhB217la3iTysYWQt0PIHtw/09zUbO1g54krtCSbQFXt0N94EU/YubOnDHlgqod4pDD2/nGDPjH/gp9crAC8=
X-Received: by 2002:a5b:5c5:: with SMTP id w5mr7944071ybp.7.1643195014163;
 Wed, 26 Jan 2022 03:03:34 -0800 (PST)
MIME-Version: 1.0
References: <CAGYwnb=p38NMpWY=wLiPRE7eUDfjE_SyNS9zQ9W7Nhpy6hn+WQ@mail.gmail.com>
In-Reply-To: <CAGYwnb=p38NMpWY=wLiPRE7eUDfjE_SyNS9zQ9W7Nhpy6hn+WQ@mail.gmail.com>
From: Patricio Ferraggi Ares <pattferraggi@gmail.com>
Date: Wed, 26 Jan 2022 12:02:58 +0100
Message-ID: <CAGYwnbnBjaNmS7aaSTXKtAbF1tKqeXTT_6tjka=5AS97c7Br8Q@mail.gmail.com>
Subject: Fwd: AX500 support quirks
To: ath11k@lists.infradead.org
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_030338_300310_E45DDC38 
X-CRM114-Status: GOOD (  14.60  )
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

Hi,

My name is Patricio, I am a fellow software developer and user of the
Dell XPS 9310 (AX500 version). First of all, I wanted to thank you for
all your hard work bringing support for this model, thanks to you, I
have been able to use my laptop with Linux almost since I got it.

This is not a bug report in any way, I just would like to gain some
knowledge on the subject and you might be the perfect person for my
questions.

I noticed that although all distros use the Linux kernel, support for
this hardware is not the same across all Linux distros. To be more
specific, Ubuntu-based distros have had working wifi and Bluetooth for
almost a year now, although there are some problems like resuming from
deep sleep,  both wifi and Bluetooth work right away on installation,
at the moment I am using Pop OS with Linux kernel 5.15.5 as my main
driver. On the other hand, arch-based distros dont' have working BT,
as you can see here and here. The wifi is working but Bluetooth
sometimes doesn't turn on and when it does it cannot properly connect
to devices. This happens across multiple arch-based distros and kernel
versions, even if I try kernel versions that work fine in PopOS, they
don't in Arch.

So finally, my questions:

Why is there this inconsistency of support between distros when
theoretically, they are all Linux?
Why is it that if Arch is always updated, in this particular case
their hardware support is lacking compared to ubuntu?
And finally, do you have a working configuration with wifi and
Bluetooth? if that is the case could you tell me your distro, kernel,
firmware, system firmware versions?

Sorry for the long email, I wanted to be as explicit as possible.
Have a great day.

Kind regards,
Patricio Ferraggi Ares

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
