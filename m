Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0D0C25B77
	for <ath11k@archiver.kernel.org>; Mon, 20 May 2024 20:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p8jwR4aIBWXrUNrjqEJKjzMBnMaHujUSnVLvz6MYE8E=; b=mclIh/XETyKT4QmBBEUzUQiQQS
	N6bulcBat2iM/g4kkZecjmHI1o2+WxVvPXA6yys/vKDhoaCa1/0vsXqgNB3hN66UdbcHCHvXaKh6Q
	AvASwVx9Ynnft0J+/HCkinYmHBX+NKMCO+b/CtAwqVVLVAttprQp/WIQMpzpSKy1ADMs2LR/ypcQU
	5K6Q7vUtE5ClSdbRyIF54px2RChVbCZr+V7bMGCfqRRK5GlZxzZJemSowdB39PZ1Ot9V7SQoc0wki
	6iiGuAmP59WiorMAmum1N9Gnhp7lDR65E0SXvBs1X/gWfFq/ZpCsoMUlzW1eakLeRTZ6KeWv0DVyj
	L8ACBV5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s99pS-0000000FVXS-1HIW;
	Mon, 20 May 2024 20:41:54 +0000
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s99pO-0000000FVWe-3dLS
	for ath11k@lists.infradead.org;
	Mon, 20 May 2024 20:41:52 +0000
Received: by mail-ua1-x931.google.com with SMTP id a1e0cc1a2514c-7f7c0f2b525so702553241.0
        for <ath11k@lists.infradead.org>; Mon, 20 May 2024 13:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716237708; x=1716842508; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8jwR4aIBWXrUNrjqEJKjzMBnMaHujUSnVLvz6MYE8E=;
        b=GvzpJjQy4QG/p218D/Cq6ukMbs/BfX8HdnxB7Mm/gAFDkzAsMFAZ/VEHZUqauK8VNx
         YnXKL46VrJAtrMLjgpmF5BrnBeRk0Jf75j2a+d3V8df8+wRnE37c+IKc5dFzZ5v4VAMO
         HisPamMwQG4YPP+UDhXFQsxGgoAV4Us5XWlg3FW0A7jafzDMLbeg1WTZFVjAVgtO8B83
         YHGqJTXtbSMZaosEmi4fXVvBs8lbc8ExcN7tBnuVxw5A4nq5CPZ280rUloveJCmQOePd
         vaFVIA1MH6/dvqBu2ITivpGc4dSNIqvhF36nCwDzpJtyqF7RQks/G8tMrorVc9gVbts+
         4/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716237708; x=1716842508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p8jwR4aIBWXrUNrjqEJKjzMBnMaHujUSnVLvz6MYE8E=;
        b=VQ7lnn7wQyj14lbwMzdmltuKI1j85TlFcSsLGgVY7uakbpM2HNwezzfn3AXGbNUKJg
         cufh5XmRDuYZwRS5de8GfM7GbIN0Pd1AaPV5le/VUoX8GHCSoNliRKP031xD8WiBWd0G
         9Nj9AjaKqoawi3MFC2l+GUQh22wqu5xap76hPTvOk8xvij2wBjM6jaoGMI/+4udMxR54
         4nn9z5gy6nxtwNoLP/DTO4iQNj6CB1pJdeRukbF2lzy4LJN3FbNppCytSLQvSMEqYXU9
         CToxtF9SA7IyBPQhTvqtzyualWrF1PG2GMjYhbYtqtpP2zD73ZiPi8A2/FIEbm1HdrLd
         eNMw==
X-Gm-Message-State: AOJu0YwjIhpicXoaX9vK5w+xYKjXPVBhBtfjwNTeG4DKpu8MJuYK3ua2
	oOAO6N2inZ5GqlF9K4ya2YEkYdfgBHWLta6fW998gZaxt2zHcezSFKg/UDhheLetW0/+RnEosKv
	A2/ME6vW76yn+WrafZ2pqr8d817EkC1ppE/c=
X-Google-Smtp-Source: AGHT+IGrlB7VtQkxINuFwlUt6b1ojhJzecZZyxj5CFgorJTHwl++Eb5hG8FHHKXBN89kGGKLAK/OoltIoz8cLnCb55w=
X-Received: by 2002:a05:6102:3746:b0:47c:37e4:9143 with SMTP id
 ada2fe7eead31-48077de550amr26369047137.11.1716237707816; Mon, 20 May 2024
 13:41:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAFKu21ZKtKmf4Cze9JCRk750reKXxz+gMs+V1Dr8kUm-J1WWPg@mail.gmail.com>
 <87le44eqbl.fsf@kernel.org>
