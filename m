Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVUyK-0007B2-5f
 for ath11k@lists.infradead.org; Tue, 28 May 2019 05:48:29 +0000
Received: from vasanth-lnx.qca.qualcomm.com
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: vthiagar@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D6A53606FC
 for <ath11k@lists.infradead.org>; Tue, 28 May 2019 05:48:26 +0000 (UTC)
From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: [PATCH 3/4] ath11k: Fix bug in accessing rcu protected wiphy->regd
Date: Tue, 28 May 2019 11:18:05 +0530
Message-Id: <1559022486-7073-3-git-send-email-vthiagar@codeaurora.org>
In-Reply-To: <1559022486-7073-1-git-send-email-vthiagar@codeaurora.org>
References: <1559022486-7073-1-git-send-email-vthiagar@codeaurora.org>
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

Access wiphy->regd through rcu dereference API. This also
fixes below sparse warning

drivers/net/wireless/ath/ath11k/reg.c:38:39: warning: incorrect type in argument 1 (different address spaces)
drivers/net/wireless/ath/ath11k/reg.c:38:39:    expected void const *
drivers/net/wireless/ath/ath11k/reg.c:38:39:    got char const [noderef] <asn:4> *

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/reg.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/reg.c b/drivers/net/wireless/ath/ath11k/reg.c
index 1fef688..ad87e9d 100644
--- a/drivers/net/wireless/ath/ath11k/reg.c
+++ b/drivers/net/wireless/ath/ath11k/reg.c
@@ -28,14 +28,17 @@
 
 static bool ath11k_regdom_changes(struct ath11k *ar, char *alpha2)
 {
+	const struct ieee80211_regdomain *regd;
+
+	regd = rcu_dereference_rtnl(ar->hw->wiphy->regd);
 	/* This can happen during wiphy registration where the previous
 	 * user request is received before we update the regd received
 	 * from firmware.
 	 */
-	if (!ar->hw->wiphy->regd)
+	if (!regd)
 		return true;
 
-	return !!(memcmp(ar->hw->wiphy->regd->alpha2, alpha2, 2));
+	return !!(memcmp(regd->alpha2, alpha2, 2));
 }
 
 static void
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
