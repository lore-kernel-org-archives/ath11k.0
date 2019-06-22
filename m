Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1heTiv-0006g0-7f
 for ath11k@lists.infradead.org; Sat, 22 Jun 2019 00:17:42 +0000
From: Sriram R <srirrama@codeaurora.org>
Subject: [PATCH 2/4] ath11k: modify code styling for boolean function return
 values
Date: Sat, 22 Jun 2019 05:47:19 +0530
Message-Id: <1561162641-4676-2-git-send-email-srirrama@codeaurora.org>
In-Reply-To: <1561162641-4676-1-git-send-email-srirrama@codeaurora.org>
References: <1561162641-4676-1-git-send-email-srirrama@codeaurora.org>
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
Cc: Sriram R <srirrama@codeaurora.org>

Modify code styling for boolean function return values by directly
comparing memcmp() result with 0.

Signed-off-by: Sriram R <srirrama@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/reg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/reg.c b/drivers/net/wireless/ath/ath11k/reg.c
index f181061..1b1dd88 100644
--- a/drivers/net/wireless/ath/ath11k/reg.c
+++ b/drivers/net/wireless/ath/ath11k/reg.c
@@ -38,7 +38,7 @@ static bool ath11k_regdom_changes(struct ath11k *ar, char *alpha2)
 	if (!regd)
 		return true;
 
-	return !!(memcmp(regd->alpha2, alpha2, 2));
+	return memcmp(regd->alpha2, alpha2, 2) != 0;
 }
 
 static void
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
