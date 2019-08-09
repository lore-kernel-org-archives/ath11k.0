Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hw1Aa-0000gT-V7
 for ath11k@lists.infradead.org; Fri, 09 Aug 2019 09:26:46 +0000
Received: from [127.0.1.1] (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: kvalo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id ACF8B60208
 for <ath11k@lists.infradead.org>; Fri,  9 Aug 2019 09:26:42 +0000 (UTC)
Subject: [PATCH 05/15] ath11k: move ath11k_mac_destroy() after _create()
From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 09 Aug 2019 12:26:40 +0300
Message-ID: <156534280030.30736.16743205044370344895.stgit@x230>
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

Just for symmetry.

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c |   34 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index c40b71e6aa92..dc9f5f98f880 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -5301,23 +5301,6 @@ static int ath11k_mac_register(struct ath11k *ar)
 	return ret;
 }
 
-void ath11k_mac_destroy(struct ath11k_base *ab)
-{
-	struct ath11k *ar;
-	struct ath11k_pdev *pdev;
-	int i;
-
-	for (i = 0; i < ab->num_radios; i++) {
-		pdev = &ab->pdevs[i];
-		ar = pdev->ar;
-		if (!ar)
-			continue;
-
-		ieee80211_free_hw(ar->hw);
-		pdev->ar = NULL;
-	}
-}
-
 void ath11k_mac_unregister(struct ath11k_base *ab)
 {
 	struct ath11k *ar;
@@ -5429,3 +5412,20 @@ int ath11k_mac_create(struct ath11k_base *ab)
 
 	return ret;
 }
+
+void ath11k_mac_destroy(struct ath11k_base *ab)
+{
+	struct ath11k *ar;
+	struct ath11k_pdev *pdev;
+	int i;
+
+	for (i = 0; i < ab->num_radios; i++) {
+		pdev = &ab->pdevs[i];
+		ar = pdev->ar;
+		if (!ar)
+			continue;
+
+		ieee80211_free_hw(ar->hw);
+		pdev->ar = NULL;
+	}
+}


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
