Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hw1AA-0000cW-Vm
 for ath11k@lists.infradead.org; Fri, 09 Aug 2019 09:26:20 +0000
Received: from [127.0.1.1] (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: kvalo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E97746074F
 for <ath11k@lists.infradead.org>; Fri,  9 Aug 2019 09:26:17 +0000 (UTC)
Subject: [PATCH 02/15] ath11k: remove unused struct ath11k_ce_sg_item
From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 09 Aug 2019 12:26:15 +0300
Message-ID: <156534277569.30736.11927985442085470666.stgit@x230>
In-Reply-To: <156534276745.30736.11736417077894270794.stgit@x230>
References: <156534276745.30736.11736417077894270794.stgit@x230>
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

No need to have unused structures laying around.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/ce.h |    8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ce.h b/drivers/net/wireless/ath/ath11k/ce.h
index 40926d06463e..b9f8a0b4cd7e 100644
--- a/drivers/net/wireless/ath/ath11k/ce.h
+++ b/drivers/net/wireless/ath/ath11k/ce.h
@@ -164,14 +164,6 @@ struct ath11k_ce {
 	spinlock_t ce_lock;
 };
 
-struct ath11k_ce_sg_item {
-	u16 transfer_id;
-	void *transfer_context; /* NULL = tx completion callback not called */
-	void *vaddr; /* for debugging mostly */
-	u32 paddr;
-	u16 len;
-};
-
 void ath11k_ce_cleanup_pipes(struct ath11k_base *ab);
 void ath11k_ce_rx_replenish_retry(struct timer_list *t);
 void ath11k_ce_per_engine_service(struct ath11k_base *ab, u16 ce_id);


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
