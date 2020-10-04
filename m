Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kP0qt-0005Xi-Uk
 for ath11k@lists.infradead.org; Sun, 04 Oct 2020 10:02:49 +0000
Received: by mail-wr1-x443.google.com with SMTP id g12so924418wrp.10
 for <ath11k@lists.infradead.org>; Sun, 04 Oct 2020 03:02:46 -0700 (PDT)
From: Alex Dewar <alex.dewar90@gmail.com>
Subject: [PATCH 2/2] ath11k: Handle errors if peer creation fails
Date: Sun,  4 Oct 2020 11:02:17 +0100
Message-Id: <20201004100218.311653-1-alex.dewar90@gmail.com>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, Carl Huang <cjhuang@codeaurora.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Alex Dewar <alex.dewar90@gmail.com>, Jakub Kicinski <kuba@kernel.org>, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

ath11k_peer_create() is called without its return value being checked,
meaning errors will be unhandled. Add missing check and, as the mutex is
unconditionally unlocked on leaving this function, simplify the exit
path.

Addresses-Coverity-ID: 1497531 ("Code maintainability issues")
Fixes: 701e48a43e15 ("ath11k: add packet log support for QCA6390")
Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 7f8dd47d2333..58db1b57b941 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -5211,7 +5211,7 @@ ath11k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
 	struct ath11k *ar = hw->priv;
 	struct ath11k_base *ab = ar->ab;
 	struct ath11k_vif *arvif = (void *)vif->drv_priv;
-	int ret;
+	int ret = 0;
 	struct peer_create_params param;
 
 	mutex_lock(&ar->conf_mutex);
@@ -5225,13 +5225,12 @@ ath11k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
 	    arvif->vdev_type != WMI_VDEV_TYPE_AP &&
 	    arvif->vdev_type != WMI_VDEV_TYPE_MONITOR) {
 		memcpy(&arvif->chanctx, ctx, sizeof(*ctx));
-		mutex_unlock(&ar->conf_mutex);
-		return 0;
+		goto unlock;
 	}
 
 	if (WARN_ON(arvif->is_started)) {
-		mutex_unlock(&ar->conf_mutex);
-		return -EBUSY;
+		ret = -EBUSY;
+		goto unlock;
 	}
 
 	if (ab->hw_params.vdev_start_delay) {
@@ -5239,6 +5238,8 @@ ath11k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
 		param.peer_type = WMI_PEER_TYPE_DEFAULT;
 		param.peer_addr = ar->mac_addr;
 		ret = ath11k_peer_create(ar, arvif, NULL, &param);
+		if (ret)
+			goto unlock;
 	}
 
 	ret = ath11k_mac_vdev_start(arvif, &ctx->def);
@@ -5246,23 +5247,19 @@ ath11k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
 		ath11k_warn(ab, "failed to start vdev %i addr %pM on freq %d: %d\n",
 			    arvif->vdev_id, vif->addr,
 			    ctx->def.chan->center_freq, ret);
-		goto err;
+		goto unlock;
 	}
 	if (arvif->vdev_type == WMI_VDEV_TYPE_MONITOR) {
 		ret = ath11k_monitor_vdev_up(ar, arvif->vdev_id);
 		if (ret)
-			goto err;
+			goto unlock;
 	}
 
 	arvif->is_started = true;
 
 	/* TODO: Setup ps and cts/rts protection */
 
-	mutex_unlock(&ar->conf_mutex);
-
-	return 0;
-
-err:
+unlock:
 	mutex_unlock(&ar->conf_mutex);
 
 	return ret;
-- 
2.28.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
