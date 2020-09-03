Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDy4G-0005FV-VF
 for ath11k@lists.infradead.org; Thu, 03 Sep 2020 22:50:58 +0000
Received: from [192.168.254.6] (unknown [50.34.202.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail3.candelatech.com (Postfix) with ESMTPSA id 171C713C2B0
 for <ath11k@lists.infradead.org>; Thu,  3 Sep 2020 15:50:56 -0700 (PDT)
From: Ben Greear <greearb@candelatech.com>
Subject: Hastings crash related to CE cleanup.
Message-ID: <a8353ad3-22a7-ba03-3cae-908d98bc7479@candelatech.com>
Date: Thu, 3 Sep 2020 15:50:55 -0700
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

I've been testing with 2 hastings radios in a PC platform.  They have all sorts
of issues like not always showing up in lspci, and never have I gotten both drivers
to load far enough to get a wlan device.

In case anyone is working on this, here is a splat during rmmod.  I think the drivers
never got far enough to do the CE setup, and then it blows up during cleanup,
I guess because rng->u.dst_ring.hp_addr is NULL.

(gdb) l *(ath11k_hal_srng_access_begin+0x44)
0x3224 is in ath11k_hal_srng_access_begin (/home/greearb/git/ath/drivers/net/wireless/ath/ath11k/hal.c:824).
819	
820		if (srng->ring_dir == HAL_SRNG_DIR_SRC)
821			srng->u.src_ring.cached_tp =
822				*(volatile u32 *)srng->u.src_ring.tp_addr;
823		else
824			srng->u.dst_ring.cached_hp = *srng->u.dst_ring.hp_addr;
825	}
826	
827	/* Update cached ring head/tail pointers to HW. a


Maybe we need a flag to test whether CE setup has happened at all before
we try to do cleanup?  Or need a check for that hp_addr being NULL and then just set
cached_tp to NULL in that case?


Turning off the locking correctness validator.
CPU: 3 PID: 6119 Comm: rmmod Not tainted 5.9.0-rc2-wt-ath+ #4
Hardware name: Default string Default string/SKYBAY, BIOS 5.12 02/19/2019
Call Trace:
  dump_stack+0xbb/0x108
  register_lock_class+0x955/0x960
  ? is_dynamic_key+0x120/0x120
  ? find_first_zero_bit+0x28/0x50
  ? add_lock_to_list.constprop.0+0xf9/0x1e0
  __lock_acquire+0xed/0x2f10
  ? mark_lock+0xa7/0xb90
  ? lockdep_hardirqs_on_prepare+0x260/0x260
  ? mark_held_locks+0x65/0x90
  lock_acquire+0x154/0x5c0
  ? ath11k_ce_send_done_cb+0x17d/0x1d0 [ath11k]
  ? lock_release+0x450/0x450
  ? __irq_get_irqchip_state+0x80/0x80
  ? do_raw_spin_lock+0x114/0x1a0
  ? rwlock_bug.part.0+0x50/0x50
  ? ___might_sleep+0x109/0x1a0
  _raw_spin_lock_bh+0x2f/0x40
  ? ath11k_ce_send_done_cb+0x17d/0x1d0 [ath11k]
  ath11k_ce_send_done_cb+0x17d/0x1d0 [ath11k]
  ? __disable_irq_nosync+0x9e/0xf0
  ath11k_ce_cleanup_pipes+0x1d8/0x210 [ath11k]
  ath11k_core_stop+0x50/0x70 [ath11k]
  ath11k_core_deinit+0x70/0x100 [ath11k]
  ath11k_pci_remove+0x41/0xb0 [ath11k_pci]
  pci_device_remove+0x5d/0xf0
  __device_release_driver+0x21b/0x330
  driver_detach+0x14c/0x18f
  bus_remove_driver+0x8a/0x151
  pci_unregister_driver+0x35/0xe0
  __do_sys_delete_module.constprop.0+0x21e/0x360
  ? free_module+0x630/0x630
  ? trace_hardirqs_on+0x1e/0x130
  ? lockdep_hardirqs_on+0x76/0xf0
  ? ktime_get_coarse_real_ts64+0x40/0x60
  do_syscall_64+0x2d/0x70
  entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x7f3c0378da9b
Code: 73 01 c3 48 8b 0d ed 33 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa b8 b0 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 
48 8b8
RSP: 002b:00007ffc30ea5d28 EFLAGS: 00000206 ORIG_RAX: 00000000000000b0
RAX: ffffffffffffffda RBX: 000055a28d844830 RCX: 00007f3c0378da9b
RDX: 000000000000000a RSI: 0000000000000800 RDI: 000055a28d844898
RBP: 00007ffc30ea5d88 R08: 0000000000000000 R09: 0000000000000000
R10: 00007f3c03801ac0 R11: 0000000000000206 R12: 00007ffc30ea5f50
R13: 00007ffc30ea6695 R14: 000055a28d8442a0 R15: 000055a28d844830
==================================================================
BUG: KASAN: null-ptr-deref in ath11k_hal_srng_access_begin+0x44/0x80 [ath11k]
Read of size 4 at addr 0000000000000000 by task rmmod/6119

CPU: 3 PID: 6119 Comm: rmmod Not tainted 5.9.0-rc2-wt-ath+ #4
Hardware name: Default string Default string/SKYBAY, BIOS 5.12 02/19/2019
Call Trace:
  dump_stack+0xbb/0x108
  kasan_report.cold+0x5/0x40
  ? ath11k_hal_srng_access_begin+0x44/0x80 [ath11k]
  ath11k_hal_srng_access_begin+0x44/0x80 [ath11k]
  ath11k_ce_send_done_cb+0x188/0x1d0 [ath11k]
  ? __disable_irq_nosync+0x9e/0xf0
  ath11k_ce_cleanup_pipes+0x1d8/0x210 [ath11k]
  ath11k_core_stop+0x50/0x70 [ath11k]
  ath11k_core_deinit+0x70/0x100 [ath11k]
  ath11k_pci_remove+0x41/0xb0 [ath11k_pci]
  pci_device_remove+0x5d/0xf0
  __device_release_driver+0x21b/0x330
  driver_detach+0x14c/0x18f
  bus_remove_driver+0x8a/0x151
  pci_unregister_driver+0x35/0xe0
  __do_sys_delete_module.constprop.0+0x21e/0x360
  ? free_module+0x630/0x630
  ? trace_hardirqs_on+0x1e/0x130
  ? lockdep_hardirqs_on+0x76/0xf0
  ? ktime_get_coarse_real_ts64+0x40/0x60
  do_syscall_64+0x2d/0x70
  entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x7f3c0378da9b
Code: 73 01 c3 48 8b 0d ed 33 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa b8 b0 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 
48 8b8
RSP: 002b:00007ffc30ea5d28 EFLAGS: 00000206 ORIG_RAX: 00000000000000b0
RAX: ffffffffffffffda RBX: 000055a28d844830 RCX: 00007f3c0378da9b
RDX: 000000000000000a RSI: 0000000000000800 RDI: 000055a28d844898
RBP: 00007ffc30ea5d88 R08: 0000000000000000 R09: 0000000000000000
R10: 00007f3c03801ac0 R11: 0000000000000206 R12: 00007ffc30ea5f50
R13: 00007ffc30ea6695 R14: 000055a28d8442a0 R15: 000055a28d844830
==================================================================
BUG: kernel NULL pointer dereference, address: 0000000000000000
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 0 P4D 0
Oops: 0000 [#1] PREEMPT SMP KASAN
CPU: 3 PID: 6119 Comm: rmmod Tainted: G    B             5.9.0-rc2-wt-ath+ #4
Hardware name: Default string Default string/SKYBAY, BIOS 5.12 02/19/2019
RIP: 0010:ath11k_hal_srng_access_begin+0x44/0x80 [ath11k]
Code: c0 75 41 48 8d bb 90 00 00 00 e8 07 49 25 e0 48 8d bb a0 00 00 00 e8 fb 49 25 e0 48 8b ab a0 00 00 00 48 89 ef e8 ec 48 25 e0 <8b> 6d 00 48 8d bb a8 00 00 
00 e8b
RSP: 0018:ffff8881ee18fc38 EFLAGS: 00010282
RAX: 0000000000000001 RBX: ffff8881fa401fa0 RCX: dffffc0000000000
RDX: 0000000000000007 RSI: 0000000000000004 RDI: 0000000000000297
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: fffffbfff067ef28 R11: 0000000000000001 R12: ffff8881fa400000
R13: ffff8881fa401be0 R14: ffff8881fa401fe0 R15: ffff8881fa401f10
FS:  00007f3c03665740(0000) GS:ffff88821dec0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 00000001ea542004 CR4: 00000000003706e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
  ath11k_ce_send_done_cb+0x188/0x1d0 [ath11k]
  ? __disable_irq_nosync+0x9e/0xf0
  ath11k_ce_cleanup_pipes+0x1d8/0x210 [ath11k]
  ath11k_core_stop+0x50/0x70 [ath11k]
  ath11k_core_deinit+0x70/0x100 [ath11k]
  ath11k_pci_remove+0x41/0xb0 [ath11k_pci]
  pci_device_remove+0x5d/0xf0
  __device_release_driver+0x21b/0x330
  driver_detach+0x14c/0x18f
  bus_remove_driver+0x8a/0x151
  pci_unregister_driver+0x35/0xe0
  __do_sys_delete_module.constprop.0+0x21e/0x360
  ? free_module+0x630/0x630
  ? trace_hardirqs_on+0x1e/0x130
  ? lockdep_hardirqs_on+0x76/0xf0
  ? ktime_get_coarse_real_ts64+0x40/0x60
  do_syscall_64+0x2d/0x70
  entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x7f3c0378da9b
Code: 73 01 c3 48 8b 0d ed 33 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa b8 b0 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 
48 8b8
RSP: 002b:00007ffc30ea5d28 EFLAGS: 00000206 ORIG_RAX: 00000000000000b0
RAX: ffffffffffffffda RBX: 000055a28d844830 RCX: 00007f3c0378da9b
RDX: 000000000000000a RSI: 0000000000000800 RDI: 000055a28d844898
RBP: 00007ffc30ea5d88 R08: 0000000000000000 R09: 0000000000000000
R10: 00007f3c03801ac0 R11: 0000000000000206 R12: 00007ffc30ea5f50
R13: 00007ffc30ea6695 R14: 000055a28d8442a0 R15: 000055a28d844830
Modules linked in: nf_conntrack_netlink nfnetlink iptable_raw xt_CT nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bpfilter vrf 8021q garp mrp stp llc macvlan 
pktgen nfsvo
  fuse [last unloaded: nf_conntrack]
CR2: 0000000000000000
---[ end trace 6b4638a21c07f006 ]---
RIP: 0010:ath11k_hal_srng_access_begin+0x44/0x80 [ath11k]
Code: c0 75 41 48 8d bb 90 00 00 00 e8 07 49 25 e0 48 8d bb a0 00 00 00 e8 fb 49 25 e0 48 8b ab a0 00 00 00 48 89 ef e8 ec 48 25 e0 <8b> 6d 00 48 8d bb a8 00 00 
00 e8b
RSP: 0018:ffff8881ee18fc38 EFLAGS: 00010282
RAX: 0000000000000001 RBX: ffff8881fa401fa0 RCX: dffffc0000000000
RDX: 0000000000000007 RSI: 0000000000000004 RDI: 0000000000000297
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: fffffbfff067ef28 R11: 0000000000000001 R12: ffff8881fa400000
R13: ffff8881fa401be0 R14: ffff8881fa401fe0 R15: ffff8881fa401f10
FS:  00007f3c03665740(0000) GS:ffff88821dec0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 00000001ea542004 CR4: 00000000003706e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Kernel panic - not syncing: Fatal exception in interrupt
Kernel Offset: disabled
Rebooting in 10 seconds..
ACPI MEMORY or I/O RESET_REG.














-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
