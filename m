Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWftS-0002GW-DQ
 for ath11k@lists.infradead.org; Mon, 18 Nov 2019 12:12:36 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH 3/3] ath11k: drop memset when setting up a tx cmd desc
Date: Mon, 18 Nov 2019 13:12:24 +0100
Message-Id: <20191118121224.26351-3-john@phrozen.org>
In-Reply-To: <20191118121224.26351-1-john@phrozen.org>
References: <20191118121224.26351-1-john@phrozen.org>
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
Cc: ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

There is no point in zero'ing out the structure if we set all values in the
following line.

Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/net/wireless/ath/ath11k/dp_tx.c  | 2 --
 drivers/net/wireless/ath/ath11k/hal_tx.c | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 8005ad60fda1..18ede21f3cbc 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -167,8 +167,6 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 	skb_cb->vif = arvif->vif;
 	skb_cb->ar = ar;
 
-	memset(cached_desc, 0, HAL_TCL_DESC_LEN);
-
 	ath11k_hal_tx_cmd_desc_setup(ab, cached_desc, &ti);
 
 	hal_ring_id = tx_ring->tcl_data_ring.ring_id;
diff --git a/drivers/net/wireless/ath/ath11k/hal_tx.c b/drivers/net/wireless/ath/ath11k/hal_tx.c
index b1aa716610b9..3813edaadd40 100644
--- a/drivers/net/wireless/ath/ath11k/hal_tx.c
+++ b/drivers/net/wireless/ath/ath11k/hal_tx.c
@@ -71,6 +71,7 @@ void ath11k_hal_tx_cmd_desc_setup(struct ath11k_base *ab, void *cmd,
 				    ti->dscp_tid_tbl_idx) |
 			 FIELD_PREP(HAL_TCL_DATA_CMD_INFO3_SEARCH_INDEX,
 				    ti->bss_ast_hash);
+	tcl_cmd->info4 = 0;
 }
 
 /* Commit the descriptor to hardware */
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
