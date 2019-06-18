Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hd5nt-0004Sl-GD
 for ath11k@lists.infradead.org; Tue, 18 Jun 2019 04:33:06 +0000
From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Subject: [PATCH] ath11k: cleanup in HTC and tx data path
Date: Tue, 18 Jun 2019 10:02:48 +0530
Message-Id: <1560832368-17047-1-git-send-email-periyasa@codeaurora.org>
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
Cc: Karthikeyan Periyasamy <periyasa@codeaurora.org>

Removed the unnecessary parenthesis in ath11k_dp_tx().
Replaced the Hard code value to the HTC header structure
size while reserve the skb. Modify the WARN_ONCE to WARN_ON
in ath11k_htc_build_tx_ctrl_skb().

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_tx.c | 5 ++---
 drivers/net/wireless/ath/ath11k/htc.c   | 4 ++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 12668a6..84a50eb 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -110,12 +110,11 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 	ti.encap_type = ath11k_dp_tx_get_encap_type(arvif, skb);
 	ti.meta_data_flags = arvif->tcl_metadata;
 
-	if (info->control.hw_key) {
+	if (info->control.hw_key)
 		ti.encrypt_type =
 		ath11k_dp_tx_get_encrypt_type(info->control.hw_key->cipher);
-	} else {
+	else
 		ti.encrypt_type = HAL_ENCRYPT_TYPE_OPEN;
-	}
 
 	ti.addr_search_flags = arvif->hal_addr_search_flags;
 	ti.search_type = arvif->search_type;
diff --git a/drivers/net/wireless/ath/ath11k/htc.c b/drivers/net/wireless/ath/ath11k/htc.c
index b42d950..27e79bb 100644
--- a/drivers/net/wireless/ath/ath11k/htc.c
+++ b/drivers/net/wireless/ath/ath11k/htc.c
@@ -44,8 +44,8 @@ static struct sk_buff *ath11k_htc_build_tx_ctrl_skb(void *ab)
 	if (!skb)
 		return NULL;
 
-	skb_reserve(skb, 20);
-	WARN_ONCE((unsigned long)skb->data & 3, "unaligned skb");
+	skb_reserve(skb, sizeof(struct ath11k_htc_hdr));
+	WARN_ON_ONCE(!IS_ALIGNED((unsigned long)skb->data, 4));
 
 	skb_cb = ATH11K_SKB_CB(skb);
 	memset(skb_cb, 0, sizeof(*skb_cb));
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
