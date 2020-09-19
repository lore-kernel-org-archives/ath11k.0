Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJXna-0005lN-5f
 for ath11k@lists.infradead.org; Sat, 19 Sep 2020 08:00:47 +0000
Received: by mail-pg1-x541.google.com with SMTP id u13so4865378pgh.1
 for <ath11k@lists.infradead.org>; Sat, 19 Sep 2020 01:00:44 -0700 (PDT)
MIME-Version: 1.0
From: Kenny Johansson <wirehell@gmail.com>
Date: Sat, 19 Sep 2020 10:00:31 +0200
Message-ID: <CAKuwtP2UbFTxj7bqXFNckJrYaocp=83Uctmxvwme9CcvcU6fkg@mail.gmail.com>
Subject: QCA6390 failure on unsuspend
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
To: ath11k@lists.infradead.org

Hi,

I've tried out the QCA6390 support as described in
https://lore.kernel.org/linux-wireless/87r1r4nukq.fsf@codeaurora.org/#t

I was able to get connectivity and experienced no issues while using
it for a couple of hours
, but after a suspend it stopped working. Here is the output from
dmesg for a boot, suspend, and unsuspend.

Kenny

[    7.375817] ath11k_pci 0000:6c:00.0: WARNING: ath11k PCI support is
experimental!
[    7.375859] ath11k_pci 0000:6c:00.0: BAR 0: assigned [mem
0xb4200000-0xb42fffff 64bit]
[    7.375872] ath11k_pci 0000:6c:00.0: enabling device (0000 -> 0002)
[    7.461615] ath11k_pci 0000:6c:00.0: aspm 0x42 changed to 0x40
[    7.461900] mhi 0000:6c:00.0: Requested to power ON
[    7.461965] mhi 0000:6c:00.0: Power on setup success
[    7.868867] ath11k_pci 0000:6c:00.0: chip_id 0x0 chip_family 0xb
board_id 0xff soc_id 0xffffffff
[    7.868869] ath11k_pci 0000:6c:00.0: fw_version 0x101c06cc
fw_build_timestamp 2020-06-24 19:50 fw_build_id
[    7.933569] ath11k_pci 0000:6c:00.0: Unknown eventid: 0x16005
[    8.069459] ath11k_pci 0000:6c:00.0 wlp108s0: renamed from wlan0
[    9.430355] rfkill: input handler disabled
[   10.320515] ath11k_pci 0000:6c:00.0: Unknown eventid: 0x1d00a
[   11.916103] wlp108s0: authenticate with ************
[   12.037738] wlp108s0: send auth to ************ (try 1/3)
[   12.042064] wlp108s0: authenticated
[   12.046314] wlp108s0: associate with ************ (try 1/3)
[   12.050815] wlp108s0: RX AssocResp from ************ (capab=0x1011
status=0 aid=1)
[   12.062868] wlp108s0: associated
[   12.103690] wlp108s0: Limiting TX power to 30 (30 - 0) dBm as
advertised by ************
[   12.158172] IPv6: ADDRCONF(NETDEV_CHANGE): wlp108s0: link becomes ready
---cut---
[   49.606985] PM: suspend entry (s2idle)
[   49.609553] Filesystems sync: 0.002 seconds
[   49.612362] Freezing user space processes ... (elapsed 0.001 seconds) done.
[   49.614151] OOM killer disabled.
[   49.614151] Freezing remaining freezable tasks ... (elapsed 0.001
seconds) done.
[   49.615356] printk: Suspending console(s) (use no_console_suspend to debug)
[   49.615558] wlp108s0: deauthenticating from ************** by local
choice (Reason: 3=DEAUTH_LEAVING)
[   49.994661] ACPI: EC: interrupt blocked
[   75.333084] ACPI: EC: interrupt unblocked
[   76.933206] nvme nvme0: 16/0/0 default/read/poll queues
[   80.122933] ath11k_pci 0000:6c:00.0: wmi command 16387 timeout
[   80.122939] ath11k_pci 0000:6c:00.0: failed to send WMI_PDEV_SET_PARAM cmd
[   80.122945] ath11k_pci 0000:6c:00.0: failed to set ac override for ARP: -11
[   80.122948] ------------[ cut here ]------------
[   80.122949] Hardware became unavailable upon resume. This could be
a software issue prior to suspend or a hardware issue.
[   80.123058] WARNING: CPU: 0 PID: 3026 at net/mac80211/util.c:2258
ieee80211_reconfig+0x9b/0x1550 [mac80211]
[   80.123067] Modules linked in: rfcomm ccm michael_mic uvcvideo
videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videobuf2_common
videodev mc qrtr_mhi cmac algif_hash algif_skcipher af_alg bnep
snd_hda_codec_hdmi snd_sof_pci snd_sof_intel_byt snd_sof_intel_ipc
snd_sof_intel_hda_common snd_soc_hdac_hda snd_sof_xtensa_dsp
snd_hda_codec_realtek snd_sof_intel_hda snd_sof snd_hda_codec_generic
snd_soc_skl snd_soc_sst_ipc snd_soc_sst_dsp snd_hda_ext_core
snd_soc_acpi_intel_match snd_soc_acpi snd_soc_core snd_compress
ac97_bus snd_pcm_dmaengine joydev snd_hda_intel mei_hdcp
intel_rapl_msr dell_laptop snd_intel_dspcfg ledtrig_audio
snd_hda_codec dell_smm_hwmon snd_hda_core x86_pkg_temp_thermal qrtr
intel_powerclamp snd_hwdep coretemp ns snd_pcm kvm_intel snd_seq_midi
snd_seq_midi_event ath11k_pci snd_rawmidi kvm mhi ath11k nls_iso8859_1
dell_wmi rapl qmi_helpers intel_cstate dell_smbios input_leds snd_seq
mac80211 mousedev dcdbas serio_raw efi_pstore hci_uart snd_seq_device
btqca snd_timer
[   80.123120]  cfg80211 btrtl dell_wmi_descriptor btbcm wmi_bmof
intel_wmi_thunderbolt btintel processor_thermal_device snd
hid_sensor_als hid_sensor_trigger intel_rapl_common
industrialio_triggered_buffer bluetooth ee1004 kfifo_buf
intel_soc_dts_iosf hid_multitouch soundcore hid_sensor_iio_common
8250_dw libarc4 industrialio mei_me mei ucsi_acpi cros_ec_ishtp
typec_ucsi cros_ec intel_pch_thermal typec ecdh_generic ecc
int3403_thermal int340x_thermal_zone mac_hid intel_hid int3400_thermal
sparse_keymap acpi_thermal_rel acpi_tad acpi_pad sch_fq_codel
parport_pc ppdev lp parport ip_tables x_tables autofs4 hid_sensor_hub
intel_ishtp_loader intel_ishtp_hid hid_generic i2c_designware_platform
i2c_designware_core i915 rtsx_pci_sdmmc crct10dif_pclmul crc32_pclmul
ghash_clmulni_intel i2c_algo_bit aesni_intel drm_kms_helper
crypto_simd cryptd syscopyarea sysfillrect glue_helper sysimgblt
fb_sys_fops cec psmouse nvme rc_core i2c_i801 nvme_core drm
thunderbolt i2c_smbus rtsx_pci intel_lpss_pci
[   80.123184]  intel_ish_ipc intel_lpss xhci_pci intel_ishtp idma64
xhci_pci_renesas i2c_hid wmi hid video pinctrl_cannonlake backlight
pinctrl_intel
[   80.123197] CPU: 0 PID: 3026 Comm: kworker/u32:66 Not tainted 5.9.0-rc1+ #1
[   80.123199] Hardware name: Dell Inc. XPS 15 9500/0HH6JF, BIOS 1.3.1
07/20/2020
[   80.123205] Workqueue: events_unbound async_run_entry_fn
[   80.123248] RIP: 0010:ieee80211_reconfig+0x9b/0x1550 [mac80211]
[   80.123252] Code: db e8 99 96 0f e3 41 c6 84 24 24 05 00 00 00 4c
89 e7 e8 28 48 fc ff 89 45 b8 85 c0 74 4d 48 c7 c7 20 7d e1 c0 e8 ea
7a 0d e3 <0f> 0b 4c 89 e7 e8 4b d0 ff ff e9 fd 02 00 00 80 7d 9f 00 0f
85 50
[   80.123255] RSP: 0018:ffffb69001b9bcf0 EFLAGS: 00010286
[   80.123258] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000027
[   80.123260] RDX: 0000000000000027 RSI: 0000000000000082 RDI: ffffa0e27b218cc8
[   80.123262] RBP: ffffb69001b9bd68 R08: 00000012a7b33073 R09: ffffffffa5c075c4
[   80.123263] R10: 00000000000004a1 R11: 0000000000026d24 R12: ffffa0e26f8887e0
[   80.123265] R13: ffffa0e26f8882e0 R14: ffffffffc0c0c270 R15: ffffa0e268443080
[   80.123268] FS:  0000000000000000(0000) GS:ffffa0e27b200000(0000)
knlGS:0000000000000000
[   80.123270] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   80.123272] CR2: 000055933fda8818 CR3: 00000002ef40e004 CR4: 00000000007706f0
[   80.123274] PKRU: 55555554
[   80.123275] Call Trace:
[   80.123286]  ? __enqueue_entity+0x96/0xa0
[   80.123323]  ? wiphy_suspend+0x290/0x290 [cfg80211]
[   80.123361]  ieee80211_resume+0x56/0x70 [mac80211]
[   80.123388]  wiphy_resume+0x81/0x130 [cfg80211]
[   80.123393]  dpm_run_callback+0x59/0x140
[   80.123397]  device_resume+0x13e/0x210
[   80.123401]  async_resume+0x1e/0x60
[   80.123404]  async_run_entry_fn+0x3c/0x150
[   80.123410]  process_one_work+0x1e8/0x3b0
[   80.123415]  worker_thread+0x4d/0x3f0
[   80.123420]  kthread+0x112/0x150
[   80.123425]  ? process_one_work+0x3b0/0x3b0
[   80.123428]  ? kthread_park+0x90/0x90
[   80.123434]  ret_from_fork+0x1f/0x30
[   80.123439] ---[ end trace 2911b458b31c3a72 ]---
[   80.123676] ------------[ cut here ]------------
[   80.123679] wlp108s0: Failed check-sdata-in-driver check, flags: 0x0
[   80.123757] WARNING: CPU: 0 PID: 3026 at
net/mac80211/driver-ops.c:97 drv_remove_interface+0x112/0x120
[mac80211]
[   80.123758] Modules linked in: rfcomm ccm michael_mic uvcvideo
videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videobuf2_common
videodev mc qrtr_mhi cmac algif_hash algif_skcipher af_alg bnep
snd_hda_codec_hdmi snd_sof_pci snd_sof_intel_byt snd_sof_intel_ipc
snd_sof_intel_hda_common snd_soc_hdac_hda snd_sof_xtensa_dsp
snd_hda_codec_realtek snd_sof_intel_hda snd_sof snd_hda_codec_generic
snd_soc_skl snd_soc_sst_ipc snd_soc_sst_dsp snd_hda_ext_core
snd_soc_acpi_intel_match snd_soc_acpi snd_soc_core snd_compress
ac97_bus snd_pcm_dmaengine joydev snd_hda_intel mei_hdcp
intel_rapl_msr dell_laptop snd_intel_dspcfg ledtrig_audio
snd_hda_codec dell_smm_hwmon snd_hda_core x86_pkg_temp_thermal qrtr
intel_powerclamp snd_hwdep coretemp ns snd_pcm kvm_intel snd_seq_midi
snd_seq_midi_event ath11k_pci snd_rawmidi kvm mhi ath11k nls_iso8859_1
dell_wmi rapl qmi_helpers intel_cstate dell_smbios input_leds snd_seq
mac80211 mousedev dcdbas serio_raw efi_pstore hci_uart snd_seq_device
btqca snd_timer
[   80.123807]  cfg80211 btrtl dell_wmi_descriptor btbcm wmi_bmof
intel_wmi_thunderbolt btintel processor_thermal_device snd
hid_sensor_als hid_sensor_trigger intel_rapl_common
industrialio_triggered_buffer bluetooth ee1004 kfifo_buf
intel_soc_dts_iosf hid_multitouch soundcore hid_sensor_iio_common
8250_dw libarc4 industrialio mei_me mei ucsi_acpi cros_ec_ishtp
typec_ucsi cros_ec intel_pch_thermal typec ecdh_generic ecc
int3403_thermal int340x_thermal_zone mac_hid intel_hid int3400_thermal
sparse_keymap acpi_thermal_rel acpi_tad acpi_pad sch_fq_codel
parport_pc ppdev lp parport ip_tables x_tables autofs4 hid_sensor_hub
intel_ishtp_loader intel_ishtp_hid hid_generic i2c_designware_platform
i2c_designware_core i915 rtsx_pci_sdmmc crct10dif_pclmul crc32_pclmul
ghash_clmulni_intel i2c_algo_bit aesni_intel drm_kms_helper
crypto_simd cryptd syscopyarea sysfillrect glue_helper sysimgblt
fb_sys_fops cec psmouse nvme rc_core i2c_i801 nvme_core drm
thunderbolt i2c_smbus rtsx_pci intel_lpss_pci
[   80.123850]  intel_ish_ipc intel_lpss xhci_pci intel_ishtp idma64
xhci_pci_renesas i2c_hid wmi hid video pinctrl_cannonlake backlight
pinctrl_intel
[   80.123862] CPU: 0 PID: 3026 Comm: kworker/u32:66 Tainted: G
W         5.9.0-rc1+ #1
[   80.123863] Hardware name: Dell Inc. XPS 15 9500/0HH6JF, BIOS 1.3.1
07/20/2020
[   80.123869] Workqueue: events_unbound async_run_entry_fn
[   80.123900] RIP: 0010:drv_remove_interface+0x112/0x120 [mac80211]
[   80.123904] Code: ff ff 48 8b 83 80 04 00 00 48 8d b3 a0 04 00 00
48 c7 c7 d0 60 e1 c0 c6 05 b8 64 0a 00 01 48 85 c0 48 0f 45 f0 e8 33
2d 11 e3 <0f> 0b e9 3b ff ff ff 0f 1f 80 00 00 00 00 0f 1f 44 00 00 55
48 89
[   80.123906] RSP: 0018:ffffb69001b9bb20 EFLAGS: 00010282
[   80.123909] RAX: 0000000000000000 RBX: ffffa0e2745d2940 RCX: 0000000000000027
[   80.123910] RDX: 0000000000000027 RSI: 0000000000000082 RDI: ffffa0e27b218cc8
[   80.123912] RBP: ffffb69001b9bb38 R08: 00000012a7be5482 R09: ffffffffa5c075c4
[   80.123914] R10: 00000000000004c6 R11: 0000000000025bd0 R12: ffffa0e26f8887e0
[   80.123916] R13: ffffa0e26f889920 R14: ffffa0e26f8887e0 R15: ffffa0e26f888ff0
[   80.123919] FS:  0000000000000000(0000) GS:ffffa0e27b200000(0000)
knlGS:0000000000000000
[   80.123921] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   80.123923] CR2: 000055933fda8818 CR3: 00000002ef40e004 CR4: 00000000007706f0
[   80.123924] PKRU: 55555554
[   80.123925] Call Trace:
[   80.123965]  ieee80211_do_stop+0x520/0x830 [mac80211]
[   80.123971]  ? _raw_spin_unlock_bh+0x1e/0x20
[   80.124001]  ? wiphy_suspend+0x290/0x290 [cfg80211]
[   80.124037]  ieee80211_stop+0x1a/0x20 [mac80211]
[   80.124042]  __dev_close_many+0xa2/0x110
[   80.124046]  dev_close_many+0x85/0x130
[   80.124051]  ? exc_invalid_op+0x19/0x70
[   80.124078]  ? wiphy_suspend+0x290/0x290 [cfg80211]
[   80.124082]  dev_close.part.0+0x44/0x70
[   80.124086]  dev_close+0x18/0x20
[   80.124108]  cfg80211_shutdown_all_interfaces+0x77/0xd0 [cfg80211]
[   80.124150]  ieee80211_handle_reconfig_failure+0x9d/0xb0 [mac80211]
[   80.124188]  ieee80211_reconfig+0xa5/0x1550 [mac80211]
[   80.124194]  ? __enqueue_entity+0x96/0xa0
[   80.124221]  ? wiphy_suspend+0x290/0x290 [cfg80211]
[   80.124257]  ieee80211_resume+0x56/0x70 [mac80211]
[   80.124283]  wiphy_resume+0x81/0x130 [cfg80211]
[   80.124287]  dpm_run_callback+0x59/0x140
[   80.124291]  device_resume+0x13e/0x210
[   80.124294]  async_resume+0x1e/0x60
[   80.124298]  async_run_entry_fn+0x3c/0x150
[   80.124303]  process_one_work+0x1e8/0x3b0
[   80.124308]  worker_thread+0x4d/0x3f0
[   80.124313]  kthread+0x112/0x150
[   80.124318]  ? process_one_work+0x3b0/0x3b0
[   80.124322]  ? kthread_park+0x90/0x90
[   80.124327]  ret_from_fork+0x1f/0x30
[   80.124331] ---[ end trace 2911b458b31c3a73 ]---
[   80.124364] ------------[ cut here ]------------
[   80.124395] WARNING: CPU: 0 PID: 3026 at
net/mac80211/driver-ops.c:36 drv_stop+0xfc/0x110 [mac80211]
[   80.124396] Modules linked in: rfcomm ccm michael_mic uvcvideo
videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videobuf2_common
videodev mc qrtr_mhi cmac algif_hash algif_skcipher af_alg bnep
snd_hda_codec_hdmi snd_sof_pci snd_sof_intel_byt snd_sof_intel_ipc
snd_sof_intel_hda_common snd_soc_hdac_hda snd_sof_xtensa_dsp
snd_hda_codec_realtek snd_sof_intel_hda snd_sof snd_hda_codec_generic
snd_soc_skl snd_soc_sst_ipc snd_soc_sst_dsp snd_hda_ext_core
snd_soc_acpi_intel_match snd_soc_acpi snd_soc_core snd_compress
ac97_bus snd_pcm_dmaengine joydev snd_hda_intel mei_hdcp
intel_rapl_msr dell_laptop snd_intel_dspcfg ledtrig_audio
snd_hda_codec dell_smm_hwmon snd_hda_core x86_pkg_temp_thermal qrtr
intel_powerclamp snd_hwdep coretemp ns snd_pcm kvm_intel snd_seq_midi
snd_seq_midi_event ath11k_pci snd_rawmidi kvm mhi ath11k nls_iso8859_1
dell_wmi rapl qmi_helpers intel_cstate dell_smbios input_leds snd_seq
mac80211 mousedev dcdbas serio_raw efi_pstore hci_uart snd_seq_device
btqca snd_timer
[   80.124433]  cfg80211 btrtl dell_wmi_descriptor btbcm wmi_bmof
intel_wmi_thunderbolt btintel processor_thermal_device snd
hid_sensor_als hid_sensor_trigger intel_rapl_common
industrialio_triggered_buffer bluetooth ee1004 kfifo_buf
intel_soc_dts_iosf hid_multitouch soundcore hid_sensor_iio_common
8250_dw libarc4 industrialio mei_me mei ucsi_acpi cros_ec_ishtp
typec_ucsi cros_ec intel_pch_thermal typec ecdh_generic ecc
int3403_thermal int340x_thermal_zone mac_hid intel_hid int3400_thermal
sparse_keymap acpi_thermal_rel acpi_tad acpi_pad sch_fq_codel
parport_pc ppdev lp parport ip_tables x_tables autofs4 hid_sensor_hub
intel_ishtp_loader intel_ishtp_hid hid_generic i2c_designware_platform
i2c_designware_core i915 rtsx_pci_sdmmc crct10dif_pclmul crc32_pclmul
ghash_clmulni_intel i2c_algo_bit aesni_intel drm_kms_helper
crypto_simd cryptd syscopyarea sysfillrect glue_helper sysimgblt
fb_sys_fops cec psmouse nvme rc_core i2c_i801 nvme_core drm
thunderbolt i2c_smbus rtsx_pci intel_lpss_pci
[   80.124472]  intel_ish_ipc intel_lpss xhci_pci intel_ishtp idma64
xhci_pci_renesas i2c_hid wmi hid video pinctrl_cannonlake backlight
pinctrl_intel
[   80.124482] CPU: 0 PID: 3026 Comm: kworker/u32:66 Tainted: G
W         5.9.0-rc1+ #1
[   80.124483] Hardware name: Dell Inc. XPS 15 9500/0HH6JF, BIOS 1.3.1
07/20/2020
[   80.124488] Workqueue: events_unbound async_run_entry_fn
[   80.124517] RIP: 0010:drv_stop+0xfc/0x110 [mac80211]
[   80.124520] Code: 0a 00 4d 85 e4 74 1e 49 8b 04 24 49 8b 7c 24 08
49 83 c4 18 48 89 de e8 c2 25 e7 e3 49 8b 04 24 48 85 c0 75 e6 e9 42
ff ff ff <0f> 0b 5b 41 5c 5d c3 66 66 2e 0f 1f 84 00 00 00 00 00 66 90
0f 1f
[   80.124522] RSP: 0018:ffffb69001b9bb10 EFLAGS: 00010246
[   80.124524] RAX: 0000000000000000 RBX: ffffa0e26f8887e0 RCX: 0000000000000000
[   80.124526] RDX: ffffa0e276bee200 RSI: 0000000000000282 RDI: ffffa0e26f8887e0
[   80.124528] RBP: ffffb69001b9bb20 R08: 00000012a7be5482 R09: ffffffffa5c075c4
[   80.124529] R10: 00000000000004c6 R11: 0000000000025bd0 R12: ffffa0e26f8887e0
[   80.124531] R13: ffffa0e26f889920 R14: ffffa0e26f8887e0 R15: ffffa0e26f888ff0
[   80.124534] FS:  0000000000000000(0000) GS:ffffa0e27b200000(0000)
knlGS:0000000000000000
[   80.124536] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   80.124538] CR2: 000055933fda8818 CR3: 00000002ef40e004 CR4: 00000000007706f0
[   80.124539] PKRU: 55555554
[   80.124540] Call Trace:
[   80.124579]  ieee80211_stop_device+0x46/0x50 [mac80211]
[   80.124611]  ieee80211_do_stop+0x54d/0x830 [mac80211]
[   80.124615]  ? _raw_spin_unlock_bh+0x1e/0x20
[   80.124643]  ? wiphy_suspend+0x290/0x290 [cfg80211]
[   80.124675]  ieee80211_stop+0x1a/0x20 [mac80211]
[   80.124680]  __dev_close_many+0xa2/0x110
[   80.124683]  dev_close_many+0x85/0x130
[   80.124688]  ? exc_invalid_op+0x19/0x70
[   80.124714]  ? wiphy_suspend+0x290/0x290 [cfg80211]
[   80.124718]  dev_close.part.0+0x44/0x70
[   80.124721]  dev_close+0x18/0x20
[   80.124744]  cfg80211_shutdown_all_interfaces+0x77/0xd0 [cfg80211]
[   80.124782]  ieee80211_handle_reconfig_failure+0x9d/0xb0 [mac80211]
[   80.124818]  ieee80211_reconfig+0xa5/0x1550 [mac80211]
[   80.124824]  ? __enqueue_entity+0x96/0xa0
[   80.124850]  ? wiphy_suspend+0x290/0x290 [cfg80211]
[   80.124885]  ieee80211_resume+0x56/0x70 [mac80211]
[   80.124911]  wiphy_resume+0x81/0x130 [cfg80211]
[   80.124915]  dpm_run_callback+0x59/0x140
[   80.124919]  device_resume+0x13e/0x210
[   80.124922]  async_resume+0x1e/0x60
[   80.124926]  async_run_entry_fn+0x3c/0x150
[   80.124931]  process_one_work+0x1e8/0x3b0
[   80.124936]  worker_thread+0x4d/0x3f0
[   80.124941]  kthread+0x112/0x150
[   80.124945]  ? process_one_work+0x3b0/0x3b0
[   80.124949]  ? kthread_park+0x90/0x90
[   80.124954]  ret_from_fork+0x1f/0x30
[   80.124958] ---[ end trace 2911b458b31c3a74 ]---
[   80.125145] PM: dpm_run_callback(): wiphy_resume+0x0/0x130
[cfg80211] returns -11
[   80.125159] PM: Device phy0 failed to resume async: error -11
[   80.136519] OOM killer enabled.
[   80.136521] Restarting tasks ... done.
[   80.186874] PM: suspend exit
[   83.450669] ath11k_pci 0000:6c:00.0: wmi command 16387 timeout
[   83.450671] ath11k_pci 0000:6c:00.0: failed to send WMI_PDEV_SET_PARAM cmd
[   83.450673] ath11k_pci 0000:6c:00.0: failed to enable PMF QOS: (-11
[   88.826874] ath11k_pci 0000:6c:00.0: wmi command 16387 timeout
[   88.826879] ath11k_pci 0000:6c:00.0: failed to send WMI_PDEV_SET_PARAM cmd
[   88.826885] ath11k_pci 0000:6c:00.0: failed to enable PMF QOS: (-11
[   91.898721] ath11k_pci 0000:6c:00.0: wmi command 16387 timeout
[   91.898725] ath11k_pci 0000:6c:00.0: failed to send WMI_PDEV_SET_PARAM cmd
[   91.898730] ath11k_pci 0000:6c:00.0: failed to enable PMF QOS: (-11
[  105.214652] ath11k_pci 0000:6c:00.0: wmi command 16387 timeout
[  105.214653] ath11k_pci 0000:6c:00.0: failed to send WMI_PDEV_SET_PARAM cmd
[  105.214655] ath11k_pci 0000:6c:00.0: failed to enable PMF QOS: (-11
[  108.282890] ath11k_pci 0000:6c:00.0: wmi command 16387 timeout
[  108.282894] ath11k_pci 0000:6c:00.0: failed to send WMI_PDEV_SET_PARAM cmd
[  108.282899] ath11k_pci 0000:6c:00.0: failed to enable PMF QOS: (-11
[  122.106734] ath11k_pci 0000:6c:00.0: wmi command 16387 timeout
[  122.106738] ath11k_pci 0000:6c:00.0: failed to send WMI_PDEV_SET_PARAM cmd
[  122.106744] ath11k_pci 0000:6c:00.0: failed to enable PMF QOS: (-11
[  125.178643] ath11k_pci 0000:6c:00.0: wmi command 16387 timeout
[  125.178647] ath11k_pci 0000:6c:00.0: failed to send WMI_PDEV_SET_PARAM cmd
[  125.178654] ath11k_pci 0000:6c:00.0: failed to enable PMF QOS: (-11
[  138.234891] ath11k_pci 0000:6c:00.0: wmi command 16387 timeout
[  138.234896] ath11k_pci 0000:6c:00.0: failed to send WMI_PDEV_SET_PARAM cmd
[  138.234902] ath11k_pci 0000:6c:00.0: failed to enable PMF QOS: (-11
[  141.306645] ath11k_pci 0000:6c:00.0: wmi command 16387 timeout
[  141.306650] ath11k_pci 0000:6c:00.0: failed to send WMI_PDEV_SET_PARAM cmd
[  141.306656] ath11k_pci 0000:6c:00.0: failed to enable PMF QOS: (-11
[  155.130655] ath11k_pci 0000:6c:00.0: wmi command 16387 timeout
[  155.130656] ath11k_pci 0000:6c:00.0: failed to send WMI_PDEV_SET_PARAM cmd
[  155.130658] ath11k_pci 0000:6c:00.0: failed to enable PMF QOS: (-11
[  158.202902] ath11k_pci 0000:6c:00.0: wmi command 16387 timeout
[  158.202906] ath11k_pci 0000:6c:00.0: failed to send WMI_PDEV_SET_PARAM cmd
[  158.202913] ath11k_pci 0000:6c:00.0: failed to enable PMF QOS: (-11

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
