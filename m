Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1938C04FFE
	for <ath11k@archiver.kernel.org>; Mon, 20 May 2024 10:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XatewDtRXNhmrlw8ampmdj1H5rkdliu36jgTcdQZkyg=; b=OAx+543log/vcNwp52i0y7pN1g
	+pbb8q1eLKS08zBl8/PnJgn+dgzm9vu12J7wxMqMCDt/1M1aEuWLT21obxNkjgUewV7QzgccMNYLQ
	aKB0MAZydAaIniPhMjkOGip5mx+zlxhA+dvGJRmilM1Wq5Q3Azsvi3YmL8XDFVeKqbCUaEf9h/0eH
	puf3689LG23RjabHpVgjaKuS0fBHluw7QswGs0kSVD2J5rsjNk0H15YbHNJE9yu+yIebUAVOFw6Mi
	hIUHqRo/QrwMG8M5AgY4AnUqT54mTEexdA9fF9QjsSw9NkhgFEvgqHziOigmM4KVED25Eyx3OTkl/
	E6erJTDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s909Z-0000000E7m8-1eeW;
	Mon, 20 May 2024 10:22:01 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s909V-0000000E7l6-2AZn
	for ath11k@lists.infradead.org;
	Mon, 20 May 2024 10:21:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 986B8CE0A15;
	Mon, 20 May 2024 10:21:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01BC7C2BD10;
	Mon, 20 May 2024 10:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716200513;
	bh=zC2W6mNzaliKrFGzIrSsedKoIL831idJS2uOmR58INg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=q8ou7dxbY4z1Dcsg4w5X77GdiJxlKOKgUFkIhVB6PEowwmY/oH6vBaKbdLrlEccdm
	 pdlrRJsiDvIWM2yqzHJo9J2uNNnOac5NMukh3+CZpNJUmo2RR6RVg8hRwpv+zqveBC
	 0QfN5qfE1PC63AGMvDfIobM6E3EkcTvelUzhh8481qGGrSGQPw4pzF4aUAyGjYy1Mq
	 tQqcVoWtNZIK5PlCFg/hsocy5lzz2xf+8d5acqpZdo96TXIqf9siQAKKNoCE/KZQwp
	 S7gGqnfp39Bjpr85SVnl3DoV2Ko57ZEZbZygYwTE9YXfxNcH9J5r4prvFJIj/wMegE
	 0/SMa3WLoiQqw==
From: Kalle Valo <kvalo@kernel.org>
To: Matthew Schwartz <njtransit215@gmail.com>
Cc: ath11k@lists.infradead.org,  cristian.ciocaltea@collabora.com
Subject: Re: question regarding qca2066 and qca206x (Steam Deck
 OLED/Galileo) on upstream kernels
References: <CAFKu21ZKtKmf4Cze9JCRk750reKXxz+gMs+V1Dr8kUm-J1WWPg@mail.gmail.com>
Date: Mon, 20 May 2024 13:21:50 +0300
In-Reply-To: <CAFKu21ZKtKmf4Cze9JCRk750reKXxz+gMs+V1Dr8kUm-J1WWPg@mail.gmail.com>
	(Matthew Schwartz's message of "Sun, 19 May 2024 15:14:44 -0700")
Message-ID: <87le44eqbl.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_032157_959490_2C04950B 
X-CRM114-Status: GOOD (  32.68  )
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

Matthew Schwartz <njtransit215@gmail.com> writes:

> Hello,
>
> I've been tinkering with my Steam Deck OLED (Galileo revision) quite a
> bit since release, and I think I am finally running into some trouble
> that I am unable to resolve regarding the use of the Galileo's
> ath11k/qca2066 driver alongside other devices on an upstream Linux
> kernel, specifically Linux 6.9.0 and later.
>
> When I try to use the upstream ath11k driver with my OLED Deck, it
> ends up failing a direct firmware load for ath11k/QCA2066/amss.bin.
> The upstream driver has never worked (to the best of my knowledge at
> least), so that is not a regression. I've attached the dmesg from this
> failure just as a reference. We used to get around this on kernels 6.6
> -> 6.8 by adding in a separate QCA206X entry via kernel patch:
> https://github.com/Nobara-Project/rpm-sources/blob/main/baseos/kernel/6.8.7/steamdeck-oled-wifi.patch

Ok, so that patch seems to add QCA2066 hw2.1 and WMI_COEX_CONFIG_CMDID
support, but it also does some smaller changes like static_window_map
and hacks. Unfortunately there's no Signed-off-by which makes it
difficult to get that code to Linux.

We already have QCA2066 hw2.1 support in upstream so that part of the
patch should not be needed anymore. WMI_COEX_CONFIG_CMDID is not
supported in upstream yet but that should not matter for initial
bringup. I would assume you need it later once you start using Wi-Fi and
BT together and want to optimise them working together.

> along with the firmware from
> https://steamdeck-packages.steamos.cloud/archlinux-mirror/jupiter-main/os/x86_64/linux-firmware-neptune-jupiter.20231113.1-1-any.pkg.tar.zst

Our recommendation is to use the firmware from our repositories as there
are no guarentees that other firmware releases work with kernel.org
driver. So try to use this one:

https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware

The board file handling might be a challenge though as I don't know if
we have the board file for Steam Deck in our board-2.bin, most likely
not.

> but I have not been able to rebase this onto Kernel 6.9 without a host
> of compile failures in ath11k, which are unfortunately a bit beyond my
> own knowledge level.
>
> The only way I've managed to get wifi working on the kernel has been
> to use this one commit from Valve
> https://gitlab.com/evlaV/linux-integration/-/commit/15dc5e42cac7240104b42443df8f4091721da5b1,

Ok, so this just modifies the firmware location from QCA2066 to QCA206X.
You could do same by just having a symlink in /lib/firmware/ath11k/.

> along with the QCA206X firmware folder on top of upstream Linux 6.9.0.
> Please correct me if I'm wrong here, but this is marked as
> [NOT-FOR-UPSTREAM] because it will break devices using the proper
> upstream ath11k firmware, right? Do you know if a solution is being
> worked on to fix the upstream drivers for compatibility with the
> Galileo specific hardware chip, or is this workaround going to be the
> only way to get working wifi on new kernel releases?

For me a major problem here is that there are several hacks and another
firmware release used. My recommendation is to take a step back and do
one thing at a time, for example something like this:

1. Install linux 6.9 without any modifications.

2. Remove the old ath11k firmware.

3. Install new firmware from
   https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware

4. Most likely our ath11k-firmware does not contain the correct board
   file so that might need to be copied from the old firmware package.

With good luck you will get the driver initialised so that you can run
'ip link set wlan0 up' and then 'iw wlan0 scan'. If not, please report
back.

Please also read our instructions what to include in bug reports:

https://wireless.wiki.kernel.org/en/users/drivers/ath11k/bugreport

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

