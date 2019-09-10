Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i7aoL-0007xz-Gh
 for ath11k@lists.infradead.org; Tue, 10 Sep 2019 07:43:38 +0000
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH bringup] ath11k: fix Kconfig, replace spaces with tabs
Date: Tue, 10 Sep 2019 13:13:26 +0530
Message-Id: <1568101406-22363-1-git-send-email-akolli@codeaurora.org>
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

Fixes format in kconfig file

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/Kconfig | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/Kconfig b/drivers/net/wireless/ath/ath11k/Kconfig
index 26bf98fa648e..b8d4ed633bc9 100644
--- a/drivers/net/wireless/ath/ath11k/Kconfig
+++ b/drivers/net/wireless/ath/ath11k/Kconfig
@@ -1,20 +1,20 @@
 config ATH11K
-        tristate "Qualcomm Technologies 802.11ax chipset support"
-        depends on MAC80211 && HAS_DMA
+	tristate "Qualcomm Technologies 802.11ax chipset support"
+	depends on MAC80211 && HAS_DMA
 	depends on REMOTEPROC
 	depends on ARCH_QCOM || COMPILE_TEST
 	select ATH_COMMON
 	select QCOM_QMI_HELPERS
-        help
-          This module adds support for Qualcomm Technologies 802.11ax family of
+	---help---
+	  This module adds support for Qualcomm Technologies 802.11ax family of
 	  chipsets.
 
-          If you choose to build a module, it'll be called ath11k.
+	  If you choose to build a module, it'll be called ath11k.
 
 config ATH11K_DEBUG
 	bool "QCA ath11k debugging"
 	depends on ATH11K
-	help
+	---help---
 	  Enables debug support
 
 	  If unsure, say Y to make it easier to debug problems.
@@ -22,7 +22,7 @@ config ATH11K_DEBUG
 config ATH11K_DEBUGFS
 	bool "QCA ath11k debugfs support"
 	depends on ATH11K && DEBUG_FS
-	help
+	---help---
 	  Enable ath11k debugfs support
 
 	  If unsure, say Y to make it easier to debug problems.
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
