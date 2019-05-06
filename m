Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNe5w-0006SM-G6
 for ath11k@lists.infradead.org; Mon, 06 May 2019 13:55:53 +0000
From: Sriram R <srirrama@codeaurora.org>
Subject: [PATCH] ath11k: update dfs cac timeout for weather radar band
Date: Mon,  6 May 2019 19:24:31 +0530
Message-Id: <1557150871-1070-1-git-send-email-srirrama@codeaurora.org>
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

DFS CAC Timeout needs to be updated to 600s for channels
in weather radar band. Split the reg rule if the rule has
weather radar band between start and end freq and update
the cac timeout.

Signed-off-by: Sriram R <srirrama@codeaurora.org>
---

 drivers/net/wireless/ath/ath11k/reg.c | 137 ++++++++++++++++++++++++++++++++--
 1 file changed, 132 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/reg.c b/drivers/net/wireless/ath/ath11k/reg.c
index 8388299..1fef688 100644
--- a/drivers/net/wireless/ath/ath11k/reg.c
+++ b/drivers/net/wireless/ath/ath11k/reg.c
@@ -12,6 +12,10 @@
 #define ATH11K_5GHZ_5725_5850    REG_RULE(5725 - 10, 5850 + 10, 80, 0, 30,\
 					  NL80211_RRF_NO_IR)
 
+#define ETSI_WEATHER_RADAR_BAND_LOW		5590
+#define ETSI_WEATHER_RADAR_BAND_HIGH		5650
+#define ETSI_WEATHER_RADAR_BAND_CAC_TIMEOUT	600000
+
 static const struct ieee80211_regdomain ath11k_world_regd = {
 	.n_reg_rules = 3,
 	.alpha2 =  "00",
@@ -441,6 +445,107 @@ ath11k_reg_get_regdom_str(enum nl80211_dfs_regions dfs_region)
 	}
 }
 
+static u16
+ath11k_reg_adjust_bw(u16 start_freq, u16 end_freq, u16 max_bw)
+{
+	u16 bw;
+
+	bw = end_freq - start_freq;
+	bw = min_t(u16, bw, max_bw);
+
+	if (bw >= 80 && bw < 160)
+		bw = 80;
+	else if (bw >= 40 && bw < 80)
+		bw = 40;
+	else if (bw < 40)
+		bw = 20;
+
+	return bw;
+}
+
+static void
+ath11k_reg_update_weather_radar_band(struct ath11k_base *ab,
+				     struct ieee80211_regdomain *regd,
+				     struct cur_reg_rule *reg_rule,
+				     u8 *rule_idx, u32 flags, u16 max_bw)
+{
+	u32 end_freq;
+	u16 bw;
+	u8 i;
+
+	i = *rule_idx;
+
+	bw = ath11k_reg_adjust_bw(reg_rule->start_freq,
+				  ETSI_WEATHER_RADAR_BAND_LOW, max_bw);
+
+	regd->reg_rules[i] = (struct ieee80211_reg_rule)
+				REG_RULE(reg_rule->start_freq,
+					 ETSI_WEATHER_RADAR_BAND_LOW,
+					 bw,
+					 reg_rule->ant_gain,
+					 reg_rule->reg_power,
+					 flags);
+
+	ath11k_dbg(ab, ATH11K_DBG_REG,
+		   "\t%d. (%d - %d @ %d) (%d, %d) (%d ms) (FLAGS %d)\n",
+		   i + 1, reg_rule->start_freq, ETSI_WEATHER_RADAR_BAND_LOW,
+		   bw, reg_rule->ant_gain, reg_rule->reg_power,
+		   regd->reg_rules[i].dfs_cac_ms,
+		   flags);
+
+	if (reg_rule->end_freq > ETSI_WEATHER_RADAR_BAND_HIGH)
+		end_freq = ETSI_WEATHER_RADAR_BAND_HIGH;
+	else
+		end_freq = reg_rule->end_freq;
+
+	bw = ath11k_reg_adjust_bw(ETSI_WEATHER_RADAR_BAND_LOW, end_freq,
+				  max_bw);
+
+	regd->reg_rules[++i] = (struct ieee80211_reg_rule)
+					REG_RULE(ETSI_WEATHER_RADAR_BAND_LOW,
+						 end_freq,
+						 bw,
+						 reg_rule->ant_gain,
+						 reg_rule->reg_power,
+						 flags);
+
+	regd->reg_rules[i].dfs_cac_ms = ETSI_WEATHER_RADAR_BAND_CAC_TIMEOUT;
+
+	ath11k_dbg(ab, ATH11K_DBG_REG,
+		   "\t%d. (%d - %d @ %d) (%d, %d) (%d ms) (FLAGS %d)\n",
+		   i + 1, ETSI_WEATHER_RADAR_BAND_LOW, end_freq,
+		   bw, reg_rule->ant_gain, reg_rule->reg_power,
+		   regd->reg_rules[i].dfs_cac_ms,
+		   flags);
+
+	if (end_freq == reg_rule->end_freq) {
+		regd->n_reg_rules--;
+		*rule_idx = i;
+		return;
+	}
+
+	bw = ath11k_reg_adjust_bw(ETSI_WEATHER_RADAR_BAND_HIGH,
+				  reg_rule->end_freq, max_bw);
+
+	regd->reg_rules[++i] =
+			(struct ieee80211_reg_rule)
+				REG_RULE(ETSI_WEATHER_RADAR_BAND_HIGH,
+					 reg_rule->end_freq,
+					 bw,
+					 reg_rule->ant_gain,
+					 reg_rule->reg_power,
+					 flags);
+
+	ath11k_dbg(ab, ATH11K_DBG_REG,
+		   "\t%d. (%d - %d @ %d) (%d, %d) (%d ms) (FLAGS %d)\n",
+		   i + 1, ETSI_WEATHER_RADAR_BAND_HIGH, reg_rule->end_freq,
+		   bw, reg_rule->ant_gain, reg_rule->reg_power,
+		   regd->reg_rules[i].dfs_cac_ms,
+		   flags);
+
+	*rule_idx = i;
+}
+
 struct ieee80211_regdomain *
 ath11k_reg_build_regd(struct ath11k_base *ab,
 		      struct cur_regulatory_info *reg_info, bool intersect)
