Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hd5wD-0007AK-FJ
 for ath11k@lists.infradead.org; Tue, 18 Jun 2019 04:41:43 +0000
Received: from vasanth-lnx.qca.qualcomm.com
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: vthiagar@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 739D160275
 for <ath11k@lists.infradead.org>; Tue, 18 Jun 2019 04:41:39 +0000 (UTC)
From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: [PATCH 2/5] ath11k: Add peer.[ch] files for peer related util
 functions
Date: Tue, 18 Jun 2019 10:11:26 +0530
Message-Id: <1560832889-14129-2-git-send-email-vthiagar@codeaurora.org>
In-Reply-To: <1560832889-14129-1-git-send-email-vthiagar@codeaurora.org>
References: <1560832889-14129-1-git-send-email-vthiagar@codeaurora.org>
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

Move peer util functions from mac.c and core.c to peer.c

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/Makefile      |   3 +-
 drivers/net/wireless/ath/ath11k/core.c        | 101 -----------
 drivers/net/wireless/ath/ath11k/core.h        |  22 ---
 drivers/net/wireless/ath/ath11k/debug.c       |   1 +
 drivers/net/wireless/ath/ath11k/debugfs_sta.c |   1 +
 drivers/net/wireless/ath/ath11k/dp.c          |   1 +
 drivers/net/wireless/ath/ath11k/dp_rx.c       |   1 +
 drivers/net/wireless/ath/ath11k/mac.c         | 131 +-------------
 drivers/net/wireless/ath/ath11k/peer.c        | 236 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/peer.h        |  35 ++++
 drivers/net/wireless/ath/ath11k/wmi.c         |   1 +
 11 files changed, 279 insertions(+), 254 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath11k/peer.c
 create mode 100644 drivers/net/wireless/ath/ath11k/peer.h

diff --git a/drivers/net/wireless/ath/ath11k/Makefile b/drivers/net/wireless/ath/ath11k/Makefile
index 4f86b18..6b4a5b5 100644
--- a/drivers/net/wireless/ath/ath11k/Makefile
+++ b/drivers/net/wireless/ath/ath11k/Makefile
@@ -14,7 +14,8 @@ ath11k-y += core.o \
 	    dp_tx.o \
 	    dp_rx.o \
 	    debug.o \
-	    ce.o
+	    ce.o \
+	    peer.o
 
 ath11k-$(CONFIG_ATH11K_DEBUGFS) += debug_htt_stats.o
 ath11k-$(CONFIG_MAC80211_DEBUGFS) += debugfs_sta.o
diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index be4f86a..fc863d6 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -324,107 +324,6 @@ int ath11k_core_fetch_bdf(struct ath11k_base *sc, struct ath11k_board_data *bd)
 
 }
 
