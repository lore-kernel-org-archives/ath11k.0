Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXlHr-0003jL-54
 for ath11k@lists.infradead.org; Mon, 03 Jun 2019 11:38:00 +0000
From: Sriram R <srirrama@codeaurora.org>
Subject: [PATCH] ath11k: Fix vdev start failure when operating in CN,
 KR regdomain
Date: Mon,  3 Jun 2019 17:07:45 +0530
Message-Id: <1559561865-27928-1-git-send-email-srirrama@codeaurora.org>
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
Cc: Sriram R <srirrama@codeaurora.org>

Currently, firmware expects the correct regdomain to be set in
vdev start command. As firmware supports regulatory offload, it can track
the current regdomain. This info is received from firmware via
REG_CHAN_LIST_CC event during bringup or after setting country code.
Currently the dfs_region received is mapped to nl80211_dfs_regions
and stored in default_regd or new_regd and is used for vdev start.
But since nl80211_dfs_regions doesn't have a value enumerated for CN
KR, the firmware rejects VDEV start with an 'invalid regdomain' error.
Hence, send the appropriate regdomain received from firmware during
REG_CHAN_LIST_CC event in vdev start to avoid vdev start failure.

Signed-off-by: Sriram R <srirrama@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.h | 13 +++++++++++++
 drivers/net/wireless/ath/ath11k/mac.c  | 10 +---------
 drivers/net/wireless/ath/ath11k/wmi.c  |  3 +++
 drivers/net/wireless/ath/ath11k/wmi.h  |  1 +
 4 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 148c9a4..f7d2d96 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -302,6 +302,16 @@ enum ath11k_stats_type {
 	ATH11K_STATS_TYPE_MAX,
 };
 
+enum ath11k_dfs_region {
+	ATH11K_DFS_REG_UNSET,
+	ATH11K_DFS_REG_FCC,
+	ATH11K_DFS_REG_ETSI,
+	ATH11K_DFS_REG_MKK,
+	ATH11K_DFS_REG_CN,
+	ATH11K_DFS_REG_KR,
+	ATH11K_DFS_REG_UNDEF,
+};
+
 struct ath11k_htt_data_stats {
 	u64 legacy[ATH11K_COUNTER_TYPE_MAX][ATH11K_LEGACY_NUM];
 	u64 ht[ATH11K_COUNTER_TYPE_MAX][ATH11K_HT_MCS_NUM];
@@ -622,6 +632,9 @@ struct ath11k_base {
 	 * This may or may not be used during the runtime
 	 */
 	struct ieee80211_regdomain *new_regd[MAX_RADIOS];
+
+	/* Current DFS Regulatory */
+	enum ath11k_dfs_region dfs_region;
 #ifdef CONFIG_ATH11K_DEBUGFS
 	struct dentry *debugfs_soc;
 #endif
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index cb0de8e..87a420e 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3915,15 +3915,7 @@ ath11k_mac_vdev_start_restart(struct ath11k_vif *arvif,
 		arg.channel.passive = arg.channel.chan_radar;
 
 		spin_lock_bh(&ab->data_lock);
-
-		/* Use the new reg info if available */
-		if (ar->ab->new_regd[ar->pdev_idx])
-			arg.regdomain =
-				ar->ab->new_regd[ar->pdev_idx]->dfs_region;
-		else
-			arg.regdomain =
-				ar->ab->default_regd[ar->pdev_idx]->dfs_region;
-
+		arg.regdomain = ar->ab->dfs_region;
 		spin_unlock_bh(&ab->data_lock);
 
 		/* TODO: Notify if secondary 80Mhz also needs radar detection */
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 9ca44c4..3ac1e1c 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -4645,6 +4645,7 @@ static int ath11k_reg_chan_list_event(struct ath11k_base *ab, u8 *evt_buf, u32 l
 		/* This regd would be applied during mac registration */
 		ab->default_regd[pdev_idx] = regd;
 	}
+	ab->dfs_region = reg_info->dfs_region;
 	spin_unlock(&ab->data_lock);
 
 	goto mem_free;
@@ -4748,6 +4749,8 @@ static inline const char *ath11k_wmi_vdev_resp_print(u32 vdev_resp_status)
 		return "not supported";
 	case WMI_VDEV_START_RESPONSE_DFS_VIOLATION:
 		return "dfs violation";
+	case WMI_VDEV_START_RESPONSE_INVALID_REGDOMAIN:
+		return "invalid regdomain";
 	default:
 		return "unknown";
 	}
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 366a136..0d36c8a 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -4221,6 +4221,7 @@ enum wmi_vdev_start_resp_status_code {
 	WMI_VDEV_START_RESPONSE_INVALID_VDEVID = 1,
 	WMI_VDEV_START_RESPONSE_NOT_SUPPORTED = 2,
 	WMI_VDEV_START_RESPONSE_DFS_VIOLATION = 3,
+	WMI_VDEV_START_RESPONSE_INVALID_REGDOMAIN = 4,
 };
 
 ;
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
