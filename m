Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ii8zY-0005hr-A9
 for ath11k@lists.infradead.org; Fri, 20 Dec 2019 03:30:18 +0000
Received: from cjhuang-station.qca.qualcomm.com (unknown [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: cjhuang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A4150C43383
 for <ath11k@lists.infradead.org>; Fri, 20 Dec 2019 03:30:07 +0000 (UTC)
From: Carl Huang <cjhuang@codeaurora.org>
Subject: [PATCH qca6390-bringup] ath11k: fix idr_alloc_u32 warning
Date: Fri, 20 Dec 2019 11:30:00 +0800
Message-Id: <1576812600-25027-1-git-send-email-cjhuang@codeaurora.org>
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

There is a typo error when calling idr_init and spin_lock_init for
rx_mon_status_refill_ring. It's 'j' not 'i'.

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index 3f35c25..af2a92e 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -839,8 +839,8 @@ int ath11k_dp_pdev_alloc(struct ath11k_base *ab)
 		atomic_set(&dp->num_tx_pending, 0);
 		init_waitqueue_head(&dp->tx_empty_waitq);
 		for (j = 0; j < MAX_MACS_PER_PDEV; j++) {
-			idr_init(&dp->rx_mon_status_refill_ring[i].bufs_idr);
-			spin_lock_init(&dp->rx_mon_status_refill_ring[i].idr_lock);
+			idr_init(&dp->rx_mon_status_refill_ring[j].bufs_idr);
+			spin_lock_init(&dp->rx_mon_status_refill_ring[j].idr_lock);
 		}
 		idr_init(&dp->rxdma_mon_buf_ring.bufs_idr);
 		spin_lock_init(&dp->rxdma_mon_buf_ring.idr_lock);
-- 
2.7.4

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
