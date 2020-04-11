Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jNPBm-00080p-Ke
 for ath11k@lists.infradead.org; Sat, 11 Apr 2020 23:05:28 +0000
From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.6 079/149] ath11k: Fixing dangling pointer issue
 upon peer delete failure
Date: Sat, 11 Apr 2020 19:02:36 -0400
Message-Id: <20200411230347.22371-79-sashal@kernel.org>
In-Reply-To: <20200411230347.22371-1-sashal@kernel.org>
References: <20200411230347.22371-1-sashal@kernel.org>
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
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org, Venkateswara Naralasetty <vnaralas@codeaurora.org>, linux-wireless@vger.kernel.org, Vikas Patel <vikpatel@codeaurora.org>, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

From: Vikas Patel <vikpatel@codeaurora.org>

[ Upstream commit 58595c9874c625ceb7004960d8e53b9226abdc92 ]

When there is WMI command failure, 'peer->sta' was not getting
cleaned up, and mac80211 frees the 'sta' memory, which is causing
the below page fault.

Cleaning up the sta pointer in ath11k whenever peer delete command
is sent.

Unable to handle kernel paging request at virtual address 200080000006a
pgd = ffffffc02a774000
[200080000006a] *pgd=0000000000000000, *pud=0000000000000000
Internal error: Oops: 96000004 [#1] PREEMPT SMP
.
.
.
CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W       4.4.60 #1
Hardware name: Qualcomm Technologies, Inc. IPQ807x/AP-HK01-C1 (DT)
task: ffffffc00083c6d0 ti: ffffffc00083c6d0 task.ti: ffffffc00083c6d0
PC is at ath11k_dp_rx_process_mon_status+0x114/0x4e0 [ath11k]
LR is at ath11k_dp_rx_process_mon_status+0xe8/0x4e0 [ath11k]
pc : [<ffffffbffcf8e544>] lr : [<ffffffbffcf8e518>] pstate: 60000145
sp : ffffffc000833a30

Signed-off-by: Vikas Patel <vikpatel@codeaurora.org>
Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 78f20ba47b37e..e89790a01c48b 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -2786,6 +2786,7 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 	struct ath11k *ar = hw->priv;
 	struct ath11k_vif *arvif = ath11k_vif_to_arvif(vif);
 	struct ath11k_sta *arsta = (struct ath11k_sta *)sta->drv_priv;
+	struct ath11k_peer *peer;
 	int ret = 0;
 
 	/* cancel must be done outside the mutex to avoid deadlock */
@@ -2818,6 +2819,17 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 				   sta->addr, arvif->vdev_id);
 
 		ath11k_mac_dec_num_stations(arvif, sta);
+		spin_lock_bh(&ar->ab->base_lock);
+		peer = ath11k_peer_find(ar->ab, arvif->vdev_id, sta->addr);
+		if (peer && peer->sta == sta) {
+			ath11k_warn(ar->ab, "Found peer entry %pM n vdev %i after it was supposedly removed\n",
+				    vif->addr, arvif->vdev_id);
+			peer->sta = NULL;
+			list_del(&peer->list);
+			kfree(peer);
+			ar->num_peers--;
+		}
+		spin_unlock_bh(&ar->ab->base_lock);
 
 		kfree(arsta->tx_stats);
 		arsta->tx_stats = NULL;
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
