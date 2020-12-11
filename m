Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knmKq-0006l4-VY
 for ath11k@lists.infradead.org; Fri, 11 Dec 2020 17:36:11 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 02/10] ath11k: hif: implement suspend and resume functions
Date: Fri, 11 Dec 2020 19:35:42 +0200
Message-Id: <1607708150-21066-3-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1607708150-21066-1-git-send-email-kvalo@codeaurora.org>
References: <1607708150-21066-1-git-send-email-kvalo@codeaurora.org>
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

From: Carl Huang <cjhuang@codeaurora.org>

For suspend support add suspend and resume to HIF layer. These ops are optional
and, for example, AHB bus driver does not need to implement these.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/hif.h | 18 ++++++++++++++++++
 drivers/net/wireless/ath/ath11k/pci.c | 20 ++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/hif.h b/drivers/net/wireless/ath/ath11k/hif.h
index dbe5568916e8..147f1e802ca9 100644
--- a/drivers/net/wireless/ath/ath11k/hif.h
+++ b/drivers/net/wireless/ath/ath11k/hif.h
@@ -17,6 +17,8 @@ struct ath11k_hif_ops {
 	void (*stop)(struct ath11k_base *sc);
 	int (*power_up)(struct ath11k_base *sc);
 	void (*power_down)(struct ath11k_base *sc);
+	int (*suspend)(struct ath11k_base *ab);
+	int (*resume)(struct ath11k_base *ab);
 	int (*map_service_to_pipe)(struct ath11k_base *sc, u16 service_id,
 				   u8 *ul_pipe, u8 *dl_pipe);
 	int (*get_user_msi_vector)(struct ath11k_base *ab, char *user_name,
@@ -56,6 +58,22 @@ static inline void ath11k_hif_power_down(struct ath11k_base *sc)
 	sc->hif.ops->power_down(sc);
 }
 
+static inline int ath11k_hif_suspend(struct ath11k_base *ab)
+{
+	if (ab->hif.ops->suspend)
+		return ab->hif.ops->suspend(ab);
+
+	return 0;
+}
+
+static inline int ath11k_hif_resume(struct ath11k_base *ab)
+{
+	if (ab->hif.ops->resume)
+		return ab->hif.ops->resume(ab);
+
+	return 0;
+}
+
 static inline u32 ath11k_hif_read32(struct ath11k_base *sc, u32 address)
 {
 	return sc->hif.ops->read32(sc, address);
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 818e37c32a85..770cefd53290 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -913,6 +913,24 @@ static void ath11k_pci_power_down(struct ath11k_base *ab)
 	ath11k_pci_sw_reset(ab_pci->ab, false);
 }
 
+static int ath11k_pci_hif_suspend(struct ath11k_base *ab)
+{
+	struct ath11k_pci *ar_pci = ath11k_pci_priv(ab);
+
+	ath11k_mhi_suspend(ar_pci);
+
+	return 0;
+}
+
+static int ath11k_pci_hif_resume(struct ath11k_base *ab)
+{
+	struct ath11k_pci *ar_pci = ath11k_pci_priv(ab);
+
+	ath11k_mhi_resume(ar_pci);
+
+	return 0;
+}
+
 static void ath11k_pci_kill_tasklets(struct ath11k_base *ab)
 {
 	int i;
@@ -997,6 +1015,8 @@ static const struct ath11k_hif_ops ath11k_pci_hif_ops = {
 	.write32 = ath11k_pci_write32,
 	.power_down = ath11k_pci_power_down,
 	.power_up = ath11k_pci_power_up,
+	.suspend = ath11k_pci_hif_suspend,
+	.resume = ath11k_pci_hif_resume,
 	.irq_enable = ath11k_pci_ext_irq_enable,
 	.irq_disable = ath11k_pci_ext_irq_disable,
 	.get_msi_address =  ath11k_pci_get_msi_address,
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
