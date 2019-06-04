Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hY7j1-0002Xo-6A
 for ath11k@lists.infradead.org; Tue, 04 Jun 2019 11:35:32 +0000
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH] ath11k: Fix nss value to get proper rate_code for peer fixed
 rate
Date: Tue,  4 Jun 2019 17:06:53 +0530
Message-Id: <1559648213-16186-1-git-send-email-mkenna@codeaurora.org>
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
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>

The rate_code is not proper when the peer fixed rate is
set by the user via the set bitrate command.
The rate_code needs the nss values as {0, 1, 2, 3}.
Hence fixing the nss value in this patch.

Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index cb0de8e2aa60..871f7da8ba21 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -2300,7 +2300,7 @@ ath11k_mac_set_peer_vht_fixed_rate(struct ath11k_vif *arvif,
 		   "Setting Fixed VHT Rate for peer %pM. Device will not switch to any other selected rates",
 		   sta->addr);
 
-	rate_code = ATH11K_HW_RATE_CODE(vht_rate, nss,
+	rate_code = ATH11K_HW_RATE_CODE(vht_rate, nss - 1,
 					WMI_RATE_PREAMBLE_VHT);
 	ret = ath11k_wmi_set_peer_param(ar, sta->addr,
 					arvif->vdev_id,
-- 
2.21.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
