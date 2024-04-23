Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384C0C4345F
	for <ath11k@archiver.kernel.org>; Tue, 23 Apr 2024 12:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WirNJIUFk6bq+S0/v0eDPQCz3FRWMavhEYhoCW13P6k=; b=g4A2TwAd0x3kg0JmHR9+E2/THT
	aUu7NwlqFd6FsOmy21y8YYOrnK4ul8tIEfk1dwGhkoPpteA/m7xErDqnrY4EZplvZqH1A/J9Jv43n
	YnNFmSUoYwpzJ/lWufpuxOb2wmWJnGNUKneDswLdM2fa1bgojw+rthcMcHjupJOOtlWba5ASpeSAm
	H8u3mbMcrSWCIe0UzjTYtENv0BdX3ok/iHjRttkMHtd36a8YcAeiCXeN+o/vIfx27SIeCVKtQrRBl
	xF7k0NKC+bAPRFeY5zWuQKmXSW3wUUCse/yPUOWczmut98h0ogbGQso4oOZf5LpoNaviCWJLFMOcC
	I6E8X+sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzErd-0000000HHB8-3UZW;
	Tue, 23 Apr 2024 12:03:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzErW-0000000HH7I-1vnZ
	for ath11k@lists.infradead.org;
	Tue, 23 Apr 2024 12:03:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 400D56146E;
	Tue, 23 Apr 2024 12:03:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20189C3277B;
	Tue, 23 Apr 2024 12:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713873781;
	bh=1AGPvaxYAf54+EK3OCdKQhwRoFQ7jhT/lEBb9hB9Ito=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=SBprygSnAAbqIpRaq36OP1vsaqrKbm2HL4YGXTkBGEAxFHSzQAW3frUO/W/JN50FX
	 MJIAQ6pV1ZVcvZDadLEOc2oKd58SOAtv0gEsL1sUXw73BCrhr6Npj00sc0iVbPIf2L
	 Gd2V7BrW3luM4/lqtg77ZW8UItC/H0b/Rko/M75HlPRsn4DkWnhYg2PpymaAvIgikg
	 xX2HFtSu4dMAlBkVN3CyXn78aoJOoHtOIJIYZ08RVVwnuemUp1kFZ0qgErDyOh2R9/
	 82kIgIIstD4FtmV7R3L7kI4wV+RwK7L0e3E18hLBVoYzsmg9TMEcSzLSndC+etqf5E
	 JN9nQO6x/zBNQ==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath11k: move power type check to ASSOC stage when
 connecting to 6 GHz AP
References: <20240420015632.2869-1-quic_bqiang@quicinc.com>
Date: Tue, 23 Apr 2024 15:02:58 +0300
In-Reply-To: <20240420015632.2869-1-quic_bqiang@quicinc.com> (Baochen Qiang's
	message of "Sat, 20 Apr 2024 09:56:32 +0800")
Message-ID: <87zftkthfx.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_050302_623722_AD9C1157 
X-CRM114-Status: GOOD (  14.01  )
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

Baochen Qiang <quic_bqiang@quicinc.com> writes:

> With commit bc8a0fac8677 ("wifi: mac80211: don't set bss_conf in parsing")
> ath11k fails to connect to 6 GHz AP.
>
> This is because currently ath11k checks AP's power type in
> ath11k_mac_op_assign_vif_chanctx() which would be called in AUTH stage.
> However with above commit power type is not available until ASSOC stage.
> As a result power type check fails and therefore connection fails.
>
> Fix this by moving power type check to ASSOC stage, also move regulatory
> rules update there because it depends on power type.
>
> Tested-on: WCN6855 hw2.0 PCI
> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
>
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

This crashes for me in AP mode, I tested two times and crashed in both
cases. I had ath-202404230930 as baseline and this is the hardware:

[  190.941259] ath11k_pci 0000:06:00.0: wcn6855 hw2.0
[  191.904773] ath11k_pci 0000:06:00.0: chip_id 0x2 chip_family 0xb board_id 0x106 soc_id 0x400c0200
[  191.906964] ath11k_pci 0000:06:00.0: fw_version 0x1106196e fw_build_timestamp 2024-01-12 11:30 fw_build_id WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37

This is the crash:

