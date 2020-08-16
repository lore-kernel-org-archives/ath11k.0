Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7GfE-0004mt-89
 for ath11k@lists.infradead.org; Sun, 16 Aug 2020 11:17:29 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH v2 04/12] ath11k: ce: remove host_ce_config_wlan macro
Date: Sun, 16 Aug 2020 14:16:31 +0300
Message-Id: <1597576599-8857-5-git-send-email-kvalo@codeaurora.org>
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
for readibility to access ab->hw_params.host_ce_config directly.

This is done in a separate patch to keep the patches simple. No functional changes.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/ce.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
index a588e5d0e5e0..c75007e92830 100644
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -7,8 +7,6 @@
 #include "debug.h"
 #include "hif.h"
 
-#define host_ce_config_wlan ab->hw_params.host_ce_config
-
 const struct ce_attr ath11k_host_ce_config_ipq8074[] = {
 	/* CE0: host->target HTC control and raw streams */
 	{
@@ -471,19 +469,19 @@ static int ath11k_ce_init_ring(struct ath11k_base *ab,
 
 	switch (type) {
 	case HAL_CE_SRC:
-		if (!(CE_ATTR_DIS_INTR & host_ce_config_wlan[ce_id].flags))
+		if (!(CE_ATTR_DIS_INTR & ab->hw_params.host_ce_config[ce_id].flags))
 			params.intr_batch_cntr_thres_entries = 1;
 		break;
 	case HAL_CE_DST:
-		params.max_buffer_len = host_ce_config_wlan[ce_id].src_sz_max;
-		if (!(host_ce_config_wlan[ce_id].flags & CE_ATTR_DIS_INTR)) {
+		params.max_buffer_len = ab->hw_params.host_ce_config[ce_id].src_sz_max;
+		if (!(ab->hw_params.host_ce_config[ce_id].flags & CE_ATTR_DIS_INTR)) {
 			params.intr_timer_thres_us = 1024;
 			params.flags |= HAL_SRNG_FLAGS_LOW_THRESH_INTR_EN;
 			params.low_threshold = ce_ring->nentries - 3;
 		}
 		break;
 	case HAL_CE_DST_STATUS:
-		if (!(host_ce_config_wlan[ce_id].flags & CE_ATTR_DIS_INTR)) {
+		if (!(ab->hw_params.host_ce_config[ce_id].flags & CE_ATTR_DIS_INTR)) {
 			params.intr_batch_cntr_thres_entries = 1;
 			params.intr_timer_thres_us = 0x1000;
 		}
@@ -502,7 +500,7 @@ static int ath11k_ce_init_ring(struct ath11k_base *ab,
 		return ret;
 	}
 
-	if (!(CE_ATTR_DIS_INTR & host_ce_config_wlan[ce_id].flags))
+	if (!(CE_ATTR_DIS_INTR & ab->hw_params.host_ce_config[ce_id].flags))
 		ath11k_ce_srng_msi_ring_params_setup(ab, ce_id, &params);
 
 	ce_ring->hal_ring_id = ret;
@@ -550,7 +548,7 @@ ath11k_ce_alloc_ring(struct ath11k_base *ab, int nentries, int desc_sz)
 static int ath11k_ce_alloc_pipe(struct ath11k_base *ab, int ce_id)
 {
 	struct ath11k_ce_pipe *pipe = &ab->ce.ce_pipe[ce_id];
-	const struct ce_attr *attr = &host_ce_config_wlan[ce_id];
+	const struct ce_attr *attr = &ab->hw_params.host_ce_config[ce_id];
 	struct ath11k_ce_ring *ring;
 	int nentries;
 	int desc_sz;
@@ -877,7 +875,7 @@ int ath11k_ce_alloc_pipes(struct ath11k_base *ab)
 	spin_lock_init(&ab->ce.ce_lock);
 
 	for (i = 0; i < CE_COUNT; i++) {
-		attr = &host_ce_config_wlan[i];
+		attr = &ab->hw_params.host_ce_config[i];
 		pipe = &ab->ce.ce_pipe[i];
 		pipe->pipe_num = i;
 		pipe->ab = ab;
@@ -919,6 +917,6 @@ int ath11k_ce_get_attr_flags(struct ath11k_base *ab, int ce_id)
 	if (ce_id >= CE_COUNT)
 		return -EINVAL;
 
-	return host_ce_config_wlan[ce_id].flags;
+	return ab->hw_params.host_ce_config[ce_id].flags;
 }
 EXPORT_SYMBOL(ath11k_ce_get_attr_flags);
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
