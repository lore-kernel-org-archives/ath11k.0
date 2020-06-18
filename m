Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jln6f-0002lf-Mr
 for ath11k@lists.infradead.org; Thu, 18 Jun 2020 05:29:01 +0000
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH v3 2/3] ath11k: copy ce service configs to hw_params
Date: Thu, 18 Jun 2020 10:58:23 +0530
Message-Id: <1592458104-2961-3-git-send-email-akolli@codeaurora.org>
In-Reply-To: <1592458104-2961-1-git-send-email-akolli@codeaurora.org>
References: <1592458104-2961-1-git-send-email-akolli@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org

No functional changes, added target ce service configurations
to hw_params.

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
V3:
 - added ce svc configs in hw_params

 drivers/net/wireless/ath/ath11k/ahb.c  | 20 +++++++++++++++-----
 drivers/net/wireless/ath/ath11k/core.c |  8 +-------
 drivers/net/wireless/ath/ath11k/core.h |  1 +
 drivers/net/wireless/ath/ath11k/hw.h   |  2 ++
 4 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 7e9bfeaaf4d2..aa74d27e5871 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -152,7 +152,7 @@ static const struct ce_pipe_config target_ce_config_wlan[] = {
  * This table is derived from the CE_PCI TABLE, above.
  * It is passed to the Target at startup for use by firmware.
  */
-static const struct service_to_pipe target_service_to_ce_map_wlan[] = {
+static const struct service_to_pipe target_service_to_ce_map_wlan_ipq8074[] = {
 	{
 		.service_id = __cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_DATA_VO),
 		.pipedir = __cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
@@ -644,8 +644,8 @@ static void ath11k_ahb_init_qmi_ce_config(struct ath11k_base *ab)
 
 	cfg->tgt_ce_len = ARRAY_SIZE(target_ce_config_wlan) - 1;
 	cfg->tgt_ce = target_ce_config_wlan;
-	cfg->svc_to_ce_map_len = ARRAY_SIZE(target_service_to_ce_map_wlan);
-	cfg->svc_to_ce_map = target_service_to_ce_map_wlan;
+	cfg->svc_to_ce_map_len = ab->hw_params.svc_to_ce_map_len;
+	cfg->svc_to_ce_map = ab->hw_params.svc_to_ce_map;
 }
 
 static void ath11k_ahb_free_ext_irq(struct ath11k_base *ab)
@@ -853,8 +853,8 @@ static int ath11k_ahb_map_service_to_pipe(struct ath11k_base *ab, u16 service_id
 	bool ul_set = false, dl_set = false;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(target_service_to_ce_map_wlan); i++) {
-		entry = &target_service_to_ce_map_wlan[i];
+	for (i = 0; i < ab->hw_params.svc_to_ce_map_len; i++) {
+		entry = &ab->hw_params.svc_to_ce_map[i];
 
 		if (__le32_to_cpu(entry->service_id) != service_id)
 			continue;
@@ -950,6 +950,16 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
 		goto err_hal_srng_deinit;
 	}
 
+	ret = ath11k_init_hw_params(ab);
+	if (ret) {
+		ath11k_err(ab, "failed to get hw params %d\n", ret);
+		return ret;
+	}
+
+	ab->hw_params.svc_to_ce_map_len =
+			ARRAY_SIZE(target_service_to_ce_map_wlan_ipq8074);
+	ab->hw_params.svc_to_ce_map = target_service_to_ce_map_wlan_ipq8074;
+
 	ath11k_ahb_init_qmi_ce_config(ab);
 
 	ret = ath11k_core_init(ab);
diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 38e830a2395b..0bf8bb1674dc 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -703,7 +703,7 @@ static void ath11k_core_restart(struct work_struct *work)
 	complete(&ab->driver_recovery);
 }
 
-static int ath11k_init_hw_params(struct ath11k_base *ab)
+int ath11k_init_hw_params(struct ath11k_base *ab)
 {
 	const struct ath11k_hw_params *hw_params = NULL;
 	int i;
@@ -746,12 +746,6 @@ int ath11k_core_init(struct ath11k_base *ab)
 	}
 	ab->tgt_rproc = prproc;
 
-	ret = ath11k_init_hw_params(ab);
-	if (ret) {
-		ath11k_err(ab, "failed to get hw params %d\n", ret);
-		return ret;
-	}
-
 	ret = ath11k_core_soc_create(ab);
 	if (ret) {
 		ath11k_err(ab, "failed to create soc core: %d\n", ret);
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index b6ccd9f93853..98b994984c25 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -852,6 +852,7 @@ struct ath11k_peer *ath11k_peer_find_by_id(struct ath11k_base *ab, int peer_id);
 int ath11k_core_qmi_firmware_ready(struct ath11k_base *ab);
 int ath11k_core_init(struct ath11k_base *ath11k);
 void ath11k_core_deinit(struct ath11k_base *ath11k);
+int ath11k_init_hw_params(struct ath11k_base *ab);
 struct ath11k_base *ath11k_core_alloc(struct device *dev, size_t priv_size,
 				      enum ath11k_bus bus);
 void ath11k_core_free(struct ath11k_base *ath11k);
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index f31d53f6adb8..388cfb42ef93 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -116,6 +116,8 @@ struct ath11k_hw_params {
 	} fw;
 
 	const struct ath11k_hw_ops *hw_ops;
+	const struct service_to_pipe *svc_to_ce_map;
+	int svc_to_ce_map_len;
 };
 
 extern const struct ath11k_hw_ops ipq8074_ops;
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
