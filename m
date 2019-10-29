Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPLJp-00047F-QC
 for ath11k@lists.infradead.org; Tue, 29 Oct 2019 06:49:32 +0000
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH] ath11k: tracing: fix ath11k tracing
Date: Tue, 29 Oct 2019 12:19:15 +0530
Message-Id: <1572331755-22072-1-git-send-email-akolli@codeaurora.org>
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

Add missing tracing subsystem define.

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/trace.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/trace.h b/drivers/net/wireless/ath/ath11k/trace.h
index aa96c4e7a0d5..a50e35a79edb 100644
--- a/drivers/net/wireless/ath/ath11k/trace.h
+++ b/drivers/net/wireless/ath/ath11k/trace.h
@@ -17,6 +17,9 @@
 static inline void trace_ ## name(proto) {}
 #endif /* !CONFIG_ATH11K_TRACING || __CHECKER__ */
 
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM ath11k
+
 TRACE_EVENT(ath11k_htt_pktlog,
 	    TP_PROTO(struct ath11k *ar, const void *buf, u16 buf_len),
 
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
