Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCzDH-0003Mx-LG
 for ath11k@lists.infradead.org; Wed, 25 Sep 2019 04:47:41 +0000
Received: from vasanth-lnx.qca.qualcomm.com
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: vthiagar@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2CD8D61156
 for <ath11k@lists.infradead.org>; Wed, 25 Sep 2019 04:47:37 +0000 (UTC)
From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: [PATCH bringup 3/3] ath11k: Use struct_size() to get the structure
 size with trailing array
Date: Wed, 25 Sep 2019 10:14:18 +0530
Message-Id: <1569386658-1325-3-git-send-email-vthiagar@codeaurora.org>
In-Reply-To: <1569386658-1325-1-git-send-email-vthiagar@codeaurora.org>
References: <1569386658-1325-1-git-send-email-vthiagar@codeaurora.org>
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

The size calculation of struct ath11k_ce_ring with trailing skb array
got simplified with struct_size() kernel macro.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/ce.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
index 03e7cf0..daeab0f 100644
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -406,8 +406,7 @@ static int ath11k_ce_init_ring(struct ath11k_base *ab,
 	struct ath11k_ce_ring *ce_ring;
 	dma_addr_t base_addr;
 
-	ce_ring = kzalloc(sizeof(*ce_ring) + (nentries * sizeof(*ce_ring->skb)),
-			  GFP_KERNEL);
+	ce_ring = kzalloc(struct_size(ce_ring, skb, nentries), GFP_KERNEL);
 	if (ce_ring == NULL)
 		return ERR_PTR(-ENOMEM);
 
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
