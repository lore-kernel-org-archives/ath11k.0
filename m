Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWGbG-0006KD-FK
 for ath11k@lists.infradead.org; Wed, 06 May 2020 09:44:26 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH 2/3] ath11k: Add drv private for bus opaque struct
Date: Wed,  6 May 2020 15:13:59 +0530
Message-Id: <20200506094400.4740-3-govinds@codeaurora.org>
In-Reply-To: <20200506094400.4740-1-govinds@codeaurora.org>
References: <20200506094400.4740-1-govinds@codeaurora.org>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org

Add drv private opaque structure to have bus level
structure for multibus support.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/ahb.c  | 2 +-
 drivers/net/wireless/ath/ath11k/core.c | 5 +++--
 drivers/net/wireless/ath/ath11k/core.h | 6 +++++-
 drivers/net/wireless/ath/ath11k/hw.h   | 5 +++++
 4 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index b625b7c3ad32..19cda6bfe9b7 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -932,7 +932,7 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ab = ath11k_core_alloc(&pdev->dev);
+	ab = ath11k_core_alloc(&pdev->dev, 0, ATH11K_BUS_AHB);
 	if (!ab) {
 		dev_err(&pdev->dev, "failed to allocate ath11k base\n");
 		return -ENOMEM;
diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 985ea3bcadb9..a91eae6a4e57 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -756,11 +756,12 @@ void ath11k_core_free(struct ath11k_base *ab)
 	kfree(ab);
 }
 
-struct ath11k_base *ath11k_core_alloc(struct device *dev)
+struct ath11k_base *ath11k_core_alloc(struct device *dev, size_t priv_size,
+				      enum ath11k_bus bus)
 {
 	struct ath11k_base *ab;
 
-	ab = kzalloc(sizeof(*ab), GFP_KERNEL);
+	ab = kzalloc(sizeof(*ab) + priv_size, GFP_KERNEL);
 	if (!ab)
 		return NULL;
 
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index fdc09995609b..b3b210a22b25 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -662,6 +662,9 @@ struct ath11k_base {
 
 	/* Round robbin based TCL ring selector */
 	atomic_t tcl_ring_selector;
+
+	/* must be last */
+	u8 drv_priv[0] __aligned(sizeof(void *));
 };
 
 struct ath11k_fw_stats_pdev {
@@ -798,7 +801,8 @@ struct ath11k_peer *ath11k_peer_find_by_id(struct ath11k_base *ab, int peer_id);
 int ath11k_core_qmi_firmware_ready(struct ath11k_base *ab);
 int ath11k_core_init(struct ath11k_base *ath11k);
 void ath11k_core_deinit(struct ath11k_base *ath11k);
-struct ath11k_base *ath11k_core_alloc(struct device *dev);
+struct ath11k_base *ath11k_core_alloc(struct device *dev, size_t priv_size,
+				      enum ath11k_bus bus);
 void ath11k_core_free(struct ath11k_base *ath11k);
 int ath11k_core_fetch_bdf(struct ath11k_base *ath11k,
 			  struct ath11k_board_data *bd);
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 9973477ae373..e9a577f561f7 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -99,6 +99,11 @@ enum ath11k_hw_rate_ofdm {
 	ATH11K_HW_RATE_OFDM_9M,
 };
 
+enum ath11k_bus {
+	ATH11K_BUS_AHB,
+	ATH11K_BUS_PCI,
+};
+
 struct ath11k_hw_params {
 	const char *name;
 	struct {
-- 
2.22.0

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
