Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AADA4C25B75
	for <ath11k@archiver.kernel.org>; Tue, 21 May 2024 11:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9c2mRCeR0sX/BSgg3opCmRnAMdCel7+WPhXtp9e2F0k=; b=qOhsBI+YT/f7n/vrwggcmcbVnI
	2xlajAhsu6G+840Uq700ZLqLngjY82ae4LPKb/R4OpQftFFcKZVHXUiYXUSHOmrkuzUvyUUHCaFUa
	AMEUR4HDzkbMndEYUkpCT/csH/oAi/WJRhI4vtde3Ac7/iRLRhB3czYoVDeiQH2Kjl4Qoekm4y7aj
	cYC+/5JAkbSsCg9qya9gaVBXdUhIwlE424+seet/m7+oOIfLjD+f6D/n3J7JwIJbuHg2pH6O8PRhe
	XBLsU40CEo17H/NI5H3YNyoRoJSsMgBSyKWSPo7QLXkAPDiHAn6hx70ibs8hzRGsGKbpmPu+8F916
	iE3uYyjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9NkX-0000000HIza-0Tsp;
	Tue, 21 May 2024 11:33:45 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9NkU-0000000HIz3-1cqk
	for ath11k@lists.infradead.org;
	Tue, 21 May 2024 11:33:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B9EEBCE0E77;
	Tue, 21 May 2024 11:33:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EFACC2BD11;
	Tue, 21 May 2024 11:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716291219;
	bh=8D/Er66icrzaGcztC3uikyl0vfzG0j1vaGuwaOxG0k0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=hp4KuaZCSLhc2TkvbAdTg4SixQFvboEFWb2Kh2QullARF6TSPXWWdTsmQqPUf1Kq2
	 RtSyuo41q3hUXdtAGfMuaB4lINWLi7dsgAhHf3agVONZhRxGTc9y2y2enA8sfW+m4P
	 f1fJ3B9E1O7HZ/34/yv0KtUpkOzGuAvCpRhjdprP0uW0CQU/yYV8x5HI/VK+9IUj5X
	 CxoUv8HLDoZotl5XAs+qXncmkEOAoMpgzyHvJDPpuDapl4DXUizPd42ZaPASfyvBww
	 ZUGFyW8h4VMo0/UdKMm7T3fwAdbdJEBMbHpa+GHSni09VbVe/ALGg/UulZXeEtVz+W
	 XmHcwFbVChByA==
From: Kalle Valo <kvalo@kernel.org>
To: Matthew Schwartz <njtransit215@gmail.com>
Cc: ath11k@lists.infradead.org,  cristian.ciocaltea@collabora.com
Subject: Re: question regarding qca2066 and qca206x (Steam Deck
 OLED/Galileo) on upstream kernels
References: <CAFKu21ZKtKmf4Cze9JCRk750reKXxz+gMs+V1Dr8kUm-J1WWPg@mail.gmail.com>
	<87le44eqbl.fsf@kernel.org>
	<CAFKu21b_4fbP3Oku_CLBOYi7wfwmYWUXoG5H1gknvFit-wc4Rw@mail.gmail.com>
