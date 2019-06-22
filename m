Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1heTiq-0006ek-0t
 for ath11k@lists.infradead.org; Sat, 22 Jun 2019 00:17:37 +0000
From: Sriram R <srirrama@codeaurora.org>
Subject: [PATCH 1/4] ath11k: Avoid use of struct initializers for runtime
 assignment
Date: Sat, 22 Jun 2019 05:47:18 +0530
Message-Id: <1561162641-4676-1-git-send-email-srirrama@codeaurora.org>
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

Cleanup the use of REG_RULE struct initializer macro for updating or
addinig reg rules at runtime. Rather make use of a separate function
to update reg rules while building new regd data.

Signed-off-by: Sriram R <srirrama@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/reg.c | 64 +++++++++++++++++++----------------
 1 file changed, 34 insertions(+), 30 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/reg.c b/drivers/net/wireless/ath/ath11k/reg.c
index cc847a7..f181061 100644
--- a/drivers/net/wireless/ath/ath11k/reg.c
+++ b/drivers/net/wireless/ath/ath11k/reg.c
@@ -468,6 +468,19 @@ ath11k_reg_adjust_bw(u16 start_freq, u16 end_freq, u16 max_bw)
 }
 
 static void
+ath11k_reg_update_rule(struct ieee80211_reg_rule *reg_rule, u32 start_freq,
+		       u32 end_freq, u32 bw, u32 ant_gain, u32 reg_pwr,
+		       u32 reg_flags)
+{
+	reg_rule->freq_range.start_freq_khz = MHZ_TO_KHZ(start_freq);
+	reg_rule->freq_range.end_freq_khz = MHZ_TO_KHZ(end_freq);
+	reg_rule->freq_range.max_bandwidth_khz = MHZ_TO_KHZ(bw);
+	reg_rule->power_rule.max_antenna_gain = DBI_TO_MBI(ant_gain);
+	reg_rule->power_rule.max_eirp = DBM_TO_MBM(reg_pwr);
+	reg_rule->flags = reg_flags;
+}
+
+static void
 ath11k_reg_update_weather_radar_band(struct ath11k_base *ab,
 				     struct ieee80211_regdomain *regd,
 				     struct cur_reg_rule *reg_rule,
@@ -482,13 +495,10 @@ ath11k_reg_update_weather_radar_band(struct ath11k_base *ab,
 	bw = ath11k_reg_adjust_bw(reg_rule->start_freq,
 				  ETSI_WEATHER_RADAR_BAND_LOW, max_bw);
 
-	regd->reg_rules[i] = (struct ieee80211_reg_rule)
-				REG_RULE(reg_rule->start_freq,
-					 ETSI_WEATHER_RADAR_BAND_LOW,
-					 bw,
-					 reg_rule->ant_gain,
-					 reg_rule->reg_power,
-					 flags);
+	ath11k_reg_update_rule(regd->reg_rules + i, reg_rule->start_freq,
+			       ETSI_WEATHER_RADAR_BAND_LOW, bw,
+			       reg_rule->ant_gain, reg_rule->reg_power,
+			       flags);
 
 	ath11k_dbg(ab, ATH11K_DBG_REG,
 		   "\t%d. (%d - %d @ %d) (%d, %d) (%d ms) (FLAGS %d)\n",
@@ -505,13 +515,12 @@ ath11k_reg_update_weather_radar_band(struct ath11k_base *ab,
 	bw = ath11k_reg_adjust_bw(ETSI_WEATHER_RADAR_BAND_LOW, end_freq,
 				  max_bw);
 
-	regd->reg_rules[++i] = (struct ieee80211_reg_rule)
-					REG_RULE(ETSI_WEATHER_RADAR_BAND_LOW,
-						 end_freq,
-						 bw,
-						 reg_rule->ant_gain,
-						 reg_rule->reg_power,
-						 flags);
+	i++;
+
+	ath11k_reg_update_rule(regd->reg_rules + i,
+			       ETSI_WEATHER_RADAR_BAND_LOW, end_freq, bw,
+			       reg_rule->ant_gain, reg_rule->reg_power,
+			       flags);
 
 	regd->reg_rules[i].dfs_cac_ms = ETSI_WEATHER_RADAR_BAND_CAC_TIMEOUT;
 
@@ -531,14 +540,12 @@ ath11k_reg_update_weather_radar_band(struct ath11k_base *ab,
 	bw = ath11k_reg_adjust_bw(ETSI_WEATHER_RADAR_BAND_HIGH,
 				  reg_rule->end_freq, max_bw);
 
-	regd->reg_rules[++i] =
-			(struct ieee80211_reg_rule)
-				REG_RULE(ETSI_WEATHER_RADAR_BAND_HIGH,
-					 reg_rule->end_freq,
-					 bw,
-					 reg_rule->ant_gain,
-					 reg_rule->reg_power,
-					 flags);
+	i++;
+
+	ath11k_reg_update_rule(regd->reg_rules + i, ETSI_WEATHER_RADAR_BAND_HIGH,
+			       reg_rule->end_freq, bw,
+			       reg_rule->ant_gain, reg_rule->reg_power,
+			       flags);
 
 	ath11k_dbg(ab, ATH11K_DBG_REG,
 		   "\t%d. (%d - %d @ %d) (%d, %d) (%d ms) (FLAGS %d)\n",
@@ -616,14 +623,11 @@ ath11k_reg_build_regd(struct ath11k_base *ab,
 
 		flags |= ath11k_map_fw_reg_flags(reg_rule->flags);
 
-		tmp_regd->reg_rules[i] =
-				(struct ieee80211_reg_rule)
-					REG_RULE(reg_rule->start_freq,
-						 reg_rule->end_freq,
-						 max_bw,
-						 reg_rule->ant_gain,
-						 reg_rule->reg_power,
-						 flags);
+		ath11k_reg_update_rule(tmp_regd->reg_rules + i,
+				       reg_rule->start_freq,
+				       reg_rule->end_freq, max_bw,
+				       reg_rule->ant_gain, reg_rule->reg_power,
+				       flags);
 
 		/* Update dfs cac timeout if the dfs domain is ETSI and the
 		 * new rule covers weather radar band.
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
