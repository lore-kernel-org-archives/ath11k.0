Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNZht-0004OF-1L
 for ath11k@lists.infradead.org; Wed, 30 Sep 2020 10:51:38 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 5/5] ath11k: debugfs: fix crash during rmmod
Date: Wed, 30 Sep 2020 13:51:13 +0300
Message-Id: <1601463073-12106-6-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1601463073-12106-1-git-send-email-kvalo@codeaurora.org>
References: <1601463073-12106-1-git-send-email-kvalo@codeaurora.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

From: Carl Huang <cjhuang@codeaurora.org>

With QCA6390 when doing rmmod the kernel crashed. The reason was that the
destroy functions ath11k_debugfs_pdev_destroy() and ath11k_debugfs_soc_destroy()
accidentally had swapped the debugfs directories and
ath11k_debugfs_soc_destroy() was removing an already removed directory, which
crashed the kernel.

The source of confusion is badly named function and variable names. I think the
best way to clean this up is actually to merge the corresponding functions, but
that's for another patch. Let's first just fix the crash.

[   43.430245] ------------[ cut here ]------------
[   43.430247] DEBUG_LOCKS_WARN_ON(1)
[   43.430253] WARNING: CPU: 4 PID: 2148 at kernel/locking/lockdep.c:183 check_wait_context+0x231/0x290
[   43.430255] Modules linked in: ath11k_pci(-) ath11k qmi_helpers qrtr_mhi mhi qrtr ns nvme nvme_core
[   43.430261] CPU: 4 PID: 2148 Comm: rmmod Not tainted 5.9.0-rc5-wt-ath+ #198
[   43.430262] Hardware name: Intel(R) Client Systems NUC8i7HVK/NUC8i7HVB, BIOS HNKBLi70.86A.0049.2018.0801.1601 08/01/2018
[   43.430265] RIP: 0010:check_wait_context+0x231/0x290
[   43.430267] Code: ff ff e8 42 83 bf 00 85 c0 74 f0 44 8b 15 af 0d 90 01 45 85 d2 75 e4 48 c7 c6 7f e5 37 8d 48 c7 c7 8d 81 34 8d e8 c3 01 fa ff <0f> 0b 31 c0 e9 01 fe ff f
[   43.430268] RSP: 0018:ffffa36140f23bf8 EFLAGS: 00010082
[   43.430270] RAX: 0000000000000000 RBX: e7a8b0f303fcdbd7 RCX: 0000000000000000
[   43.430272] RDX: 0000000000000016 RSI: ffffffff8bee5824 RDI: ffffffff8d66fd60
[   43.430273] RBP: ffff936573551d80 R08: 0000000a1ca4fc0e R09: 0000000000000016
[   43.430275] R10: 0000000000000046 R11: ffffa36140f23a35 R12: ffff936573552670
[   43.430276] R13: 0000000000000000 R14: ffff936573552638 R15: 0000000000000001
[   43.430278] FS:  00007f03e78c8700(0000) GS:ffff93659c800000(0000) knlGS:0000000000000000
[   43.430280] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   43.430282] CR2: 000056424768fee8 CR3: 00000001f7b46003 CR4: 00000000003706e0
[   43.430283] Call Trace:
[   43.430286]  __lock_acquire+0x1c0/0x6e0
[   43.430289]  lock_acquire+0xb6/0x270
[   43.430292]  ? lockref_get+0x9/0x20
[   43.430295]  ? lock_acquire+0xb6/0x270
[   43.430297]  ? simple_pin_fs+0x1d/0xa0
[   43.430299]  ? find_held_lock+0x32/0x90
[   43.430303]  _raw_spin_lock+0x2c/0x70
[   43.430305]  ? lockref_get+0x9/0x20
[   43.430306]  lockref_get+0x9/0x20
[   43.430308]  simple_recursive_removal+0x31/0x2f0
[   43.430310]  ? debugfs_rename+0x40/0x40
[   43.430312]  debugfs_remove+0x3b/0x60
[   43.430320]  ath11k_debug_soc_destroy+0x10/0x20 [ath11k]
[   43.430325]  ath11k_core_deinit+0xab/0xd0 [ath11k]
[   43.430327]  ath11k_pci_remove+0x1b/0xb0 [ath11k_pci]
[   43.430329]  pci_device_remove+0x36/0x90
[   43.430331]  __device_release_driver+0x16c/0x220
[   43.430333]  driver_detach+0xcf/0x110
[   43.430334]  bus_remove_driver+0x4d/0xa2
[   43.430336]  pci_unregister_driver+0x25/0xa0
[   43.430338]  __do_sys_delete_module+0x163/0x240
[   43.430340]  ? lockdep_hardirqs_on_prepare.part.0+0x9f/0x140
[   43.430342]  ? syscall_enter_from_user_mode+0x1d/0x50
[   43.430343]  ? trace_hardirqs_on+0x1c/0x100
[   43.430345]  do_syscall_64+0x33/0x40
[   43.430347]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   43.430348] RIP: 0033:0x7f03e73f89e7
[   43.430350] Code: 73 01 c3 48 8b 0d b1 c4 2b 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 b8 b0 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c
[   43.430351] RSP: 002b:00007ffdb61d6198 EFLAGS: 00000202 ORIG_RAX: 00000000000000b0
[   43.430352] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f03e73f89e7
[   43.430353] RDX: 000000000000000a RSI: 0000000000000800 RDI: 0000556f67d922e8
[   43.430354] RBP: 0000556f67d92280 R08: 0000000000000000 R09: 1999999999999999
[   43.430355] R10: 0000000000000883 R11: 0000000000000202 R12: 00007ffdb61d63b0
[   43.430356] R13: 00007ffdb61d7917 R14: 0000000000000000 R15: 0000556f67d92280
[   43.430358] irq event stamp: 240801
[   43.430360] hardirqs last  enabled at (240801): [<ffffffff8c02d0e5>] cmpxchg_double_slab.constprop.0+0x185/0x1a0
[   43.430362] hardirqs last disabled at (240800): [<ffffffff8c02d03e>] cmpxchg_double_slab.constprop.0+0xde/0x1a0
[   43.430364] softirqs last  enabled at (240680): [<ffffffffc01eee37>] ath11k_pci_read32+0x87/0xe0 [ath11k_pci]
[   43.430365] softirqs last disabled at (240678): [<ffffffffc01eedf8>] ath11k_pci_read32+0x48/0xe0 [ath11k_pci]
[   43.430366] ---[ end trace dc96c4234c294fe8 ]---

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/debugfs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
index 5193b308a992..1542f4b16e6b 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs.c
@@ -855,8 +855,8 @@ int ath11k_debugfs_pdev_create(struct ath11k_base *ab)
 
 void ath11k_debugfs_pdev_destroy(struct ath11k_base *ab)
 {
-	debugfs_remove_recursive(ab->debugfs_ath11k);
-	ab->debugfs_ath11k = NULL;
+	debugfs_remove_recursive(ab->debugfs_soc);
+	ab->debugfs_soc = NULL;
 }
 
 int ath11k_debugfs_soc_create(struct ath11k_base *ab)
@@ -874,8 +874,8 @@ int ath11k_debugfs_soc_create(struct ath11k_base *ab)
 
 void ath11k_debugfs_soc_destroy(struct ath11k_base *ab)
 {
-	debugfs_remove_recursive(ab->debugfs_soc);
-	ab->debugfs_soc = NULL;
+	debugfs_remove_recursive(ab->debugfs_ath11k);
+	ab->debugfs_ath11k = NULL;
 }
 
 void ath11k_debugfs_fw_stats_init(struct ath11k *ar)
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