[  290.145465] general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] PREEMPT SMP DEBUG_PAGEALLOC KASAN
[  290.149806] KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
[  290.151533] CPU: 1 PID: 3593 Comm: wpa_supplicant Not tainted 6.9.0-rc4-wt-ath+ #1394
[  290.152530] Hardware name: Intel(R) Client Systems NUC8i7HVK/NUC8i7HVB, BIOS HNKBLi70.86A.0067.2021.0528.1339 05/28/2021
[  290.153558] RIP: 0010:ath11k_mac_op_sta_state+0x878/0x11b0 [ath11k]
[  290.154615] Code: df 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 20 09 00 00 4c 8b ab 78 07 00 00 48 b8 00 00 00 00 00 fc ff df 4c 89 ea 48 c1 ea 03 <0f> b6 04 02 84 c0 74 08 3c 03 0f 8e 02 09 00 00 41 83 7d 00 03 0f
[  290.156844] RSP: 0018:ffffc900029af0e0 EFLAGS: 00010246
[  290.157887] RAX: dffffc0000000000 RBX: ffff88814376e840 RCX: ffffffffc0a23a82
[  290.158949] RDX: 0000000000000000 RSI: 0000000000000008 RDI: ffff88814376efb8
[  290.159998] RBP: ffffc900029af120 R08: 0000000000000000 R09: ffffed10283e41ec
[  290.161052] R10: ffff888141f20f67 R11: 0000000000000006 R12: ffff88813fb932c0
[  290.162085] R13: 0000000000000000 R14: ffff88814254aef0 R15: ffff88814376ecb8
[  290.163113] FS:  00007fe3edcad140(0000) GS:ffff888231c00000(0000) knlGS:0000000000000000
[  290.164150] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  290.165179] CR2: 00005628b67461d0 CR3: 000000012b466006 CR4: 00000000003706f0
[  290.166189] Call Trace:
[  290.167183]  <TASK>
[  290.168186]  ? show_regs+0x5b/0x70
[  290.169255]  ? die_addr+0x3c/0xa0
[  290.170260]  ? exc_general_protection+0x14c/0x220
[  290.171278]  ? asm_exc_general_protection+0x27/0x30
[  290.172247]  ? ath11k_wmi_supports_6ghz_cc_ext+0x42/0xd0 [ath11k]
[  290.173291]  ? ath11k_mac_op_sta_state+0x878/0x11b0 [ath11k]
[  290.174302]  drv_sta_state+0x2ca/0x640 [mac80211]
[  290.175395]  _sta_info_move_state+0x270/0x850 [mac80211]
[  290.176520]  sta_info_move_state+0xe/0x10 [mac80211]
[  290.177596]  sta_apply_auth_flags.isra.0+0x15b/0x2e0 [mac80211]
[  290.178672]  sta_apply_parameters+0x1bb/0xc70 [mac80211]
[  290.179736]  ieee80211_change_station+0x4b9/0x860 [mac80211]
[  290.180812]  nl80211_set_station+0xeb1/0x1890 [cfg80211]
[  290.181848]  ? nl80211_set_qos_map+0x6d0/0x6d0 [cfg80211]
[  290.182883]  ? mutex_unlock+0xd/0x10
[  290.183839]  ? rtnl_unlock+0x9/0x10
[  290.184807]  ? nl80211_pre_doit+0x557/0x800 [cfg80211]
[  290.185839]  genl_family_rcv_msg_doit+0x1f0/0x2e0
[  290.186784]  ? genl_family_rcv_msg_attrs_parse.isra.0+0x250/0x250
[  290.187731]  ? ns_capable+0x57/0xd0
[  290.188664]  genl_family_rcv_msg+0x34c/0x600
[  290.189598]  ? genl_family_rcv_msg_dumpit+0x310/0x310
[  290.190531]  ? __lock_acquire+0xd43/0x1dd0
[  290.191462]  ? he_set_mcs_mask.isra.0+0x8d0/0x8d0 [cfg80211]
[  290.192467]  ? nl80211_set_qos_map+0x6d0/0x6d0 [cfg80211]
[  290.193469]  ? cfg80211_external_auth_request+0x690/0x690 [cfg80211]
[  290.194472]  genl_rcv_msg+0xa0/0x130
[  290.195387]  netlink_rcv_skb+0x14c/0x400
[  290.196266]  ? genl_family_rcv_msg+0x600/0x600
[  290.197139]  ? netlink_ack+0xd70/0xd70
[  290.198027]  ? rwsem_optimistic_spin+0x4f0/0x4f0
[  290.198957]  ? genl_rcv+0x14/0x40
[  290.199835]  ? rwsem_down_read_slowpath+0xb10/0xb10
[  290.200707]  ? netlink_deliver_tap+0x143/0x350
[  290.201576]  ? __this_cpu_preempt_check+0x13/0x20
[  290.202443]  genl_rcv+0x23/0x40
[  290.203280]  netlink_unicast+0x45c/0x790
[  290.204089]  ? netlink_attachskb+0x7f0/0x7f0
[  290.204932]  netlink_sendmsg+0x7eb/0xdb0
[  290.205770]  ? netlink_unicast+0x790/0x790
[  290.206600]  ? __this_cpu_preempt_check+0x13/0x20
[  290.207430]  ? selinux_socket_sendmsg+0x31/0x40
[  290.208192]  ? netlink_unicast+0x790/0x790
[  290.208995]  __sock_sendmsg+0xc9/0x160
[  290.209787]  ____sys_sendmsg+0x620/0x9a0
[  290.210570]  ? kernel_sendmsg+0x30/0x30
[  290.211333]  ? __copy_msghdr+0x410/0x410
[  290.212020]  ? reacquire_held_locks+0x4d0/0x4d0
[  290.212753]  ? lock_sync+0x1a0/0x1a0
[  290.213477]  ___sys_sendmsg+0xe9/0x170
[  290.214129]  ? copy_msghdr_from_user+0x120/0x120
[  290.214819]  ? __might_fault+0xc0/0x170
[  290.215485]  ? __kasan_check_write+0x14/0x20
[  290.216093]  ? _copy_from_user+0x5b/0xa0
[  290.216746]  ? copy_from_sockptr_offset.constprop.0+0xe7/0x110
[  290.217406]  ? netlink_seq_show+0x330/0x330
[  290.218009]  ? __kasan_check_write+0x14/0x20
[  290.218666]  ? __kasan_check_read+0x11/0x20
[  290.219312]  ? __fget_light+0x53/0x1e0
[  290.219899]  ? __fdget+0xe/0x10
[  290.220527]  ? sockfd_lookup_light+0x1a/0x170
[  290.221101]  __sys_sendmsg+0xd2/0x180
[  290.221721]  ? __sys_sendmsg_sock+0x20/0x20
[  290.222349]  ? __sys_setsockopt+0xf4/0x1b0
[  290.222920]  ? debug_smp_processor_id+0x17/0x20
[  290.223550]  __x64_sys_sendmsg+0x72/0xb0
[  290.224122]  ? lockdep_hardirqs_on+0x7d/0x100
[  290.224746]  x64_sys_call+0x894/0x9e0
[  290.225369]  do_syscall_64+0x65/0x130
[  290.225933]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
[  290.226553] RIP: 0033:0x7fe3ee039807
[  290.227117] Code: 64 89 02 48 c7 c0 ff ff ff ff eb bb 0f 1f 80 00 00 00 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 2e 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 51 c3 48 83 ec 28 89 54 24 1c 48 89 74 24 10
[  290.228401] RSP: 002b:00007ffc6f94a998 EFLAGS: 00000246 ORIG_RAX: 000000000000002e
[  290.229025] RAX: ffffffffffffffda RBX: 00005628ca86dac0 RCX: 00007fe3ee039807
[  290.229705] RDX: 0000000000000000 RSI: 00007ffc6f94a9d0 RDI: 0000000000000006
[  290.230380] RBP: 00005628ca86d9d0 R08: 0000000000000004 R09: 00007fe3ee105cb0
[  290.231001] R10: 00007ffc6f94aaa4 R11: 0000000000000246 R12: 00005628ca8b4370
[  290.231676] R13: 00007ffc6f94a9d0 R14: 00007ffc6f94aaa4 R15: 00005628ca8bb540
[  290.232352]  </TASK>
[  290.232963] Modules linked in: ath11k_pci ath11k mac80211 libarc4 cfg80211 qmi_helpers qrtr_mhi mhi qrtr nvme nvme_core [last unloaded: mhi]
[  290.234016] ---[ end trace 0000000000000000 ]---
[  291.635799] RIP: 0010:ath11k_mac_op_sta_state+0x878/0x11b0 [ath11k]
[  291.636600] Code: df 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 20 09 00 00 4c 8b ab 78 07 00 00 48 b8 00 00 00 00 00 fc ff df 4c 89 ea 48 c1 ea 03 <0f> b6 04 02 84 c0 74 08 3c 03 0f 8e 02 09 00 00 41 83 7d 00 03 0f
[  291.638237] RSP: 0018:ffffc900029af0e0 EFLAGS: 00010246
[  291.639007] RAX: dffffc0000000000 RBX: ffff88814376e840 RCX: ffffffffc0a23a82
[  291.639797] RDX: 0000000000000000 RSI: 0000000000000008 RDI: ffff88814376efb8
[  291.640635] RBP: ffffc900029af120 R08: 0000000000000000 R09: ffffed10283e41ec
[  291.641475] R10: ffff888141f20f67 R11: 0000000000000006 R12: ffff88813fb932c0
[  291.642217] R13: 0000000000000000 R14: ffff88814254aef0 R15: ffff88814376ecb8
[  291.642949] FS:  00007fe3edcad140(0000) GS:ffff888231c00000(0000) knlGS:0000000000000000
[  291.643778] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  291.644628] CR2: 00005628b67461d0 CR3: 000000012b466006 CR4: 00000000003706f0
[  291.645473] Kernel panic - not syncing: Fatal exception
[  291.646324] Kernel Offset: 0xa400000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

