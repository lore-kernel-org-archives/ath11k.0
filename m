Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfNTt-00050c-24
 for ath11k@lists.infradead.org; Mon, 24 Jun 2019 11:49:54 +0000
From: Manikanta Pubbisetty <mpubbise@codeaurora.org>
Subject: [PATCH 2/8] ath11k: make ath11k_mgmt_over_wmi_tx_*() functions static
Date: Mon, 24 Jun 2019 17:19:23 +0530
Message-Id: <1561376969-3999-2-git-send-email-mpubbise@codeaurora.org>
In-Reply-To: <1561376969-3999-1-git-send-email-mpubbise@codeaurora.org>
References: <1561376969-3999-1-git-send-email-mpubbise@codeaurora.org>
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
Cc: Manikanta Pubbisetty <mpubbise@codeaurora.org>

make ath11k_mgmt_over_wmi_tx_*() functions static in mac.c file.

Signed-off-by: Manikanta Pubbisetty <mpubbise@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 4 ++--
 drivers/net/wireless/ath/ath11k/mac.h | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 2e87b1a..e3bca88 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3382,7 +3382,7 @@ static int ath11k_mac_mgmt_tx_wmi(struct ath11k *ar, struct ath11k_vif *arvif,
 	return ret;
 }
 
-void ath11k_mgmt_over_wmi_tx_purge(struct ath11k *ar)
+static void ath11k_mgmt_over_wmi_tx_purge(struct ath11k *ar)
 {
 	struct sk_buff *skb;
 
@@ -3390,7 +3390,7 @@ void ath11k_mgmt_over_wmi_tx_purge(struct ath11k *ar)
 		ieee80211_free_txskb(ar->hw, skb);
 }
 
-void ath11k_mgmt_over_wmi_tx_work(struct work_struct *work)
+static void ath11k_mgmt_over_wmi_tx_work(struct work_struct *work)
 {
 	struct ath11k *ar = container_of(work, struct ath11k, wmi_mgmt_tx_work);
 	struct ieee80211_tx_info *info;
diff --git a/drivers/net/wireless/ath/ath11k/mac.h b/drivers/net/wireless/ath/ath11k/mac.h
index 071fcbc..7ced4bc1 100644
--- a/drivers/net/wireless/ath/ath11k/mac.h
+++ b/drivers/net/wireless/ath/ath11k/mac.h
@@ -187,8 +187,6 @@ struct ath11k *ath11k_mac_get_ar_by_pdev_id(struct ath11k_base *ab, u32 pdev_id)
 struct ath11k *ath11k_mac_get_ar_vdev_stop_status(struct ath11k_base *ab,
 						  u32 vdev_id);
 
-void ath11k_mgmt_over_wmi_tx_work(struct work_struct *work);
-void ath11k_mgmt_over_wmi_tx_purge(struct ath11k *ar);
 void ath11k_mac_drain_tx(struct ath11k *ar);
 void ath11k_mac_peer_cleanup_all(struct ath11k *ar);
 int ath11k_mac_tx_mgmt_pending_free(int buf_id, void *skb, void *ctx);
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