-struct ath11k_peer *ath11k_peer_find(struct ath11k_base *ab, int vdev_id,
-				     const u8 *addr)
-{
-	struct ath11k_peer *peer;
-
-	lockdep_assert_held(&ab->data_lock);
-
-	list_for_each_entry(peer, &ab->peers, list) {
-		if (peer->vdev_id != vdev_id)
-			continue;
-		if (memcmp(peer->addr, addr, ETH_ALEN))
-			continue;
-
-		return peer;
-	}
-
-	return NULL;
-}
-
-struct ath11k_peer *ath11k_peer_find_by_addr(struct ath11k_base *ab,
-					     const u8 *addr)
-{
-	struct ath11k_peer *peer;
-
-	lockdep_assert_held(&ab->data_lock);
-
-	list_for_each_entry(peer, &ab->peers, list) {
-		if (memcmp(peer->addr, addr, ETH_ALEN))
-			continue;
-
-		return peer;
-	}
-
-	return NULL;
-}
-
-struct ath11k_peer *ath11k_peer_find_by_id(struct ath11k_base *ab,
-					   int peer_id)
-{
-	struct ath11k_peer *peer;
-
-	lockdep_assert_held(&ab->data_lock);
-
-	list_for_each_entry(peer, &ab->peers, list)
-		if (peer_id == peer->peer_id)
-			return peer;
-
-	return NULL;
-}
-
-void ath11k_peer_unmap_event(struct ath11k_base *ab, u16 peer_id)
-{
-	struct ath11k_peer *peer;
-
-	spin_lock_bh(&ab->data_lock);
-
-	peer = ath11k_peer_find_by_id(ab, peer_id);
-	if (!peer) {
-		ath11k_warn(ab, "peer-unmap-event: unknown peer id %d\n",
-			    peer_id);
-		goto exit;
-	}
-
-	ath11k_dbg(ab, ATH11K_DBG_DP_HTT, "htt peer unmap vdev %d peer %pM id %d\n",
-		   peer->vdev_id, peer->addr, peer_id);
-
-	list_del(&peer->list);
-	kfree(peer);
-	wake_up(&ab->peer_mapping_wq);
-
-exit:
-	spin_unlock_bh(&ab->data_lock);
-}
-
-void ath11k_peer_map_event(struct ath11k_base *ab, u8 vdev_id, u16 peer_id,
-			   u8 *mac_addr, u16 ast_hash)
-{
-	struct ath11k_peer *peer;
-
-	spin_lock_bh(&ab->data_lock);
-	peer = ath11k_peer_find(ab, vdev_id, mac_addr);
-	if (!peer) {
-		peer = kzalloc(sizeof(*peer), GFP_ATOMIC);
-		if (!peer)
-			goto exit;
-
-		peer->vdev_id = vdev_id;
-		peer->peer_id = peer_id;
-		peer->ast_hash = ast_hash;
-		ether_addr_copy(peer->addr, mac_addr);
-		list_add(&peer->list, &ab->peers);
-		wake_up(&ab->peer_mapping_wq);
-	}
-
-	ath11k_dbg(ab, ATH11K_DBG_DP_HTT, "htt peer map vdev %d peer %pM id %d\n",
-		   vdev_id, mac_addr, peer_id);
-
-exit:
-	spin_unlock_bh(&ab->data_lock);
-}
-
 static void ath11k_core_stop(struct ath11k_base *sc)
 {
 	if (!test_bit(ATH11K_FLAG_CRASH_FLUSH, &sc->dev_flags))
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 038f905..d15ae78 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -239,19 +239,6 @@ struct ath11k_rx_peer_stats {
 	u64 reception_type[HAL_RX_RECEPTION_TYPE_MAX];
 };
 
-struct ath11k_peer {
-	struct list_head list;
-	struct ieee80211_sta *sta;
-	int vdev_id;
-	u8 addr[ETH_ALEN];
-	int peer_id;
-	u16 ast_hash;
-
-	/* protected by ab->data_lock */
-	struct ieee80211_key_conf *keys[WMI_MAX_KEY_INDEX + 1];
-	struct dp_rx_tid rx_tid[IEEE80211_NUM_TIDS + 1];
-};
-
 #define ATH11K_HE_MCS_NUM       12
 #define ATH11K_VHT_MCS_NUM      10
 #define ATH11K_BW_NUM           4
@@ -799,15 +786,6 @@ struct ath11k_fw_stats_peer_extd {
 	u32 rx_mc_bc_cnt;
 };
 
-void ath11k_peer_unmap_event(struct ath11k_base *ab, u16 peer_id);
-void ath11k_peer_map_event(struct ath11k_base *ab, u8 vdev_id, u16 peer_id,
-			   u8 *mac_addr, u16 ast_hash);
-struct ath11k_peer *ath11k_peer_find(struct ath11k_base *ab, int vdev_id,
-				     const u8 *addr);
-struct ath11k_peer *ath11k_peer_find_by_addr(struct ath11k_base *ab,
-					     const u8 *addr);
-struct ath11k_peer *ath11k_peer_find_by_id(struct ath11k_base *ab,
-						  int peer_id);
 int ath11k_core_qmi_firmware_ready(struct ath11k_base *ab);
 int ath11k_core_init(struct ath11k_base *ath11k);
 void ath11k_core_deinit(struct ath11k_base *ath11k);
diff --git a/drivers/net/wireless/ath/ath11k/debug.c b/drivers/net/wireless/ath/ath11k/debug.c
index 69a2340..4a878eb 100644
--- a/drivers/net/wireless/ath/ath11k/debug.c
+++ b/drivers/net/wireless/ath/ath11k/debug.c
@@ -9,6 +9,7 @@
 #include "wmi.h"
 #include "hal_rx.h"
 #include "dp_tx.h"
+#include "peer.h"
 
 void ath11k_info(struct ath11k_base *sc, const char *fmt, ...)
 {
diff --git a/drivers/net/wireless/ath/ath11k/debugfs_sta.c b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
index cff6a3f..6bebe6d 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
@@ -4,6 +4,7 @@
  */
 
 #include "core.h"
+#include "peer.h"
 #include "debug.h"
 
 void ath11k_sta_update_rx_duration(struct ath11k *ar,
diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index 0aec840..815a343 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -9,6 +9,7 @@
 #include "hal_tx.h"
 #include "debug.h"
 #include "dp_rx.h"
+#include "peer.h"
 
 static void ath11k_dp_htt_htc_tx_complete(struct ath11k_base *sc,
 					  struct sk_buff *skb)
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 1d9892e..9e5bd81 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -11,6 +11,7 @@
 #include "dp_rx.h"
 #include "hal_rx.h"
 #include "dp_tx.h"
+#include "peer.h"
 
 static u8 *ath11k_dp_rx_h_80211_hdr(u8 *desc)
 {
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index a7e8e00..2191b57 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -13,6 +13,7 @@
 #include "dp_tx.h"
 #include "dp_rx.h"
 #include "testmode.h"
+#include "peer.h"
 
 #define CHAN2G(_channel, _freq, _flags) { \
 	.band                   = NL80211_BAND_2GHZ, \
@@ -604,113 +605,6 @@ static int ath11k_mac_set_kickout(struct ath11k_vif *arvif)
 	return 0;
 }
 
-static int ath11k_wait_for_peer_common(struct ath11k_base *ab, int vdev_id,
-				       const u8 *addr, bool expect_mapped)
-{
-	int ret;
-
-	ret = wait_event_timeout(ab->peer_mapping_wq, ({
-				bool mapped;
-
-				spin_lock_bh(&ab->data_lock);
-				mapped = !!ath11k_peer_find(ab, vdev_id, addr);
-				spin_unlock_bh(&ab->data_lock);
-
-				(mapped == expect_mapped ||
-				 test_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags));
-				}), 3 * HZ);
-
-	if (ret <= 0)
-		return -ETIMEDOUT;
-
-	return 0;
-}
-
-static int
-ath11k_wait_for_peer_created(struct ath11k *ar, int vdev_id, const u8 *addr)
-{
-	return ath11k_wait_for_peer_common(ar->ab, vdev_id, addr, true);
-}
-
-static int
-ath11k_wait_for_peer_deleted(struct ath11k *ar, int vdev_id, const u8 *addr)
-{
-	return ath11k_wait_for_peer_common(ar->ab, vdev_id, addr, false);
-}
-
-static int ath11k_peer_create(struct ath11k *ar, struct ath11k_vif *arvif,
-			      struct ieee80211_sta *sta,
-			      struct peer_create_params *param)
-{
-	struct ath11k_peer *peer;
-	int ret;
-
-	lockdep_assert_held(&ar->conf_mutex);
-
-	if (ar->num_peers > (ar->max_num_peers - 1)) {
-		ath11k_warn(ar->ab,
-			    "failed to create peer due to insufficient peer entry resource in firmware\n");
-		return -ENOBUFS;
-	}
-
-	ret = ath11k_wmi_send_peer_create_cmd(ar, param);
-	if (ret) {
-		ath11k_warn(ar->ab,
-			    "failed to send peer create vdev_id %d ret %d\n",
-			    param->vdev_id, ret);
-		return ret;
-	}
-
-	ret = ath11k_wait_for_peer_created(ar, param->vdev_id,
-					   param->peer_addr);
-	if (ret)
-		return ret;
-
-	spin_lock_bh(&ar->ab->data_lock);
-
-	peer = ath11k_peer_find(ar->ab, param->vdev_id, param->peer_addr);
-	if (!peer) {
-		spin_unlock_bh(&ar->ab->data_lock);
-		ath11k_warn(ar->ab, "failed to find peer %pM on vdev %i after creation\n",
-			    param->peer_addr, param->vdev_id);
-		ath11k_wmi_send_peer_delete_cmd(ar, param->peer_addr,
-						param->vdev_id);
-		return -ENOENT;
-	}
-
-	peer->sta = sta;
-	arvif->ast_hash = peer->ast_hash;
-
-	ar->num_peers++;
-
-	spin_unlock_bh(&ar->ab->data_lock);
-
-	return 0;
-}
-
-static int ath11k_peer_delete(struct ath11k *ar, u32 vdev_id, u8 *addr)
-{
-	int ret;
-
-	lockdep_assert_held(&ar->conf_mutex);
-
-	ret = ath11k_wmi_send_peer_delete_cmd(ar, addr, vdev_id);
-	if (ret) {
-		ath11k_warn(ar->ab,
-			    "failed to delete peer vdev_id %d addr %pM ret %d\n",
-			    vdev_id, addr, ret);
-		return ret;
-	}
-
-	ret = ath11k_wait_for_peer_deleted(ar, vdev_id, addr);
-	if (ret)
-		return ret;
-
-	ar->num_peers--;
-
-	return 0;
-}
-
 void ath11k_mac_peer_cleanup_all(struct ath11k *ar)
 {
 	struct ath11k_peer *peer, *tmp;
@@ -730,29 +624,6 @@ void ath11k_mac_peer_cleanup_all(struct ath11k *ar)
 	ar->num_stations = 0;
 }
 
-static void ath11k_peer_cleanup(struct ath11k *ar, u32 vdev_id)
-{
-	struct ath11k_peer *peer, *tmp;
-	struct ath11k_base *ab = ar->ab;
-
-	lockdep_assert_held(&ar->conf_mutex);
-
-	spin_lock_bh(&ab->data_lock);
-	list_for_each_entry_safe(peer, tmp, &ab->peers, list) {
-		if (peer->vdev_id != vdev_id)
-			continue;
-
-		ath11k_warn(ab, "removing stale peer %pM from vdev_id %d\n",
-			    peer->addr, vdev_id);
-
-		list_del(&peer->list);
-		kfree(peer);
-		ar->num_peers--;
-	}
-
-	spin_unlock_bh(&ab->data_lock);
-}
-
 static int ath11k_monitor_vdev_up(struct ath11k *ar, int vdev_id)
 {
 	int ret = 0;
diff --git a/drivers/net/wireless/ath/ath11k/peer.c b/drivers/net/wireless/ath/ath11k/peer.c
new file mode 100644
index 0000000..5e7aa96
--- /dev/null
+++ b/drivers/net/wireless/ath/ath11k/peer.c
@@ -0,0 +1,236 @@
+// SPDX-License-Identifier: ISC
+/*
+ * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
+ */
+
+#include "core.h"
+#include "peer.h"
+#include "debug.h"
+
+struct ath11k_peer *ath11k_peer_find(struct ath11k_base *ab, int vdev_id,
+				     const u8 *addr)
+{
+	struct ath11k_peer *peer;
+
+	lockdep_assert_held(&ab->data_lock);
+
+	list_for_each_entry(peer, &ab->peers, list) {
+		if (peer->vdev_id != vdev_id)
+			continue;
+		if (memcmp(peer->addr, addr, ETH_ALEN))
+			continue;
+
+		return peer;
+	}
+
+	return NULL;
+}
+
+struct ath11k_peer *ath11k_peer_find_by_addr(struct ath11k_base *ab,
+					     const u8 *addr)
+{
+	struct ath11k_peer *peer;
+
+	lockdep_assert_held(&ab->data_lock);
+
+	list_for_each_entry(peer, &ab->peers, list) {
+		if (memcmp(peer->addr, addr, ETH_ALEN))
+			continue;
+
+		return peer;
+	}
+
+	return NULL;
+}
+
+struct ath11k_peer *ath11k_peer_find_by_id(struct ath11k_base *ab,
+					   int peer_id)
+{
+	struct ath11k_peer *peer;
+
+	lockdep_assert_held(&ab->data_lock);
+
+	list_for_each_entry(peer, &ab->peers, list)
+		if (peer_id == peer->peer_id)
+			return peer;
+
+	return NULL;
+}
+
+void ath11k_peer_unmap_event(struct ath11k_base *ab, u16 peer_id)
+{
+	struct ath11k_peer *peer;
+
+	spin_lock_bh(&ab->data_lock);
+
+	peer = ath11k_peer_find_by_id(ab, peer_id);
+	if (!peer) {
+		ath11k_warn(ab, "peer-unmap-event: unknown peer id %d\n",
+			    peer_id);
+		goto exit;
+	}
+
+	ath11k_dbg(ab, ATH11K_DBG_DP_HTT, "htt peer unmap vdev %d peer %pM id %d\n",
+		   peer->vdev_id, peer->addr, peer_id);
+
+	list_del(&peer->list);
+	kfree(peer);
+	wake_up(&ab->peer_mapping_wq);
+
+exit:
+	spin_unlock_bh(&ab->data_lock);
+}
+
+void ath11k_peer_map_event(struct ath11k_base *ab, u8 vdev_id, u16 peer_id,
+			   u8 *mac_addr, u16 ast_hash)
+{
+	struct ath11k_peer *peer;
+
+	spin_lock_bh(&ab->data_lock);
+	peer = ath11k_peer_find(ab, vdev_id, mac_addr);
+	if (!peer) {
+		peer = kzalloc(sizeof(*peer), GFP_ATOMIC);
+		if (!peer)
+			goto exit;
+
+		peer->vdev_id = vdev_id;
+		peer->peer_id = peer_id;
+		peer->ast_hash = ast_hash;
+		ether_addr_copy(peer->addr, mac_addr);
+		list_add(&peer->list, &ab->peers);
+		wake_up(&ab->peer_mapping_wq);
+	}
+
+	ath11k_dbg(ab, ATH11K_DBG_DP_HTT, "htt peer map vdev %d peer %pM id %d\n",
+		   vdev_id, mac_addr, peer_id);
+
+exit:
+	spin_unlock_bh(&ab->data_lock);
+}
+
+static int ath11k_wait_for_peer_common(struct ath11k_base *ab, int vdev_id,
+				       const u8 *addr, bool expect_mapped)
+{
+	int ret;
+
+	ret = wait_event_timeout(ab->peer_mapping_wq, ({
+				bool mapped;
+
+				spin_lock_bh(&ab->data_lock);
+				mapped = !!ath11k_peer_find(ab, vdev_id, addr);
+				spin_unlock_bh(&ab->data_lock);
+
+				(mapped == expect_mapped ||
+				 test_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags));
+				}), 3 * HZ);
+
+	if (ret <= 0)
+		return -ETIMEDOUT;
+
+	return 0;
+}
+
+void ath11k_peer_cleanup(struct ath11k *ar, u32 vdev_id)
+{
+	struct ath11k_peer *peer, *tmp;
+	struct ath11k_base *ab = ar->ab;
+
+	lockdep_assert_held(&ar->conf_mutex);
+
+	spin_lock_bh(&ab->data_lock);
+	list_for_each_entry_safe(peer, tmp, &ab->peers, list) {
+		if (peer->vdev_id != vdev_id)
+			continue;
+
+		ath11k_warn(ab, "removing stale peer %pM from vdev_id %d\n",
+			    peer->addr, vdev_id);
+
+		list_del(&peer->list);
+		kfree(peer);
+		ar->num_peers--;
+	}
+
+	spin_unlock_bh(&ab->data_lock);
+}
+
+static int ath11k_wait_for_peer_deleted(struct ath11k *ar, int vdev_id, const u8 *addr)
+{
+	return ath11k_wait_for_peer_common(ar->ab, vdev_id, addr, false);
+}
+
+int ath11k_peer_delete(struct ath11k *ar, u32 vdev_id, u8 *addr)
+{
+	int ret;
+
+	lockdep_assert_held(&ar->conf_mutex);
+
+	ret = ath11k_wmi_send_peer_delete_cmd(ar, addr, vdev_id);
+	if (ret) {
+		ath11k_warn(ar->ab,
+			    "failed to delete peer vdev_id %d addr %pM ret %d\n",
+			    vdev_id, addr, ret);
+		return ret;
+	}
+
+	ret = ath11k_wait_for_peer_deleted(ar, vdev_id, addr);
+	if (ret)
+		return ret;
+
+	ar->num_peers--;
+
+	return 0;
+}
+
+static int ath11k_wait_for_peer_created(struct ath11k *ar, int vdev_id, const u8 *addr)
+{
+	return ath11k_wait_for_peer_common(ar->ab, vdev_id, addr, true);
+}
+
+int ath11k_peer_create(struct ath11k *ar, struct ath11k_vif *arvif,
+		       struct ieee80211_sta *sta, struct peer_create_params *param)
+{
+	struct ath11k_peer *peer;
+	int ret;
+
+	lockdep_assert_held(&ar->conf_mutex);
+
+	if (ar->num_peers > (ar->max_num_peers - 1)) {
+		ath11k_warn(ar->ab,
+			    "failed to create peer due to insufficient peer entry resource in firmware\n");
+		return -ENOBUFS;
+	}
+
+	ret = ath11k_wmi_send_peer_create_cmd(ar, param);
+	if (ret) {
+		ath11k_warn(ar->ab,
+			    "failed to send peer create vdev_id %d ret %d\n",
+			    param->vdev_id, ret);
+		return ret;
+	}
+
+	ret = ath11k_wait_for_peer_created(ar, param->vdev_id,
+					   param->peer_addr);
+	if (ret)
+		return ret;
+
+	spin_lock_bh(&ar->ab->data_lock);
+
+	peer = ath11k_peer_find(ar->ab, param->vdev_id, param->peer_addr);
+	if (!peer) {
+		spin_unlock_bh(&ar->ab->data_lock);
+		ath11k_warn(ar->ab, "failed to find peer %pM on vdev %i after creation\n",
+			    param->peer_addr, param->vdev_id);
+		ath11k_wmi_send_peer_delete_cmd(ar, param->peer_addr,
+						param->vdev_id);
+		return -ENOENT;
+	}
+
+	peer->sta = sta;
+	arvif->ast_hash = peer->ast_hash;
+
+	ar->num_peers++;
+
+	spin_unlock_bh(&ar->ab->data_lock);
+
+	return 0;
+}
diff --git a/drivers/net/wireless/ath/ath11k/peer.h b/drivers/net/wireless/ath/ath11k/peer.h
new file mode 100644
index 0000000..99e54f1
--- /dev/null
+++ b/drivers/net/wireless/ath/ath11k/peer.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: ISC */
+/*
+ * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
+ */
+
+#ifndef ATH11K_PEER_H
+#define ATH11K_PEER_H
+
+struct ath11k_peer {
+	struct list_head list;
+	struct ieee80211_sta *sta;
+	int vdev_id;
+	u8 addr[ETH_ALEN];
+	int peer_id;
+	u16 ast_hash;
+
+	/* protected by ab->data_lock */
+	struct ieee80211_key_conf *keys[WMI_MAX_KEY_INDEX + 1];
+	struct dp_rx_tid rx_tid[IEEE80211_NUM_TIDS + 1];
+};
+
+void ath11k_peer_unmap_event(struct ath11k_base *ab, u16 peer_id);
+void ath11k_peer_map_event(struct ath11k_base *ab, u8 vdev_id, u16 peer_id,
+			   u8 *mac_addr, u16 ast_hash);
+struct ath11k_peer *ath11k_peer_find(struct ath11k_base *ab, int vdev_id,
+				     const u8 *addr);
+struct ath11k_peer *ath11k_peer_find_by_addr(struct ath11k_base *ab,
+					     const u8 *addr);
+struct ath11k_peer *ath11k_peer_find_by_id(struct ath11k_base *ab, int peer_id);
+void ath11k_peer_cleanup(struct ath11k *ar, u32 vdev_id);
+int ath11k_peer_delete(struct ath11k *ar, u32 vdev_id, u8 *addr);
+int ath11k_peer_create(struct ath11k *ar, struct ath11k_vif *arvif,
+		       struct ieee80211_sta *sta, struct peer_create_params *param);
+
+#endif /* _PEER_H_ */
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index f5e5d3d..12f3024 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -17,6 +17,7 @@
 #include "debug.h"
 #include "mac.h"
 #include "hw.h"
+#include "peer.h"
 
 struct wmi_tlv_policy {
 	size_t min_len;
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
