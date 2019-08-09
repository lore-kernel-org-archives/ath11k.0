Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hw1Aj-0000hl-J6
 for ath11k@lists.infradead.org; Fri, 09 Aug 2019 09:26:54 +0000
Received: from [127.0.1.1] (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: kvalo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9691C60C8B
 for <ath11k@lists.infradead.org>; Fri,  9 Aug 2019 09:26:51 +0000 (UTC)
Subject: [PATCH 06/15] ath11k: random whitespace fixes
From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 09 Aug 2019 12:26:49 +0300
Message-ID: <156534280882.30736.10489779348844331061.stgit@x230>
In-Reply-To: <156534276745.30736.11736417077894270794.stgit@x230>
References: <156534276745.30736.11736417077894270794.stgit@x230>
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
To: ath11k@lists.infradead.org

Found while reviewing the driver. No functional changes.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_tx.c |    4 +++-
 drivers/net/wireless/ath/ath11k/wmi.c   |    6 +++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index f7de1fb9820b..69f78d209315 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -112,7 +112,7 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 
 	if (info->control.hw_key)
 		ti.encrypt_type =
-		ath11k_dp_tx_get_encrypt_type(info->control.hw_key->cipher);
+			ath11k_dp_tx_get_encrypt_type(info->control.hw_key->cipher);
 	else
 		ti.encrypt_type = HAL_ENCRYPT_TYPE_OPEN;
 
@@ -123,6 +123,7 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 	ti.lmac_id = ar->lmac_id;
 	ti.bss_ast_hash = arvif->ast_hash;
 	ti.dscp_tid_tbl_idx = 0;
+
 	if (skb->ip_summed == CHECKSUM_PARTIAL) {
 		ti.flags0 |= FIELD_PREP(HAL_TCL_DATA_CMD_INFO1_IP4_CKSUM_EN, 1) |
 			     FIELD_PREP(HAL_TCL_DATA_CMD_INFO1_UDP4_CKSUM_EN, 1) |
@@ -133,6 +134,7 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 
 	if (ieee80211_vif_is_mesh(arvif->vif))
 		ti.flags1 |= FIELD_PREP(HAL_TCL_DATA_CMD_INFO2_MESH_ENABLE, 1);
+
 	ti.flags1 |= FIELD_PREP(HAL_TCL_DATA_CMD_INFO2_TID_OVERWRITE, 1);
 
 	ti.tid = ath11k_dp_tx_get_tid(skb);
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 24058ab1f5fd..e553adf1cf9d 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -3388,9 +3388,9 @@ static int ath11k_pull_mgmt_tx_compl_param_tlv(struct ath11k_base *ab,
 		return -EPROTO;
 	}
 
-	param->pdev_id =  ev->pdev_id;
-	param->desc_id =  ev->desc_id;
-	param->status =  ev->status;
+	param->pdev_id = ev->pdev_id;
+	param->desc_id = ev->desc_id;
+	param->status = ev->status;
 
 	kfree(tb);
 	return 0;


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
