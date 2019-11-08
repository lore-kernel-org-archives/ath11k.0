Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSznx-0002Da-1u
 for ath11k@lists.infradead.org; Fri, 08 Nov 2019 08:39:42 +0000
From: Sriram R <srirrama@codeaurora.org>
Subject: [PATCH] ath11k: Update tx and rx chain count properly on
 drv_set_antenna
Date: Fri,  8 Nov 2019 14:09:15 +0530
Message-Id: <1573202355-15351-1-git-send-email-srirrama@codeaurora.org>
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
Cc: Sriram R <srirrama@codeaurora.org>

Set the number of tx and rx chains properly on drv_set_antenna().
This will ensure the related ht/vht/he caps are properly recalculated
based on the tx/rx chains set.

Signed-off-by: Sriram R <srirrama@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 6f82fdb..8c4f039 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3450,6 +3450,8 @@ static int __ath11k_set_antenna(struct ath11k *ar, u32 tx_ant, u32 rx_ant)
 		return ret;
 	}
 
+	ar->num_tx_chains = get_num_chains(tx_ant);
+
 	ret = ath11k_wmi_pdev_set_param(ar, WMI_PDEV_PARAM_RX_CHAIN_MASK,
 					rx_ant, ar->pdev->pdev_id);
 	if (ret) {
@@ -3458,6 +3460,8 @@ static int __ath11k_set_antenna(struct ath11k *ar, u32 tx_ant, u32 rx_ant)
 		return ret;
 	}
 
+	ar->num_rx_chains = get_num_chains(rx_ant);
+
 	/* Reload HT/VHT/HE capability */
 	ath11k_mac_setup_ht_vht_cap(ar, &ar->pdev->cap, NULL);
 	ath11k_mac_setup_he_cap(ar, &ar->pdev->cap);
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
