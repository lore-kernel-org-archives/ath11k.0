Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEAtj-0006KK-9C
 for ath11k@lists.infradead.org; Tue, 17 Mar 2020 12:00:44 +0000
From: Pravas Kumar Panda <kumarpan@codeaurora.org>
Subject: [PATCH] ath11k: Adding proper validation before accessing tx_stats
Date: Tue, 17 Mar 2020 17:29:29 +0530
Message-Id: <1584446369-7021-1-git-send-email-kumarpan@codeaurora.org>
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
Cc: Pravas Kumar Panda <kumarpan@codeaurora.org>, linux-wireless@vger.kernel.org

Before dumping tx_stats proper validation was not been taken care of.
Due to which we were encountering null pointer dereference(kernel panic).
This scenario will arise when a station is getting disconnected and
we are changing the STA state by ath11k_mac_op_sta_state and assigning
tx_stats as NULL and after this the mac80211 will destroy the
debugfs entry from where we are trying to read the stats.

If anyone tries to dump tx_stats for that STA in between setting
tx_stats to NULL and debugfs file removal without checking the NULL
value it will run into a NULL pointer exception.

Proceeding with the analysis of "ARM Kernel Panic".
The APSS crash happened due to OOPS on CPU 3.
Crash Signature : Unable to handle kernel NULL pointer dereference at
virtual address 00000360
During the crash,
PC points to "ath11k_debug_htt_stats_init+0x16ac/0x1acc [ath11k]"
LR points to "ath11k_debug_htt_stats_init+0x1688/0x1acc [ath11k]".
The Backtrace obtained is as follows:
[<ffffffbffcfd8590>] ath11k_debug_htt_stats_init+0x16ac/0x1acc [ath11k]
[<ffffffc000156320>] do_loop_readv_writev+0x60/0xa4
[<ffffffc000156a5c>] do_readv_writev+0xd8/0x19c
[<ffffffc000156b54>] vfs_readv+0x34/0x48
[<ffffffc00017d6f4>] default_file_splice_read+0x1a8/0x2e4
[<ffffffc00017c56c>] do_splice_to+0x78/0x98
[<ffffffc00017c63c>] splice_direct_to_actor+0xb0/0x1a4
[<ffffffc00017c7b4>] do_splice_direct+0x84/0xa8
[<ffffffc000156f40>] do_sendfile+0x160/0x2a4
[<ffffffc000157980>] SyS_sendfile64+0xb4/0xc8

Signed-off-by: Pravas Kumar Panda <kumarpan@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/debugfs_sta.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/debugfs_sta.c b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
index 872f3ef..389dac2 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
@@ -219,6 +219,9 @@ static ssize_t ath11k_dbg_sta_dump_tx_stats(struct file *file,
 	const int size = 2 * 4096;
 	char *buf;
 
+	if (!arsta->tx_stats)
+		return -ENOENT;
+
 	buf = kzalloc(size, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
-- 
2.7.4

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
