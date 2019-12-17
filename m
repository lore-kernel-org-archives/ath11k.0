Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihG2F-0002aV-UB
 for ath11k@lists.infradead.org; Tue, 17 Dec 2019 16:49:25 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH] ath11k: set TxBf parameters after vdev start
Date: Tue, 17 Dec 2019 17:49:17 +0100
Message-Id: <20191217164917.5040-1-john@phrozen.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, Bhagavathi Perumal S <bperumal@codeaurora.org>, John Crispin <john@phrozen.org>

From: Bhagavathi Perumal S <bperumal@codeaurora.org>

The channel info parameters are required by the firmware to process TxBf
parameters. Currently TxBf is passed prior to the channel info. This patch
moves TxBf setup after the channel setup.

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Bhagavathi Perumal S <bperumal@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 9d0fed4034dd..a8ccb00d6072 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4216,12 +4216,6 @@ static int ath11k_mac_op_add_interface(struct ieee80211_hw *hw,
 			    arvif->vdev_id, ret);
 	}
 
-	ret = ath11k_mac_set_txbf_conf(arvif);
-	if (ret) {
-		ath11k_warn(ar->ab, "failed to set txbf conf for vdev %d: %d\n",
-			    arvif->vdev_id, ret);
-	}
-
 	ath11k_dp_vdev_tx_attach(ar, arvif);
 
 	mutex_unlock(&ar->conf_mutex);
@@ -4573,6 +4567,11 @@ ath11k_mac_vdev_start_restart(struct ath11k_vif *arvif,
 			   arg.channel.freq, arg.vdev_id);
 	}
 
+	ret = ath11k_mac_set_txbf_conf(arvif);
+	if (ret)
+		ath11k_warn(ab, "failed to set txbf conf for vdev %d: %d\n",
+			    arvif->vdev_id, ret);
+
 	return 0;
 }
 
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
