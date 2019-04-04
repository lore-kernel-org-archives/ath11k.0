Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-delivery-195.mimecast.com ([63.128.21.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hC3BZ-0003pd-91
 for ath11k@lists.infradead.org; Thu, 04 Apr 2019 14:17:47 +0000
Received: by mail-pg1-f197.google.com with SMTP id x2so1644877pge.16
 for <ath11k@lists.infradead.org>; Thu, 04 Apr 2019 07:17:41 -0700 (PDT)
Received: from bentobox.localnet ([2001:16b8:55d5:6efa::e4d])
 by smtp.gmail.com with ESMTPSA id l184sm44528880pfc.98.2019.04.04.07.17.37
 for <ath11k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 04 Apr 2019 07:17:38 -0700 (PDT)
From: Sven Eckelmann <seckelmann@datto.com>
Subject: ath11k: Firmware WLAN.HK.2.1.0.1-00113-QCAHKSWPL_SILICONZ-1 BDF
 mapping
Date: Thu, 04 Apr 2019 16:17:31 +0200
Message-ID: <1775657.NEkFaWULJY@bentobox>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6196795390226996276=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org

--===============6196795390226996276==
Content-Type: multipart/signed; boundary="nextPart8642784.Z0BxYOtq9S"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart8642784.Z0BxYOtq9S
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi,

we've noticed that our rev 2 boards don't really work with ath11k. We got the 
suggestion to use firmware 2.1.0.1 [1] to solve some of the problems. So I've 
updated to the version which John received and just tried to boot the device. 
The newest ath11k was installed and I got a crash [2] during the device 
bringup.

The problem seems to be here that ath11k_qmi_load_bdf calls
ath11k_qmi_prepare_bdf_download to get the ATH11K_QMI_FILE_TYPE_BDF_GOLDEN -
which at the end does a
memcpy(0xffffff8007480000, 0xffffff80074e1094, 131072) when it crashes.
The 131072 bytes comes from the boardata btw (fw.board_size says 262144 byte).
Source address is the loaded BDF and target address is the iomap'ped
qcom,bdf-addr.

John already mentioned this problem before but maybe there are still some 
patches which Kalle didn't merge and which solve the problem during bringup.
Or do we need some u-boot adjustments to use a different qcom,bdf-address or
qcom,tgt-mem-mode? Both bdf-addresses point to 0x4be00000 and tgt-mem-mode
is 0 at the moment.


Kind regards,
	Sven

[1] http://lists.infradead.org/pipermail/ath11k/2019-April/000001.html
[2] Log:

[    9.843453] ath11k c000000.wifi: Target: chip_id: 0x0, chip_family: 0x0, board_id: 0x211, soc_id: 0xffffffff, fw_version: 0x30a84a5
[    9.844297] ath11k c000000.wifi: Downloading BDF: IPQ8074/board-2.bin, size: 917972
[    9.844306] Unhandled fault: alignment fault (0x96000061) at 0xffffff8007480004
[    9.844310] Internal error: : 96000061 [#1] PREEMPT SMP
[    9.844357] Modules linked in: ath11k(+) pppox ppp_generic nf_nat_ipv4 nf_conntrack_ipv6 nf_conntrack_ipv4 mac80211 ipt_REJECT ipt_MASQUERADE cfg80211 xt_time xt_tcpudp xt_state xt_nat xt_multiport xt_mark xt_mac xt_limit xt_conntrack xt_comment xt_TCPMSS xt_REDIRECT xt_LOG xt_CT slhc nf_reject_ipv4 nf_nat_redirect nf_nat_masquerade_ipv4 nf_nat nf_log_ipv4 nf_defrag_ipv6 nf_defrag_ipv4 nf_conntrack_rtcache nf_conntrack iptable_mangle iptable_filter ip_tables crc_ccitt compat ip6t_REJECT nf_reject_ipv6 nf_log_ipv6 nf_log_common ip6table_mangle ip6table_filter ip6_tables x_tables qca_nss_drv qca_nss_dp qca_ssdk gpio_button_hotplug
[    9.844362] CPU: 2 PID: 1922 Comm: kworker/u8:2 Not tainted 4.4.60 #0
[    9.844363] Hardware name: Qualcomm Technologies, Inc. IPQ807x/AP-HK01-C1 (DT)
[    9.844430] Workqueue: ath11k_qmi_wq ath11k_qmi_event_work [ath11k]
[    9.844432] task: ffffffc001580000 ti: ffffffc001580000 task.ti: ffffffc001580000
[    9.844438] PC is at __efistub_memcpy+0x48/0x180
[    9.844490] LR is at ath11k_htc_init+0xbb4/0xcbc [ath11k]
[    9.844492] pc : [<ffffffc0002538c8>] lr : [<ffffffbffc57b118>] pstate: 00000145
[    9.844492] sp : ffffffc0397c7bf0
[    9.844494] x29: ffffffc0397c7bf0 x28: ffffff8007480000
[    9.844496] x27: 0000000000000000 x26: ffffffc0397fe000
[    9.844498] x25: ffffffc0397c7d38 x24: ffffffc03903e00c
[    9.844500] x23: ffffff8007480000 x22: 00000000fffffff4
[    9.844502] x21: ffffffc001cce808 x20: ffffffc0397f0000
[    9.844504] x19: 0000000000020000 x18: 0000000000000000
[    9.844506] x17: 0000007fa9a26b60 x16: ffffffc0000955c4
[    9.844508] x15: 0000000000000000 x14: 3a657a6973202c6e
[    9.844509] x13: 69622e322d647261 x12: 0000000000000000
[    9.844511] x11: fffffffffffffffc x10: 0000000000000004
[    9.844513] x9 : 0000000000000008 x8 : 0000000000000004
[    9.844515] x7 : ffffffffffffffff x6 : ffffff8007480004
[    9.844517] x5 : 0080000000000000 x4 : 000000000000000c
[    9.844519] x3 : 4f6b800000000000 x2 : 000000000001fff4
[    9.844521] x1 : ffffff80074e10a0 x0 : ffffff8007480000
[    9.844521]
[    9.844523] Process kworker/u8:2 (pid: 1922, stack limit = 0xffffffc0397c4000)
[    9.844524] Stack: (0xffffffc0397c7bf0 to 0xffffffc0397c8000)
[    9.844527] 7be0:                                   ffffffc0397c7cb0 ffffffbffc57b6c0
[    9.844529] 7c00: ffffffc0397f0000 ffffffc03903e000 ffffffc0395a9c00 00000000fffffff4
[    9.844532] 7c20: ffffffc0397f0050 ffffffc0397f00b0 ffffffc0397c7d38 ffffff80074bffff
[    9.844534] 7c40: ffffffc000000000 ffffff80074bffff ffffffc0395a9d80 ffffff80074e1094
[    9.844536] 7c60: 0000000000020000 ffffffc00008f738 ffffffc0397f0000 ffffffc03903e000
[    9.844538] 7c80: ffffffc0395a9c00 00000000fffffff4 ffffffc0397f0050 ffffffbffc57b5e4
[    9.844540] 7ca0: ffffffc0397c7cb0 cb88537fdc8ba63c ffffffc0397c7d80 ffffffc0000a5860
[    9.844543] 7cc0: ffffffc03955c100 ffffffc00fb44800 ffffffc0397f0050 0000000000000000
[    9.844545] 7ce0: ffffffc00155a800 0000000000000000 0000000000000000 0000000000000000
[    9.844547] 7d00: ffffffc001cce000 0000000000000000 ffffffc0397fe1a8 ffffffc0397f00a0
[    9.844549] 7d20: ffffffc001cce000 0000000000000000 00000007397c7d80 4be000004be00000
[    9.844551] 7d40: ffffffc03955c100 000018260fb40025 ffffffbffc5a0058 ffffffc0000a593c
[    9.844553] 7d60: 0000000739550025 ffffffbffc5a0238 ffffffc0397f0070 ffffffc0000a5894
[    9.844556] 7d80: ffffffc0397c7dc0 ffffffc0000a6544 ffffffc03955c100 ffffffc001d3dab2
[    9.844558] 7da0: ffffffc00fb44800 ffffffc03955c130 ffffffc00fb44818 ffffffc001580000
[    9.844560] 7dc0: ffffffc0397c7e20 ffffffc0000aabb4 ffffffc0014bed80 ffffffc001d42560
[    9.844562] 7de0: ffffffc0006b6110 ffffffc03955c100 ffffffc0000a6300 0000000000000000
[    9.844565] 7e00: 0000000000000000 0000000000000000 0000000000000000 ffffffc03955c100
[    9.844567] 7e20: 0000000000000000 ffffffc000085550 ffffffc0000aaae8 ffffffc0014bed80
[    9.844569] 7e40: 0000000000000000 0000000000000000 0000000000000000 000000000000005e
[    9.844571] 7e60: ffffffc00050b000 0000000000000000 ffffffc0397c7ea0 ffffffc03955c100
[    9.844573] 7e80: ffffffc000000000 ffffffc000000000 ffffffc0397c7e90 ffffffc0397c7e90
[    9.844575] 7ea0: 0000000000000000 ffffffc000000000 ffffffc0397c7eb0 ffffffc0397c7eb0
[    9.844577] 7ec0: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    9.844579] 7ee0: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    9.844581] 7f00: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    9.844583] 7f20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    9.844585] 7f40: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    9.844587] 7f60: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    9.844589] 7f80: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    9.844591] 7fa0: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    9.844593] 7fc0: 0000000000000000 0000000000000005 0000000000000000 0000000000000000
[    9.844595] 7fe0: 0000000000000000 0000000000000000 b088a0288ca962e8 14550004261d8c40
[    9.844598] [<ffffffc0002538c8>] __efistub_memcpy+0x48/0x180
[    9.844651] [<ffffffbffc57b6c0>] ath11k_qmi_event_work+0x454/0x6bc [ath11k]
[    9.844657] [<ffffffc0000a5860>] process_one_work+0x1a8/0x298
[    9.844660] [<ffffffc0000a6544>] worker_thread+0x244/0x360
[    9.844663] [<ffffffc0000aabb4>] kthread+0xcc/0xd4
[    9.844666] [<ffffffc000085550>] ret_from_fork+0x10/0x40
[    9.844669] Code: b8404423 b80044c3 36180064 f8408423 (f80084c3)
[    9.844672] ---[ end trace 0441efe3bbdfab2e ]---
[    9.844674] Kernel panic - not syncing: Fatal exception
[    9.844680] CPU0: stopping
[    9.844683] CPU: 0 PID: 1927 Comm: sh Tainted: G      D         4.4.60 #0
[    9.844684] Hardware name: Qualcomm Technologies, Inc. IPQ807x/AP-HK01-C1 (DT)
[    9.844685] Call trace:
[    9.844689] [<ffffffc000087b74>] dump_backtrace+0x0/0xf0
[    9.844691] [<ffffffc000087c78>] show_stack+0x14/0x1c
[    9.844694] [<ffffffc000254c40>] dump_stack+0x94/0xb4
[    9.844696] [<ffffffc00008c160>] handle_IPI+0xcc/0x134
[    9.844698] [<ffffffc000081ca8>] gic_handle_irq+0x94/0xbc
[    9.844700] Exception stack(0xffffffc03906be90 to 0xffffffc03906bfc0)
[    9.844702] be80:                                   0000000000000000 000000003d2a4000
[    9.844704] bea0: ffffffffffffffff 0000000000423fd4 0000000080000000 0000000000000000
[    9.844706] bec0: 000000002cd81020 000000002cd81218 0000000000473000 0000000000000000
[    9.844708] bee0: fefefefefefefeff 171e21185d030a09 0000007fb61cca20 0000000000000000
[    9.844710] bf00: 00000000000000d6 000000000000000b 0000000000000000 0000000000000000
[    9.844712] bf20: 0000000000000000 0000000000000001 0000000000000038 0000000000000000
[    9.844714] bf40: 0000000000472f30 0000007fb619de80 0000000000000000 0000000000473000
[    9.844716] bf60: 0000000000000022 0000007fb61cb020 00000000004734f4 0000000000000001
[    9.844718] bf80: 0000000000000000 0000000000000000 0000000000000000 0000007fe6a1dc10
[    9.844720] bfa0: 0000000000000001 0000007fe6a1da50 0000000000429b9c 0000007fe6a1da00
[    9.844722] [<ffffffc00008539c>] el0_irq_naked+0x14/0x18
[    9.844723] CPU3: stopping
[    9.844726] CPU: 3 PID: 0 Comm: swapper/3 Tainted: G      D         4.4.60 #0
[    9.844727] Hardware name: Qualcomm Technologies, Inc. IPQ807x/AP-HK01-C1 (DT)
[    9.844728] Call trace:
[    9.844730] [<ffffffc000087b74>] dump_backtrace+0x0/0xf0
[    9.844733] [<ffffffc000087c78>] show_stack+0x14/0x1c
[    9.844735] [<ffffffc000254c40>] dump_stack+0x94/0xb4
[    9.844736] [<ffffffc00008c160>] handle_IPI+0xcc/0x134
[    9.844738] [<ffffffc000081ca8>] gic_handle_irq+0x94/0xbc
[    9.844739] Exception stack(0xffffffc00fbcfe20 to 0xffffffc00fbcff50)
[    9.844742] fe20: 0000000000000000 0000008000000000 ffffffc00fbcff80 ffffffc000085d50
[    9.844744] fe40: 0000000060000145 0000000000000000 0000000000000000 0000000000000000
[    9.844746] fe60: 0000000000000001 0000000000000000 0100000000000000 ffffffc001cce848
[    9.844748] fe80: 00000000000003d0 414d495f43510042 ffffffc00fbc1130 ffffffc00fbcfef0
[    9.844750] fea0: 0000000000000650 2e302e312e322e4b 2d36353030302d31 5057534b48414351
[    9.844752] fec0: 4f43494c49535f4c 003b9aca00000000 ffffffc00016727c 0000007f8eea17d4
[    9.844754] fee0: 0000000000000000 0000000000000000 ffffffc001cb4008 0000000000000000
[    9.844756] ff00: ffffffc001cb49e0 0000000000000000 0000000000000000 0000000042d88000
[    9.844758] ff20: 0000000042d8b000 ffffffc000081fd0 0000000000000000 ffffffc00fbcff80
[    9.844760] ff40: ffffffc000085d4c ffffffc00fbcff80
[    9.844762] [<ffffffc000084e7c>] el1_irq+0x7c/0xf4
[    9.844766] [<ffffffc0000c0354>] default_idle_call+0x20/0x28
[    9.844768] [<ffffffc0000c0500>] cpu_startup_entry+0x158/0x20c
[    9.844770] [<ffffffc00008bd4c>] secondary_start_kernel+0x130/0x13c
[    9.844772] [<0000000041081fbc>] 0x41081fbc
[    9.850172] CPU1: stopping
[    9.850174] CPU: 1 PID: 194 Comm: kmodloader Tainted: G      D         4.4.60 #0
[    9.850175] Hardware name: Qualcomm Technologies, Inc. IPQ807x/AP-HK01-C1 (DT)
[    9.850176] Call trace:
[    9.850178] [<ffffffc000087b74>] dump_backtrace+0x0/0xf0
[    9.850180] [<ffffffc000087c78>] show_stack+0x14/0x1c
[    9.850182] [<ffffffc000254c40>] dump_stack+0x94/0xb4
[    9.850184] [<ffffffc00008c160>] handle_IPI+0xcc/0x134
[    9.850186] [<ffffffc000081ca8>] gic_handle_irq+0x94/0xbc
[    9.850187] Exception stack(0xffffffc03b3cf3d0 to 0xffffffc03b3cf500)
[    9.850189] f3c0:                                   ffffffc001d42ee0 0000008000000000
[    9.850191] f3e0: ffffffc03b3cf530 ffffffc0000c6c28 0000000060000145 0000000000000087
[    9.850193] f400: 0000000000000001 ffffffc03b3a3480 ffffffc03b3ce4d3 0000000000000000
[    9.850196] f420: 0000000000000000 ffffffc000542430 ffffffc001d430c6 6666666666666666
[    9.850198] f440: 7265765f7766202c 696863203a746567 7830203a64695f70 5f70696863202c30
[    9.850200] f460: 203a796c696d6166 616f62202c307830 30203a64695f6472 00000000b4581539
[    9.850202] f480: 000000006f303dcb 0000000065a2d016 000000000ba94e60 ffffffc001d42ee0
[    9.850204] f4a0: ffffffc001d62ce0 0000000000000004 ffffffc001d4a2f8 ffffffc001d62000
[    9.850206] f4c0: 0000000000000087 0000000000000000 000000000000016a 0000000000000140
[    9.850208] f4e0: 0000000000006aa4 ffffffc03b3cf530 ffffffc0000c6c24 ffffffc03b3cf530
[    9.850210] [<ffffffc000084e7c>] el1_irq+0x7c/0xf4
[    9.850213] [<ffffffc0000c70a8>] vprintk_emit+0x3f0/0x450
[    9.850217] [<ffffffc000310028>] dev_vprintk_emit+0x1b4/0x1e4
[    9.850219] [<ffffffc0003100a0>] dev_printk_emit+0x48/0x50
[    9.850221] [<ffffffc0003100fc>] __dev_printk+0x54/0x78
[    9.850222] [<ffffffc000310424>] _dev_info+0x50/0x58
[    9.850227] [<ffffffc0003e88dc>] rproc_boot+0x1d0/0x384
[    9.850230] [<ffffffc0003ebea8>] start_q6+0x2cc/0x300
[    9.850234] [<ffffffc0002dc630>] __subsystem_get+0xd8/0x1a0
[    9.850236] [<ffffffc0002dc708>] subsystem_get+0x10/0x18
[    9.850288] [<ffffffbffc569a9c>] ath11k_ahb_power_up+0x28/0xcc [ath11k]
[    9.850339] [<ffffffbffc566d98>] ath11k_core_init+0x78/0x210 [ath11k]
[    9.850390] [<ffffffbffc56a3cc>] ath11k_register_subsys+0x610/0x71c [ath11k]
[    9.850394] [<ffffffc000315198>] platform_drv_probe+0x54/0xa4
[    9.850397] [<ffffffc0003137d8>] driver_probe_device+0x110/0x288
[    9.850399] [<ffffffc0003139b4>] __driver_attach+0x64/0x90
[    9.850401] [<ffffffc000311e94>] bus_for_each_dev+0x68/0x98
[    9.850403] [<ffffffc00031335c>] driver_attach+0x20/0x28
[    9.850405] [<ffffffc000312f20>] bus_add_driver+0xe0/0x1ec
[    9.850407] [<ffffffc00031423c>] driver_register+0x90/0xdc
[    9.850409] [<ffffffc0003150b8>] __platform_driver_register+0x48/0x50
[    9.850461] [<ffffffbffc56a4ec>] ath11k_ahb_init+0x14/0x30 [ath11k]
[    9.850513] [<ffffffbffc5b2014>] init_module+0x14/0x40 [ath11k]
[    9.850515] [<ffffffc000082204>] do_one_initcall+0x188/0x1a4
[    9.850519] [<ffffffc0000f8cc0>] do_init_module+0x58/0x19c
[    9.850522] [<ffffffc0000eb250>] load_module+0x1498/0x1904
[    9.850524] [<ffffffc0000eb7d0>] SyS_init_module+0x114/0x140
[    9.850526] [<ffffffc0000855b0>] el0_svc_naked+0x24/0x28
[   14.850545] The reading for sensor 4 is 0x002041e0
[   14.850549] The reading for sensor 5 is 0x002051ea
[   14.850553] The reading for sensor 6 is 0x002061f1
[   14.850557] The reading for sensor 7 is 0x002071ca
[   14.850562] The reading for sensor 8 is 0x002081c0
[   14.850566] The reading for sensor 9 is 0x002091e0
[   14.850570] The reading for sensor 10 is 0x0020a1e0
[   14.850574] The reading for sensor 11 is 0x0020b1e4
[   14.850578] The reading for sensor 12 is 0x0020c1e7
[   14.850582] The reading for sensor 13 is 0x0020d1e0
[   14.850586] The reading for sensor 14 is 0x0020e1cd
[   14.850590] The reading for sensor 15 is 0x0020f1cd
[   17.006183] Rebooting in 5 seconds.

