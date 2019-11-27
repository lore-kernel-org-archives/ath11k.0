Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-187.smtp-out.us-west-2.amazonses.com ([54.240.27.187])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZxzt-0002JD-Sy
 for ath11k@lists.infradead.org; Wed, 27 Nov 2019 14:08:51 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 02/10] ath11k: qmi clean up ce and HTC service config update
Date: Wed, 27 Nov 2019 14:08:47 +0000
Message-ID: <0101016ead316c3d-4cd80ff4-91cb-48cc-8d25-9e7a56bfede2-000000@us-west-2.amazonses.com>
In-Reply-To: <1574863720-25728-1-git-send-email-kvalo@codeaurora.org>
References: <1574863720-25728-1-git-send-email-kvalo@codeaurora.org>
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

From: Anilkumar Kolli <akolli@codeaurora.org>

Copy CE and htc service configs for all pipes.

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 9 ++++-----
 drivers/net/wireless/ath/ath11k/qmi.h | 4 ++--
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index f80173b8afc6..e7e3e64c07aa 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -635,11 +635,10 @@ static void ath11k_ahb_init_qmi_ce_config(struct ath11k_base *ab)
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
index df0685564e21..3f7db642d869 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -66,9 +66,9 @@ struct ath11k_qmi_driver_event {
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
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
