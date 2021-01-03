Return-Path: <SRS0=czDI=GG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 068C2C433DB
	for <ath11k@archiver.kernel.org>; Sun,  3 Jan 2021 00:19:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86EA3207A5
	for <ath11k@archiver.kernel.org>; Sun,  3 Jan 2021 00:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86EA3207A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IseQu6ZFKhHo5VeauUUB0BTogVDUin9qGERbIYbNmRM=; b=OHj4nOLMwMzEdEB5B0RL8XjV/
	v0ICMit0lZPb4YsCbSkN/NkEwYBzbSnQbcfKvB/aIh5zP52xgA66WD+Qd9JQmSXxIC9I5h0iXzOsN
	7HhSKNyxRNzrZLFxPWAYz3822qT3YAiQj5nQJrsiNv2vPv07CjoLX9uQXHgQKoV7q8xsvs4Lz7s04
	fLoq0v1wm2NZ40PjevcKEUIFied1azhycq9f4ne/K7jioZp/yavTYZdyujdLsy2r+8xhdvX60asWL
	w41t7qrpoWVp/+UvGQ3GGY/7/olDnlfUSzfEaifvf3M2apoYEaKADVsDm2xqM/6wv9nR5q8dlP+PN
	TiWhf+/Uw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kvr6p-0000Ac-Hh; Sun, 03 Jan 2021 00:18:59 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kvr6n-0000A9-Ck
 for ath11k@lists.infradead.org; Sun, 03 Jan 2021 00:18:58 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id e20so12592357vsr.12
 for <ath11k@lists.infradead.org>; Sat, 02 Jan 2021 16:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Iv86gO3rBkYocf1UltOAAMVSLuKOs3JdUyWZGZY5TxU=;
 b=B0LdnfNh6eR69i2wigMeJr/R31T3ShGSALRB6Rj1opOKxWQSsnCAnkRRpoB5ZbpI7j
 N434mu+s7ynbX4iL7kB1qxdy7eb4vciN3916oDJNAIDQBP9eljR0bo1qxr0SzRnWH/ik
 1uUQx2Vaa6LFmRbg7IdZdVZuRXzAxfcxbuNAf00VOSVlexoFruRnKJHAyvzxRcpMH5aP
 7kiuWuamnY77HF3CyhWYhw2uguG2WIduyHpVhQ4E27Pejs2Nl+FUVVjS2C59DVSFfzza
 crWQrBaMGduTfHtOeLHzTqmBOBOcfLh3GAkumifb/APZX+0QfeQiWiUvi6PC+P/vzbla
 Lplg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Iv86gO3rBkYocf1UltOAAMVSLuKOs3JdUyWZGZY5TxU=;
 b=lkJmoYaz283O7w392SmH3TJWYcqEmibx1q800QdhUwtm6jQRsyQt/1ZmPssjBxm/7Z
 2aPPJIfy1oPDMQ/+gjX8UJWy0/QzMjENphgxz8bEMyEahxyLLOK+DFl1VdSlE1FYdXkI
 wPlnCvu0aoKxZlp7ie428w0bzfhKbkHTyKtXYAb2LLtKDIysiG8Qx64WZ4WVlf4yqVY+
 E6xZdayX5JS4vuIAQ0aO811/5TDNyXYvi6Sk3U1lCnKvZwZPaKvKpz+bA+MAT7y9rVfI
 Ux9IroUsjz7kz5Q1870yVJXRbRPo0jfDXx5+7UMEIbE3zkZjjLHxlXOKGPfIgPXwllEw
 fsPg==
X-Gm-Message-State: AOAM533MCJa/wTUlcuvv/DK925joH30M9n9OazKEczkE8GXmuCrZk+rr
 fsx7ajPm7Sun61ASpeIaIXeDiXOgO16WaJo95k4=
X-Google-Smtp-Source: ABdhPJwZp7Z5rQITkz2hkOrodca/xcVR88C3zr6/XJxs3NE2CqLofXTj5sEnYDEPoYvznjW4lU297tFMAIN99Ij74hg=
X-Received: by 2002:a67:32c5:: with SMTP id y188mr38867890vsy.4.1609633135299; 
 Sat, 02 Jan 2021 16:18:55 -0800 (PST)
MIME-Version: 1.0
References: <CAM+r-RhxY4TA4zPm6e6ah9RWdBY67J=5oRS3+=+EQMomKa10QQ@mail.gmail.com>
 <CA+icZUWcuka-6j139+89pSV5Z-r1fYVriz+wJE0gma4RO_PL9Q@mail.gmail.com>