In-Reply-To: <87le44eqbl.fsf@kernel.org>
From: Matthew Schwartz <njtransit215@gmail.com>
Date: Mon, 20 May 2024 13:41:10 -0700
Message-ID: <CAFKu21b_4fbP3Oku_CLBOYi7wfwmYWUXoG5H1gknvFit-wc4Rw@mail.gmail.com>
Subject: Re: question regarding qca2066 and qca206x (Steam Deck OLED/Galileo)
 on upstream kernels
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org, cristian.ciocaltea@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_134150_946246_6057ACDB 
X-CRM114-Status: GOOD (  46.13  )
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

On Mon, May 20, 2024 at 3:21=E2=80=AFAM Kalle Valo <kvalo@kernel.org> wrote=
:
>
> Matthew Schwartz <njtransit215@gmail.com> writes:
>
> > Hello,
> >
> > I've been tinkering with my Steam Deck OLED (Galileo revision) quite a
> > bit since release, and I think I am finally running into some trouble
> > that I am unable to resolve regarding the use of the Galileo's
> > ath11k/qca2066 driver alongside other devices on an upstream Linux
> > kernel, specifically Linux 6.9.0 and later.
> >
> > When I try to use the upstream ath11k driver with my OLED Deck, it
> > ends up failing a direct firmware load for ath11k/QCA2066/amss.bin.
> > The upstream driver has never worked (to the best of my knowledge at
> > least), so that is not a regression. I've attached the dmesg from this
> > failure just as a reference. We used to get around this on kernels 6.6
> > -> 6.8 by adding in a separate QCA206X entry via kernel patch:
> > https://github.com/Nobara-Project/rpm-sources/blob/main/baseos/kernel/6=
.8.7/steamdeck-oled-wifi.patch
>
> Ok, so that patch seems to add QCA2066 hw2.1 and WMI_COEX_CONFIG_CMDID
> support, but it also does some smaller changes like static_window_map
> and hacks. Unfortunately there's no Signed-off-by which makes it
> difficult to get that code to Linux.
>

Understood, I will revisit that once I manage to get core
functionality working for proper testing.

> We already have QCA2066 hw2.1 support in upstream so that part of the
> patch should not be needed anymore. WMI_COEX_CONFIG_CMDID is not
> supported in upstream yet but that should not matter for initial
> bringup. I would assume you need it later once you start using Wi-Fi and
> BT together and want to optimise them working together.
>
> > along with the firmware from
> > https://steamdeck-packages.steamos.cloud/archlinux-mirror/jupiter-main/=
os/x86_64/linux-firmware-neptune-jupiter.20231113.1-1-any.pkg.tar.zst
>
> Our recommendation is to use the firmware from our repositories as there
> are no guarentees that other firmware releases work with kernel.org
> driver. So try to use this one:
>
> https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware
>
> The board file handling might be a challenge though as I don't know if
> we have the board file for Steam Deck in our board-2.bin, most likely
> not.

I don't believe this is present, I'll explain my exact troubleshooting
steps below to clarify..

>
> > but I have not been able to rebase this onto Kernel 6.9 without a host
> > of compile failures in ath11k, which are unfortunately a bit beyond my
> > own knowledge level.
> >
> > The only way I've managed to get wifi working on the kernel has been
> > to use this one commit from Valve
> > https://gitlab.com/evlaV/linux-integration/-/commit/15dc5e42cac7240104b=
42443df8f4091721da5b1,
>
> Ok, so this just modifies the firmware location from QCA2066 to QCA206X.
> You could do same by just having a symlink in /lib/firmware/ath11k/.
>

This ends up being a very important suggestion, one I think may hold
the key to solving this.

> > along with the QCA206X firmware folder on top of upstream Linux 6.9.0.
> > Please correct me if I'm wrong here, but this is marked as
> > [NOT-FOR-UPSTREAM] because it will break devices using the proper
> > upstream ath11k firmware, right? Do you know if a solution is being
> > worked on to fix the upstream drivers for compatibility with the
> > Galileo specific hardware chip, or is this workaround going to be the
> > only way to get working wifi on new kernel releases?
>
> For me a major problem here is that there are several hacks and another
> firmware release used. My recommendation is to take a step back and do
> one thing at a time, for example something like this:
>
> 1. Install linux 6.9 without any modifications.
>

