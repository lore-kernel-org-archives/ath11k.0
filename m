Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGgst-0008LV-Nj
 for ath11k@lists.infradead.org; Wed, 17 Apr 2019 09:29:41 +0000
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: [PATCH 2/3] ath11k: allow 4 address transmission for mesh packet
Date: Wed, 17 Apr 2019 02:29:17 -0700
Message-Id: <1555493358-16381-3-git-send-email-rmanohar@codeaurora.org>
In-Reply-To: <1555493358-16381-1-git-send-email-rmanohar@codeaurora.org>
References: <1555493358-16381-1-git-send-email-rmanohar@codeaurora.org>
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
Cc: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, Rajkumar Manoharan <rmanohar@codeaurora.org>

Inform the target to use 4 adressses in 802.11 header for mesh data
by marking the peer is capable of operating in 4 address format.
Also ensure to inform TCL ring that mesh header is pesent in payload.
This will be useful for enabling HW checksumming form mesh packets.

Co-developed-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Signed-off-by: Rajkumar Manoharan <rmanohar@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_tx.c |  3 +++
 drivers/net/wireless/ath/ath11k/mac.c   | 11 +++++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 5324c5f514f8..b2807a88df9c 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -131,7 +131,10 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 			     FIELD_PREP(HAL_TCL_DATA_CMD_INFO1_TCP6_CKSUM_EN, 1);
 	}
 
+	if (ieee80211_vif_is_mesh(arvif->vif))
+		ti.flags1 |= FIELD_PREP(HAL_TCL_DATA_CMD_INFO2_MESH_ENABLE, 1);
 	ti.flags1 |= FIELD_PREP(HAL_TCL_DATA_CMD_INFO2_TID_OVERWRITE, 1);
+
 	ti.tid = ath11k_dp_get_tid(skb);
 
 	switch (ti.encap_type) {
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index b384395bb08c..aea99d9d8d1f 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -2550,6 +2550,17 @@ static int ath11k_sta_state(struct ieee80211_hw *hw,
 				goto exit;
 		}
 
+		if (ieee80211_vif_is_mesh(vif)) {
+			ret = ath11k_wmi_set_peer_param(ar, sta->addr,
+							arvif->vdev_id,
+							WMI_PEER_USE_4ADDR, 1);
+			if (ret) {
+				ath11k_warn(ar->ab, "failed to STA %pM 4addr capability: %d\n",
+						sta->addr, ret);
+				goto exit;
+			}
+		}
+
 		ret = ath11k_dp_peer_setup(ar, arvif->vdev_id, sta->addr);
 		if (ret) {
 			ath11k_warn(ar->ab, "failed to setup dp for peer %pM on vdev %i (%d)\n",
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
