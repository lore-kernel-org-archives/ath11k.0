Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVXur-0002PE-SZ
 for ath11k@lists.infradead.org; Fri, 15 Nov 2019 09:29:23 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH v3 02/49] ath11k: add Kconfig
Date: Fri, 15 Nov 2019 11:28:26 +0200
Message-Id: <1573810153-29623-3-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1573810153-29623-1-git-send-email-kvalo@codeaurora.org>
References: <1573810153-29623-1-git-send-email-kvalo@codeaurora.org>
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

(patches split for easier review, see the cover letter for more)

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/Kconfig | 35 +++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/Kconfig b/drivers/net/wireless/ath/ath11k/Kconfig
new file mode 100644
index 000000000000..cfab4fb86aef
--- /dev/null
+++ b/drivers/net/wireless/ath/ath11k/Kconfig
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: BSD-3-Clause-Clear
+config ATH11K
+	tristate "Qualcomm Technologies 802.11ax chipset support"
+	depends on MAC80211 && HAS_DMA
+	depends on REMOTEPROC
+	depends on ARCH_QCOM || COMPILE_TEST
+	select ATH_COMMON
+	select QCOM_QMI_HELPERS
+	---help---
+	  This module adds support for Qualcomm Technologies 802.11ax family of
+	  chipsets.
+
+	  If you choose to build a module, it'll be called ath11k.
+
+config ATH11K_DEBUG
+	bool "QCA ath11k debugging"
+	depends on ATH11K
+	---help---
+	  Enables debug support
+
+	  If unsure, say Y to make it easier to debug problems.
+
+config ATH11K_DEBUGFS
+	bool "QCA ath11k debugfs support"
+	depends on ATH11K && DEBUG_FS
+	---help---
+	  Enable ath11k debugfs support
+
+	  If unsure, say Y to make it easier to debug problems.
+
+config ATH11K_TRACING
+	bool "ath11k tracing support"
+	depends on ATH11K && EVENT_TRACING
+	---help---
+	  Select this to use ath11k tracing infrastructure.


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
