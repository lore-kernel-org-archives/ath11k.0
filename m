Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJEXB-00051o-4i
 for ath11k@lists.infradead.org; Wed, 24 Apr 2019 09:49:46 +0000
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH v2] ath11k: move per peer pktlog entry to per sta debugfs
Date: Wed, 24 Apr 2019 15:19:34 +0530
Message-Id: <1556099374-11893-1-git-send-email-akolli@codeaurora.org>
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

Per peer pktlog is enabled through per sta debugfs
Currently this feature is limited on single peer.

Enable pktlog using,
echo "0x6f 2" > /sys/kernel/debug/ath11k/mac0/pktlog_filter

Enable peer pktlog using,
echo 1 > /sys/kernel/debug/ieee80211/phy9/netdev\:wlan0/stations
/8c\:fd\:f0\:0a\:8c\:14/peer_pktlog

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
V2:
  - Fixes warnings and build issues.

 drivers/net/wireless/ath/ath11k/debug.c       | 99 +++++----------------------
 drivers/net/wireless/ath/ath11k/debugfs_sta.c | 81 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/dp_rx.c       |  2 +-
 3 files changed, 100 insertions(+), 82 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debug.c b/drivers/net/wireless/ath/ath11k/debug.c
index f24099ed8dda..b6e18938ba5e 100644
--- a/drivers/net/wireless/ath/ath11k/debug.c
+++ b/drivers/net/wireless/ath/ath11k/debug.c
@@ -992,10 +992,9 @@ static ssize_t ath11k_write_pktlog_filter(struct file *file,
 {
 	struct ath11k *ar = file->private_data;
 	struct htt_rx_ring_tlv_filter tlv_filter = {0};
-	u32 rx_filter = 0, ring_id, filter, peer_valid;
-	u8 buf[128] = {0}, mac_addr[ETH_ALEN] = {0}, mode;
-	char *token, *sptr;
-	int ret, i;
+	u32 rx_filter = 0, ring_id, filter, mode;
+	u8 buf[128] = {0};
+	int ret;
 	ssize_t rc;
 
 	mutex_lock(&ar->conf_mutex);
@@ -1010,24 +1009,13 @@ static ssize_t ath11k_write_pktlog_filter(struct file *file,
 		goto out;
 	}
 	buf[rc] = '\0';
-	sptr = buf;
-
-	token = strsep(&sptr, " ");
-	if (!token) {
-		ret = -EINVAL;
-		goto out;
-	}
 
-	if (kstrtou32(token, 0, &filter)) {
+	ret = sscanf(buf, "0x%x %u", &filter, &mode);
+	if (ret != 2) {
 		ret = -EINVAL;
 		goto out;
 	}
 
-	if (filter == ar->debug.pktlog_filter) {
-		ret = count;
-		goto out;
-	}
-
 	if (filter) {
 		ret = ath11k_wmi_pdev_pktlog_enable(ar, filter);
 		if (ret) {
@@ -1044,36 +1032,23 @@ static ssize_t ath11k_write_pktlog_filter(struct file *file,
 		}
 	}
 
-	token = strsep(&sptr, " ");
-	if (!token) {
-		ret = -EINVAL;
-		goto out;
-	}
-
-	if (kstrtou8(token, 0, &mode)) {
-		ret = -EINVAL;
-		goto out;
-	}
+#define HTT_RX_FILTER_TLV_LITE_MODE \
+			(HTT_RX_FILTER_TLV_FLAGS_PPDU_START | \
+			HTT_RX_FILTER_TLV_FLAGS_PPDU_END | \
+			HTT_RX_FILTER_TLV_FLAGS_PPDU_END_USER_STATS | \
+			HTT_RX_FILTER_TLV_FLAGS_PPDU_END_USER_STATS_EXT | \
+			HTT_RX_FILTER_TLV_FLAGS_PPDU_END_STATUS_DONE | \
+			HTT_RX_FILTER_TLV_FLAGS_MPDU_START)
 
 	if (mode == ATH11K_PKTLOG_MODE_FULL) {
-		rx_filter = HTT_RX_FILTER_TLV_FLAGS_PPDU_START |
-			    HTT_RX_FILTER_TLV_FLAGS_PPDU_END |
-			    HTT_RX_FILTER_TLV_FLAGS_PPDU_END_USER_STATS |
-			    HTT_RX_FILTER_TLV_FLAGS_PPDU_END_USER_STATS_EXT |
-			    HTT_RX_FILTER_TLV_FLAGS_PPDU_END_STATUS_DONE |
-			    HTT_RX_FILTER_TLV_FLAGS_MPDU_START |
+		rx_filter = HTT_RX_FILTER_TLV_LITE_MODE |
 			    HTT_RX_FILTER_TLV_FLAGS_MSDU_START |
 			    HTT_RX_FILTER_TLV_FLAGS_MSDU_END |
 			    HTT_RX_FILTER_TLV_FLAGS_MPDU_END |
 			    HTT_RX_FILTER_TLV_FLAGS_PACKET_HEADER |
 			    HTT_RX_FILTER_TLV_FLAGS_ATTENTION;
 	} else if (mode == ATH11K_PKTLOG_MODE_LITE) {
-		rx_filter = HTT_RX_FILTER_TLV_FLAGS_PPDU_START |
-			    HTT_RX_FILTER_TLV_FLAGS_PPDU_END |
-			    HTT_RX_FILTER_TLV_FLAGS_PPDU_END_USER_STATS |
-			    HTT_RX_FILTER_TLV_FLAGS_PPDU_END_USER_STATS_EXT |
-			    HTT_RX_FILTER_TLV_FLAGS_PPDU_END_STATUS_DONE |
-			    HTT_RX_FILTER_TLV_FLAGS_MPDU_START;
+		rx_filter = HTT_RX_FILTER_TLV_LITE_MODE;
 	}
 
 	tlv_filter.rx_filter = rx_filter;
@@ -1089,53 +1064,16 @@ static ssize_t ath11k_write_pktlog_filter(struct file *file,
 	ret = ath11k_dp_htt_rx_filter_setup(ar->ab, ring_id, ar->dp.mac_id,
 					    HAL_RXDMA_MONITOR_STATUS,
 					    DP_RX_BUFFER_SIZE, &tlv_filter);
-
 	if (ret) {
 		ath11k_warn(ar->ab, "failed to set rx filter for moniter status ring\n");
 		goto out;
 	}
 
-	token = strsep(&sptr, " ");
-	if (!token) {
-		ret = -EINVAL;
-		goto out;
-	}
-
-	if (kstrtou32(token, 0, &peer_valid)) {
-		ret = -EINVAL;
-		goto out;
-	}
-
-	if (peer_valid) {
-		token = strsep(&sptr, " ");
-		if (token) {
-			for (i = 0; i < ETH_ALEN - 1; i++) {
-				token = strsep(&sptr, ":");
-				if (!token)
-					return -EINVAL;
-
-				if (kstrtou8(token, 16, &mac_addr[i]))
-					return -EINVAL;
-			}
-			memcpy(ar->debug.pktlog_peer_addr, mac_addr, ETH_ALEN);
-		}
-	}
-
-	/* Send peer based pktlog enable/disable */
-	ret = ath11k_wmi_pdev_peer_pktlog_filter(ar, mac_addr, peer_valid);
-	if (ret) {
-		ath11k_warn(ar->ab, "failed to set peer pktlog filter %pM: %d\n",
-			    mac_addr, ret);
-		goto out;
-	}
-
-	ath11k_dbg(ar->ab, ATH11K_DBG_WMI, "pktlog filter %d mode %s peer addr %pM\n",
-		   filter, ((mode == ATH11K_PKTLOG_MODE_FULL)?"full":"lite"),
-		   ar->debug.pktlog_peer_addr);
+	ath11k_dbg(ar->ab, ATH11K_DBG_WMI, "pktlog filter %d mode %s\n",
+		   filter, ((mode == ATH11K_PKTLOG_MODE_FULL)?"full":"lite"));
 
 	ar->debug.pktlog_filter = filter;
 	ar->debug.pktlog_mode = mode;
-	ar->debug.pktlog_peer_valid = peer_valid;
 	ret = count;
 
 out:
@@ -1153,10 +1091,9 @@ static ssize_t ath11k_read_pktlog_filter(struct file *file,
 	int len = 0;
 
 	mutex_lock(&ar->conf_mutex);
-	len = scnprintf(buf, sizeof(buf) - len, "%08x %08x %08x\n",
+	len = scnprintf(buf, sizeof(buf) - len, "%08x %08x\n",
 			ar->debug.pktlog_filter,
-			ar->debug.pktlog_mode,
-			ar->debug.pktlog_peer_valid);
+			ar->debug.pktlog_mode);
 	mutex_unlock(&ar->conf_mutex);
 
 	return simple_read_from_buffer(ubuf, count, ppos, buf, len);
diff --git a/drivers/net/wireless/ath/ath11k/debugfs_sta.c b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
index 41b2221e0479..b9d006b828e7 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
@@ -382,6 +382,84 @@ static ssize_t ath11k_dbg_sta_dump_rx_stats(struct file *file,
 	.llseek = default_llseek,
 };
 
+static ssize_t ath11k_dbg_sta_write_peer_pktlog(struct file *file,
+						const char __user *ubuf,
+						size_t count, loff_t *ppos)
+{
+	struct ieee80211_sta *sta = file->private_data;
+	struct ath11k_sta *arsta = (struct ath11k_sta *)sta->drv_priv;
+	struct ath11k *ar = arsta->arvif->ar;
+	u8 buf[32] = {0};
+	int ret, enable;
+	ssize_t rc;
+
+	mutex_lock(&ar->conf_mutex);
+
+	if (ar->state != ATH11K_STATE_ON) {
+		ret = -ENETDOWN;
+		goto out;
+	}
+
+	rc = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, ubuf, count);
+	if (rc < 0) {
+		ret = rc;
+		goto out;
+	}
+	buf[rc] = '\0';
+
+	ret = sscanf(buf, "%d", &enable);
+	if (ret != 1) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	ar->debug.pktlog_peer_valid = enable;
+	memcpy(ar->debug.pktlog_peer_addr, sta->addr, ETH_ALEN);
+
+	/* Send peer based pktlog enable/disable */
+	ret = ath11k_wmi_pdev_peer_pktlog_filter(ar, sta->addr, enable);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to set peer pktlog filter %pM: %d\n",
+			    sta->addr, ret);
+		goto out;
+	}
+
+	ath11k_dbg(ar->ab, ATH11K_DBG_WMI, "peer pktlog filter set to %d\n",
+		   enable);
+	ret = count;
+
+out:
+	mutex_unlock(&ar->conf_mutex);
+	return ret;
+}
+
+static ssize_t ath11k_dbg_sta_read_peer_pktlog(struct file *file,
+					       char __user *ubuf,
+					       size_t count, loff_t *ppos)
+{
+	struct ieee80211_sta *sta = file->private_data;
+	struct ath11k_sta *arsta = (struct ath11k_sta *)sta->drv_priv;
+	struct ath11k *ar = arsta->arvif->ar;
+	char buf[32] = {0};
+	int len;
+
+	mutex_lock(&ar->conf_mutex);
+	len = scnprintf(buf, sizeof(buf), "%08x %pM\n",
+			ar->debug.pktlog_peer_valid,
+			ar->debug.pktlog_peer_addr);
+	mutex_unlock(&ar->conf_mutex);
+
+	return simple_read_from_buffer(ubuf, count, ppos, buf, len);
+}
+
+static const struct file_operations fops_peer_pktlog = {
+	.write = ath11k_dbg_sta_write_peer_pktlog,
+	.read = ath11k_dbg_sta_read_peer_pktlog,
+	.open = simple_open,
+	.owner = THIS_MODULE,
+	.llseek = default_llseek,
+};
+
 void ath11k_sta_add_debugfs(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			    struct ieee80211_sta *sta, struct dentry *dir)
 {
@@ -393,4 +471,7 @@ void ath11k_sta_add_debugfs(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	if (ath11k_debug_is_extd_rx_stats_enabled(ar))
 		debugfs_create_file("rx_stats", 0400, dir, sta,
 				    &fops_rx_stats);
+
+	debugfs_create_file("peer_pktlog", 0644, dir, sta,
+			    &fops_peer_pktlog);
 }
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index b57cd30be987..f955563662bd 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -988,7 +988,7 @@ static int ath11k_htt_pull_ppdu_stats(struct ath11k_base *ab,
 	ppdu_id = *((u32 *)data + 1);
 	ar = ab->pdevs[pdev_id].ar;
 
-	if (!ar->debug.pktlog_mode == ATH11K_PKTLOG_MODE_LITE) {
+	if (ar->debug.pktlog_mode == ATH11K_PKTLOG_MODE_LITE) {
 		/* TODO update the pktlog tracing */
 	}
 
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