Done, compiled the v6.9 release from git without any issues.

> 2. Remove the old ath11k firmware.
>

Easy, I ran sudo rm -r /lib/firmware/ath11k

> 3. Install new firmware from
>    https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware
>

For this step, this was my exact process:
copied QCA206X from my current kernel's firmware into the upstream
ath11k firmware folder retrieved from
https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware
sudo cp -r /home/matt/Downloads/Warpinator/ath11k /lib/firmware/ath11k

> 4. Most likely our ath11k-firmware does not contain the correct board
>    file so that might need to be copied from the old firmware package.
>

For this step, this was my exact process:
Rebooted after 6.9 kernel install

I get no wifi and this is my dmesg:
May 20 12:49:21 steamdeck-oled kernel: mhi mhi0: Direct firmware load
for ath11k/QCA2066/hw2.1/amss.bin failed with error -2
May 20 12:49:21 steamdeck-oled kernel: mhi mhi0: Error loading firmware: -2
May 20 12:49:21 steamdeck-oled kernel: ath11k_pci 0000:03:00.0: failed
to power up mhi: -110
May 20 12:49:21 steamdeck-oled kernel: ath11k_pci 0000:03:00.0: failed
to start mhi: -110
May 20 12:49:21 steamdeck-oled kernel: ath11k_pci 0000:03:00.0: failed
to power up :-110
May 20 12:49:21 steamdeck-oled kernel: ath11k_pci 0000:03:00.0: failed
to create soc core: -110
May 20 12:49:21 steamdeck-oled kernel: ath11k_pci 0000:03:00.0: failed
to init core: -110
May 20 12:49:21 steamdeck-oled kernel: ------------[ cut here ]------------
May 20 12:49:21 steamdeck-oled kernel: WARNING: CPU: 0 PID: 745 at
kernel/irq/manage.c:1925 free_irq+0x2d3/0x300
May 20 12:49:21 steamdeck-oled kernel: Modules linked in:
snd_acp_sof_mach snd_acp_mach snd_sof_probes snd_soc_dmic
intel_rapl_msr snd_sof_amd_acp63 snd_sof_amd_vangogh intel_rapl_>
May 20 12:49:21 steamdeck-oled kernel:  mmc_block mii hid_apple amdgpu
amdxcp i2c_algo_bit drm_ttm_helper ttm crct10dif_pclmul drm_exec
crc32_pclmul crc32c_intel gpu_sched drm_suba>
May 20 12:49:21 steamdeck-oled kernel: CPU: 0 PID: 745 Comm:
(udev-worker) Not tainted 6.9.0 #2
May 20 12:49:21 steamdeck-oled kernel: Hardware name: Valve
Galileo/Galileo, BIOS F7G0110 04/09/2024
May 20 12:49:21 steamdeck-oled kernel: RIP: 0010:free_irq+0x2d3/0x300
May 20 12:49:21 steamdeck-oled kernel: Code: 0f 0b e9 ac fd ff ff 41
81 66 78 ff ff f7 ff 4c 89 f7 e8 f0 1d 00 00 e9 11 fe ff ff 49 8d 7e
28 e8 e2 30 ea 00 e9 20 ff ff ff <0f> 0b 4>
May 20 12:49:21 steamdeck-oled kernel: RSP: 0018:ffffad560174b970
EFLAGS: 00010082
May 20 12:49:21 steamdeck-oled kernel: RAX: 0000000000000880 RBX:
ffff8c3e87921c58 RCX: ffff8c3e837ad308
May 20 12:49:21 steamdeck-oled kernel: RDX: 0000000000000001 RSI:
ffff8c3e8e8fff00 RDI: ffff8c3e8f63dc00
May 20 12:49:21 steamdeck-oled kernel: RBP: 0000000000000246 R08:
ffff8c3e837ad300 R09: 0000000000000000
May 20 12:49:21 steamdeck-oled kernel: R10: 0000000000000000 R11:
0000000000000001 R12: ffff8c3e8f63dd60
May 20 12:49:21 steamdeck-oled kernel: R13: ffff8c3e8f63dca4 R14:
ffff8c3e8f63dc00 R15: ffff8c3e8e8fff00
May 20 12:49:21 steamdeck-oled kernel: FS:  00007fcc7f8da980(0000)
GS:ffff8c41afe00000(0000) knlGS:0000000000000000
May 20 12:49:21 steamdeck-oled kernel: CS:  0010 DS: 0000 ES: 0000
CR0: 0000000080050033
May 20 12:49:21 steamdeck-oled kernel: CR2: 000055ac1f5a1df8 CR3:
00000001037aa000 CR4: 0000000000350ef0
May 20 12:49:21 steamdeck-oled kernel: Call Trace:
May 20 12:49:21 steamdeck-oled kernel:  <TASK>
May 20 12:49:21 steamdeck-oled kernel:  ? __warn+0x80/0x120
May 20 12:49:21 steamdeck-oled kernel:  ? free_irq+0x2d3/0x300
May 20 12:49:21 steamdeck-oled kernel:  ? report_bug+0x164/0x190
May 20 12:49:21 steamdeck-oled kernel:  ? handle_bug+0x3c/0x80
May 20 12:49:21 steamdeck-oled kernel:  ? exc_invalid_op+0x17/0x70
May 20 12:49:21 steamdeck-oled kernel:  ? asm_exc_invalid_op+0x1a/0x20
May 20 12:49:21 steamdeck-oled kernel:  ? free_irq+0x2d3/0x300
May 20 12:49:21 steamdeck-oled kernel:  ath11k_pcic_free_irq+0x5a/0xe0 [ath=
11k]
May 20 12:49:21 steamdeck-oled kernel:  ath11k_pci_probe+0x81d/0x840
[ath11k_pci]
May 20 12:49:21 steamdeck-oled kernel:  local_pci_probe+0x45/0xa0
May 20 12:49:21 steamdeck-oled kernel:  pci_device_probe+0xc7/0x240
May 20 12:49:21 steamdeck-oled kernel:  really_probe+0xd6/0x390
May 20 12:49:21 steamdeck-oled kernel:  ? __pfx___driver_attach+0x10/0x10
May 20 12:49:21 steamdeck-oled kernel:  __driver_probe_device+0x78/0x150
May 20 12:49:21 steamdeck-oled kernel:  driver_probe_device+0x1f/0x90
May 20 12:49:21 steamdeck-oled kernel:  __driver_attach+0xd2/0x1c0
May 20 12:49:21 steamdeck-oled kernel:  bus_for_each_dev+0x88/0xd0
May 20 12:49:21 steamdeck-oled kernel:  bus_add_driver+0x116/0x220
May 20 12:49:21 steamdeck-oled kernel:  driver_register+0x59/0x100
May 20 12:49:21 steamdeck-oled kernel:  ?
__pfx_ath11k_pci_init+0x10/0x10 [ath11k_pci]
May 20 12:49:21 steamdeck-oled kernel:  ath11k_pci_init+0x24/0x50 [ath11k_p=
ci]
May 20 12:49:21 steamdeck-oled kernel:  ?
__pfx_ath11k_pci_init+0x10/0x10 [ath11k_pci]
May 20 12:49:21 steamdeck-oled kernel:  do_one_initcall+0x5b/0x320
May 20 12:49:21 steamdeck-oled kernel:  do_init_module+0x60/0x240
May 20 12:49:21 steamdeck-oled kernel:  init_module_from_file+0x86/0xc0
May 20 12:49:21 steamdeck-oled kernel:  idempotent_init_module+0x120/0x2b0
May 20 12:49:21 steamdeck-oled kernel:  __x64_sys_finit_module+0x5e/0xb0
May 20 12:49:21 steamdeck-oled kernel:  do_syscall_64+0x82/0x170
May 20 12:49:21 steamdeck-oled kernel:  ? srso_return_thunk+0x5/0x5f
May 20 12:49:21 steamdeck-oled kernel:  ?
syscall_exit_to_user_mode_prepare+0x15d/0x190
May 20 12:49:21 steamdeck-oled kernel:  ? srso_return_thunk+0x5/0x5f
May 20 12:49:21 steamdeck-oled kernel:  ? syscall_exit_to_user_mode+0x75/0x=
230
May 20 12:49:21 steamdeck-oled kernel:  ? srso_return_thunk+0x5/0x5f
May 20 12:49:21 steamdeck-oled kernel:  ? do_syscall_64+0x8f/0x170
May 20 12:49:21 steamdeck-oled kernel:  ? srso_return_thunk+0x5/0x5f
May 20 12:49:21 steamdeck-oled kernel:  ?
syscall_exit_to_user_mode_prepare+0x15d/0x190
May 20 12:49:21 steamdeck-oled kernel:  ? srso_return_thunk+0x5/0x5f
May 20 12:49:21 steamdeck-oled kernel:  ? syscall_exit_to_user_mode+0x75/0x=
230
May 20 12:49:21 steamdeck-oled kernel:  ? srso_return_thunk+0x5/0x5f
May 20 12:49:21 steamdeck-oled kernel:  ? do_syscall_64+0x8f/0x170
May 20 12:49:21 steamdeck-oled kernel:  ? srso_return_thunk+0x5/0x5f
May 20 12:49:21 steamdeck-oled kernel:  ? srso_return_thunk+0x5/0x5f
May 20 12:49:21 steamdeck-oled kernel:  ? sched_clock_cpu+0xf/0x190
May 20 12:49:21 steamdeck-oled kernel:  ? srso_return_thunk+0x5/0x5f
May 20 12:49:21 steamdeck-oled kernel:  ? irqtime_account_irq+0x45/0xc0
May 20 12:49:21 steamdeck-oled kernel:  ? srso_return_thunk+0x5/0x5f
May 20 12:49:21 steamdeck-oled kernel:  ? __irq_exit_rcu+0x4b/0xc0
May 20 12:49:21 steamdeck-oled kernel:  ? srso_return_thunk+0x5/0x5f
May 20 12:49:21 steamdeck-oled kernel:  entry_SYSCALL_64_after_hwframe+0x76=
/0x7e
May 20 12:49:21 steamdeck-oled kernel: RIP: 0033:0x7fcc7fb3185d
May 20 12:49:21 steamdeck-oled kernel: Code: ff c3 66 2e 0f 1f 84 00
00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89
c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 0>
May 20 12:49:21 steamdeck-oled kernel: RSP: 002b:00007ffe58d46158
EFLAGS: 00000246 ORIG_RAX: 0000000000000139
May 20 12:49:21 steamdeck-oled kernel: RAX: ffffffffffffffda RBX:
0000555e0252d7b0 RCX: 00007fcc7fb3185d
May 20 12:49:21 steamdeck-oled kernel: RDX: 0000000000000000 RSI:
00007fcc8012107d RDI: 0000000000000013
May 20 12:49:21 steamdeck-oled kernel: RBP: 00007ffe58d46210 R08:
0000000000000000 R09: 00007ffe58d461a0
May 20 12:49:21 steamdeck-oled kernel: R10: 0000000000000013 R11:
0000000000000246 R12: 00007fcc8012107d
May 20 12:49:21 steamdeck-oled kernel: R13: 0000000000020000 R14:
0000555e0252a1a0 R15: 0000555e025201f0
May 20 12:49:21 steamdeck-oled kernel:  </TASK>
May 20 12:49:21 steamdeck-oled kernel: ---[ end trace 0000000000000000 ]---
May 20 12:49:22 steamdeck-oled kernel: ath11k_pci 0000:03:00.0: probe
with driver ath11k_pci failed with error -110

