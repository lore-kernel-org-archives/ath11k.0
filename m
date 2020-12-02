Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-5.mailgun.net ([69.72.42.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkKAo-0007Mb-My
 for ath11k@lists.infradead.org; Wed, 02 Dec 2020 04:55:28 +0000
From: Thiraviyam Mariyappan <tmariyap@codeaurora.org>
Subject: [PATCH] mac80211: fix rx byte values not updated on mesh link
Date: Wed,  2 Dec 2020 10:25:12 +0530
Message-Id: <1606884912-10987-1-git-send-email-tmariyap@codeaurora.org>
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
Cc: Thiraviyam Mariyappan <tmariyap@codeaurora.org>, linux-wireless@vger.kernel.org

In mesh link, rx byte values were not updating though rx packets keep
increasing in the station dump. This is because of rx_stats were updated
regardless of USES_RSS flag is enabled/disabled. Solved the issue by
updating the rx_stats from percpu pointers according to the USES_RSS flag

Signed-off-by: Thiraviyam Mariyappan <tmariyap@codeaurora.org>
---
 net/mac80211/mesh_plink.c |  6 +++++-
 net/mac80211/rx.c         | 44 ++++++++++++++++++++++++++++++++++----------
 2 files changed, 39 insertions(+), 11 deletions(-)

diff --git a/net/mac80211/mesh_plink.c b/net/mac80211/mesh_plink.c
index aca26df..e840277 100644
--- a/net/mac80211/mesh_plink.c
+++ b/net/mac80211/mesh_plink.c
@@ -416,6 +416,7 @@ static void mesh_sta_info_init(struct ieee80211_sub_if_data *sdata,
 	struct ieee80211_supported_band *sband;
 	u32 rates, basic_rates = 0, changed = 0;
 	enum ieee80211_sta_rx_bandwidth bw = sta->sta.bandwidth;
+	struct ieee80211_sta_rx_stats *stats;
 
 	sband = ieee80211_get_sband(sdata);
 	if (!sband)
@@ -425,7 +426,10 @@ static void mesh_sta_info_init(struct ieee80211_sub_if_data *sdata,
 					&basic_rates);
 
 	spin_lock_bh(&sta->mesh->plink_lock);
-	sta->rx_stats.last_rx = jiffies;
+	stats = &sta->rx_stats;
+	if (ieee80211_hw_check(&local->hw, USES_RSS))
+		stats = this_cpu_ptr(sta->pcpu_rx_stats);
+	stats->last_rx = jiffies;
 
 	/* rates and capabilities don't change during peering */
 	if (sta->mesh->plink_state == NL80211_PLINK_ESTAB &&
diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index 062c2b4..1e8851d 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -2212,6 +2212,7 @@ ieee80211_rx_h_defragment(struct ieee80211_rx_data *rx)
 	unsigned int frag, seq;
 	struct ieee80211_fragment_entry *entry;
 	struct sk_buff *skb;
+	struct ieee80211_sta_rx_stats *stats;
 
 	hdr = (struct ieee80211_hdr *)rx->skb->data;
 	fc = hdr->frame_control;
@@ -2340,8 +2341,12 @@ ieee80211_rx_h_defragment(struct ieee80211_rx_data *rx)
  out:
 	ieee80211_led_rx(rx->local);
  out_no_led:
-	if (rx->sta)
-		rx->sta->rx_stats.packets++;
+	if (rx->sta) {
+		stats = &rx->sta->rx_stats;
+		if (ieee80211_hw_check(&rx->sdata->local->hw, USES_RSS))
+			stats = this_cpu_ptr(rx->sta->pcpu_rx_stats);
+		stats->packets++;
+	}
 	return RX_CONTINUE;
 }
 
@@ -3134,6 +3139,7 @@ ieee80211_rx_h_action(struct ieee80211_rx_data *rx)
 	struct ieee80211_mgmt *mgmt = (struct ieee80211_mgmt *) rx->skb->data;
 	struct ieee80211_rx_status *status = IEEE80211_SKB_RXCB(rx->skb);
 	int len = rx->skb->len;
+	struct ieee80211_sta_rx_stats *stats;
 
 	if (!ieee80211_is_action(mgmt->frame_control))
 		return RX_CONTINUE;
@@ -3415,16 +3421,24 @@ ieee80211_rx_h_action(struct ieee80211_rx_data *rx)
 	return RX_CONTINUE;
 
  handled:
-	if (rx->sta)
-		rx->sta->rx_stats.packets++;
+	if (rx->sta) {
+		stats = &rx->sta->rx_stats;
+		if (ieee80211_hw_check(&local->hw, USES_RSS))
+			stats = this_cpu_ptr(rx->sta->pcpu_rx_stats);
+		stats->packets++;
+	}
 	dev_kfree_skb(rx->skb);
 	return RX_QUEUED;
 
  queue:
 	skb_queue_tail(&sdata->skb_queue, rx->skb);
 	ieee80211_queue_work(&local->hw, &sdata->work);
-	if (rx->sta)
-		rx->sta->rx_stats.packets++;
+	if (rx->sta) {
+		stats = &rx->sta->rx_stats;
+		if (ieee80211_hw_check(&local->hw, USES_RSS))
+			stats = this_cpu_ptr(rx->sta->pcpu_rx_stats);
+		stats->packets++;
+	}
 	return RX_QUEUED;
 }
 
@@ -3467,6 +3481,7 @@ ieee80211_rx_h_action_post_userspace(struct ieee80211_rx_data *rx)
 	struct ieee80211_sub_if_data *sdata = rx->sdata;
 	struct ieee80211_mgmt *mgmt = (struct ieee80211_mgmt *) rx->skb->data;
 	int len = rx->skb->len;
+	struct ieee80211_sta_rx_stats *stats;
 
 	if (!ieee80211_is_action(mgmt->frame_control))
 		return RX_CONTINUE;
@@ -3490,8 +3505,12 @@ ieee80211_rx_h_action_post_userspace(struct ieee80211_rx_data *rx)
 	return RX_CONTINUE;
 
  handled:
-	if (rx->sta)
-		rx->sta->rx_stats.packets++;
+	if (rx->sta) {
+		stats = &rx->sta->rx_stats;
+		if (ieee80211_hw_check(&rx->sdata->local->hw, USES_RSS))
+			stats = this_cpu_ptr(rx->sta->pcpu_rx_stats);
+		stats->packets++;
+	}
 	dev_kfree_skb(rx->skb);
 	return RX_QUEUED;
 }
@@ -3585,6 +3604,7 @@ ieee80211_rx_h_mgmt(struct ieee80211_rx_data *rx)
 {
 	struct ieee80211_sub_if_data *sdata = rx->sdata;
 	struct ieee80211_mgmt *mgmt = (void *)rx->skb->data;
+	struct ieee80211_sta_rx_stats *stats;
 	__le16 stype;
 
 	stype = mgmt->frame_control & cpu_to_le16(IEEE80211_FCTL_STYPE);
@@ -3635,8 +3655,12 @@ ieee80211_rx_h_mgmt(struct ieee80211_rx_data *rx)
 	/* queue up frame and kick off work to process it */
 	skb_queue_tail(&sdata->skb_queue, rx->skb);
 	ieee80211_queue_work(&rx->local->hw, &sdata->work);
-	if (rx->sta)
-		rx->sta->rx_stats.packets++;
+	if (rx->sta) {
+		stats = &rx->sta->rx_stats;
+		if (ieee80211_hw_check(&rx->sdata->local->hw, USES_RSS))
+			stats = this_cpu_ptr(rx->sta->pcpu_rx_stats);
+		stats->packets++;
+	}
 
 	return RX_QUEUED;
 }
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
