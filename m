Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiQ17-000251-PL
 for ath11k@lists.infradead.org; Thu, 26 Nov 2020 22:45:36 +0000
Received: by mail-ed1-x543.google.com with SMTP id q3so3775244edr.12
 for <ath11k@lists.infradead.org>; Thu, 26 Nov 2020 14:45:31 -0800 (PST)
MIME-Version: 1.0
References: <87sg95t9ez.fsf@codeaurora.org> <87o8jtt98l.fsf@codeaurora.org>
 <CAJxb_EqUNt7-m97V7k5MACYssJjhg09J9xmLH5MB=NuVKfedKg@mail.gmail.com>
 <CAJxb_Eqewg1_ZKRtiKFUgZFbtRq4N6duEpSz0RxMhB3igMgZQQ@mail.gmail.com>
 <CAHUdJJVtG34UQB9EsNbqG0ef-zaEjLoNSBqkb7PQoz5U4eb2QA@mail.gmail.com>
 <CAHUdJJVoKKZO+P__+b8mGbh=ohaMKhLbJypOWATpPkK9bv0aDA@mail.gmail.com>
 <CAHUdJJXyqEvVwvRSVZ4Et395VZttVfWEJDOgXv5KKuecZpHgOQ@mail.gmail.com>
 <CAHUdJJWmO8wUcz7tBiJNC3LkACg-wxVqb_Wkr8=g1E1dU1snAQ@mail.gmail.com>
In-Reply-To: <CAHUdJJWmO8wUcz7tBiJNC3LkACg-wxVqb_Wkr8=g1E1dU1snAQ@mail.gmail.com>
From: wi nk <wink@technolu.st>
Date: Thu, 26 Nov 2020 23:45:19 +0100
Message-ID: <CAHUdJJXkwOyNwHzTze+m0fd7C2vuC1vAHwMVG4ZwTB=o8q8irg@mail.gmail.com>
Subject: Re: ath11k-qca6390-bringup-202011191920: new suspend implementation
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
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Mitchell Nordine <mitchell.nordine@gmail.com>, Carl Huang <cjhuang@codeaurora.org>
Cc: ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

Good evening all,

  I've had a bit more time to hack at this to try to sort out what's
going on.  I've narrowed down the racing a bit, it begins when
ath11k_pci_ext_irq_enable is called and the napi system is enabled.
If I forcibly prevent it from enabling, the adapter will never fully
associate (as expected), but it prevents any crashing and the CE
interrupt handler still attempts to do it's work.  I haven't sorted
much beyond that as I'm still reading docs but from what I can find,
having the CE and EXT handlers sharing this IRQ and enabling /
disabling it out from under each other seems like it could cause
issues if it happens at the wrong moment.  Looking at the AHB
implementation (where I guess the PCI version was ported from?), it's
handling the IRQ management quite differently, is this a difference in
the hardware or porting?

Thanks!

