Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDsxv-0001ng-HX
 for ath11k@lists.infradead.org; Thu, 03 Sep 2020 17:24:05 +0000
From: greearb@candelatech.com
Subject: [PATCH] ath11k:  Allow debugfs to work with 2+ radios installed.
Date: Thu,  3 Sep 2020 10:23:59 -0700
Message-Id: <20200903172359.29199-1-greearb@candelatech.com>
MIME-Version: 1.0
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
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless@vger.kernel.org

From: Ben Greear <greearb@candelatech.com>

The code is trying to create an ath11k directory on debugfs
root, but that fails when there is a second radio (and thus
second instance of the driver).

Work around this by finding a free name.  This may fall into
the HACK category, I'm not really sure what the original design
is supposed to accomplish.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---

NOTE:  A second radio still does not get far enough to fully boot
the NIC and create a phy* device, but at least system doesn't crash
hard now.

 drivers/net/wireless/ath/ath11k/core.h  |  5 +++--
 drivers/net/wireless/ath/ath11k/debug.c | 23 ++++++++++++++++-------
 2 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index bb22b41fefaa..858dfc700d54 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -707,8 +707,9 @@ struct ath11k_base {
 	/* Current DFS Regulatory */
 	enum ath11k_dfs_region dfs_region;
 #ifdef CONFIG_ATH11K_DEBUGFS
-	struct dentry *debugfs_soc;
-	struct dentry *debugfs_ath11k;
+	struct dentry *debugfs_soc; /* child of debugfs_ath11k */
+	char debugfs_ath11k_fname[36];
+	struct dentry *debugfs_ath11k; /* per driver instance */
 #endif
 	struct ath11k_soc_dp_stats soc_stats;
 
diff --git a/drivers/net/wireless/ath/ath11k/debug.c b/drivers/net/wireless/ath/ath11k/debug.c
index 31978ef9144e..70b4c4837879 100644
--- a/drivers/net/wireless/ath/ath11k/debug.c
+++ b/drivers/net/wireless/ath/ath11k/debug.c
@@ -1011,15 +1011,24 @@ void ath11k_debug_pdev_destroy(struct ath11k_base *ab)
 
 int ath11k_debug_soc_create(struct ath11k_base *ab)
 {
-	ab->debugfs_ath11k = debugfs_create_dir("ath11k", NULL);
+	/* We need one of these per driver instance, try until we find an un-used name */
+	int i;
 
-	if (IS_ERR_OR_NULL(ab->debugfs_ath11k)) {
-		if (IS_ERR(ab->debugfs_ath11k))
-			return PTR_ERR(ab->debugfs_ath11k);
-		return -ENOMEM;
+	for (i = 0; i<99; i++) {
+		snprintf(ab->debugfs_ath11k_fname, sizeof(ab->debugfs_ath11k_fname), "ath11k-%d", i);
+		ab->debugfs_ath11k = debugfs_create_dir(ab->debugfs_ath11k_fname, NULL);
+
+		if (!IS_ERR_OR_NULL(ab->debugfs_ath11k)) {
+			return 0;
+		}
 	}
 
-	return 0;
+	/* Couldn't create one */
+	ab->debugfs_ath11k_fname[0] = 0;
+
+	if (IS_ERR(ab->debugfs_ath11k))
+		return PTR_ERR(ab->debugfs_ath11k);
+	return -ENOMEM;
 }
 
 void ath11k_debug_soc_destroy(struct ath11k_base *ab)
@@ -1228,7 +1237,7 @@ int ath11k_debug_register(struct ath11k *ar)
 	}
 
 	/* Create a symlink under ieee80211/phy* */
-	snprintf(buf, 100, "../../ath11k/%pd2", ar->debug.debugfs_pdev);
+	snprintf(buf, 100, "../../%s/%pd2", ab->debugfs_ath11k_fname, ar->debug.debugfs_pdev);
 	debugfs_create_symlink("ath11k", ar->hw->wiphy->debugfsdir, buf);
 
 	ath11k_debug_htt_stats_init(ar);
-- 
2.26.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
