Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hg3oz-0000WA-Jh
 for ath11k@lists.infradead.org; Wed, 26 Jun 2019 09:02:35 +0000
From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Subject: [PATCH] ath11k: avoid inappropriate data lock
Date: Wed, 26 Jun 2019 14:32:05 +0530
Message-Id: <1561539725-24438-1-git-send-email-periyasa@codeaurora.org>
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
Cc: Karthikeyan Periyasamy <periyasa@codeaurora.org>

peer data should protected by the ath11k_base data_lock not
by the ath11k data_lock. so lock the ath11k_base data_lock
before accessing ath11k_peer_find().

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 40 ++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1a4a333..f30b2df 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -2095,6 +2095,7 @@ static int ath11k_clear_peer_keys(struct ath11k_vif *arvif,
 				  const u8 *addr)
 {
 	struct ath11k *ar = arvif->ar;
+	struct ath11k_base *ab = ar->ab;
 	struct ath11k_peer *peer;
 	int first_errno = 0;
 	int ret;
@@ -2103,9 +2104,9 @@ static int ath11k_clear_peer_keys(struct ath11k_vif *arvif,
 
 	lockdep_assert_held(&ar->conf_mutex);
 
-	spin_lock_bh(&ar->data_lock);
-	peer = ath11k_peer_find(ar->ab, arvif->vdev_id, addr);
-	spin_unlock_bh(&ar->data_lock);
+	spin_lock_bh(&ab->data_lock);
+	peer = ath11k_peer_find(ab, arvif->vdev_id, addr);
+	spin_unlock_bh(&ab->data_lock);
 
 	if (!peer)
 		return -ENOENT;
@@ -2121,12 +2122,12 @@ static int ath11k_clear_peer_keys(struct ath11k_vif *arvif,
 			first_errno = ret;
 
 		if (ret < 0)
-			ath11k_warn(ar->ab, "failed to remove peer key %d: %d\n",
+			ath11k_warn(ab, "failed to remove peer key %d: %d\n",
 				    i, ret);
 
-		spin_lock_bh(&ar->data_lock);
+		spin_lock_bh(&ab->data_lock);
 		peer->keys[i] = NULL;
-		spin_unlock_bh(&ar->data_lock);
+		spin_unlock_bh(&ab->data_lock);
 	}
 
 	return first_errno;
@@ -2137,6 +2138,7 @@ static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 				 struct ieee80211_key_conf *key)
 {
 	struct ath11k *ar = hw->priv;
+	struct ath11k_base *ab = ar->ab;
 	struct ath11k_vif *arvif = ath11k_vif_to_arvif(vif);
 	struct ath11k_peer *peer;
 	const u8 *peer_addr;
@@ -2167,13 +2169,13 @@ static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	/* the peer should not disappear in mid-way (unless FW goes awry) since
 	 * we already hold conf_mutex. we just make sure its there now.
 	 */
-	spin_lock_bh(&ar->data_lock);
-	peer = ath11k_peer_find(ar->ab, arvif->vdev_id, peer_addr);
-	spin_unlock_bh(&ar->data_lock);
+	spin_lock_bh(&ab->data_lock);
+	peer = ath11k_peer_find(ab, arvif->vdev_id, peer_addr);
+	spin_unlock_bh(&ab->data_lock);
 
 	if (!peer) {
 		if (cmd == SET_KEY) {
-			ath11k_warn(ar->ab, "cannot install key for non-existent peer %pM\n",
+			ath11k_warn(ab, "cannot install key for non-existent peer %pM\n",
 				    peer_addr);
 			ret = -EOPNOTSUPP;
 			goto exit;
@@ -2192,20 +2194,20 @@ static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 
 	ret = ath11k_install_key(arvif, key, cmd, peer_addr, flags);
 	if (ret) {
-		ath11k_warn(ar->ab, "ath11k_install_key failed (%d)\n", ret);
+		ath11k_warn(ab, "ath11k_install_key failed (%d)\n", ret);
 		goto exit;
 	}
 
-	spin_lock_bh(&ar->data_lock);
-	peer = ath11k_peer_find(ar->ab, arvif->vdev_id, peer_addr);
+	spin_lock_bh(&ab->data_lock);
+	peer = ath11k_peer_find(ab, arvif->vdev_id, peer_addr);
 	if (peer && cmd == SET_KEY)
 		peer->keys[key->keyidx] = key;
 	else if (peer && cmd == DISABLE_KEY)
 		peer->keys[key->keyidx] = NULL;
 	else if (!peer)
 		/* impossible unless FW goes crazy */
-		ath11k_warn(ar->ab, "peer %pM disappeared!\n", peer_addr);
-	spin_unlock_bh(&ar->data_lock);
+		ath11k_warn(ab, "peer %pM disappeared!\n", peer_addr);
+	spin_unlock_bh(&ab->data_lock);
 
 exit:
 	mutex_unlock(&ar->conf_mutex);
@@ -2669,21 +2671,25 @@ static void ath11k_mac_op_sta_rc_update(struct ieee80211_hw *hw,
 	struct ath11k_peer *peer;
 	u32 bw, smps;
 
-	spin_lock_bh(&ar->data_lock);
+	spin_lock_bh(&ar->ab->data_lock);
 
 	peer = ath11k_peer_find(ar->ab, arvif->vdev_id, sta->addr);
 	if (!peer) {
-		spin_unlock_bh(&ar->data_lock);
+		spin_unlock_bh(&ar->ab->data_lock);
 		ath11k_warn(ar->ab, "mac sta rc update failed to find peer %pM on vdev %i\n",
 			    sta->addr, arvif->vdev_id);
 		return;
 	}
 
+	spin_unlock_bh(&ar->ab->data_lock);
+
 	ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
 		   "mac sta rc update for %pM changed %08x bw %d nss %d smps %d\n",
 		   sta->addr, changed, sta->bandwidth, sta->rx_nss,
 		   sta->smps_mode);
 
+	spin_lock_bh(&ar->data_lock);
+
 	if (changed & IEEE80211_RC_BW_CHANGED) {
 		bw = WMI_PEER_CHWIDTH_20MHZ;
 
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
