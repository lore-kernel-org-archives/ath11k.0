Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from aserp2120.oracle.com ([141.146.126.78])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifiYe-00087i-8f
 for ath11k@lists.infradead.org; Fri, 13 Dec 2019 10:52:29 +0000
Date: Fri, 13 Dec 2019 13:52:19 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] ath11k: remove an unneeded NULL check
Message-ID: <20191213105219.qbpng7eut5zgty2p@kili.mountain>
MIME-Version: 1.0
Content-Disposition: inline
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

The list iterator is always non-NULL so it doesn't need to be checked.
I also removed the unnecessary initializer because the list iterator is
always initialized.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 1b3b65c0038c..3a3dc7680622 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1225,12 +1225,12 @@ static
 struct htt_ppdu_stats_info *ath11k_dp_htt_get_ppdu_desc(struct ath11k *ar,
 							u32 ppdu_id)
 {
-	struct htt_ppdu_stats_info *ppdu_info = NULL;
+	struct htt_ppdu_stats_info *ppdu_info;
 
 	spin_lock_bh(&ar->data_lock);
 	if (!list_empty(&ar->ppdu_stats_info)) {
 		list_for_each_entry(ppdu_info, &ar->ppdu_stats_info, list) {
-			if (ppdu_info && ppdu_info->ppdu_id == ppdu_id) {
+			if (ppdu_info->ppdu_id == ppdu_id) {
 				spin_unlock_bh(&ar->data_lock);
 				return ppdu_info;
 			}
-- 
2.11.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