In-Reply-To: <CA+icZUWcuka-6j139+89pSV5Z-r1fYVriz+wJE0gma4RO_PL9Q@mail.gmail.com>
From: Luca Versari <veluca93@gmail.com>
Date: Sun, 3 Jan 2021 01:18:29 +0100
Message-ID: <CAM+r-Rj3y6DGonMPQ_V7qCwWH7v1bgh5x7YmAzMh5-cY68jJiw@mail.gmail.com>
Subject: Re: [BUG] Stacktrace in ath11k_pci
To: sedat.dilek@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210102_191857_468997_422DE386 
X-CRM114-Status: GOOD (  14.71  )
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
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Thanks for the quick reply!
Unfortunately, this didn't seem to work - I'm still getting the same
stack trace:

[   23.136891] WARNING: CPU: 7 PID: 534 at
drivers/net/wireless/ath/ath11k/mac.c:5301
ath11k_mac_op_unassign_vif_chanctx+0x1d8/0x2e0 [ath11k]
[   23.136893] Modules linked in: michael_mic snd_hda_codec_hdmi
snd_hda_codec_realtek snd_hda_codec_generic qrtr_mhi snd_sof_pci
snd_sof_intel_byt snd_sof_intel_ipc snd_sof_intel_hda_common
snd_soc_hdac_hda snd_sof_xtensa_dsp snd_sof_intel_hda snd_sof
hid_sensor_als hid_sensor_trigger industrialio_triggered_buffer
snd_soc_skl kfifo_buf hid_sensor_iio_common snd_soc_sst_ipc 88x2bu(OE)
industrialio snd_soc_sst_dsp snd_hda_ext_core x86_pkg_temp_thermal
intel_powerclamp qrtr snd_soc_acpi_intel_match ns hid_sensor_hub
snd_soc_acpi ath11k_pci coretemp cros_ec_ishtp joydev cros_ec mousedev
intel_ishtp_loader snd_hda_intel mhi intel_ishtp_hid kvm_intel
snd_intel_dspcfg soundwire_intel soundwire_generic_allocation
nvidia_drm(POE) hid_multitouch soundwire_cadence iTCO_wdt dell_laptop
intel_pmc_bxt 8250_dw nvidia_modeset(POE) ee1004 iTCO_vendor_support
mei_hdcp intel_rapl_msr kvm nls_iso8859_1 ath11k snd_hda_codec
ledtrig_audio dell_wmi dell_smbios snd_hda_core snd_hwdep qmi_helpers
dell_wmi_descriptor
[   23.136989]  irqbypass soundwire_bus wmi_bmof dcdbas
crct10dif_pclmul intel_wmi_thunderbolt crc32_pclmul vfat mac80211
ghash_clmulni_intel hci_uart aesni_intel nvidia(POE) dell_smm_hwmon
i915 fat snd_soc_core crypto_simd btqca cryptd btrtl snd_compress
glue_helper btbcm ac97_bus rapl btintel i2c_algo_bit intel_cstate
snd_pcm_dmaengine cfg80211 intel_uncore bluetooth pcspkr snd_pcm
drm_kms_helper thunderbolt i2c_i801 tpm_crb i2c_smbus snd_timer
libarc4 snd mei_me cec mei soundcore intel_lpss_pci intel_gtt
intel_lpss tpm_tis intel_ish_ipc syscopyarea processor_thermal_device
idma64 tpm_tis_core ucsi_acpi sysfillrect intel_rapl_common typec_ucsi
tpm intel_ishtp sysimgblt fb_sys_fops intel_soc_dts_iosf
intel_pch_thermal typec ecdh_generic rng_core rfkill wmi mac_hid ecc
i2c_hid int3403_thermal int340x_thermal_zone video intel_hid
int3400_thermal acpi_thermal_rel sparse_keymap acpi_tad acpi_pad drm
sg fuse crypto_user agpgart bpf_preload ip_tables x_tables ext4
crc32c_generic crc16 mbcache jbd2
[   23.137125]  rtsx_pci_sdmmc mmc_core crc32c_intel serio_raw
rtsx_pci xhci_pci xhci_pci_renesas
[   23.137141] CPU: 7 PID: 534 Comm: wpa_supplicant Tainted: P
  OE     5.10.4-arch2-1 #1
