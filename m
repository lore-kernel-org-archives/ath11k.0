Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keZZt-000406-EM
 for ath11k@lists.infradead.org; Mon, 16 Nov 2020 08:09:37 +0000
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH v3 2/3] ath11k: peer delete synchronization with firmware
Date: Mon, 16 Nov 2020 13:39:02 +0530
Message-Id: <1605514143-17652-3-git-send-email-mkenna@codeaurora.org>
In-Reply-To: <1605514143-17652-1-git-send-email-mkenna@codeaurora.org>
References: <1605514143-17652-1-git-send-email-mkenna@codeaurora.org>
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
To: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Cc: Ritesh Singh <ritesi@codeaurora.org>, Maharaja Kennadyrajan <mkenna@codeaurora.org>

From: Ritesh Singh <ritesi@codeaurora.org>

Peer creation in firmware fails, if last peer deletion
is still in progress.
Hence, add wait for the event after deleting every peer
from host driver to synchronize with firmware.

Signed-off-by: Ritesh Singh <ritesi@codeaurora.org>
Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
---
    V3: Rebased on latest ath.git TOT & added correct version name
        in the subject name in the patches.
    V2: Rebased on latest ath.git TOT(Addressed Kalle's comment).

 drivers/net/wireless/ath/ath11k/core.c |  1 +
 drivers/net/wireless/ath/ath11k/core.h |  1 +
 drivers/net/wireless/ath/ath11k/mac.c  | 17 ++++++++++++-
 drivers/net/wireless/ath/ath11k/peer.c | 44 +++++++++++++++++++++++++++++++---
 drivers/net/wireless/ath/ath11k/peer.h |  2 ++
 drivers/net/wireless/ath/ath11k/wmi.c  | 17 ++++++++++---
 6 files changed, 75 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index f792825..da20ed7 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -808,6 +808,7 @@ static void ath11k_core_restart(struct work_struct *work)
 		complete(&ar->scan.started);
 		complete(&ar->scan.completed);
 		complete(&ar->peer_assoc_done);
+		complete(&ar->peer_delete_done);
 		complete(&ar->install_key_done);
 		complete(&ar->vdev_setup_done);
 		complete(&ar->vdev_delete_done);
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 714dcb4..c7ce7c2 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -506,6 +506,7 @@ struct ath11k {
 	u8 lmac_id;
 
 	struct completion peer_assoc_done;
+	struct completion peer_delete_done;
 
 	int install_key_status;
 	struct completion install_key_done;
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index f0ab88c..10d83a9 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4628,8 +4628,22 @@ static int ath11k_mac_op_add_interface(struct ieee80211_hw *hw,
 
 err_peer_del:
 	if (arvif->vdev_type == WMI_VDEV_TYPE_AP) {
+		reinit_completion(&ar->peer_delete_done);
+
+		ret = ath11k_wmi_send_peer_delete_cmd(ar, vif->addr,
+						      arvif->vdev_id);
+		if (ret) {
+			ath11k_warn(ar->ab, "failed to delete peer vdev_id %d addr %pM\n",
+				    arvif->vdev_id, vif->addr);
+			return ret;
+		}
+
+		ret = ath11k_wait_for_peer_delete_done(ar, arvif->vdev_id,
+						       vif->addr);
+		if (ret)
+			return ret;
+
 		ar->num_peers--;
-		ath11k_wmi_send_peer_delete_cmd(ar, vif->addr, arvif->vdev_id);
 	}
 
 err_vdev_del:
@@ -6474,6 +6488,7 @@ int ath11k_mac_allocate(struct ath11k_base *ab)
 		init_completion(&ar->vdev_setup_done);
 		init_completion(&ar->vdev_delete_done);
 		init_completion(&ar->peer_assoc_done);
+		init_completion(&ar->peer_delete_done);
 		init_completion(&ar->install_key_done);
 		init_completion(&ar->bss_survey_done);
 		init_completion(&ar->scan.started);
diff --git a/drivers/net/wireless/ath/ath11k/peer.c b/drivers/net/wireless/ath/ath11k/peer.c
index 61ad930..1866d82 100644
--- a/drivers/net/wireless/ath/ath11k/peer.c
+++ b/drivers/net/wireless/ath/ath11k/peer.c
@@ -177,12 +177,36 @@ static int ath11k_wait_for_peer_deleted(struct ath11k *ar, int vdev_id, const u8
 	return ath11k_wait_for_peer_common(ar->ab, vdev_id, addr, false);
 }
 
+int ath11k_wait_for_peer_delete_done(struct ath11k *ar, u32 vdev_id,
+				     const u8 *addr)
+{
+	int ret;
+	unsigned long time_left;
+
+	ret = ath11k_wait_for_peer_deleted(ar, vdev_id, addr);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed wait for peer deleted");
+		return ret;
+	}
+
+	time_left = wait_for_completion_timeout(&ar->peer_delete_done,
+						3 * HZ);
+	if (time_left == 0) {
+		ath11k_warn(ar->ab, "Timeout in receiving peer delete response\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
 int ath11k_peer_delete(struct ath11k *ar, u32 vdev_id, u8 *addr)
 {
 	int ret;
 
 	lockdep_assert_held(&ar->conf_mutex);
 
+	reinit_completion(&ar->peer_delete_done);
+
 	ret = ath11k_wmi_send_peer_delete_cmd(ar, addr, vdev_id);
 	if (ret) {
 		ath11k_warn(ar->ab,
@@ -191,7 +215,7 @@ int ath11k_peer_delete(struct ath11k *ar, u32 vdev_id, u8 *addr)
 		return ret;
 	}
 
-	ret = ath11k_wait_for_peer_deleted(ar, vdev_id, addr);
+	ret = ath11k_wait_for_peer_delete_done(ar, vdev_id, addr);
 	if (ret)
 		return ret;
 
@@ -247,8 +271,22 @@ int ath11k_peer_create(struct ath11k *ar, struct ath11k_vif *arvif,
 		spin_unlock_bh(&ar->ab->base_lock);
 		ath11k_warn(ar->ab, "failed to find peer %pM on vdev %i after creation\n",
 			    param->peer_addr, param->vdev_id);
-		ath11k_wmi_send_peer_delete_cmd(ar, param->peer_addr,
-						param->vdev_id);
+
+		reinit_completion(&ar->peer_delete_done);
+
+		ret = ath11k_wmi_send_peer_delete_cmd(ar, param->peer_addr,
+						      param->vdev_id);
+		if (ret) {
+			ath11k_warn(ar->ab, "failed to delete peer vdev_id %d addr %pM\n",
+				    param->vdev_id, param->peer_addr);
+			return ret;
+		}
+
+		ret = ath11k_wait_for_peer_delete_done(ar, param->vdev_id,
+						       param->peer_addr);
+		if (ret)
+			return ret;
+
 		return -ENOENT;
 	}
 
diff --git a/drivers/net/wireless/ath/ath11k/peer.h b/drivers/net/wireless/ath/ath11k/peer.h
index 5d125ce..bba2e00 100644
--- a/drivers/net/wireless/ath/ath11k/peer.h
+++ b/drivers/net/wireless/ath/ath11k/peer.h
@@ -41,5 +41,7 @@ void ath11k_peer_cleanup(struct ath11k *ar, u32 vdev_id);
 int ath11k_peer_delete(struct ath11k *ar, u32 vdev_id, u8 *addr);
 int ath11k_peer_create(struct ath11k *ar, struct ath11k_vif *arvif,
 		       struct ieee80211_sta *sta, struct peer_create_params *param);
+int ath11k_wait_for_peer_delete_done(struct ath11k *ar, u32 vdev_id,
+				     const u8 *addr);
 
 #endif /* _PEER_H_ */
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index d1175a1..e374270 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -5730,15 +5730,26 @@ static int ath11k_ready_event(struct ath11k_base *ab, struct sk_buff *skb)
 static void ath11k_peer_delete_resp_event(struct ath11k_base *ab, struct sk_buff *skb)
 {
 	struct wmi_peer_delete_resp_event peer_del_resp;
+	struct ath11k *ar;
 
 	if (ath11k_pull_peer_del_resp_ev(ab, skb, &peer_del_resp) != 0) {
 		ath11k_warn(ab, "failed to extract peer delete resp");
 		return;
 	}
 
-	/* TODO: Do we need to validate whether ath11k_peer_find() return NULL
-	 *	 Why this is needed when there is HTT event for peer delete
-	 */
+	rcu_read_lock();
+	ar = ath11k_mac_get_ar_by_vdev_id(ab, peer_del_resp.vdev_id);
+	if (!ar) {
+		ath11k_warn(ab, "invalid vdev id in peer delete resp ev %d",
+			    peer_del_resp.vdev_id);
+		rcu_read_unlock();
+		return;
+	}
+
+	complete(&ar->peer_delete_done);
+	rcu_read_unlock();
+	ath11k_dbg(ab, ATH11K_DBG_WMI, "peer delete resp for vdev id %d addr %pM\n",
+		   peer_del_resp.vdev_id, peer_del_resp.peer_macaddr.addr);
 }
 
 static void ath11k_vdev_delete_resp_event(struct ath11k_base *ab,
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
