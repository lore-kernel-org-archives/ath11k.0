Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jM8UU-0007Rb-20
 for ath11k@lists.infradead.org; Wed, 08 Apr 2020 11:03:31 +0000
From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Subject: [PATCH] ath11k: fix duplication peer create on same radio
Date: Wed,  8 Apr 2020 16:33:15 +0530
Message-Id: <1586343795-21422-1-git-send-email-periyasa@codeaurora.org>
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
Cc: Karthikeyan Periyasamy <periyasa@codeaurora.org>, linux-wireless@vger.kernel.org

Add the pdev index information in the peer object to validate
the peer creation. Ignore the peer creation request, if the given
MAC address is already present in the peer list with same radio.
If we allow the peer creation in above scenario, FW assert will happen.
Above scenario occurred in two cases, where Multiple AP VAP created in
the same radio.

1. when testing tool sends association request to two AP with same
   MAC address
2. when a station do roaming from one AP VAP to another AP VAP.

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/peer.c | 35 ++++++++++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath11k/peer.h |  1 +
 2 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/peer.c b/drivers/net/wireless/ath/ath11k/peer.c
index f43deac..2971725 100644
--- a/drivers/net/wireless/ath/ath11k/peer.c
+++ b/drivers/net/wireless/ath/ath11k/peer.c
@@ -17,7 +17,26 @@ struct ath11k_peer *ath11k_peer_find(struct ath11k_base *ab, int vdev_id,
 	list_for_each_entry(peer, &ab->peers, list) {
 		if (peer->vdev_id != vdev_id)
 			continue;
-		if (memcmp(peer->addr, addr, ETH_ALEN))
+		if (!ether_addr_equal(peer->addr, addr))
+			continue;
+
+		return peer;
+	}
+
+	return NULL;
+}
+
+static struct ath11k_peer *ath11k_peer_find_by_pdev_idx(struct ath11k_base *ab,
+							u8 pdev_idx, const u8 *addr)
+{
+	struct ath11k_peer *peer;
+
+	lockdep_assert_held(&ab->base_lock);
+
+	list_for_each_entry(peer, &ab->peers, list) {
+		if (peer->pdev_idx != pdev_idx)
+			continue;
+		if (!ether_addr_equal(peer->addr, addr))
 			continue;
 
 		return peer;
@@ -34,7 +53,7 @@ struct ath11k_peer *ath11k_peer_find_by_addr(struct ath11k_base *ab,
 	lockdep_assert_held(&ab->base_lock);
 
 	list_for_each_entry(peer, &ab->peers, list) {
-		if (memcmp(peer->addr, addr, ETH_ALEN))
+		if (!ether_addr_equal(peer->addr, addr))
 			continue;
 
 		return peer;
@@ -200,6 +219,17 @@ int ath11k_peer_create(struct ath11k *ar, struct ath11k_vif *arvif,
 		return -ENOBUFS;
 	}
 
+	spin_lock_bh(&ar->ab->base_lock);
+	peer = ath11k_peer_find_by_pdev_idx(ar->ab, ar->pdev_idx, param->peer_addr);
+	if (peer) {
+		spin_unlock_bh(&ar->ab->base_lock);
+		ath11k_info(ar->ab,
+			    "ignoring the peer %pM creation on same pdev idx %d\n",
+			    param->peer_addr, ar->pdev_idx);
+		return -EINVAL;
+	}
+	spin_unlock_bh(&ar->ab->base_lock);
+
 	ret = ath11k_wmi_send_peer_create_cmd(ar, param);
 	if (ret) {
 		ath11k_warn(ar->ab,
@@ -225,6 +255,7 @@ int ath11k_peer_create(struct ath11k *ar, struct ath11k_vif *arvif,
 		return -ENOENT;
 	}
 
+	peer->pdev_idx = ar->pdev_idx;
 	peer->sta = sta;
 	arvif->ast_hash = peer->ast_hash;
 
diff --git a/drivers/net/wireless/ath/ath11k/peer.h b/drivers/net/wireless/ath/ath11k/peer.h
index ccca152..5d125ce 100644
--- a/drivers/net/wireless/ath/ath11k/peer.h
+++ b/drivers/net/wireless/ath/ath11k/peer.h
@@ -13,6 +13,7 @@ struct ath11k_peer {
 	u8 addr[ETH_ALEN];
 	int peer_id;
 	u16 ast_hash;
+	u8 pdev_idx;
 
 	/* protected by ab->data_lock */
 	struct ieee80211_key_conf *keys[WMI_MAX_KEY_INDEX + 1];
-- 
1.9.1

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