On Tue, Nov 24, 2020 at 12:38 AM wi nk <wink@technolu.st> wrote:
>
> On Tue, Nov 24, 2020 at 12:30 AM wi nk <wink@technolu.st> wrote:
> >
> > On Mon, Nov 23, 2020 at 4:14 AM wi nk <wink@technolu.st> wrote:
> > >
> > > On Sun, Nov 22, 2020 at 4:07 PM wi nk <wink@technolu.st> wrote:
> > > >
> > > > On Sun, Nov 22, 2020 at 2:15 PM Mitchell Nordine
> > > > <mitchell.nordine@gmail.com> wrote:
> > > > >
> > > > > > Unfortunately there's no solution still for the weird
> > > > > crashes some people are seeing.
> > > > >
> > > > > Can confirm, the spurious system freezing still continues. This time
> > > > > while typing my password into the gdm UI for login.
> > > > >
> > > > > On Sun, Nov 22, 2020 at 12:44 AM Mitchell Nordine
> > > > > <mitchell.nordine@gmail.com> wrote:
> > > > > >
> > > > > > Thanks for the update!
> > > > > >
> > > > > > I no longer notice any errors related to ath11k during boot of NixOS
> > > > > > on my XPS 13 9310 with these patches:
> > > > > >
> > > > > > [mindtree@mindtree:~]$ dmesg | grep -e ath11
> > > > > > [    4.084314] ath11k_pci 0000:56:00.0: WARNING: ath11k PCI support is
> > > > > > experimental!
> > > > > > [    4.084358] ath11k_pci 0000:56:00.0: BAR 0: assigned [mem
> > > > > > 0x8c300000-0x8c3fffff 64bit]
> > > > > > [    4.084377] ath11k_pci 0000:56:00.0: enabling device (0000 -> 0002)
> > > > > > [    4.084442] ath11k_pci 0000:56:00.0: MSI vectors: 1
> > > > > > [    4.320847] ath11k_pci 0000:56:00.0: qmi req mem_seg[0] 0x59c00000 3522560 1
> > > > > > [    4.320849] ath11k_pci 0000:56:00.0: qmi req mem_seg[1] 0x5a200000 884736 4
> > > > > > [    4.330816] ath11k_pci 0000:56:00.0: chip_id 0x0 chip_family 0xb
> > > > > > board_id 0xff soc_id 0xffffffff
> > > > > > [    4.330818] ath11k_pci 0000:56:00.0: fw_version 0x101c06cc
> > > > > > fw_build_timestamp 2020-06-24 19:50 fw_build_id
> > > > > > [    4.521522] ath11k_pci 0000:56:00.0 wlp86s0: renamed from wlan0
> > > > > >
> > > > > > Everything appears to run smoothly for the first 5-10 minutes, then
> > > > > > the firmware appears to crash and the internet drops out:
> > > > > >
> > > > > > [  293.677300] ath11k_pci 0000:56:00.0: firmware crashed:
> > > > > > MHI_CB_SYS_ERROR
> > > > > > [  385.774509] mhi 0000:56:00.0: Device failed to exit MHI Reset state
> > > > > >
> > > > > > I haven't yet been able to identify an action that consistently causes
> > > > > > the crash.
> > > > > >
> > > > > > Following the crash, the gnome shell appears to still believe that the
> > > > > > connection is up, however upon clicking on the wifi in the top-right
> > > > > > drop-down menu and clicking the "Turn Off" option, the shell freezes
> > > > > > for a few seconds and a few more errors show up in dmesg:
> > > > > >
> > > > > > [  634.018718] wlp86s0: deauthenticating from 7a:8a:20:d5:98:d7 by
> > > > > > local choice (Reason: 3=DEAUTH_LEAVING)
> > > > > > [  639.151611] ath11k_pci 0000:56:00.0: failed to flush transmit queue
> > > > > > 0
> > > > > > [  642.159384] ath11k_pci 0000:56:00.0: wmi command 24595 timeout
> > > > > > [  642.159388] ath11k_pci 0000:56:00.0: failed to send
> > > > > > WMI_PEER_REORDER_QUEUE_SETUP
> > > > > > [  642.159394] ath11k_pci 0000:56:00.0: failed to send wmi to delete rx tid -11
> > > > > > [  642.159400] wlp86s0: HW problem - can not stop rx aggregation for
> > > > > > 7a:8a:20:d5:98:d7 tid 0
> > > > > > [  645.168070] ath11k_pci 0000:56:00.0: wmi command 24595 timeout
> > > > > > [  645.168072] ath11k_pci 0000:56:00.0: failed to send
> > > > > > WMI_PEER_REORDER_QUEUE_SETUP
> > > > > > [  645.168074] ath11k_pci 0000:56:00.0: failed to send wmi to delete rx tid -11
> > > > > > [  645.168077] wlp86s0: HW problem - can not stop rx aggregation for
> > > > > > 7a:8a:20:d5:98:d7 tid 1
> > > > > > [  648.174960] ath11k_pci 0000:56:00.0: wmi command 24595 timeout
> > > > > > [  648.174965] ath11k_pci 0000:56:00.0: failed to send
> > > > > > WMI_PEER_REORDER_QUEUE_SETUP
> > > > > > [  648.174971] ath11k_pci 0000:56:00.0: failed to send wmi to delete rx tid -11
> > > > > > [  648.174976] wlp86s0: HW problem - can not stop rx aggregation for
> > > > > > 7a:8a:20:d5:98:d7 tid 6
> > > > > > [  651.183596] ath11k_pci 0000:56:00.0: wmi command 20489 timeout
> > > > > > [  651.183601] ath11k_pci 0000:56:00.0: failed to send WMI_VDEV_INSTALL_KEY cmd
> > > > > > [  651.183606] ath11k_pci 0000:56:00.0: ath11k_install_key failed (-11)
> > > > > > [  651.183610] wlp86s0: failed to remove key (0, 7a:8a:20:d5:98:d7)
> > > > > > from hardware (-11)
> > > > > > [  654.190511] ath11k_pci 0000:56:00.0: wmi command 24578 timeout
> > > > > > [  654.190516] ath11k_pci 0000:56:00.0: failed to send WMI_PEER_DELETE cmd
> > > > > > [  654.190523] ath11k_pci 0000:56:00.0: failed to delete peer vdev_id
> > > > > > 0 addr 7a:8a:20:d5:98:d7 ret -11
> > > > > > [  654.190526] ath11k_pci 0000:56:00.0: Failed to delete peer:
> > > > > > 7a:8a:20:d5:98:d7 for VDEV: 0
> > > > > > [  654.190528] ath11k_pci 0000:56:00.0: Found peer entry
> > > > > > 9c:b6:d0:3e:43:4a n vdev 0 after it was supposedly removed
> > > > > > [  654.190574] ------------[ cut here ]------------
> > > > > > [  654.190594] WARNING: CPU: 5 PID: 1208 at
> > > > > > net/mac80211/sta_info.c:1098 __sta_info_destroy_part2+0x11c/0x140
> > > > > > [mac80211]
> > > > > > [  654.190595] Modules linked in: ath9k_htc ath9k_common ath9k_hw ath
> > > > > > fuse ctr ccm michael_mic af_packet cdc_ether usbnet r8152 mii
> > > > > > typec_displayport uvcvideo
> > > > > > videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videobuf2_common
> > > > > > videodev mc hid_sensor_als hid_sensor_trigger
> > > > > > industrialio_triggered_buffer kfifo_buf hid_se
> > > > > > nsor_iio_common industrialio hid_sensor_hub intel_ishtp_loader joydev
> > > > > > mousedev intel_ishtp_hid wacom usbhid hid_multitouch hid_generic
> > > > > > qrtr_mhi iTCO_wdt intel_
> > > > > > pmc_bxt 8250_dw watchdog mei_hdcp i2c_designware_platform
> > > > > > i2c_designware_core intel_rapl_msr snd_sof_pci snd_sof_intel_byt
> > > > > > snd_sof_intel_ipc qrtr dell_wmi wmi_
> > > > > > bmof ns snd_sof_intel_hda_common dell_laptop ath11k_pci
> > > > > > snd_soc_hdac_hda dell_smbios snd_sof_xtensa_dsp snd_hda_codec_hdmi mhi
> > > > > > snd_sof_intel_hda dell_wmi_descr
> > > > > > iptor dcdbas snd_sof ath11k x86_pkg_temp_thermal intel_powerclamp
> > > > > > dell_smm_hwmon qmi_helpers snd_hda_ext_core coretemp crc32_pclmul
> > > > > > ghash_clmulni_intel snd_soc
> > > > > > _acpi_intel_match aesni_intel snd_soc_acpi
> > > > > > [  654.190666]  snd_hda_codec_realtek libaes mac80211 crypto_simd
> > > > > > cryptd glue_helper snd_hda_codec_generic ledtrig_audio intel_cstate
> > > > > > snd_soc_core intel_uncore
> > > > > >  snd_compress sha256_ssse3 ac97_bus snd_pcm_dmaengine sha256_generic
> > > > > > input_leds led_class deflate snd_hda_intel intel_spi_pci efi_pstore
> > > > > > snd_intel_dspcfg cfg80
> > > > > > 211 intel_spi serio_raw pstore spi_nor snd_hda_codec mtd nls_iso8859_1
> > > > > > nls_cp437 snd_hda_core vfat i2c_i801 snd_hwdep i2c_smbus rfkill
> > > > > > tpm_crb fat libarc4 sch_
> > > > > > fq_codel intel_ish_ipc mei_me intel_lpss_pci tpm_tis intel_ishtp
> > > > > > intel_lpss tpm_tis_core mei ucsi_acpi idma64 processor_thermal_device
> > > > > > virt_dma tpm typec_ucsi
> > > > > > intel_rapl_common 8250_pci intel_soc_dts_iosf typec snd_pcm_oss
> > > > > > rng_core snd_mixer_oss tiny_power_button snd_pcm wmi battery button
> > > > > > snd_timer snd i2c_hid sound
> > > > > > core hid msr int3403_thermal evdev int340x_thermal_zone mac_hid
> > > > > > int3400_thermal acpi_thermal_rel intel_hid sparse_keymap
> > > > > > pinctrl_tigerlake intel_pmc_core acpi_
> > > > > > tad ac acpi_pad loop cpufreq_powersave tun tap
> > > > > > [  654.190754]  macvlan bridge stp llc kvm_intel kvm irqbypass
> > > > > > efivarfs ip_tables x_tables autofs4 ext4 crc32c_generic crc16 mbcache
> > > > > > jbd2 xhci_pci xhci_pci_ren
> > > > > > esas rtsx_pci_sdmmc xhci_hcd mmc_core atkbd libps2 usbcore thunderbolt
> > > > > > nvme nvme_core rtsx_pci crc32c_intel t10_pi crc_t10dif
> > > > > > crct10dif_generic crct10dif_pclmu
> > > > > > l usb_common crct10dif_common i8042 rtc_cmos serio dm_mod i915 video
> > > > > > intel_gtt i2c_algo_bit cec drm_kms_helper syscopyarea sysfillrect
> > > > > > sysimgblt fb_sys_fops dr
> > > > > > m i2c_core backlight agpgart
> > > > > > [  654.190811] CPU: 5 PID: 1208 Comm: NetworkManager Tainted: G
> > > > > > W I       5.10.0-rc4 #1-NixOS
> > > > > > [  654.190813] Hardware name: Dell Inc. XPS 13 9310/0F7M4C, BIOS 1.1.1
> > > > > > 10/05/2020
> > > > > > [  654.190825] RIP: 0010:__sta_info_destroy_part2+0x11c/0x140 [mac80211]
> > > > > > [  654.190829] Code: ff 0f 0b 80 bd 14 01 00 00 00 74 82 45 31 c0 b9
> > > > > > 01 00 00 00 48 89 ea 48 89 de 4c 89 e7 e8 ac ad ff ff 85 c0 0f 84 64
> > > > > > ff ff ff <0f> 0b e9 5
> > > > > > d ff ff ff be 03 00 00 00 48 89 ef e8 10 ea ff ff 85 c0
> > > > > > [  654.190831] RSP: 0018:ffffac81c0897b80 EFLAGS: 00010286
> > > > > > [  654.190834] RAX: 00000000fffffff5 RBX: ffff9d54d5800900 RCX:
> > > > > > 0000000000000000
> > > > > > [  654.190836] RDX: ffff9d54c3d0bf00 RSI: 000000000020001a RDI:
> > > > > > ffff9d54d629b5d8
> > > > > > [  654.190837] RBP: ffff9d54c778f000 R08: 0000000000000000 R09:
> > > > > > ffffffffc1245800
> > > > > > [  654.190838] R10: ffff9d54cde07800 R11: 0000000000000001 R12:
> > > > > > ffff9d54d6298800
> > > > > > [  654.190840] R13: ffff9d54d5800900 R14: 0000000000000001 R15:
> > > > > > ffff9d54d6298de0
> > > > > > [  654.190842] FS:  00007f1bf8509040(0000) GS:ffff9d5c2f740000(0000)
> > > > > > knlGS:0000000000000000
> > > > > > [  654.190844] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > > > > [  654.190845] CR2: 00007f6d3cb34000 CR3: 0000000118d9a006 CR4:
> > > > > > 0000000000770ee0
> > > > > > [  654.190847] PKRU: 55555554
> > > > > > [  654.190848] Call Trace:
> > > > > > [  654.190866]  __sta_info_flush+0x123/0x180 [mac80211]
> > > > > > [  654.190885]  ieee80211_set_disassoc+0xba/0x5d0 [mac80211]
> > > > > > [  654.190902]  ieee80211_mgd_deauth.cold+0x49/0x1bf [mac80211]
> > > > > > [  654.190923]  cfg80211_mlme_deauth+0xb1/0x1b0 [cfg80211]
> > > > > > [  654.190939]  cfg80211_mlme_down+0x66/0x90 [cfg80211]
> > > > > > [  654.190955]  cfg80211_disconnect+0x128/0x1b0 [cfg80211]
> > > > > > [  654.190967]  cfg80211_leave+0x27/0x40 [cfg80211]
> > > > > > [  654.190977]  cfg80211_netdev_notifier_call+0xec/0x440 [cfg80211]
> > > > > > [  654.190984]  raw_notifier_call_chain+0x44/0x60
> > > > > > [  654.190991]  __dev_close_many+0x5f/0x110
> > > > > > [  654.190995]  dev_close_many+0x81/0x130
> > > > > > [  654.190999]  dev_close.part.0+0x3e/0x70
> > > > > > [  654.191008]  cfg80211_shutdown_all_interfaces+0x71/0xd0 [cfg80211]
> > > > > > [  654.191017]  cfg80211_rfkill_set_block+0x22/0x30 [cfg80211]
> > > > > > [  654.191022]  rfkill_set_block+0x92/0x140 [rfkill]
> > > > > > [  654.191026]  rfkill_fop_write+0x11f/0x1c0 [rfkill]
> > > > > > [  654.191032]  vfs_write+0xc7/0x280
> > > > > > [  654.191035]  ksys_write+0xa7/0xe0
> > > > > > [  654.191041]  do_syscall_64+0x33/0x40
> > > > > > [  654.191045]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> > > > > > [  654.191048] RIP: 0033:0x7f1bf93906f7
> > > > > > [  654.191052] Code: 1f 40 00 41 54 49 89 d4 55 48 89 f5 53 89 fb 48
> > > > > > 83 ec 10 e8 fb fc ff ff 4c 89 e2 48 89 ee 89 df 41 89 c0 b8 01 00 00
> > > > > > 00 0f 05 <48> 3d 00 f
> > > > > > 0 ff ff 77 35 44 89 c7 48 89 44 24 08 e8 54 fd ff ff 48
> > > > > > [  654.191053] RSP: 002b:00007ffc79f67e10 EFLAGS: 00000293 ORIG_RAX:
> > > > > > 0000000000000001
> > > > > > [  654.191056] RAX: ffffffffffffffda RBX: 000000000000001d RCX: 00007f1bf93906f7
> > > > > > [  654.191057] RDX: 0000000000000008 RSI: 00007ffc79f67e48 RDI: 000000000000001d
> > > > > > [  654.191059] RBP: 00007ffc79f67e48 R08: 0000000000000000 R09: 0000000000000001
> > > > > > [  654.191060] R10: 0000000000000000 R11: 0000000000000293 R12: 0000000000000008
> > > > > > [  654.191061] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000001b10c20
> > > > > > [  654.191075] ---[ end trace 4fd47da3698c4a9f ]---
> > > > > > [  657.198288] ath11k_pci 0000:56:00.0: wmi command 20488 timeout
> > > > > > [  657.198293] ath11k_pci 0000:56:00.0: failed to send WMI_VDEV_SET_PARAM_CMDID
> > > > > > [  657.198299] ath11k_pci 0000:56:00.0: Failed to set CTS prot for VDEV: 0
> > > > > > [  660.205991] ath11k_pci 0000:56:00.0: wmi command 20488 timeout
> > > > > > [  660.205995] ath11k_pci 0000:56:00.0: failed to send WMI_VDEV_SET_PARAM_CMDID
> > > > > > [  660.206000] ath11k_pci 0000:56:00.0: Failed to set erp slot for VDEV: 0
> > > > > > [  663.213835] ath11k_pci 0000:56:00.0: wmi command 20488 timeout
> > > > > > [  663.213840] ath11k_pci 0000:56:00.0: failed to send WMI_VDEV_SET_PARAM_CMDID
> > > > > > [  663.213846] ath11k_pci 0000:56:00.0: Failed to set preamble for VDEV: 0
> > > > > > [  666.221628] ath11k_pci 0000:56:00.0: wmi command 20487 timeout
> > > > > > [  666.221633] ath11k_pci 0000:56:00.0: failed to submit WMI_VDEV_DOWN cmd
> > > > > > [  666.221639] ath11k_pci 0000:56:00.0: failed to down vdev 0: -11
> > > > > > [  669.229407] ath11k_pci 0000:56:00.0: wmi command 20493 timeout
> > > > > > [  669.229412] ath11k_pci 0000:56:00.0: failed to send
> > > > > > WMI_VDEV_SET_WMM_PARAMS_CMDID
> > > > > > [  669.229417] ath11k_pci 0000:56:00.0: failed to set wmm params: -11
> > > > > > [  672.237193] ath11k_pci 0000:56:00.0: wmi command 20493 timeout
> > > > > > [  672.237198] ath11k_pci 0000:56:00.0: failed to send
> > > > > > WMI_VDEV_SET_WMM_PARAMS_CMDID
> > > > > > [  672.237203] ath11k_pci 0000:56:00.0: failed to set wmm params: -11
> > > > > > [  675.244963] ath11k_pci 0000:56:00.0: wmi command 20493 timeout
> > > > > > [  675.244968] ath11k_pci 0000:56:00.0: failed to send
> > > > > > WMI_VDEV_SET_WMM_PARAMS_CMDID
> > > > > > [  675.244971] ath11k_pci 0000:56:00.0: failed to set wmm params: -11
> > > > > > [  678.252682] ath11k_pci 0000:56:00.0: wmi command 20493 timeout
> > > > > > [  678.252689] ath11k_pci 0000:56:00.0: failed to send
> > > > > > WMI_VDEV_SET_WMM_PARAMS_CMDID
> > > > > > [  678.252695] ath11k_pci 0000:56:00.0: failed to set wmm params: -11
> > > > > > [  681.260582] ath11k_pci 0000:56:00.0: wmi command 20486 timeout
> > > > > > [  681.260587] ath11k_pci 0000:56:00.0: failed to submit WMI_VDEV_STOP
> > > > > > cmd
> > > > > > [  681.260594] ath11k_pci 0000:56:00.0: failed to stop WMI vdev 0: -11
> > > > > > [  681.260596] ath11k_pci 0000:56:00.0: failed to stop vdev 0: -11
> > > > > > [  686.764099] ath11k_pci 0000:56:00.0: failed to flush transmit queue
> > > > > > 0
> > > > > > [  689.771891] ath11k_pci 0000:56:00.0: wmi command 20482 timeout
> > > > > > [  689.771897] ath11k_pci 0000:56:00.0: failed to submit
> > > > > > WMI_VDEV_DELETE_CMDID
> > > > > > [  689.771904] ath11k_pci 0000:56:00.0: failed to delete WMI vdev 0:
> > > > > > -11
> > > > > > [  719.529733] ath11k_pci 0000:56:00.0: wmi command 16387 timeout
> > > > > > [  719.529740] ath11k_pci 0000:56:00.0: failed to send
> > > > > > WMI_PDEV_SET_PARAM cmd
> > > > > > [  719.529748] ath11k_pci 0000:56:00.0: failed to enable PMF QOS: (-11
> > > > > > [  722.793499] ath11k_pci 0000:56:00.0: wmi command 16387 timeout
> > > > > > [  722.793517] ath11k_pci 0000:56:00.0: failed to send
> > > > > > WMI_PDEV_SET_PARAM cmd
> > > > > > [  722.793524] ath11k_pci 0000:56:00.0: failed to enable PMF QOS: (-11
> > > > > >
> > > > > > Apologies for the long output, hopefully something here is useful.
> > > > > >
> > > > > > I haven't had my whole system freeze yet like I did prior to these
> > > > > > patches, however I've only been running these patches for a few hours
> > > > > > so far, currently on my third boot.
> > > > > >
> > > > > > You can find the nix configuration I'm working on for the xps 9310
> > > > > > that includes the new patches here:
> > > > > >
> > > > > > https://github.com/NixOS/nixos-hardware/pull/207
> > > > > >
> > > > > > On Thu, Nov 19, 2020 at 8:52 PM Kalle Valo <kvalo@codeaurora.org> wrote:
> > > > > > >
> > > > > > > Kalle Valo <kvalo@codeaurora.org> writes:
> > > > > > >
> > > > > > > > (Bcc: people reporting qca6390 problems)
> > > > > > > >
> > > > > > > > Hi,
> > > > > > > >
> > > > > > > > I collected all important QCA6390 fixes to ath11k-qca6390 branch so that
> > > > > > > > there's a good baseline for all testing:
> > > > > > > >
> > > > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/log/?h=ath11k-qca6390-bringup
> > > > > > > >
> > > > > > > > At the moment it's based on v5.10-rc4 and I will try to update it to a
> > > > > > > > recent -rc release every few weeks or so. Everytime I update the branch
> > > > > > > > I create a new tag and the latest tag is now:
> > > > > > > >
> > > > > > > > ath11k-qca6390-bringup-202011191920
> > > > > > > >
> > > > > > > > In this tag there's now a brand new implementation for suspend, which
> > > > > > > > relies that the platform provides power to QCA6390 during suspend. Not
> > > > > > > > all platforms do, but most of them should do that. ath11k also prints a
> > > > > > > > warning whenever it notices that the firmware has crashed, but I'm not
> > > > > > > > sure yet if it (the MHI subsystem to be exact) can detect every case.
> > > > > > > >
> > > > > > > > The MSI patch is mostly the same, it had just some refactoring since the
> > > > > > > > last version. Unfortunately there's no solution still for the weird
> > > > > > > > crashes some people are seeing.
> > > > > > >
> > > > > > > Forgot to mention when debugging ath11k PCI issues it's a good idea to
> > > > > > > enable MHI debug messages. To do that enable CONFIG_MHI_BUS_DEBUG and
> > > > > > > CONFIG_DYNAMIC_DEBUG and run:
> > > > > > >
> > > > > > > sudo sh -c "echo -n 'module mhi +p' > /sys/kernel/debug/dynamic_debug/control"
> > > > > > >
> > > > > > > --
> > > > > > > https://patchwork.kernel.org/project/linux-wireless/list/
> > > > > > >
> > > > > > > https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
> > > > >
> > > > > --
> > > > > ath11k mailing list
> > > > > ath11k@lists.infradead.org
> > > > > http://lists.infradead.org/mailman/listinfo/ath11k
> > > >
> > > > So after your message I was wracking my brain to sort out any
> > > > differences between our configs.  I did disable vt / vt-d and that
> > > > seems to have increased the stability of things some, but I still see
> > > > occasional hangs on initialization / association.
> > >
> > > Good morning,
> > >
> > >   As I've been bouncing around reading up on the current kernel
> > > internals + the single MSI patch trying to get to a point where I can
> > > dive into this deeply, I think I may have found part of the racing.
> > > When I check /proc/interrupts to find the driver I see:
> > >
> > > 194:          0          0          0          0          0          0
> > >       7111          0   PCI-MSI 44564480-edge      ce0, ce1, ce2, ce3,
> > > ce5, ce7, ce8, DP_EXT_IRQ, DP_EXT_IRQ, DP_EXT_IRQ, DP_EXT_IRQ,
> > > DP_EXT_IRQ, DP_EXT_IRQ, DP_EXT_IRQ, DP_EXT_IRQ, DP_EXT_IRQ,
> > > DP_EXT_IRQ, bhi, mhi, mhi
> > >
> > > Looking at the patch, there are 4 places where IRQs are being
> > > requested, 2 in the MHI code (bhi/mhi), and 2 in the ath11k PCI code
> > > (ce* and DP_EXT_IRQ).  The patch changes the calls to
> > > request_(threaded)_irq and modifies the flags to add IRQ_SHARED which
> > > is allowing these irq handlers to mount this single available IRQ.
> > > Each handler is accepting the dev_id parameter as a void * which then
> > > gets cast into a relevant data structure for the handler and used /
> > > accessed.  My understanding from the reading I did is that since the
> > > IRQ is now shared, each of these handlers needs to ensure/detect that
> > > the dev_id is actually relevant for it to handle it, and if not return
> > > IRQ_NONE.  Is it possible the wrong handlers are being
> > > invoked/executing occasionally and casting/accessing things
> > > incorrectly, or did I misunderstand how the IRQ sharing works?  If I
> > > am reading that correctly, does that also have implications for the
> > > disabling/enabling of the IRQ everywhere?
> >
> > I went ahead and hacked a quick patch together that implements the
> > dev_id checking per interrupt handler and that seems to have fixed the
> > freezes without any indication.  Now reliably if things are going to
> > crash, I'll receive the RT throttling message from the scheduler and
> > then things will completely hang about a number of seconds later.  I
> > added the instrumentation to enable the verbose MHI printing, and it
> > seems the mhi_intvec_threaded_handler is printing some additional
> > information.  First, if things are behaving nominally, I see the state
> > transitions from m0 -> m1 -> m2 and then things stay mostly in m2 (I
> > can't say for 100%, it's quite fast).  However when things are
> > crashing, this printing is showing it.
> >
> > [  312.xxx] mhi 0000:55:00.0: local ee:AMSS device ee:AMSS dev_state:M2
> > [  313.024033] mhi 0000:55:00.0: local ee:INVALID_EE device
> > ee:INVALID_EE dev_state:SYS_ERR
> > [  313.024033] mhi 0000:55:00.0: System error detected
> >
> > I'll see the last 2 prints repeat a 5-6 times, then comes the throttling:
> >
> > [  313.124033] sched: RT throttling activated
> >
> > then a couple more attempts to reset the state of things, then the
> > machine will hang with the fans spinning fully.
>
> Sorry I found one more thing in my notes I wanted to mention.  In
> drivers/bus/mhi/core/main.c , mhi_process_ctrl_ev_ring , there is a
> switch handling different event types, one of those being
> MHI_PKT_TYPE_STATE_CHANGE_EVENT.  When that occurs this prints:
>
> dev_dbg(dev, "State change event to state: %s\n",
>     TO_MHI_STATE_STR(new_state));
>
> I never see a printed transition here from M1 -> M2 , the ee just
> updates from under the mhi_intvec_threaded_handler printing.  I'm not
> sure if that means somehow this event is being missed or it doesn't
> fire for this transition?

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
