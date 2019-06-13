Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbDe6-000878-L2
 for ath11k@lists.infradead.org; Thu, 13 Jun 2019 00:31:16 +0000
From: Sriram R <srirrama@codeaurora.org>
Subject: [PATCH] ath11k: cleanup warnings due to conflicting enum types
Date: Thu, 13 Jun 2019 06:01:01 +0530
Message-Id: <1560385861-18893-1-git-send-email-srirrama@codeaurora.org>
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

Cleanup warnings due to conflicting enum types
dfs_reg and ath11k_dfs_region

This will resolve the below warning.

"drivers/net/wireless/ath/ath11k/wmi.c:4597:34:
 warning: mixing different enum types"

Signed-off-by: Sriram R <srirrama@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/reg.c | 16 ++++++++--------
 drivers/net/wireless/ath/ath11k/wmi.h | 12 +-----------
 2 files changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/reg.c b/drivers/net/wireless/ath/ath11k/reg.c
index ef16931..cc847a7 100644
--- a/drivers/net/wireless/ath/ath11k/reg.c
+++ b/drivers/net/wireless/ath/ath11k/reg.c
@@ -263,16 +263,16 @@ int ath11k_regd_update(struct ath11k *ar, bool init)
 }
 
 static enum nl80211_dfs_regions
-ath11k_map_fw_dfs_region(enum dfs_reg dfs_region)
+ath11k_map_fw_dfs_region(enum ath11k_dfs_region dfs_region)
 {
 	switch (dfs_region) {
-	case DFS_FCC_REG:
-	case DFS_CN_REG:
+	case ATH11K_DFS_REG_FCC:
+	case ATH11K_DFS_REG_CN:
 		return NL80211_DFS_FCC;
-	case DFS_ETSI_REG:
-	case DFS_KR_REG:
+	case ATH11K_DFS_REG_ETSI:
+	case ATH11K_DFS_REG_KR:
 		return NL80211_DFS_ETSI;
-	case DFS_MKK_REG:
+	case ATH11K_DFS_REG_MKK:
 		return NL80211_DFS_JP;
 	default:
 		return NL80211_DFS_UNSET;
@@ -568,7 +568,7 @@ ath11k_reg_build_regd(struct ath11k_base *ab,
 		goto ret;
 
 	/* Add max additional rules to accommodate weather radar band */
-	if (reg_info->dfs_region == DFS_ETSI_REG)
+	if (reg_info->dfs_region == ATH11K_DFS_REG_ETSI)
 		num_rules += 2;
 
 	tmp_regd =  kzalloc(sizeof(*tmp_regd) +
@@ -631,7 +631,7 @@ ath11k_reg_build_regd(struct ath11k_base *ab,
 		 * need to update that for other rules.
 		 */
 		if (flags & NL80211_RRF_DFS &&
-		    reg_info->dfs_region == DFS_ETSI_REG &&
+		    reg_info->dfs_region == ATH11K_DFS_REG_ETSI &&
 		    (reg_rule->end_freq > ETSI_WEATHER_RADAR_BAND_LOW &&
 		    reg_rule->start_freq < ETSI_WEATHER_RADAR_BAND_HIGH)){
 			ath11k_reg_update_weather_radar_band(ab, tmp_regd,
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 441fe43..58a2fcd 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -4283,16 +4283,6 @@ enum cc_setting_code {
 	REG_SET_CC_STATUS_FAIL = 5,
 };
 
-enum dfs_reg {
-	DFS_UNINIT_REG = 0,
-	DFS_FCC_REG = 1,
-	DFS_ETSI_REG = 2,
-	DFS_MKK_REG = 3,
-	DFS_CN_REG = 4,
-	DFS_KR_REG = 5,
-	DFS_UNDEF_REG
-};
-
 /* Regaulatory Rule Flags Passed by FW */
 #define REGULATORY_CHAN_DISABLED     BIT(0)
 #define REGULATORY_CHAN_NO_IR        BIT(1)
@@ -4331,7 +4321,7 @@ struct cur_regulatory_info {
 	u16 reg_dmn_pair;
 	u16 ctry_code;
 	u8 alpha2[REG_ALPHA2_LEN + 1];
-	enum dfs_reg dfs_region;
+	u32 dfs_region;
 	u32 phybitmap;
 	u32 min_bw_2g;
 	u32 max_bw_2g;
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
