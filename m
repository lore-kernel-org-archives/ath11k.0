Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiWQL-0001h7-5v
 for ath11k@lists.infradead.org; Tue, 09 Jun 2020 05:03:46 +0000
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH 4/8] ath11k: add IPQ6018 support
Date: Tue,  9 Jun 2020 10:33:09 +0530
Message-Id: <1591678993-11016-5-git-send-email-akolli@codeaurora.org>
In-Reply-To: <1591678993-11016-1-git-send-email-akolli@codeaurora.org>
References: <1591678993-11016-1-git-send-email-akolli@codeaurora.org>
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

IPQ6018 has one 5G and one 2G radio with 2x2,
shares ipq8074 configurations.

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/ahb.c  |  3 ++
 drivers/net/wireless/ath/ath11k/core.c | 55 +++++++++++++++++++++++++++++-----
 drivers/net/wireless/ath/ath11k/core.h |  1 +
 drivers/net/wireless/ath/ath11k/hw.h   |  6 ++++
 4 files changed, 58 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 30092841ac46..dca014ea7ddf 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -20,6 +20,9 @@ static const struct of_device_id ath11k_ahb_of_match[] = {
 	{ .compatible = "qcom,ipq8074-wifi",
 	  .data = (void *)ATH11K_HW_IPQ8074,
 	},
+	{ .compatible = "qcom,ipq6018-wifi",
+	  .data = (void *)ATH11K_HW_IPQ6018,
+	},
 	{ }
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 02501cc154fe..abe9edb56309 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -17,12 +17,24 @@ unsigned int ath11k_debug_mask;
 module_param_named(debug_mask, ath11k_debug_mask, uint, 0644);
 MODULE_PARM_DESC(debug_mask, "Debugging mask");
 
-static const struct ath11k_hw_params ath11k_hw_params = {
-	.name = "ipq8074",
-	.fw = {
-		.dir = IPQ8074_FW_DIR,
-		.board_size = IPQ8074_MAX_BOARD_DATA_SZ,
-		.cal_size =  IPQ8074_MAX_CAL_DATA_SZ,
+static const struct ath11k_hw_params ath11k_hw_params_list[] = {
+	{
+		.dev_id = ATH11K_HW_IPQ8074,
+		.name = "ipq8074",
+		.fw = {
+			.dir = IPQ8074_FW_DIR,
+			.board_size = IPQ8074_MAX_BOARD_DATA_SZ,
+			.cal_size =  IPQ8074_MAX_CAL_DATA_SZ,
+		},
+	},
+	{
+		.dev_id = ATH11K_HW_IPQ6018,
+		.name = "ipq6018",
+		.fw = {
+			.dir = IPQ6018_FW_DIR,
+			.board_size = IPQ6018_MAX_BOARD_DATA_SZ,
+			.cal_size =  IPQ6018_MAX_CAL_DATA_SZ,
+		},
 	},
 };
 
@@ -707,6 +719,30 @@ static void ath11k_core_restart(struct work_struct *work)
 	complete(&ab->driver_recovery);
 }
 
+static int ath11k_init_hw_params(struct ath11k_base *ab)
+{
+	const struct ath11k_hw_params *hw_params = NULL;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(ath11k_hw_params_list); i++) {
+		hw_params = &ath11k_hw_params_list[i];
+
+		if (hw_params->dev_id == ab->hw_rev)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(ath11k_hw_params_list)) {
+		ath11k_err(ab, "Unsupported hardware version: 0x%x\n", ab->hw_rev);
+		return -EINVAL;
+	}
+
+	ab->hw_params = *hw_params;
+
+	ath11k_dbg(ab, ATH11K_DBG_BOOT, "Hardware name %s\n", ab->hw_params.name);
+
+	return 0;
+}
+
 int ath11k_core_init(struct ath11k_base *ab)
 {
 	struct device *dev = ab->dev;
@@ -725,7 +761,12 @@ int ath11k_core_init(struct ath11k_base *ab)
 		return -EINVAL;
 	}
 	ab->tgt_rproc = prproc;
-	ab->hw_params = ath11k_hw_params;
+
+	ret = ath11k_init_hw_params(ab);
+	if (ret) {
+		ath11k_err(ab, "failed to get hw params %d\n", ret);
+		return ret;
+	}
 
 	ret = ath11k_core_soc_create(ab);
 	if (ret) {
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index e04f0e711779..ecf327537ad3 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -88,6 +88,7 @@ struct ath11k_skb_rxcb {
 
 enum ath11k_hw_rev {
 	ATH11K_HW_IPQ8074,
+	ATH11K_HW_IPQ6018,
 };
 
 enum ath11k_firmware_mode {
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index f7f070af233c..e66f0e0138c4 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -73,6 +73,11 @@
 #define IPQ8074_MAX_BOARD_DATA_SZ	(256 * 1024)
 #define IPQ8074_MAX_CAL_DATA_SZ		IPQ8074_MAX_BOARD_DATA_SZ
 
+/* IPQ6018 definitions */
+#define IPQ6018_FW_DIR			ATH11K_FW_DIR "/IPQ6018/hw1.0"
+#define IPQ6018_MAX_BOARD_DATA_SZ	(256 * 1024)
+#define IPQ6018_MAX_CAL_DATA_SZ		IPQ6018_MAX_BOARD_DATA_SZ
+
 #define ATH11K_BOARD_MAGIC		"QCA-ATH11K-BOARD"
 #define ATH11K_BOARD_API2_FILE		"board-2.bin"
 #define ATH11K_DEFAULT_BOARD_FILE	"board.bin"
@@ -106,6 +111,7 @@ enum ath11k_bus {
 
 struct ath11k_hw_params {
 	const char *name;
+	u16 dev_id;
 	struct {
 		const char *dir;
 		size_t board_size;
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
