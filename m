Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]
 helo=alexa-out-blr.qualcomm.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdBjE-0002Q5-1C
 for ath11k@lists.infradead.org; Tue, 18 Jun 2019 10:52:41 +0000
From: Venkateswara Naralasetty <vnaralas@codeaurora.org>
Subject: [PATCH] ath11k: add wrapper function to ath11k_dbg
Date: Tue, 18 Jun 2019 16:22:32 +0530
Message-Id: <1560855152-2609-1-git-send-email-vnaralas@codeaurora.org>
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
Cc: Venkateswara Naralasetty <vnaralas@codeaurora.org>

This patch define a macro for ath11k_dbg() which improves
the Rx performance by avoid calling ath11k_dbg() from
ath11k_dp_rx_deliver_msdu() when no dbg_mask set.

Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>
---
v2:
 * corrected one style issue

 drivers/net/wireless/ath/ath11k/debug.c |  6 +++---
 drivers/net/wireless/ath/ath11k/debug.h | 18 ++++++++++++------
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debug.c b/drivers/net/wireless/ath/ath11k/debug.c
index 69a2340..6e16c29 100644
--- a/drivers/net/wireless/ath/ath11k/debug.c
+++ b/drivers/net/wireless/ath/ath11k/debug.c
@@ -53,8 +53,8 @@ void ath11k_warn(struct ath11k_base *sc, const char *fmt, ...)
 }
 
 #ifdef CONFIG_ATH11K_DEBUG
-void ath11k_dbg(struct ath11k_base *ab, enum ath11k_debug_mask mask,
-		const char *fmt, ...)
+void __ath11k_dbg(struct ath11k_base *ab, enum ath11k_debug_mask mask,
+		  const char *fmt, ...)
 {
 	struct va_format vaf;
 	va_list args;
@@ -83,7 +83,7 @@ void ath11k_dbg_dump(struct ath11k_base *ab,
 
 	if (ath11k_debug_mask & mask) {
 		if (msg)
-			ath11k_dbg(ab, mask, "%s\n", msg);
+			__ath11k_dbg(ab, mask, "%s\n", msg);
 
 		for (ptr = buf; (ptr - buf) < len; ptr += 16) {
 			linebuflen = 0;
diff --git a/drivers/net/wireless/ath/ath11k/debug.h b/drivers/net/wireless/ath/ath11k/debug.h
index 5774f53..ebc807e 100644
--- a/drivers/net/wireless/ath/ath11k/debug.h
+++ b/drivers/net/wireless/ath/ath11k/debug.h
@@ -106,17 +106,17 @@ __printf(2, 3) void ath11k_warn(struct ath11k_base *sc, const char *fmt, ...);
 extern unsigned int ath11k_debug_mask;
 
 #ifdef CONFIG_ATH11K_DEBUG
-__printf(3, 4) void ath11k_dbg(struct ath11k_base *ab,
-			       enum ath11k_debug_mask mask,
-			       const char *fmt, ...);
+__printf(3, 4) void __ath11k_dbg(struct ath11k_base *ab,
+				 enum ath11k_debug_mask mask,
+				 const char *fmt, ...);
 void ath11k_dbg_dump(struct ath11k_base *ab,
 		     enum ath11k_debug_mask mask,
 		     const char *msg, const char *prefix,
 		     const void *buf, size_t len);
 #else /* CONFIG_ATH11K_DEBUG */
-static inline int ath11k_dbg(struct ath11k_base *ab,
-			     enum ath11k_debug_mask dbg_mask,
-			     const char *fmt, ...)
+static inline int __ath11k_dbg(struct ath11k_base *ab,
+			       enum ath11k_debug_mask dbg_mask,
+			       const char *fmt, ...)
 {
 	return 0;
 }
@@ -272,4 +272,10 @@ static inline void ath11k_sta_update_rx_duration(struct ath11k *ar,
 
 #endif /* CONFIG_MAC80211_DEBUGFS*/
 
+#define ath11k_dbg(ar, dbg_mask, fmt, ...)			\
+do {								\
+	if (ath11k_debug_mask & dbg_mask)			\
+		__ath11k_dbg(ar, dbg_mask, fmt, ##__VA_ARGS__);	\
+} while (0)
+
 #endif /* _ATH11K_DEBUG_H_ */
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
