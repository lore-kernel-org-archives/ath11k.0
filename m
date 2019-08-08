Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvi4f-00086A-NZ
 for ath11k@lists.infradead.org; Thu, 08 Aug 2019 13:03:23 +0000
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH 07/15] ath11k: Rename ath11k_base struct from 'sc' to 'ab in
 debug.h
Date: Thu,  8 Aug 2019 18:33:04 +0530
Message-Id: <1565269392-2838-8-git-send-email-mkenna@codeaurora.org>
In-Reply-To: <1565269392-2838-1-git-send-email-mkenna@codeaurora.org>
References: <1565269392-2838-1-git-send-email-mkenna@codeaurora.org>
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
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>

To avoid confusion and better readability, renamed the
ath11k_base struct from 'sc' to 'ab' in debug.h file.

Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/debug.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debug.h b/drivers/net/wireless/ath/ath11k/debug.h
index ce1f414a95e9..fac6cb4aa597 100644
--- a/drivers/net/wireless/ath/ath11k/debug.h
+++ b/drivers/net/wireless/ath/ath11k/debug.h
@@ -100,9 +100,9 @@ enum ath11k_pktlog_enum {
 	ATH11K_PKTLOG_TYPE_LITE_RX      = 24,
 };
 
-__printf(2, 3) void ath11k_info(struct ath11k_base *sc, const char *fmt, ...);
-__printf(2, 3) void ath11k_err(struct ath11k_base *sc, const char *fmt, ...);
-__printf(2, 3) void ath11k_warn(struct ath11k_base *sc, const char *fmt, ...);
+__printf(2, 3) void ath11k_info(struct ath11k_base *ab, const char *fmt, ...);
+__printf(2, 3) void ath11k_err(struct ath11k_base *ab, const char *fmt, ...);
+__printf(2, 3) void ath11k_warn(struct ath11k_base *ab, const char *fmt, ...);
 
 extern unsigned int ath11k_debug_mask;
 
@@ -131,8 +131,8 @@ static inline void ath11k_dbg_dump(struct ath11k_base *ab,
 #endif /* CONFIG_ATH11K_DEBUG */
 
 #ifdef CONFIG_ATH11K_DEBUGFS
-int ath11k_debug_soc_create(struct ath11k_base *sc);
-void ath11k_debug_soc_destroy(struct ath11k_base *sc);
+int ath11k_debug_soc_create(struct ath11k_base *ab);
+void ath11k_debug_soc_destroy(struct ath11k_base *ab);
 int ath11k_debug_register(struct ath11k *ar);
 void ath11k_debug_unregister(struct ath11k *ar);
 void ath11k_dbg_htt_ext_stats_handler(struct ath11k_base *ab,
@@ -168,12 +168,12 @@ static inline int ath11k_debug_is_extd_rx_stats_enabled(struct ath11k *ar)
 	return ar->debug.extd_rx_stats;
 }
 #else
-static inline int ath11k_debug_soc_create(struct ath11k_base *sc)
+static inline int ath11k_debug_soc_create(struct ath11k_base *ab)
 {
 	return 0;
 }
 
-static inline void ath11k_debug_soc_destroy(struct ath11k_base *sc)
+static inline void ath11k_debug_soc_destroy(struct ath11k_base *ab)
 {
 }
 
-- 
2.21.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
