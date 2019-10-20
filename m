Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iM84N-000078-Ko
 for ath11k@lists.infradead.org; Sun, 20 Oct 2019 10:04:17 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH v2 03/49] ath11k: add Makefile
Date: Sun, 20 Oct 2019 13:03:21 +0300
Message-Id: <1571565847-10338-4-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1571565847-10338-1-git-send-email-kvalo@codeaurora.org>
References: <1571565847-10338-1-git-send-email-kvalo@codeaurora.org>
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
 drivers/net/wireless/ath/ath11k/Makefile | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/Makefile b/drivers/net/wireless/ath/ath11k/Makefile
new file mode 100644
index 000000000000..a91d75c1cfeb
--- /dev/null
+++ b/drivers/net/wireless/ath/ath11k/Makefile
@@ -0,0 +1,26 @@
+# SPDX-License-Identifier: BSD-3-Clause-Clear
+obj-$(CONFIG_ATH11K) += ath11k.o
+ath11k-y += core.o \
+	    hal.o \
+	    hal_tx.o \
+	    hal_rx.o \
+	    ahb.o \
+	    wmi.o \
+	    mac.o \
+	    reg.o \
+	    htc.o \
+	    qmi.o \
+	    dp.o  \
+	    dp_tx.o \
+	    dp_rx.o \
+	    debug.o \
+	    ce.o \
+	    peer.o
+
+ath11k-$(CONFIG_ATH11K_DEBUGFS) += debug_htt_stats.o
+ath11k-$(CONFIG_MAC80211_DEBUGFS) += debugfs_sta.o
+ath11k-$(CONFIG_NL80211_TESTMODE) += testmode.o
+ath11k-$(CONFIG_ATH11K_TRACING) += trace.o
+
+# for tracing framework to find trace.h
+CFLAGS_trace.o := -I$(src)


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