I created a symlink like this:
sudo ln -s /lib/firmware/ath11k/QCA206X/hw2.1/amss.bin
/lib/firmware/ath11k/QCA2066/hw2.1/amss.bin

Now I rebooted once again

I get no wifi still but my dmesg changes to this:
May 20 12:56:32 steamdeck-oled kernel: ath11k_pci 0000:03:00.0:
chip_id 0x2 chip_family 0xb board_id 0x309 soc_id 0x400c0210
May 20 12:56:32 steamdeck-oled kernel: ath11k_pci 0000:03:00.0:
fw_version 0x11058f56 fw_build_timestamp 2023-10-11 08:46 fw_build_id
CI_WLAN.HSP.1.1-03926.9.1-QCAHSPSWPL_V2_SILICO>
May 20 12:56:32 steamdeck-oled kernel: Bluetooth: hci0: QCA setup on
UART is completed
May 20 12:56:32 steamdeck-oled kernel: Bluetooth: hci0: HFP non-HCI
data transport is supported
May 20 12:56:32 steamdeck-oled kernel: ath11k_pci 0000:03:00.0: failed
to load ath11k/QCA2066/hw2.1/m3.bin: -2
May 20 12:56:32 steamdeck-oled kernel: ath11k_pci 0000:03:00.0: failed
to load m3 firmware: -2
May 20 12:56:32 steamdeck-oled kernel: ath11k_pci 0000:03:00.0: failed
to send qmi m3 info req: -2