@@ -458,6 +563,10 @@ ath11k_reg_build_regd(struct ath11k_base *ab,
 	if (!num_rules)
 		goto ret;
 
+	/* Add max additional rules to accommodate weather radar band */
+	if (reg_info->dfs_region == DFS_ETSI_REG)
+		num_rules += 2;
+
 	tmp_regd =  kzalloc(sizeof(*tmp_regd) +
 			(num_rules * sizeof(struct ieee80211_reg_rule)),
 			GFP_ATOMIC);
@@ -477,13 +586,15 @@ ath11k_reg_build_regd(struct ath11k_base *ab,
 	/* Update reg_rules[] below. Firmware is expected to
 	 * send these rules in order(2G rules first and then 5G)
 	 */
-	for (; i < num_rules; i++) {
-		if (i < reg_info->num_2g_reg_rules) {
+	for (; i < tmp_regd->n_reg_rules; i++) {
+		if (reg_info->num_2g_reg_rules &&
+		    (i < reg_info->num_2g_reg_rules)) {
 			reg_rule = reg_info->reg_rules_2g_ptr + i;
 			max_bw = min_t(u16, reg_rule->max_bw,
 				       reg_info->max_bw_2g);
 			flags = 0;
-		} else {
+		} else if (reg_info->num_5g_reg_rules &&
+			   (j < reg_info->num_5g_reg_rules)) {
 			reg_rule = reg_info->reg_rules_5g_ptr + j++;
 			max_bw = min_t(u16, reg_rule->max_bw,
 				       reg_info->max_bw_5g);
@@ -495,6 +606,8 @@ ath11k_reg_build_regd(struct ath11k_base *ab,
 			 * per other BW rule flags we pass from here
 			 */
 			flags = NL80211_RRF_AUTO_BW;
+		} else {
+			break;
 		}
 
 		flags |= ath11k_map_fw_reg_flags(reg_rule->flags);
@@ -508,12 +621,26 @@ ath11k_reg_build_regd(struct ath11k_base *ab,
 						 reg_rule->reg_power,
 						 flags);
 
-		/* TODO: Fill DFS CAC Timeout (dfs_cac_ms) */
+		/* Update dfs cac timeout if the dfs domain is ETSI and the
+		 * new rule covers weather radar band.
+		 * Default value of '0' corresponds to 60s timeout, so no
+		 * need to update that for other rules.
+		 */
+		if (flags & NL80211_RRF_DFS &&
+		    reg_info->dfs_region == DFS_ETSI_REG &&
+		    (reg_rule->end_freq > ETSI_WEATHER_RADAR_BAND_LOW &&
+		    reg_rule->start_freq < ETSI_WEATHER_RADAR_BAND_HIGH)){
+			ath11k_reg_update_weather_radar_band(ab, tmp_regd,
+							     reg_rule, &i,
+							     flags, max_bw);
+			continue;
+		}
 
 		ath11k_dbg(ab, ATH11K_DBG_REG,
-			   "\t%d. (%d - %d @ %d) (%d, %d) (FLAGS %d) \n",
+			   "\t%d. (%d - %d @ %d) (%d, %d) (%d ms) (FLAGS %d)\n",
 			   i + 1, reg_rule->start_freq, reg_rule->end_freq,
 			   max_bw, reg_rule->ant_gain, reg_rule->reg_power,
+			   tmp_regd->reg_rules[i].dfs_cac_ms,
 			   flags);
 	}
 
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
