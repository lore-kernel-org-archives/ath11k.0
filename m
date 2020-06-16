Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlC9c-0002tv-7k
 for ath11k@lists.infradead.org; Tue, 16 Jun 2020 14:01:42 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 02/12] ath11k: convert ath11k_hw_params to an array
Date: Tue, 16 Jun 2020 17:00:45 +0300
Message-Id: <1592316055-24958-3-git-send-email-kvalo@codeaurora.org>
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

Convert to ath11k_hw_params to an array to make it possible add new hardware in
the future, for example IPQ6018 or QCA6390.

No functional changes. Compile tested only.

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c | 46 ++++++++++++++++++++++++++++------
 drivers/net/wireless/ath/ath11k/hw.h   |  1 +
 2 files changed, 40 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 905cd8beaf28..92d7925ad0f4 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -17,12 +17,15 @@ unsigned int ath11k_debug_mask;
 module_param_named(debug_mask, ath11k_debug_mask, uint, 0644);
 MODULE_PARM_DESC(debug_mask, "Debugging mask");
 
-static const struct ath11k_hw_params ath11k_hw_params = {
-	.name = "ipq8074",
-	.fw = {
-		.dir = IPQ8074_FW_DIR,
-		.board_size = IPQ8074_MAX_BOARD_DATA_SZ,
-		.cal_size =  IPQ8074_MAX_CAL_DATA_SZ,
+static const struct ath11k_hw_params ath11k_hw_params[] = {
+	{
+		.hw_rev = ATH11K_HW_IPQ8074,
+		.name = "ipq8074 hw2.0",
+		.fw = {
+			.dir = IPQ8074_FW_DIR,
+			.board_size = IPQ8074_MAX_BOARD_DATA_SZ,
+			.cal_size =  IPQ8074_MAX_CAL_DATA_SZ,
+		},
 	},
 };
 
@@ -717,6 +720,30 @@ static void ath11k_core_restart(struct work_struct *work)
 	complete(&ab->driver_recovery);
 }
 
+static int ath11k_init_hw_params(struct ath11k_base *ab)
+{
+	const struct ath11k_hw_params *hw_params = NULL;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(ath11k_hw_params); i++) {
+		hw_params = &ath11k_hw_params[i];
+
+		if (hw_params->hw_rev == ab->hw_rev)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(ath11k_hw_params)) {
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
@@ -735,7 +762,12 @@ int ath11k_core_init(struct ath11k_base *ab)
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
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index f7f070af233c..f95ad31d3d6c 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -106,6 +106,7 @@ enum ath11k_bus {
 
 struct ath11k_hw_params {
 	const char *name;
+	u16 hw_rev;
 	struct {
 		const char *dir;
 		size_t board_size;
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
