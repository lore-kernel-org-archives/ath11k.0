Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]
 helo=alexa-out-blr.qualcomm.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hONp8-0007X0-Ky
 for ath11k@lists.infradead.org; Wed, 08 May 2019 14:45:36 +0000
From: Venkateswara Naralasetty <vnaralas@codeaurora.org>
Subject: [PATCH] ath11k: fix target assert when unload driver
Date: Wed,  8 May 2019 20:15:26 +0530
Message-Id: <1557326726-29837-1-git-send-email-vnaralas@codeaurora.org>
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
Cc: Venkateswara Naralasetty <vnaralas@codeaurora.org>

Currently ath11k_ahb_ext_irq_disable() called before ath11k_mac_unregister
which will disable napi before mac_unregister and still we might receive
packets on all active devices which results reo_dest_ring full.

Fix this issue by moving ath11k_ahb_ext_irq_disable() after
ath11k_mac_unregister().

Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index dc56df5..e3e6b64 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -486,6 +486,7 @@ static int ath11k_core_pdev_create(struct ath11k_base *sc)
 static void ath11k_core_pdev_destroy(struct ath11k_base *sc)
 {
 	ath11k_mac_unregister(sc);
+	ath11k_ahb_ext_irq_disable(sc);
 	ath11k_dp_pdev_free(sc);
 }
 
@@ -781,7 +782,6 @@ void ath11k_core_deinit(struct ath11k_base *sc)
 {
 	mutex_lock(&sc->core_lock);
 
-	ath11k_ahb_ext_irq_disable(sc);
 	ath11k_core_pdev_destroy(sc);
 	ath11k_core_stop(sc);
 
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
