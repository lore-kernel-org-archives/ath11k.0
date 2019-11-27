Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-187.smtp-out.us-west-2.amazonses.com ([54.240.27.187])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZxzs-0002Il-0e
 for ath11k@lists.infradead.org; Wed, 27 Nov 2019 14:08:49 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 01/10] ath11k: tracing: fix ath11k tracing
Date: Wed, 27 Nov 2019 14:08:46 +0000
Message-ID: <0101016ead3164c9-45d9089b-1871-40df-b8c4-7be2478b4455-000000@us-west-2.amazonses.com>
In-Reply-To: <1574863720-25728-1-git-send-email-kvalo@codeaurora.org>
References: <1574863720-25728-1-git-send-email-kvalo@codeaurora.org>
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
Cc: ath11k@lists.infradead.org

From: Anilkumar Kolli <akolli@codeaurora.org>

Add missing tracing subsystem define.

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/trace.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/trace.h b/drivers/net/wireless/ath/ath11k/trace.h
index 400f759568e1..8700a622be7b 100644
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
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
