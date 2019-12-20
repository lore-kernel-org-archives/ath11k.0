Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ii8zk-0004RQ-Ai
 for ath11k@lists.infradead.org; Fri, 20 Dec 2019 03:30:30 +0000
Received: from cjhuang-station.qca.qualcomm.com (unknown [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: cjhuang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A1678C447A3
 for <ath11k@lists.infradead.org>; Fri, 20 Dec 2019 03:30:21 +0000 (UTC)
From: Carl Huang <cjhuang@codeaurora.org>
Subject: [PATCH qca6390-bringup] ath11k: fix ath11k_pci rmmod crash
Date: Fri, 20 Dec 2019 11:30:15 +0800
Message-Id: <1576812615-25070-1-git-send-email-cjhuang@codeaurora.org>
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

For QCA6390, it needs to free_irq and then disable_msi.Otherwise,
crash happened. Also free other resources during ath11k_pci_remove.
Fixed the typo in ath11k_debug_pdev_destroy and ath11k_debug_soc_destroy.

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/debug.c |  8 ++++----
 drivers/net/wireless/ath/ath11k/pci.c   | 16 +++++++++++++++-
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debug.c b/drivers/net/wireless/ath/ath11k/debug.c
index 82522ec..3bd97b0 100644
--- a/drivers/net/wireless/ath/ath11k/debug.c
+++ b/drivers/net/wireless/ath/ath11k/debug.c
@@ -828,8 +828,8 @@ int ath11k_debug_pdev_create(struct ath11k_base *ab)
 
 void ath11k_debug_pdev_destroy(struct ath11k_base *ab)
 {
-	debugfs_remove_recursive(ab->debugfs_ath11k);
-	ab->debugfs_ath11k = NULL;
+	debugfs_remove_recursive(ab->debugfs_soc);
+	ab->debugfs_soc = NULL;
 }
 
 int ath11k_debug_soc_create(struct ath11k_base *ab)
@@ -847,8 +847,8 @@ int ath11k_debug_soc_create(struct ath11k_base *ab)
 
 void ath11k_debug_soc_destroy(struct ath11k_base *ab)
 {
-	debugfs_remove_recursive(ab->debugfs_soc);
-	ab->debugfs_soc = NULL;
+	debugfs_remove_recursive(ab->debugfs_ath11k);
+	ab->debugfs_ath11k = NULL;
 }
 
 void ath11k_debug_fw_stats_init(struct ath11k *ar)
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 1673ce7..48339e2 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -392,6 +392,14 @@ static void ath11k_pci_free_irq(struct ath11k_base *ab)
 		irq_idx = ATH11K_IRQ_CE0_OFFSET + i;
 		free_irq(ab->irq_num[irq_idx], &ab->ce.ce_pipe[i]);
 	}
+
+	for (i = 0; i < ATH11K_EXT_IRQ_GRP_NUM_MAX; i++) {
+		struct ath11k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
+		int j;
+
+		for (j = 0; j < irq_grp->num_irq; j++)
+			free_irq(ab->irq_num[irq_grp->irqs[j]], irq_grp);
+	}
 }
 
 static void ath11k_pci_ce_irq_enable(struct ath11k_base *ab, u16 ce_id)
@@ -1068,10 +1076,16 @@ static void ath11k_pci_remove(struct pci_dev *pdev)
 	struct ath11k_pci *ar_pci = ath11k_pci_priv(ab);
 
 	set_bit(ATH11K_FLAG_UNREGISTERING, &ab->dev_flags);
+	ath11k_core_deinit(ab);
+
 	ath11k_pci_unregister_mhi(ar_pci);
+
+	ath11k_pci_free_irq(ab);
 	ath11k_pci_disable_msi(ar_pci);
 	ath11k_pci_free_region(ar_pci);
-	ath11k_pci_free_irq(ab);
+
+	ath11k_hal_srng_deinit(ab);
+	ath11k_ce_free_pipes(ab);
 	ath11k_core_free(ab);
 }
 
-- 
2.7.4

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
