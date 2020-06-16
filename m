Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlC9N-0002d1-NR
 for ath11k@lists.infradead.org; Tue, 16 Jun 2020 14:01:24 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 01/12] ath11k: ahb: call ath11k_core_init() before irq
 configuration
Date: Tue, 16 Jun 2020 17:00:44 +0300
Message-Id: <1592316055-24958-2-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1592316055-24958-1-git-send-email-kvalo@codeaurora.org>
References: <1592316055-24958-1-git-send-email-kvalo@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

From: Anilkumar Kolli <akolli@codeaurora.org>

This is needed to init .max_radios in hw_params and onfigure external
interrupts for available pdev_ids.

Compile tested only.

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 30092841ac46..2ea6da7682ce 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -951,15 +951,15 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
 
 	ath11k_ahb_init_qmi_ce_config(ab);
 
-	ret = ath11k_ahb_config_irq(ab);
+	ret = ath11k_core_init(ab);
 	if (ret) {
-		ath11k_err(ab, "failed to configure irq: %d\n", ret);
+		ath11k_err(ab, "failed to init core: %d\n", ret);
 		goto err_ce_free;
 	}
 
-	ret = ath11k_core_init(ab);
+	ret = ath11k_ahb_config_irq(ab);
 	if (ret) {
-		ath11k_err(ab, "failed to init core: %d\n", ret);
+		ath11k_err(ab, "failed to configure irq: %d\n", ret);
 		goto err_ce_free;
 	}
 
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
