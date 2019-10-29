Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPLOq-0001mo-Fq
 for ath11k@lists.infradead.org; Tue, 29 Oct 2019 06:54:43 +0000
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH 1/2] ath11k: qmi clean up ce and HTC service config update
Date: Tue, 29 Oct 2019 12:24:27 +0530
Message-Id: <1572332068-2611-1-git-send-email-akolli@codeaurora.org>
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

Copy CE and htc service configs for all pipes.

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 9 ++++-----
 drivers/net/wireless/ath/ath11k/qmi.h | 4 ++--
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index a2c697b97bdf..67dd455b56a0 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -677,11 +677,10 @@ static void ath11k_ahb_init_qmi_ce_config(struct ath11k_base *ab)
 {
 	struct ath11k_qmi_ce_cfg *cfg = &ab->qmi.ce_cfg;
 
-	cfg->tgt_ce = (u8 *)target_ce_config_wlan;
-	cfg->tgt_ce_len = sizeof(target_ce_config_wlan);
-
-	cfg->svc_to_ce_map = (u8 *)target_service_to_ce_map_wlan;
-	cfg->svc_to_ce_map_len = sizeof(target_service_to_ce_map_wlan);
+	cfg->tgt_ce_len = ARRAY_SIZE(target_ce_config_wlan) - 1;
+	cfg->tgt_ce = target_ce_config_wlan;
+	cfg->svc_to_ce_map_len = ARRAY_SIZE(target_service_to_ce_map_wlan);
+	cfg->svc_to_ce_map = target_service_to_ce_map_wlan;
 }
 
 static void ath11k_ahb_free_ext_irq(struct ath11k_base *ab)
diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index ff9203d46810..fab03f5af271 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -64,9 +64,9 @@ struct ath11k_qmi_driver_event {
 };
 
 struct ath11k_qmi_ce_cfg {
-	const u8 *tgt_ce;
+	const struct ce_pipe_config *tgt_ce;
 	int tgt_ce_len;
-	const u8 *svc_to_ce_map;
+	const struct service_to_pipe *svc_to_ce_map;
 	int svc_to_ce_map_len;
 	const u8 *shadow_reg;
 	int shadow_reg_len;
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
