Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hnxy3-0006LY-8H
 for ath11k@lists.infradead.org; Thu, 18 Jul 2019 04:24:32 +0000
Received: from vasanth-lnx.qca.qualcomm.com
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: vthiagar@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B71A660E42
 for <ath11k@lists.infradead.org>; Thu, 18 Jul 2019 04:24:29 +0000 (UTC)
From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: [PATCH 2/2] ath11k/dp_rx: Fix possible REO ring desc overwrite
Date: Thu, 18 Jul 2019 09:54:15 +0530
Message-Id: <1563423855-32397-2-git-send-email-vthiagar@codeaurora.org>
In-Reply-To: <1563423855-32397-1-git-send-email-vthiagar@codeaurora.org>
References: <1563423855-32397-1-git-send-email-vthiagar@codeaurora.org>
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

When we find there is not desc available in REO ring based
on the cached hp (head pointer), we again try to read the REO
ting with the latest hp that hw might have just updated. In this
case we update the tp (tail pointer) before the corresponding
desc is completely processed by the driver. This would lead to
a scenario where hw will be overwriting the desc which is still
not completely prcoessed. Make sure tp is not updated to hw before
the residing desc is completely processed.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 45 +++++++++++++--------------------
 1 file changed, 17 insertions(+), 28 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 686b140..63b7275 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2104,32 +2104,6 @@ static void ath11k_dp_rx_pre_deliver_amsdu(struct ath11k *ar,
 	}
 }
 
-static u32 *ath11k_dp_rx_get_reo_desc(struct ath11k_base *ab,
-				      struct hal_srng *srng)
-{
-	u32 *rx_desc;
-
-	lockdep_assert_held(&srng->lock);
-
-	rx_desc = ath11k_hal_srng_dst_get_next_entry(ab, srng);
-
-	/* Hw might have updated the head pointer after we cached it.
-	 * In this case, even though there are entries in the ring we'll
-	 * get rx_desc NULL. Give the read another try with updated cached
-	 * head pointer so that we can reap complete MPDU in the current
-	 * rx processing.
-	 */
-	if (!rx_desc) {
-		ath11k_hal_srng_access_begin(ab, srng);
-		rx_desc = ath11k_hal_srng_dst_get_next_entry(ab, srng);
-		if (!rx_desc)
-			return NULL;
-		ath11k_hal_srng_access_end(ab, srng);
-	}
-
-	return rx_desc;
-}
-
 static void ath11k_dp_rx_process_pending_packets(struct ath11k_base *ab,
 						 struct napi_struct *napi,
 						 struct sk_buff_head *pending_q,
@@ -2178,6 +2152,7 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int mac_id,
 	int num_buffs_reaped = 0;
 	int quota = budget;
 	int ret;
+	bool done = false;
 
 	/* Process any pending packets from the previous napi poll.
 	 * Note: All msdu's in this pending_q corresponds to the same mac id
@@ -2201,7 +2176,8 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int mac_id,
 
 	ath11k_hal_srng_access_begin(ab, srng);
 
-	while ((rx_desc = ath11k_dp_rx_get_reo_desc(ab, srng))) {
+try_again:
+	while ((rx_desc = ath11k_hal_srng_dst_get_next_entry(ab, srng))) {
 		memset(&meta_info, 0, sizeof(meta_info));
 		ath11k_hal_rx_parse_dst_ring_desc(ab, rx_desc, &meta_info);
 
@@ -2250,8 +2226,21 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int mac_id,
 		 * and how use of budget instead of remaining quota affects it.
 		 */
 		if (num_buffs_reaped >= quota && rxcb->is_last_msdu &&
-		    !rxcb->is_continuation)
+		    !rxcb->is_continuation) {
+			done = true;
 			break;
+		}
+	}
+
+	/* Hw might have updated the head pointer after we cached it.
+	 * In this case, even though there are entries in the ring we'll
+	 * get rx_desc NULL. Give the read another try with updated cached
+	 * head pointer so that we can reap complete MPDU in the current
+	 * rx processing.
+	 */
+	if (!done && ath11k_hal_srng_dst_num_free(ab, srng, true)) {
+		ath11k_hal_srng_access_end(ab, srng);
+		goto try_again;
 	}
 
 	ath11k_hal_srng_access_end(ab, srng);
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
