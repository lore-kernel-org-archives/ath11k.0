Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMWfk-0000y1-Kv
 for ath11k@lists.infradead.org; Sun, 27 Sep 2020 13:25:01 +0000
Received: by mail-wm1-x342.google.com with SMTP id a9so3918021wmm.2
 for <ath11k@lists.infradead.org>; Sun, 27 Sep 2020 06:25:00 -0700 (PDT)
From: Alex Dewar <alex.dewar90@gmail.com>
Subject: [PATCH] ath11k: Correctly check errors for calls to
 debugfs_create_dir()
Date: Sun, 27 Sep 2020 14:24:50 +0100
Message-Id: <20200927132451.585473-1-alex.dewar90@gmail.com>
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
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Alex Dewar <alex.dewar90@gmail.com>, Jakub Kicinski <kuba@kernel.org>, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

debugfs_create_dir() returns an ERR_PTR in case of error, but never a
null pointer. There are a number of places where error-checking code can
accordingly be simplified.

Addresses-Coverity: CID 1497150: Memory - illegal accesses (USE_AFTER_FREE)
Addresses-Coverity: CID 1497158: Memory - illegal accesses (USE_AFTER_FREE)
Addresses-Coverity: CID 1497160: Memory - illegal accesses (USE_AFTER_FREE)
Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
---
 drivers/net/wireless/ath/ath11k/debugfs.c | 25 +++++------------------
 1 file changed, 5 insertions(+), 20 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
index 5193b308a992..826dc8ba188f 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs.c
@@ -837,12 +837,8 @@ int ath11k_debugfs_pdev_create(struct ath11k_base *ab)
 		return 0;
 
 	ab->debugfs_soc = debugfs_create_dir(ab->hw_params.name, ab->debugfs_ath11k);
-
-	if (IS_ERR_OR_NULL(ab->debugfs_soc)) {
-		if (IS_ERR(ab->debugfs_soc))
-			return PTR_ERR(ab->debugfs_soc);
-		return -ENOMEM;
-	}
+	if (IS_ERR(ab->debugfs_soc))
+		return PTR_ERR(ab->debugfs_soc);
 
 	debugfs_create_file("simulate_fw_crash", 0600, ab->debugfs_soc, ab,
 			    &fops_simulate_fw_crash);
@@ -863,13 +859,7 @@ int ath11k_debugfs_soc_create(struct ath11k_base *ab)
 {
 	ab->debugfs_ath11k = debugfs_create_dir("ath11k", NULL);
 
-	if (IS_ERR_OR_NULL(ab->debugfs_ath11k)) {
-		if (IS_ERR(ab->debugfs_ath11k))
-			return PTR_ERR(ab->debugfs_ath11k);
-		return -ENOMEM;
-	}
-
-	return 0;
+	return PTR_ERR_OR_ZERO(ab->debugfs_ath11k);
 }
 
 void ath11k_debugfs_soc_destroy(struct ath11k_base *ab)
@@ -1069,13 +1059,8 @@ int ath11k_debugfs_register(struct ath11k *ar)
 	snprintf(pdev_name, sizeof(pdev_name), "%s%d", "mac", ar->pdev_idx);
 
 	ar->debug.debugfs_pdev = debugfs_create_dir(pdev_name, ab->debugfs_soc);
-
-	if (IS_ERR_OR_NULL(ar->debug.debugfs_pdev)) {
-		if (IS_ERR(ar->debug.debugfs_pdev))
-			return PTR_ERR(ar->debug.debugfs_pdev);
-
-		return -ENOMEM;
-	}
+	if (IS_ERR(ar->debug.debugfs_pdev))
+		return PTR_ERR(ar->debug.debugfs_pdev);
 
 	/* Create a symlink under ieee80211/phy* */
 	snprintf(buf, 100, "../../ath11k/%pd2", ar->debug.debugfs_pdev);
-- 
2.28.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
