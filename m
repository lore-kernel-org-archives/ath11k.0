Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvi4e-00085D-8O
 for ath11k@lists.infradead.org; Thu, 08 Aug 2019 13:03:22 +0000
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH 06/15] ath11k: Rename ath11k_base struct from 'sc' to 'ab in
 debug.c
Date: Thu,  8 Aug 2019 18:33:03 +0530
Message-Id: <1565269392-2838-7-git-send-email-mkenna@codeaurora.org>
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
ath11k_base struct from 'sc' to 'ab' in debug.c file.

Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/debug.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debug.c b/drivers/net/wireless/ath/ath11k/debug.c
index 4fd99417585c..e62a409185f4 100644
--- a/drivers/net/wireless/ath/ath11k/debug.c
+++ b/drivers/net/wireless/ath/ath11k/debug.c
@@ -12,7 +12,7 @@
 #include "debug_htt_stats.h"
 #include "peer.h"
 
-void ath11k_info(struct ath11k_base *sc, const char *fmt, ...)
+void ath11k_info(struct ath11k_base *ab, const char *fmt, ...)
 {
 	struct va_format vaf = {
 		.fmt = fmt,
@@ -21,12 +21,12 @@ void ath11k_info(struct ath11k_base *sc, const char *fmt, ...)
 
 	va_start(args, fmt);
 	vaf.va = &args;
-	dev_info(sc->dev, "%pV", &vaf);
+	dev_info(ab->dev, "%pV", &vaf);
 	/* TODO: Trace the log */
 	va_end(args);
 }
 
-void ath11k_err(struct ath11k_base *sc, const char *fmt, ...)
+void ath11k_err(struct ath11k_base *ab, const char *fmt, ...)
 {
 	struct va_format vaf = {
 		.fmt = fmt,
@@ -35,12 +35,12 @@ void ath11k_err(struct ath11k_base *sc, const char *fmt, ...)
 
 	va_start(args, fmt);
 	vaf.va = &args;
-	dev_err(sc->dev, "%pV", &vaf);
+	dev_err(ab->dev, "%pV", &vaf);
 	/* TODO: Trace the log */
 	va_end(args);
 }
 
-void ath11k_warn(struct ath11k_base *sc, const char *fmt, ...)
+void ath11k_warn(struct ath11k_base *ab, const char *fmt, ...)
 {
 	struct va_format vaf = {
 		.fmt = fmt,
@@ -49,7 +49,7 @@ void ath11k_warn(struct ath11k_base *sc, const char *fmt, ...)
 
 	va_start(args, fmt);
 	vaf.va = &args;
-	dev_warn_ratelimited(sc->dev, "%pV", &vaf);
+	dev_warn_ratelimited(ab->dev, "%pV", &vaf);
 	/* TODO: Trace the log */
 	va_end(args);
 }
-- 
2.21.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