--nextPart8642784.Z0BxYOtq9S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAlymEfwACgkQXYcKB8Em
e0bgHQ//evFpIKbIJbAqovvNU3UjWh80SxsQwv5roXoxb3a2RjBQg9fYNC4tQCMk
HluhstVJefUyLtdzU04WEWrgiRVonQ++jpkrtkthTDGqICy83T0scpJUp0gaTsMc
gejYP3Ukx0YjlV3NSlA9IIatIS43tg6PfQnRQDYfWuqW5B2GGgvdG495qs+ltdtC
LYSau+yLCJtuRWx3isMinh6DKN4sxmzDFKWi2nT6sGleM+MZZhBy3teJ/+JsDUcK
cku6rRYhGCF5HuhHAl5kr7QTXSEyoYwTeTqFrSHqZCPls2JcK5PRK5/Cy8iq5eg2
UYjm40wAdn2m/K05+mw87My0AU8k9xwWoBGcY5IXSbYv9cOhnUeukfPTRfvOVn2m
ZqEie0CS71WLcyTQnxFWT6+h7o0wYfMzzCoZaoKSPCb/mmkUPbnD7cpajgVbItT6
VNKfsuzDcf81uAUjFJzGauOUGOXny6NXLTSrqcv9ym8WANNE3c7PuqeYxX3huuRk
gE+TzxSct6f0gpankhy1nLu6JoQUEHmcLZDHPX4WRZKmvPIDrGoK3eT7Yqm61Wis
cOSu44aS87hc+O9G74NmHEqIR+ftWdJT5Ho4K3YqhK0ERq0RqaYYv4TY0s0mONgL
dQpVaigze7QkSsLmvFcqcTY6X05j5Sk0xcJbN16/UskhT3I78Qk=
=MLOV
-----END PGP SIGNATURE-----

--nextPart8642784.Z0BxYOtq9S--





--===============6196795390226996276==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============6196795390226996276==--