Date: Tue, 21 May 2024 14:33:36 +0300
In-Reply-To: <CAFKu21b_4fbP3Oku_CLBOYi7wfwmYWUXoG5H1gknvFit-wc4Rw@mail.gmail.com>
	(Matthew Schwartz's message of "Mon, 20 May 2024 13:41:10 -0700")
Message-ID: <874jarcsbz.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_043343_093046_91D90AB7 
X-CRM114-Status: GOOD (  18.94  )
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

> On Mon, May 20, 2024 at 3:21=E2=80=AFAM Kalle Valo <kvalo@kernel.org> wro=
te:
>
>> For me a major problem here is that there are several hacks and another
>> firmware release used. My recommendation is to take a step back and do
>> one thing at a time, for example something like this:
>>
>> 1. Install linux 6.9 without any modifications.
>>
>
> Done, compiled the v6.9 release from git without any issues.
>
>> 2. Remove the old ath11k firmware.
>>
>
> Easy, I ran sudo rm -r /lib/firmware/ath11k
>
>> 3. Install new firmware from
>>    https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware
>>
>
> For this step, this was my exact process:
> copied QCA206X from my current kernel's firmware into the upstream
> ath11k firmware folder retrieved from
> https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware
> sudo cp -r /home/matt/Downloads/Warpinator/ath11k /lib/firmware/ath11k

I forgot to mention that you you need to use 'make install' to install
the firmware or run ath11k-fw-repo manually. See README for more:

https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware/-/blob/main/REA=
DME.md?ref_type=3Dheads

If you need to create symlinks or copy files manually then something is
wrong in our installation process. Please do report if you see such cases.

>> 4. Most likely our ath11k-firmware does not contain the correct board
>>    file so that might need to be copied from the old firmware package.
>>
>
> For this step, this was my exact process:
> Rebooted after 6.9 kernel install
>
> I get no wifi and this is my dmesg:
> May 20 12:49:21 steamdeck-oled kernel: mhi mhi0: Direct firmware load
> for ath11k/QCA2066/hw2.1/amss.bin failed with error -2
> May 20 12:49:21 steamdeck-oled kernel: mhi mhi0: Error loading firmware: =
-2
> May 20 12:49:21 steamdeck-oled kernel: ath11k_pci 0000:03:00.0: failed
> to power up mhi: -110
> May 20 12:49:21 steamdeck-oled kernel: ath11k_pci 0000:03:00.0: failed
> to start mhi: -110
> May 20 12:49:21 steamdeck-oled kernel: ath11k_pci 0000:03:00.0: failed
> to power up :-110
> May 20 12:49:21 steamdeck-oled kernel: ath11k_pci 0000:03:00.0: failed
> to create soc core: -110
> May 20 12:49:21 steamdeck-oled kernel: ath11k_pci 0000:03:00.0: failed
> to init core: -110
> May 20 12:49:21 steamdeck-oled kernel: ------------[ cut here ]----------=
--
> May 20 12:49:21 steamdeck-oled kernel: WARNING: CPU: 0 PID: 745 at
> kernel/irq/manage.c:1925 free_irq+0x2d3/0x300

Oh man, clearly ath11k is buggy if any firmware files are missing. I
thought I fixed at some point but I guess it has regressed.

> I rebooted one final time, and now I have functional Wi-Fi and this
> dmesg:
>
> matt@steamdeck-oled:/lib/firmware/ath11k$ journalctl -k -b | grep ath11k
> May 20 12:58:15 steamdeck-oled kernel: ath11k_pci 0000:03:00.0: BAR 0
> [mem 0x80000000-0x801fffff 64bit]: assigned
> May 20 12:58:15 steamdeck-oled kernel: ath11k_pci 0000:03:00.0:
> enabling device (0000 -> 0002)
> May 20 12:58:15 steamdeck-oled kernel: ath11k_pci 0000:03:00.0: MSI vecto=
rs: 1
> May 20 12:58:15 steamdeck-oled kernel: ath11k_pci 0000:03:00.0: qca2066 h=
w2.1
> May 20 12:58:16 steamdeck-oled kernel: ath11k_pci 0000:03:00.0:
> chip_id 0x2 chip_family 0xb board_id 0x309 soc_id 0x400c0210
> May 20 12:58:16 steamdeck-oled kernel: ath11k_pci 0000:03:00.0:
> fw_version 0x11058f56 fw_build_timestamp 2023-10-11 08:46 fw_build_id
> CI_WLAN.HSP.1.1-03926.9.1-QCAHSPSWPL_V2_SILICON
> Z_CE-15
> May 20 12:58:16 steamdeck-oled kernel: ath11k_pci 0000:03:00.0:
> leaving PCI ASPM disabled to avoid MHI M2 problems
> May 20 12:58:17 steamdeck-oled kernel: ath11k_pci 0000:03:00.0 wlo1:
> renamed from wlan0

Nice. At least it looks like the ath11k firmware is booting which is
most important. But based on the firmware string
(CI_WLAN.HSP.1.1-03926.9.1-QCAHSPSWPL_V2_SILICONZ_CE-15) it looks like
that this is not the firmware from ath11k-firmware.git.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

