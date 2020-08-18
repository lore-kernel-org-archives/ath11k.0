Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8BQF-0002sc-MZ
 for ath11k@lists.infradead.org; Tue, 18 Aug 2020 23:53:44 +0000
Received: from [192.168.254.6] (unknown [50.34.202.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail3.candelatech.com (Postfix) with ESMTPSA id 5AF8613C2B0
 for <ath11k@lists.infradead.org>; Tue, 18 Aug 2020 16:53:42 -0700 (PDT)
From: Ben Greear <greearb@candelatech.com>
Subject: Hastings: kernel bug on rmmod at drivers/pci/msi.c:375
Message-ID: <1005491c-24ec-1c67-5762-59e337913ff3@candelatech.com>
Date: Tue, 18 Aug 2020 16:53:41 -0700
MIME-Version: 1.0
Content-Language: en-MW
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org

I cloned kvallo's ath tree today and tried it on a system with one of the Hastings
NICs in it.  Firmware wasn't in my file system, so it didn't load.  I put FW into
place and did 'rmmod ath11k_pci ath11k' and got the splat below:

[  520.273845] ------------[ cut here ]------------
[  520.273848] kernel BUG at drivers/pci/msi.c:375!
[  520.277302] invalid opcode: 0000 [#1] PREEMPT SMP
[  520.280889] CPU: 4 PID: 4760 Comm: rmmod Not tainted 5.8.0-rc7-wt-ath+ #1
[  520.286566] Hardware name: Default string Default string/SKYBAY, BIOS 5.12 02/19/2019
[  520.293368] RIP: 0010:free_msi_irqs+0x168/0x190
[  520.296714] Code: 14 85 c0 0f 84 e4 fe ff ff 31 ed eb 0f 83 c5 01 39 6b 14 0f 86 d4 fe ff ff 8b 7b 10 01 ef e8 9f d0 b3 ff 48 83 78 70 00 74 e3 <0f> 0b 49 8d 
b5 b0 00 00 00 e8 ca 8e b4 ff e9 d6 fe ff ff 48 8b 7d
[  520.314895] RSP: 0018:ffffc900068c7de0 EFLAGS: 00010282
[  520.318990] RAX: ffff8882559acc00 RBX: ffff88825a5b4700 RCX: 0000000000000000
[  520.325080] RDX: ffff8882543ec6d8 RSI: ffff8882543ec778 RDI: 00000000000000cf
[  520.331157] RBP: 0000000000000000 R08: ffff8882559acc00 R09: ffffffff82880c88
[  520.337257] R10: 0000000000000000 R11: 0000000000000000 R12: ffff88825b9424b8
[  520.343361] R13: ffff88825b942000 R14: ffffffffa0176250 R15: 0000000000000000
[  520.349427] FS:  00007f518244f740(0000) GS:ffff88826dd00000(0000) knlGS:0000000000000000
[  520.356533] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  520.361163] CR2: 00005581d5bdc258 CR3: 00000002558f4003 CR4: 00000000003606e0
[  520.367254] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  520.373354] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  520.379456] Call Trace:
[  520.380653]  ath11k_pci_remove+0x2b/0x90 [ath11k_pci]
[  520.384565]  pci_device_remove+0x31/0x90
[  520.387292]  __device_release_driver+0x15a/0x210
[  520.390742]  driver_detach+0xcf/0x110
[  520.393210]  bus_remove_driver+0x56/0xca
[  520.395942]  pci_unregister_driver+0x36/0x80
[  520.399000]  __do_sys_delete_module.constprop.0+0x16f/0x2b0
[  520.403439]  ? ktime_get_coarse_real_ts64+0x9/0x40
[  520.407078]  ? syscall_trace_enter+0x10f/0x240
[  520.410356]  do_syscall_64+0x56/0xe0
[  520.412721]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  520.416656] RIP: 0033:0x7f5182577a9b
[  520.419019] Code: 73 01 c3 48 8b 0d ed 33 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa b8 b0 00 00 00 0f 05 <48> 3d 01 f0 
ff ff 73 01 c3 48 8b 0d bd 33 0c 00 f7 d8 64 89 01 48
[  520.437300] RSP: 002b:00007fff59e06dd8 EFLAGS: 00000206 ORIG_RAX: 00000000000000b0
[  520.443815] RAX: ffffffffffffffda RBX: 00005581d5bd1830 RCX: 00007f5182577a9b
[  520.449902] RDX: 000000000000000a RSI: 0000000000000800 RDI: 00005581d5bd1898
[  520.455967] RBP: 00007fff59e06e38 R08: 0000000000000000 R09: 0000000000000000
[  520.462076] R10: 00007f51825ebac0 R11: 0000000000000206 R12: 00007fff59e07000
[  520.468170] R13: 00007fff59e08680 R14: 00005581d5bd12a0 R15: 00005581d5bd1830
[  520.474255] Modules linked in: nf_conntrack_netlink nf_conntrack nfnetlink nf_defrag_ipv6 nf_defrag_ipv4 bpfilter vrf iwlmvm iwlwifi 8021q garp mrp stp llc 
macvlan pktgen f71882fg sunrpc snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_intel qrtr snd_intel_dspcfg ns snd_hda_codec 
ath10k_pci ath11k_pci(-) snd_hda_core ath10k_core mhi snd_hwdep ath11k snd_seq iTCO_wdt ath intel_rapl_msr qmi_helpers intel_pmc_bxt snd_seq_device coretemp 
intel_rapl_common iTCO_vendor_support ee1004 snd_pcm mac80211 snd_timer x86_pkg_temp_thermal snd intel_powerclamp intel_wmi_thunderbolt i2c_i801 cfg80211 
soundcore i2c_smbus mei_hdcp mei_wdt intel_pch_thermal acpi_pad sch_fq_codel raid1 dm_raid raid456 libcrc32c async_raid6_recov async_memcpy async_pq async_xor 
xor async_tx raid6_pq igb i915 intel_gtt i2c_algo_bit drm_kms_helper cec rc_core drm ixgbe agpgart mdio hwmon dca xhci_pci i2c_core xhci_pci_renesas wmi video 
fuse [last unloaded: nf_conntrack]
[  520.562021] ---[ end trace fe624797b2d2d407 ]---
[  520.565470] RIP: 0010:free_msi_irqs+0x168/0x190
[  520.568806] Code: 14 85 c0 0f 84 e4 fe ff ff 31 ed eb 0f 83 c5 01 39 6b 14 0f 86 d4 fe ff ff 8b 7b 10 01 ef e8 9f d0 b3 ff 48 83 78 70 00 74 e3 <0f> 0b 49 8d 
b5 b0 00 00 00 e8 ca 8e b4 ff e9 d6 fe ff ff 48 8b 7d
[  520.586960] RSP: 0018:ffffc900068c7de0 EFLAGS: 00010282
[  520.591023] RAX: ffff8882559acc00 RBX: ffff88825a5b4700 RCX: 0000000000000000
[  520.597086] RDX: ffff8882543ec6d8 RSI: ffff8882543ec778 RDI: 00000000000000cf
[  520.603169] RBP: 0000000000000000 R08: ffff8882559acc00 R09: ffffffff82880c88
[  520.609260] R10: 0000000000000000 R11: 0000000000000000 R12: ffff88825b9424b8
[  520.615363] R13: ffff88825b942000 R14: ffffffffa0176250 R15: 0000000000000000
[  520.621444] FS:  00007f518244f740(0000) GS:ffff88826dd00000(0000) knlGS:0000000000000000
[  520.628534] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  520.633170] CR2: 00005581d5bdc258 CR3: 00000002558f4003 CR4: 00000000003606e0
[  520.639303] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  520.645366] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
