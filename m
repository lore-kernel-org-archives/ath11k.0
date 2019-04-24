Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJAtn-0002yd-Sz
 for ath11k@lists.infradead.org; Wed, 24 Apr 2019 05:56:53 +0000
From: Sathishkumar Muruganandam <murugana@codeaurora.org>
Subject: [PATCH v2] ath11k: add HW checksum offload support
Date: Wed, 24 Apr 2019 11:26:18 +0530
Message-Id: <1556085378-4389-1-git-send-email-murugana@codeaurora.org>
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
Cc: Sathishkumar Muruganandam <murugana@codeaurora.org>

Advertise HW checksum offload capabilities to netdev

Signed-off-by: Sathishkumar Muruganandam <murugana@codeaurora.org>
---
Changes in v2:
	Modified commit log

 drivers/net/wireless/ath/ath11k/dp_tx.c | 4 ++++
 drivers/net/wireless/ath/ath11k/mac.c   | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index b2807a88df9c..84965000c54d 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -142,6 +142,10 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 		ath11k_dp_encap_nwifi(skb);
 		break;
 	case HAL_TCL_ENCAP_TYPE_RAW:
+		/*  TODO: for CHECKSUM_PARTIAL case in raw mode, HW checksum offload
+		 *	  is not applicable, hence manual checksum calculation using
+		 *	  skb_checksum_help() is needed
+		 */
 	case HAL_TCL_ENCAP_TYPE_ETHERNET:
 	case HAL_TCL_ENCAP_TYPE_802_3:
 		/* TODO: Take care of other encap modes as well */
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index ddb8beba3ab7..6cba3ebab6ed 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4927,6 +4927,9 @@ static int ath11k_mac_register(struct ath11k *ar)
 
 	ath11k_reg_init(ar);
 
+	/* advertise HW checksum offload capabilities */
+	ar->hw->netdev_features = NETIF_F_HW_CSUM;
+
 	ret = ieee80211_register_hw(ar->hw);
 	if (ret) {
 		ath11k_err(ar->ab, "ieee80211 registration failed: %d\n", ret);
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
