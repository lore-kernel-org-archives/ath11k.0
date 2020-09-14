Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHofp-0000TX-UM
 for ath11k@lists.infradead.org; Mon, 14 Sep 2020 13:37:38 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH] ath11k: Remove rproc references from common core layer
Date: Mon, 14 Sep 2020 19:06:55 +0530
Message-Id: <1600090615-18904-1-git-send-email-govinds@codeaurora.org>
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
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org

IPQ8074 HW uses rproc with AHB as underlying hif layer.
Move rproc references from common core layer to target
hif layer. Remove IS_ENABLED check for CONFIG_REMOTEPROC
as it's not required anymore.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/ahb.c  | 39 ++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath11k/ahb.h  |  8 ++++++
 drivers/net/wireless/ath/ath11k/core.c | 33 ----------------------
 drivers/net/wireless/ath/ath11k/core.h |  1 -
 4 files changed, 44 insertions(+), 37 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index f6e36e58e1fd..b642e52c4904 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -323,9 +323,10 @@ static void ath11k_ahb_stop(struct ath11k_base *ab)
 
 static int ath11k_ahb_power_up(struct ath11k_base *ab)
 {
+	struct ath11k_ahb *ab_ahb = ath11k_ahb_priv(ab);
 	int ret;
 
-	ret = rproc_boot(ab->tgt_rproc);
+	ret = rproc_boot(ab_ahb->tgt_rproc);
 	if (ret)
 		ath11k_err(ab, "failed to boot the remote processor Q6\n");
 
@@ -334,7 +335,9 @@ static int ath11k_ahb_power_up(struct ath11k_base *ab)
 
 static void ath11k_ahb_power_down(struct ath11k_base *ab)
 {
-	rproc_shutdown(ab->tgt_rproc);
+	struct ath11k_ahb *ab_ahb = ath11k_ahb_priv(ab);
+
+	rproc_shutdown(ab_ahb->tgt_rproc);
 }
 
 static void ath11k_ahb_init_qmi_ce_config(struct ath11k_base *ab)
@@ -600,6 +603,28 @@ static const struct ath11k_hif_ops ath11k_ahb_hif_ops = {
 	.power_up = ath11k_ahb_power_up,
 };
 
+static int ath11k_core_get_rproc(struct ath11k_base *ab)
+{
+	struct ath11k_ahb *ab_ahb = ath11k_ahb_priv(ab);
+	struct device *dev = ab->dev;
+	struct rproc *prproc;
+	phandle rproc_phandle;
+
+	if (of_property_read_u32(dev->of_node, "qcom,rproc", &rproc_phandle)) {
+		ath11k_err(ab, "failed to get q6_rproc handle\n");
+		return -ENOENT;
+	}
+
+	prproc = rproc_get_by_phandle(rproc_phandle);
+	if (!prproc) {
+		ath11k_err(ab, "failed to get rproc\n");
+		return -EINVAL;
+	}
+	ab_ahb->tgt_rproc = prproc;
+
+	return 0;
+}
+
 static int ath11k_ahb_probe(struct platform_device *pdev)
 {
 	struct ath11k_base *ab;
@@ -626,7 +651,9 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ab = ath11k_core_alloc(&pdev->dev, 0, ATH11K_BUS_AHB, &ath11k_ahb_bus_params);
+	ab = ath11k_core_alloc(&pdev->dev, sizeof(struct ath11k_ahb),
+			       ATH11K_BUS_AHB,
+			       &ath11k_ahb_bus_params);
 	if (!ab) {
 		dev_err(&pdev->dev, "failed to allocate ath11k base\n");
 		return -ENOMEM;
@@ -655,6 +682,12 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
 
 	ath11k_ahb_init_qmi_ce_config(ab);
 
+	ret = ath11k_core_get_rproc(ab);
+	if (ret) {
+		ath11k_err(ab, "failed to get rproc: %d\n", ret);
+		goto err_ce_free;
+	}
+
 	ret = ath11k_core_init(ab);
 	if (ret) {
 		ath11k_err(ab, "failed to init core: %d\n", ret);
diff --git a/drivers/net/wireless/ath/ath11k/ahb.h b/drivers/net/wireless/ath/ath11k/ahb.h
index 6c7b26ac6545..51e6e4a5f686 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.h
+++ b/drivers/net/wireless/ath/ath11k/ahb.h
@@ -10,4 +10,12 @@
 #define ATH11K_AHB_RECOVERY_TIMEOUT (3 * HZ)
 struct ath11k_base;
 
+struct ath11k_ahb {
+	struct rproc *tgt_rproc;
+};
+
+static inline struct ath11k_ahb *ath11k_ahb_priv(struct ath11k_base *ab)
+{
+	return (struct ath11k_ahb *)ab->drv_priv;
+}
 #endif
diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index ce81702b27d2..0e8b1d25f0bc 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -842,43 +842,10 @@ int ath11k_core_pre_init(struct ath11k_base *ab)
 }
 EXPORT_SYMBOL(ath11k_core_pre_init);
 
-static int ath11k_core_get_rproc(struct ath11k_base *ab)
-{
-	struct device *dev = ab->dev;
-	struct rproc *prproc;
-	phandle rproc_phandle;
-
-	if (!IS_ENABLED(CONFIG_REMOTEPROC))
-		return 0;
-
-	if (ab->bus_params.mhi_support)
-		return 0;
-
-	if (of_property_read_u32(dev->of_node, "qcom,rproc", &rproc_phandle)) {
-		ath11k_err(ab, "failed to get q6_rproc handle\n");
-		return -ENOENT;
-	}
-
-	prproc = rproc_get_by_phandle(rproc_phandle);
-	if (!prproc) {
-		ath11k_err(ab, "failed to get rproc\n");
-		return -EINVAL;
-	}
-	ab->tgt_rproc = prproc;
-
-	return 0;
-}
-
 int ath11k_core_init(struct ath11k_base *ab)
 {
 	int ret;
 
-	ret = ath11k_core_get_rproc(ab);
-	if (ret) {
-		ath11k_err(ab, "failed to get rproc: %d\n", ret);
-		return ret;
-	}
-
 	ret = ath11k_core_soc_create(ab);
 	if (ret) {
 		ath11k_err(ab, "failed to create soc core: %d\n", ret);
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 807884687d39..02a87027c4e4 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -648,7 +648,6 @@ struct ath11k_base {
 	struct ath11k_qmi qmi;
 	struct ath11k_wmi_base wmi_ab;
 	struct completion fw_ready;
-	struct rproc *tgt_rproc;
 	int num_radios;
 	/* HW channel counters frequency value in hertz common to all MACs */
 	u32 cc_freq_hz;
-- 
2.22.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
