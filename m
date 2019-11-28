Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-18.smtp-out.us-west-2.amazonses.com ([54.240.27.18])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iaF3c-00015g-JU
 for ath11k@lists.infradead.org; Thu, 28 Nov 2019 08:21:49 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 1/9] ath11k: Update tx and rx chain count properly on
 drv_set_antenna
Date: Thu, 28 Nov 2019 08:21:46 +0000
Message-ID: <0101016eb11a12a4-fe2e3161-3d2e-4f10-a232-29a3f71fa979-000000@us-west-2.amazonses.com>
In-Reply-To: <1574929300-31782-1-git-send-email-kvalo@codeaurora.org>
References: <1574929300-31782-1-git-send-email-kvalo@codeaurora.org>
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
To: linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org

From: Sriram R <srirrama@codeaurora.org>

Set the number of tx and rx chains properly on drv_set_antenna().
This will ensure the related ht/vht/he caps are properly recalculated
based on the tx/rx chains set.

Signed-off-by: Sriram R <srirrama@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 5231c4fa0e38..5ee7c2a1c611 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3480,6 +3480,8 @@ static int __ath11k_set_antenna(struct ath11k *ar, u32 tx_ant, u32 rx_ant)
 		return ret;
 	}
 
+	ar->num_tx_chains = get_num_chains(tx_ant);
+
 	ret = ath11k_wmi_pdev_set_param(ar, WMI_PDEV_PARAM_RX_CHAIN_MASK,
 					rx_ant, ar->pdev->pdev_id);
 	if (ret) {
@@ -3488,6 +3490,8 @@ static int __ath11k_set_antenna(struct ath11k *ar, u32 tx_ant, u32 rx_ant)
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
