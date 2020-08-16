Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7GfJ-0004mm-PR
 for ath11k@lists.infradead.org; Sun, 16 Aug 2020 11:17:32 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH v2 05/12] ath11k: ce: remove CE_COUNT() macro
Date: Sun, 16 Aug 2020 14:16:32 +0300
Message-Id: <1597576599-8857-6-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1597576599-8857-1-git-send-email-kvalo@codeaurora.org>
References: <1597576599-8857-1-git-send-email-kvalo@codeaurora.org>
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

This macro is evil as it's accesses ab variable in a hidden way. It's better
for readibility to access ab->hw_params.ce_count directly.

This is done in a separate patch to keep the patches simple. No functional changes.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 12 ++++++------
 drivers/net/wireless/ath/ath11k/ce.c  | 12 ++++++------
 drivers/net/wireless/ath/ath11k/ce.h  |  1 -
 drivers/net/wireless/ath/ath11k/hal.c |  2 +-
 drivers/net/wireless/ath/ath11k/htc.c |  2 +-
 drivers/net/wireless/ath/ath11k/pci.c | 12 ++++++------
 6 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 4bc3558fc300..8466c62a83d6 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -384,7 +384,7 @@ static void ath11k_ahb_kill_tasklets(struct ath11k_base *ab)
 {
 	int i;
 
-	for (i = 0; i < CE_COUNT; i++) {
+	for (i = 0; i < ab->hw_params.ce_count; i++) {
 		struct ath11k_ce_pipe *ce_pipe = &ab->ce.ce_pipe[i];
 
 		if (ath11k_ce_get_attr_flags(ab, i) & CE_ATTR_DIS_INTR)
@@ -475,7 +475,7 @@ static void ath11k_ahb_sync_ce_irqs(struct ath11k_base *ab)
 	int i;
 	int irq_idx;
 
-	for (i = 0; i < CE_COUNT; i++) {
+	for (i = 0; i < ab->hw_params.ce_count; i++) {
 		if (ath11k_ce_get_attr_flags(ab, i) & CE_ATTR_DIS_INTR)
 			continue;
 
@@ -503,7 +503,7 @@ static void ath11k_ahb_ce_irqs_enable(struct ath11k_base *ab)
 {
 	int i;
 
-	for (i = 0; i < CE_COUNT; i++) {
+	for (i = 0; i < ab->hw_params.ce_count; i++) {
 		if (ath11k_ce_get_attr_flags(ab, i) & CE_ATTR_DIS_INTR)
 			continue;
 		ath11k_ahb_ce_irq_enable(ab, i);
@@ -514,7 +514,7 @@ static void ath11k_ahb_ce_irqs_disable(struct ath11k_base *ab)
 {
 	int i;
 
-	for (i = 0; i < CE_COUNT; i++) {
+	for (i = 0; i < ab->hw_params.ce_count; i++) {
 		if (ath11k_ce_get_attr_flags(ab, i) & CE_ATTR_DIS_INTR)
 			continue;
 		ath11k_ahb_ce_irq_disable(ab, i);
@@ -601,7 +601,7 @@ static void ath11k_ahb_free_irq(struct ath11k_base *ab)
 	int irq_idx;
 	int i;
 
-	for (i = 0; i < CE_COUNT; i++) {
+	for (i = 0; i < ab->hw_params.ce_count; i++) {
 		if (ath11k_ce_get_attr_flags(ab, i) & CE_ATTR_DIS_INTR)
 			continue;
 		irq_idx = ATH11K_IRQ_CE0_OFFSET + i;
@@ -756,7 +756,7 @@ static int ath11k_ahb_config_irq(struct ath11k_base *ab)
 	int ret;
 
 	/* Configure CE irqs */
-	for (i = 0; i < CE_COUNT; i++) {
+	for (i = 0; i < ab->hw_params.ce_count; i++) {
 		struct ath11k_ce_pipe *ce_pipe = &ab->ce.ce_pipe[i];
 
 		if (ath11k_ce_get_attr_flags(ab, i) & CE_ATTR_DIS_INTR)
diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
index c75007e92830..41c1a6e56596 100644
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -718,7 +718,7 @@ void ath11k_ce_cleanup_pipes(struct ath11k_base *ab)
 	struct ath11k_ce_pipe *pipe;
 	int pipe_num;
 
-	for (pipe_num = 0; pipe_num < CE_COUNT; pipe_num++) {
+	for (pipe_num = 0; pipe_num < ab->hw_params.ce_count; pipe_num++) {
 		pipe = &ab->ce.ce_pipe[pipe_num];
 		ath11k_ce_rx_pipe_cleanup(pipe);
 
@@ -736,7 +736,7 @@ void ath11k_ce_rx_post_buf(struct ath11k_base *ab)
 	int i;
 	int ret;
 
-	for (i = 0; i < CE_COUNT; i++) {
+	for (i = 0; i < ab->hw_params.ce_count; i++) {
 		pipe = &ab->ce.ce_pipe[i];
 		ret = ath11k_ce_rx_post_pipe(pipe);
 		if (ret) {
@@ -767,7 +767,7 @@ int ath11k_ce_init_pipes(struct ath11k_base *ab)
 	int i;
 	int ret;
 
-	for (i = 0; i < CE_COUNT; i++) {
+	for (i = 0; i < ab->hw_params.ce_count; i++) {
 		pipe = &ab->ce.ce_pipe[i];
 
 		if (pipe->src_ring) {
@@ -825,7 +825,7 @@ void ath11k_ce_free_pipes(struct ath11k_base *ab)
 	int desc_sz;
 	int i;
 
-	for (i = 0; i < CE_COUNT; i++) {
+	for (i = 0; i < ab->hw_params.ce_count; i++) {
 		pipe = &ab->ce.ce_pipe[i];
 
 		if (pipe->src_ring) {
@@ -874,7 +874,7 @@ int ath11k_ce_alloc_pipes(struct ath11k_base *ab)
 
 	spin_lock_init(&ab->ce.ce_lock);
 
-	for (i = 0; i < CE_COUNT; i++) {
+	for (i = 0; i < ab->hw_params.ce_count; i++) {
 		attr = &ab->hw_params.host_ce_config[i];
 		pipe = &ab->ce.ce_pipe[i];
 		pipe->pipe_num = i;
@@ -914,7 +914,7 @@ void ath11k_ce_byte_swap(void *mem, u32 len)
 
 int ath11k_ce_get_attr_flags(struct ath11k_base *ab, int ce_id)
 {
-	if (ce_id >= CE_COUNT)
+	if (ce_id >= ab->hw_params.ce_count)
 		return -EINVAL;
 
 	return ab->hw_params.host_ce_config[ce_id].flags;
diff --git a/drivers/net/wireless/ath/ath11k/ce.h b/drivers/net/wireless/ath/ath11k/ce.h
index 8feb6e98ea13..cf704f18f3a1 100644
--- a/drivers/net/wireless/ath/ath11k/ce.h
+++ b/drivers/net/wireless/ath/ath11k/ce.h
@@ -6,7 +6,6 @@
 #ifndef ATH11K_CE_H
 #define ATH11K_CE_H
 
-#define CE_COUNT (ab->hw_params.ce_count)
 #define CE_COUNT_MAX 12
 
 /* Byte swap data words */
diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index cca019cc0234..7dcdcc1a72fb 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -1157,7 +1157,7 @@ void ath11k_hal_dump_srng_stats(struct ath11k_base *ab)
 	int i;
 
 	ath11k_err(ab, "Last interrupt received for each CE:\n");
-	for (i = 0; i < CE_COUNT; i++) {
+	for (i = 0; i < ab->hw_params.ce_count; i++) {
 		ce_pipe = &ab->ce.ce_pipe[i];
 
 		if (ath11k_ce_get_attr_flags(ab, i) & CE_ATTR_DIS_INTR)
diff --git a/drivers/net/wireless/ath/ath11k/htc.c b/drivers/net/wireless/ath/ath11k/htc.c
index bc0026c1e4a6..e9e354fc11fa 100644
--- a/drivers/net/wireless/ath/ath11k/htc.c
+++ b/drivers/net/wireless/ath/ath11k/htc.c
@@ -478,7 +478,7 @@ int ath11k_htc_wait_target(struct ath11k_htc *htc)
 	if (!time_left) {
 		ath11k_warn(ab, "failed to receive control response completion, polling..\n");
 
-		for (i = 0; i < CE_COUNT; i++)
+		for (i = 0; i < ab->hw_params.ce_count; i++)
 			ath11k_ce_per_engine_service(htc->ab, i);
 
 		time_left =
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index e4551fb493ff..37bd385348c3 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -393,7 +393,7 @@ static void ath11k_pci_free_irq(struct ath11k_base *ab)
 {
 	int i, irq_idx;
 
-	for (i = 0; i < CE_COUNT; i++) {
+	for (i = 0; i < ab->hw_params.ce_count; i++) {
 		if (ath11k_ce_get_attr_flags(ab, i) & CE_ATTR_DIS_INTR)
 			continue;
 		irq_idx = ATH11K_PCI_IRQ_CE0_OFFSET + i;
@@ -421,7 +421,7 @@ static void ath11k_pci_ce_irqs_disable(struct ath11k_base *ab)
 {
 	int i;
 
-	for (i = 0; i < CE_COUNT; i++) {
+	for (i = 0; i < ab->hw_params.ce_count; i++) {
 		if (ath11k_ce_get_attr_flags(ab, i) & CE_ATTR_DIS_INTR)
 			continue;
 		ath11k_pci_ce_irq_disable(ab, i);
@@ -433,7 +433,7 @@ static void ath11k_pci_sync_ce_irqs(struct ath11k_base *ab)
 	int i;
 	int irq_idx;
 
-	for (i = 0; i < CE_COUNT; i++) {
+	for (i = 0; i < ab->hw_params.ce_count; i++) {
 		if (ath11k_ce_get_attr_flags(ab, i) & CE_ATTR_DIS_INTR)
 			continue;
 
@@ -477,7 +477,7 @@ static int ath11k_pci_config_irq(struct ath11k_base *ab)
 		return ret;
 
 	/* Configure CE irqs */
-	for (i = 0; i < CE_COUNT; i++) {
+	for (i = 0; i < ab->hw_params.ce_count; i++) {
 		msi_data = (i % msi_data_count) + msi_irq_start;
 		irq = ath11k_pci_get_msi_irq(ab->dev, msi_data);
 		ce_pipe = &ab->ce.ce_pipe[i];
@@ -521,7 +521,7 @@ static void ath11k_pci_ce_irqs_enable(struct ath11k_base *ab)
 {
 	int i;
 
-	for (i = 0; i < CE_COUNT; i++) {
+	for (i = 0; i < ab->hw_params.ce_count; i++) {
 		if (ath11k_ce_get_attr_flags(ab, i) & CE_ATTR_DIS_INTR)
 			continue;
 		ath11k_pci_ce_irq_enable(ab, i);
@@ -680,7 +680,7 @@ static void ath11k_pci_kill_tasklets(struct ath11k_base *ab)
 {
 	int i;
 
-	for (i = 0; i < CE_COUNT; i++) {
+	for (i = 0; i < ab->hw_params.ce_count; i++) {
 		struct ath11k_ce_pipe *ce_pipe = &ab->ce.ce_pipe[i];
 
 		if (ath11k_ce_get_attr_flags(ab, i) & CE_ATTR_DIS_INTR)
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
