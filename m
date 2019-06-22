Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1heTiy-0006gm-1M
 for ath11k@lists.infradead.org; Sat, 22 Jun 2019 00:17:45 +0000
From: Sriram R <srirrama@codeaurora.org>
Subject: [PATCH 3/4] ath11k: replace locally defined MACRO's with actual
 functions
Date: Sat, 22 Jun 2019 05:47:20 +0530
Message-Id: <1561162641-4676-3-git-send-email-srirrama@codeaurora.org>
In-Reply-To: <1561162641-4676-1-git-send-email-srirrama@codeaurora.org>
References: <1561162641-4676-1-git-send-email-srirrama@codeaurora.org>
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

Replace use of locally defined MIN/MAX macros with actual
min_t/max_t functions respectively.

Signed-off-by: Sriram R <srirrama@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/reg.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/reg.c b/drivers/net/wireless/ath/ath11k/reg.c
index 1b1dd88..da8c6c2 100644
--- a/drivers/net/wireless/ath/ath11k/reg.c
+++ b/drivers/net/wireless/ath/ath11k/reg.c
@@ -339,9 +339,6 @@ static void ath11k_reg_intersect_rules(struct ieee80211_reg_rule *rule1,
 				       struct ieee80211_reg_rule *rule2,
 				       struct ieee80211_reg_rule *new_rule)
 {
-	#define MAX(a, b) max_t(u32, a, b)
-	#define MIN(a, b) min_t(u32, a, b)
-
 	u32 start_freq1, end_freq1;
 	u32 start_freq2, end_freq2;
 	u32 freq_diff, max_bw;
@@ -352,30 +349,29 @@ static void ath11k_reg_intersect_rules(struct ieee80211_reg_rule *rule1,
 	end_freq1 = rule1->freq_range.end_freq_khz;
 	end_freq2 = rule2->freq_range.end_freq_khz;
 
-	new_rule->freq_range.start_freq_khz = MAX(start_freq1, start_freq2);
-	new_rule->freq_range.end_freq_khz = MIN(end_freq1, end_freq2);
+	new_rule->freq_range.start_freq_khz = max_t(u32, start_freq1,
+						    start_freq2);
+	new_rule->freq_range.end_freq_khz = min_t(u32, end_freq1, end_freq2);
 
 	freq_diff = new_rule->freq_range.end_freq_khz -
 			new_rule->freq_range.start_freq_khz;
-	max_bw = MIN(rule1->freq_range.max_bandwidth_khz,
-		     rule2->freq_range.max_bandwidth_khz);
-	new_rule->freq_range.max_bandwidth_khz = MIN(max_bw, freq_diff);
+	max_bw = min_t(u32, rule1->freq_range.max_bandwidth_khz,
+		       rule2->freq_range.max_bandwidth_khz);
+	new_rule->freq_range.max_bandwidth_khz = min_t(u32, max_bw, freq_diff);
 
 	new_rule->power_rule.max_antenna_gain =
-		MIN(rule1->power_rule.max_antenna_gain,
-		    rule2->power_rule.max_antenna_gain);
+		min_t(u32, rule1->power_rule.max_antenna_gain,
+		      rule2->power_rule.max_antenna_gain);
 
-	new_rule->power_rule.max_eirp = MIN(rule1->power_rule.max_eirp,
-					    rule2->power_rule.max_eirp);
+	new_rule->power_rule.max_eirp = min_t(u32, rule1->power_rule.max_eirp,
+					      rule2->power_rule.max_eirp);
 
 	/* Use the flags of both the rules */
 	new_rule->flags = rule1->flags | rule2->flags;
 
 	/* To be safe, lts use the max cac timeout of both rules */
-	new_rule->dfs_cac_ms = MAX(rule1->dfs_cac_ms, rule2->dfs_cac_ms);
-
-	#undef MAX
-	#undef MIN
+	new_rule->dfs_cac_ms = max_t(u32, rule1->dfs_cac_ms,
+				     rule2->dfs_cac_ms);
 }
 
 static struct ieee80211_regdomain *
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
