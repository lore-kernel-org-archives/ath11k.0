Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVZYV-0004Ie-J8
 for ath11k@lists.infradead.org; Mon, 04 May 2020 11:46:44 +0000
From: Sowmiya Sree Elavalagan <ssreeela@codeaurora.org>
Subject: [PATCH] ath11k: fix resource unavailability for htt stats after peer
 stats display
Date: Mon,  4 May 2020 17:15:55 +0530
Message-Id: <1588592755-10427-1-git-send-email-ssreeela@codeaurora.org>
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
Cc: Sowmiya Sree Elavalagan <ssreeela@codeaurora.org>, linux-wireless@vger.kernel.org

htt stats are not working after htt peer stats display
and also after htt peer stats reset. Trying to dump htt 
stats shows "Resource temporarily unavailable".
This is because of "ar->debug.htt_stats.stats_req" member is being
consecutively used for all htt stats without being reset 
during the previous usage. Hence assigning NULL to this member 
after freeing the allocated memory fixes the issue.

console logs below:
# echo 9 >/sys/kernel/debug/ath11k/ipq8074/mac1/htt_stats_type
# cat /sys/kernel/debug/ath11k/ipq8074/mac1/htt_stats_type
9
# cat /sys/kernel/debug/ath11k/ipq8074/mac1/htt_stats
cat: can't open '/sys/kernel/debug/ath11k/ipq8074/mac1/htt_stats'
: Resource temporarily unavailable

Signed-off-by: Sowmiya Sree Elavalagan <ssreeela@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/debugfs_sta.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/debugfs_sta.c b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
index 389dac2..696ff14 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
@@ -435,13 +435,22 @@ ath11k_dbg_sta_open_htt_peer_stats(struct inode *inode, struct file *file)
 	return 0;
 out:
 	vfree(stats_req);
+	ar->debug.htt_stats.stats_req = NULL;
 	return ret;
 }
 
 static int
 ath11k_dbg_sta_release_htt_peer_stats(struct inode *inode, struct file *file)
 {
+	struct ieee80211_sta *sta = inode->i_private;
+	struct ath11k_sta *arsta = (struct ath11k_sta *)sta->drv_priv;
+	struct ath11k *ar = arsta->arvif->ar;
+
+	mutex_lock(&ar->conf_mutex);
 	vfree(file->private_data);
+	ar->debug.htt_stats.stats_req = NULL;
+	mutex_unlock(&ar->conf_mutex);
+
 	return 0;
 }
 
-- 
2.7.4

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
