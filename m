Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1heTj0-0006hh-Iz
 for ath11k@lists.infradead.org; Sat, 22 Jun 2019 00:17:47 +0000
From: Sriram R <srirrama@codeaurora.org>
Subject: [PATCH 4/4] ath11k: Remove stray character in reg notifier debug log
Date: Sat, 22 Jun 2019 05:47:21 +0530
Message-Id: <1561162641-4676-4-git-send-email-srirrama@codeaurora.org>
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

Remove stray character 'n' used in debug message of
ath11k_reg_notifier()

Signed-off-by: Sriram R <srirrama@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/reg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/reg.c b/drivers/net/wireless/ath/ath11k/reg.c
index da8c6c2..f72b81f 100644
--- a/drivers/net/wireless/ath/ath11k/reg.c
+++ b/drivers/net/wireless/ath/ath11k/reg.c
@@ -50,7 +50,7 @@ ath11k_reg_notifier(struct wiphy *wiphy, struct regulatory_request *request)
 	int ret;
 
 	ath11k_dbg(ar->ab, ATH11K_DBG_REG,
-		   "Regulatory Notification received for %s n", wiphy_name(wiphy));
+		   "Regulatory Notification received for %s\n", wiphy_name(wiphy));
 
 	/* Currently supporting only General User Hints. Cell base user
 	 * hints to be handled later.
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
