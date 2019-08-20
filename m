Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i06My-0001Bj-Dz
 for ath11k@lists.infradead.org; Tue, 20 Aug 2019 15:48:25 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 02/49] ath11k: add Kconfig
Date: Tue, 20 Aug 2019 18:47:28 +0300
Message-Id: <1566316095-27507-3-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org>
References: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org>
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
To: linux-wireless@vger.kernel.org
Cc: devicetree@vger.kernel.org, ath11k@lists.infradead.org

---
 drivers/net/wireless/ath/ath11k/Kconfig | 34 +++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/Kconfig b/drivers/net/wireless/ath/ath11k/Kconfig
new file mode 100644
index 000000000000..26bf98fa648e
--- /dev/null
+++ b/drivers/net/wireless/ath/ath11k/Kconfig
@@ -0,0 +1,34 @@
+config ATH11K
+        tristate "Qualcomm Technologies 802.11ax chipset support"
+        depends on MAC80211 && HAS_DMA
+	depends on REMOTEPROC
+	depends on ARCH_QCOM || COMPILE_TEST
+	select ATH_COMMON
+	select QCOM_QMI_HELPERS
+        help
+          This module adds support for Qualcomm Technologies 802.11ax family of
+	  chipsets.
+
+          If you choose to build a module, it'll be called ath11k.
+
+config ATH11K_DEBUG
+	bool "QCA ath11k debugging"
+	depends on ATH11K
+	help
+	  Enables debug support
+
+	  If unsure, say Y to make it easier to debug problems.
+
+config ATH11K_DEBUGFS
+	bool "QCA ath11k debugfs support"
+	depends on ATH11K && DEBUG_FS
+	help
+	  Enable ath11k debugfs support
+
+	  If unsure, say Y to make it easier to debug problems.
+
+config ATH11K_TRACING
+	bool "ath11k tracing support"
+	depends on ATH11K && EVENT_TRACING
+	---help---
+	  Select this to ath11k use tracing infrastructure.


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
