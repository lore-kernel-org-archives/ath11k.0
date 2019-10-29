Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPJ5T-0004uq-3m
 for ath11k@lists.infradead.org; Tue, 29 Oct 2019 04:26:32 +0000
Received: from CHECSTEX0180100-LIN.qca.qualcomm.com
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: vthiagar@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id EA77460B6E
 for <ath11k@lists.infradead.org>; Tue, 29 Oct 2019 04:26:26 +0000 (UTC)
From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: [PATCH] ath11k: Fix target crash due to WBM_IDLE_LINK ring desc
 shortage
Date: Tue, 29 Oct 2019 09:56:02 +0530
Message-Id: <1572323162-13410-1-git-send-email-vthiagar@codeaurora.org>
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

Make sure the number of WBM_IDLE_LINK ring descriptors is power
of 2. This increases the number of descriptors to 32k from the
current ~18k to fix the target assert because of the shortage in
the descriptors in WBM_IDLE_LINK ring. Remove unnecessary
power of 2 calculation in ath11k_dp_link_desc_setup() as it is
not required after this change.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index ff510e8..72c21cf 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -478,6 +478,9 @@ static int ath11k_wbm_idle_ring_setup(struct ath11k_base *ab, u32 *n_link_desc)
 	*n_link_desc = n_mpdu_link_desc + n_mpdu_queue_desc +
 		      n_tx_msdu_link_desc + n_rx_msdu_link_desc;
 
+	if (*n_link_desc & (*n_link_desc - 1))
+		*n_link_desc = 1 << fls(*n_link_desc);
+
 	ret = ath11k_dp_srng_setup(ab, &dp->wbm_idle_ring,
 				   HAL_WBM_IDLE_LINK, 0, 0, *n_link_desc);
 	if (ret) {
@@ -499,9 +502,6 @@ int ath11k_dp_link_desc_setup(struct ath11k_base *ab,
 	u32 *desc;
 	int i, ret;
 
-	if (n_link_desc & (n_link_desc - 1))
-		n_link_desc = 1 << fls(n_link_desc);
-
 	tot_mem_sz = n_link_desc * HAL_LINK_DESC_SIZE;
 	tot_mem_sz += HAL_LINK_DESC_ALIGN;
 
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