Next, I created a symlink like this:
sudo ln -s /lib/firmware/ath11k/QCA206X/hw2.1/m3.bin
/lib/firmware/ath11k/QCA2066/hw2.1/m3.bin

I rebooted one final time, and now I have functional Wi-Fi and this dmesg:
matt@steamdeck-oled:/lib/firmware/ath11k$ journalctl -k -b | grep ath11k
May 20 12:58:15 steamdeck-oled kernel: ath11k_pci 0000:03:00.0: BAR 0
[mem 0x80000000-0x801fffff 64bit]: assigned
May 20 12:58:15 steamdeck-oled kernel: ath11k_pci 0000:03:00.0:
enabling device (0000 -> 0002)
May 20 12:58:15 steamdeck-oled kernel: ath11k_pci 0000:03:00.0: MSI vectors=
: 1
May 20 12:58:15 steamdeck-oled kernel: ath11k_pci 0000:03:00.0: qca2066 hw2=
.1
May 20 12:58:16 steamdeck-oled kernel: ath11k_pci 0000:03:00.0:
chip_id 0x2 chip_family 0xb board_id 0x309 soc_id 0x400c0210
May 20 12:58:16 steamdeck-oled kernel: ath11k_pci 0000:03:00.0:
fw_version 0x11058f56 fw_build_timestamp 2023-10-11 08:46 fw_build_id
CI_WLAN.HSP.1.1-03926.9.1-QCAHSPSWPL_V2_SILICON
Z_CE-15
May 20 12:58:16 steamdeck-oled kernel: ath11k_pci 0000:03:00.0:
leaving PCI ASPM disabled to avoid MHI M2 problems
May 20 12:58:17 steamdeck-oled kernel: ath11k_pci 0000:03:00.0 wlo1:
renamed from wlan0