[   23.137143] Hardware name: Dell Inc. XPS 15 9500/0XWT2F, BIOS 1.4.0
08/14/2020
[   23.137159] RIP: 0010:ath11k_mac_op_unassign_vif_chanctx+0x1d8/0x2e0 [ath11k]
[   23.137164] Code: 8b 85 e0 02 00 00 4c 89 e9 be 10 00 00 00 4c 89
e7 48 c7 c2 c0 d2 e5 c2 e8 a5 52 01 00 80 bd 98 03 00 00 00 0f 85 71
fe ff ff <0f> 0b e9 6a fe ff ff f0 80 a3 d8 16 00 00 fe f6 05 c2 34 05
00 10
[   23.137167] RSP: 0018:ffffb14780f3b808 EFLAGS: 00010246
[   23.137171] RAX: 0000000000000000 RBX: ffff952fc4bfc480 RCX: 0000000000000000
[   23.137173] RDX: ffff952fc4de9f80 RSI: ffff952fc60bd548 RDI: ffff952fd72fb5f8
[   23.137175] RBP: ffff952fc60bd548 R08: ffff952fc60bc940 R09: ffffb14780f3b648
[   23.137177] R10: ffffb14780f3b640 R11: ffffffff948cb1e8 R12: ffff952fd8900000
[   23.137179] R13: ffff952fc4bfc4d8 R14: ffff952fd72f9ee0 R15: ffff952fd72fb5f8
[   23.137183] FS:  00007f633f0fccc0(0000) GS:ffff953f1b7c0000(0000)
knlGS:0000000000000000
[   23.137186] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   23.137188] CR2: 00007f0d803b6000 CR3: 000000011ac62001 CR4: 00000000007706e0
[   23.137190] PKRU: 55555554
[   23.137192] Call Trace:
[   23.137259]  ieee80211_assign_vif_chanctx+0x81/0x440 [mac80211]
[   23.137309]  __ieee80211_vif_release_channel+0x4f/0x130 [mac80211]
[   23.137355]  ieee80211_vif_release_channel+0x3a/0x50 [mac80211]
[   23.137411]  ieee80211_mgd_auth.cold+0x10a/0x160 [mac80211]
[   23.137467]  cfg80211_mlme_auth+0x127/0x240 [cfg80211]
[   23.137505]  nl80211_authenticate+0x2ac/0x300 [cfg80211]
[   23.137518]  genl_family_rcv_msg_doit+0xfd/0x160
[   23.137525]  genl_rcv_msg+0xef/0x1e0
[   23.137561]  ? nl80211_parse_key+0x310/0x310 [cfg80211]
[   23.137566]  ? genl_get_cmd+0xd0/0xd0
[   23.137570]  netlink_rcv_skb+0x5b/0x100
[   23.137575]  genl_rcv+0x24/0x40
[   23.137578]  netlink_unicast+0x242/0x340
[   23.137583]  netlink_sendmsg+0x243/0x480
[   23.137589]  sock_sendmsg+0x5e/0x60
[   23.137594]  ____sys_sendmsg+0x25a/0x2a0
[   23.137598]  ? copy_msghdr_from_user+0x6e/0xa0
[   23.137604]  ___sys_sendmsg+0x97/0xe0
[   23.137614]  __sys_sendmsg+0x81/0xd0
[   23.137622]  do_syscall_64+0x33/0x40
[   23.137627]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   23.137631] RIP: 0033:0x7f633f54b7e7
[   23.137637] Code: 0c 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7
0f 1f 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 2e 00 00
00 0f 05 <48> 3d 00 f0 ff ff 77 51 c3 48 83 ec 28 89 54 24 1c 48 89 74
24 10
[   23.137640] RSP: 002b:00007ffe8dcb2f48 EFLAGS: 00000246 ORIG_RAX:
000000000000002e
[   23.137644] RAX: ffffffffffffffda RBX: 000055e801b10780 RCX: 00007f633f54b7e7
[   23.137646] RDX: 0000000000000000 RSI: 00007ffe8dcb2f80 RDI: 0000000000000006
[   23.137648] RBP: 000055e801b10690 R08: 0000000000000004 R09: 00007f633f60ca60
[   23.137650] R10: 00007ffe8dcb3054 R11: 0000000000000246 R12: 000055e801b49130
[   23.137653] R13: 00007ffe8dcb2f80 R14: 00007ffe8dcb3054 R15: 000055e801b50a90

On Sun, 3 Jan 2021 at 00:48, Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Sun, Jan 3, 2021 at 12:27 AM Luca Versari <veluca93@gmail.com> wrote:
> >
> > Hi all,
> > I recently updated to kernel 5.10.3, which has the module for my WiFi
> > card (QCA6390 - Hardware name: Dell Inc. XPS 15 9500/0XWT2F, BIOS
> > 1.4.0 08/14/2020).
>
> I have no ath11k hardware but looking at the commit logs:
>
> $ git log --oneline v5.10.3..v5.10.4 | grep 'ath11k:'
> 6003ff9ca725 ath11k: Fix incorrect tlvs in scan start command
> 01c0691ead1e ath11k: Fix an error handling path
> 08c7e5615496 ath11k: Reset ath11k_skb_cb before setting new flags
> 345511c3f496 ath11k: Don't cast ath11k_skb_cb to ieee80211_tx_info.control
> 7688ca1121ba ath11k: Fix the rx_filter flag setting for peer rssi stats
> 00f7592609c9 ath11k: Handle errors if peer creation fails
> 8a8fe3e58c3e ath11k: fix wmi init configuration
> e3f640e6a085 ath11k: Fix number of rules in filtered ETSI regdomain
> ce79baf7b3eb ath11k: Initialize complete alpha2 for regulatory change
>
> Upgrade to Linux v5.10.4 and check again?
>
> - Sedat -

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
