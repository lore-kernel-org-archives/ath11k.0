Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6542C433EF
	for <ath11k@archiver.kernel.org>; Thu, 27 Jan 2022 12:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8+KbZBV63bXaPsbr2oPxvv/TXE2vneD18qmg5ar7EAQ=; b=J2rBrGQYjFsHW1
	e1TAN6T9wdqqJ4bgns2eFJN2TwdYwj61+h70EYF7Vb/T6GbX0WIv5PZe/JEX8NFQ8qWhQYRc9zL6u
	hBZZTItcyO1ZeNk4bAjQF54CISyQv+JTs3OmxqbXspG3k0uHZvdex39TVxR539ZmmhcBcx/D6obeK
	XY+JH1qc6oC1/l1A/jm6o1UhWsuNf7uDL5upLUAYRb1PgcZfijXSZC4MgUwPahxzDSv9p1hc3xwcA
	/bslw3R1WmeQIK2pQ5dAwG96go41JXHsgu/S19SWUwUTxNNz8m0ucjO8vRt+P6wXf8VIpBpVbPfff
	Hw1vqT9ArvvBidAiW3ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD3v5-00Fi70-Ks; Thu, 27 Jan 2022 12:30:31 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD3ud-00Fhw9-V7
 for ath11k@lists.infradead.org; Thu, 27 Jan 2022 12:30:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 909FCB821EE;
 Thu, 27 Jan 2022 12:30:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFFE7C340E9;
 Thu, 27 Jan 2022 12:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643286601;
 bh=c8Q6vl6mVhC9lR0gqmUrp2kOdDMx017vcu6cmewFmJ0=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=TF7VxyLCA/m0YTgAhxkA9aijiLSYNEEDb0XTDvwmk9zskxfVjOSCAM8JrP//jteL0
 y6Gz3EvPHiFOQerFnyz057E0li2sjgu5WGKL8V6TYl9OMj8yhlt6s3BbBwjwgFxhMM
 JjpARlwWSGFw6o4C1BZ360rlaEMQKpQOQn19eNJ1z7+GsxCqKMKT5GJeJ5kdkmN+JF
 iEc+nJuli87OhLL3Yi0ea6TzDx/EjzAPJ6iZ0K0Y3DoGlMzqCgL6Z/iYiEzCF2lGcQ
 /7E3q/LpI4YkqNQkg0PmyRklorYAJhxAzztPq57zLxUrxFlEz/hRgELdWH/WbhRCkF
 0xKEtHJ2wwlCg==
From: Kalle Valo <kvalo@kernel.org>
To: Patricio Ferraggi Ares <pattferraggi@gmail.com>
Cc: ath11k@lists.infradead.org
Subject: Re: Fwd: AX500 support quirks
References: <CAGYwnb=p38NMpWY=wLiPRE7eUDfjE_SyNS9zQ9W7Nhpy6hn+WQ@mail.gmail.com>
 <CAGYwnbnBjaNmS7aaSTXKtAbF1tKqeXTT_6tjka=5AS97c7Br8Q@mail.gmail.com>
Date: Thu, 27 Jan 2022 14:29:55 +0200
In-Reply-To: <CAGYwnbnBjaNmS7aaSTXKtAbF1tKqeXTT_6tjka=5AS97c7Br8Q@mail.gmail.com>
 (Patricio Ferraggi Ares's message of "Wed, 26 Jan 2022 12:02:58
 +0100")
Message-ID: <87ilu5jr98.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_043004_345881_F0B2B0E1 
X-CRM114-Status: GOOD (  32.53  )
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

Patricio Ferraggi Ares <pattferraggi@gmail.com> writes:

> My name is Patricio, I am a fellow software developer and user of the
> Dell XPS 9310 (AX500 version). First of all, I wanted to thank you for
> all your hard work bringing support for this model, thanks to you, I
> have been able to use my laptop with Linux almost since I got it.
>
> This is not a bug report in any way, I just would like to gain some
> knowledge on the subject and you might be the perfect person for my
> questions.
>
> I noticed that although all distros use the Linux kernel, support for
> this hardware is not the same across all Linux distros. To be more
> specific, Ubuntu-based distros have had working wifi and Bluetooth for
> almost a year now, although there are some problems like resuming from
> deep sleep,  both wifi and Bluetooth work right away on installation,
> at the moment I am using Pop OS with Linux kernel 5.15.5 as my main
> driver. On the other hand, arch-based distros dont' have working BT,
> as you can see here and here. The wifi is working but Bluetooth
> sometimes doesn't turn on and when it does it cannot properly connect
> to devices. This happens across multiple arch-based distros and kernel
> versions, even if I try kernel versions that work fine in PopOS, they
> don't in Arch.
>
> So finally, my questions:
>
> Why is there this inconsistency of support between distros when
> theoretically, they are all Linux?
> Why is it that if Arch is always updated, in this particular case
> their hardware support is lacking compared to ubuntu?

This is something you need to ask Ubuntu, or check from their git
history or package changelogs. But in general distros make changes to
the kernel, some of them even quite drastic, so behaviour between
distros can be different. My guess is that Ubuntu had custom changes to
ath11k, maybe they backported patches?

> And finally, do you have a working configuration with wifi and
> Bluetooth? if that is the case could you tell me your distro, kernel,
> firmware, system firmware versions?

I also use Dell XPS 13 9310 with QCA6390 as my daily driver (no pun
intended) and I have no issues with wifi. BIOS is 3.1.0 from 07/22/2021.
I'm a debian guy so I have Debian 10 and use connman, but
network-manager should work as well. I compile my own kernel from my
ath.git master branch[1], but with QCA6390 I would expect stock v5.16
release to work fine. For WCN6855 I recommend to use v5.17.

Firmware version is WLAN.HST.1.0.1-05266-QCAHSTSWPLZ_V2_TO_X86-1.

I don't use Bluetooth so can't comment on that.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