This is my current tree structure with functional wifi:

=E2=94=9C=E2=94=80=E2=94=80 QCA2066
=E2=94=82   =E2=94=94=E2=94=80=E2=94=80 hw2.1
=E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 1.1
=E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 WLAN.HSP.1.1-03926.=
13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.2
=E2=94=82       =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 amss.bi=
n
=E2=94=82       =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 m3.bin
=E2=94=82       =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 Notice.=
txt
=E2=94=82       =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 WLAN.HSP.1.1-03926.=
13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.3
=E2=94=82       =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 amss.bin
=E2=94=82       =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 m3.bin
=E2=94=82       =E2=94=82       =E2=94=94=E2=94=80=E2=94=80 Notice.txt
=E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 amss.bin -> /lib/firmware/ath11=
k/QCA206X/hw2.1/amss.bin
=E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 board-2.bin
=E2=94=82       =E2=94=94=E2=94=80=E2=94=80 m3.bin -> /lib/firmware/ath11k/=
QCA206X/hw2.1/m3.bin
=E2=94=9C=E2=94=80=E2=94=80 QCA206X
=E2=94=82   =E2=94=94=E2=94=80=E2=94=80 hw2.1
=E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 amss.bin
=E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 board-2.bin
=E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 board.bin
=E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 boardg.bin
=E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 Data.msc
=E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 m3.bin
=E2=94=82       =E2=94=94=E2=94=80=E2=94=80 regdb.bin

Is the mismatch between file/directory structure for QCA2066 and the
upstream QCA206X I had to add to the upstream ath11k firmware going to
be an issue? Also, QCA206X seems to be missing Notice.txt. Will this
cause any issues?

This is all still pending further testing on my end as well, but I
wanted to get some clarity on the current situation. Thanks again for
the detailed and helpful guidance you've provided so far!

> With good luck you will get the driver initialised so that you can run
> 'ip link set wlan0 up' and then 'iw wlan0 scan'. If not, please report
> back.
>
> Please also read our instructions what to include in bug reports:
>
> https://wireless.wiki.kernel.org/en/users/drivers/ath11k/bugreport
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpa=
tches

