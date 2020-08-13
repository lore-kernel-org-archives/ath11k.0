Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k69AA-0006ch-U9
 for ath11k@lists.infradead.org; Thu, 13 Aug 2020 09:04:44 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 07/10] ath11k: implement ath11k_core_pre_init()
Date: Thu, 13 Aug 2020 12:04:23 +0300
Message-Id: <1597309466-19688-8-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1597309466-19688-1-git-send-email-kvalo@codeaurora.org>
References: <1597309466-19688-1-git-send-email-kvalo@codeaurora.org>
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

This is needed to initialise hw_params before MHI registration starts. MHI
needs location of firmware directory and that's delivered via hw_params.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/ahb.c  |  4 ++++
 drivers/net/wireless/ath/ath11k/core.c | 20 ++++++++++++++------
 drivers/net/wireless/ath/ath11k/core.h |  1 +
 drivers/net/wireless/ath/ath11k/pci.c  |  7 +++++++
 4 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 042019de0a81..f4c346bcc676 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -868,6 +868,10 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
 	ab->mem_len = resource_size(mem_res);
 	platform_set_drvdata(pdev, ab);
 
+	ret = ath11k_core_pre_init(ab);
+	if (ret)
+		goto err_core_free;
+
 	ret = ath11k_hal_srng_init(ab);
 	if (ret)
 		goto err_core_free;
diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 2dfbe4276514..5c84995baaf9 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -742,6 +742,20 @@ static int ath11k_init_hw_params(struct ath11k_base *ab)
 	return 0;
 }
 
+int ath11k_core_pre_init(struct ath11k_base *ab)
+{
+	int ret;
+
+	ret = ath11k_init_hw_params(ab);
+	if (ret) {
+		ath11k_err(ab, "failed to get hw params: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(ath11k_core_pre_init);
+
 int ath11k_core_init(struct ath11k_base *ab)
 {
 	struct device *dev = ab->dev;
@@ -761,12 +775,6 @@ int ath11k_core_init(struct ath11k_base *ab)
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
index ca97ccf250a4..a0a7c7b003c1 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -841,6 +841,7 @@ struct ath11k_peer *ath11k_peer_find_by_addr(struct ath11k_base *ab,
 					     const u8 *addr);
 struct ath11k_peer *ath11k_peer_find_by_id(struct ath11k_base *ab, int peer_id);
 int ath11k_core_qmi_firmware_ready(struct ath11k_base *ab);
+int ath11k_core_pre_init(struct ath11k_base *ab);
 int ath11k_core_init(struct ath11k_base *ath11k);
 void ath11k_core_deinit(struct ath11k_base *ath11k);
 struct ath11k_base *ath11k_core_alloc(struct device *dev, size_t priv_size,
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 5ebbdbde81ef..ff401d2871f3 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -208,8 +208,15 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 		goto err_pci_free_region;
 	}
 
+	ret = ath11k_core_pre_init(ab);
+	if (ret)
+		goto err_pci_disable_msi;
+
 	return 0;
 
+err_pci_disable_msi:
+	ath11k_pci_disable_msi(ab_pci);
+
 err_pci_free_region:
 	ath11k_pci_free_region(ab_pci);
 
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
