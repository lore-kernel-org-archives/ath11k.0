Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCzCz-0003Fa-Dg
 for ath11k@lists.infradead.org; Wed, 25 Sep 2019 04:47:22 +0000
Received: from vasanth-lnx.qca.qualcomm.com
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: vthiagar@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E997D602E1
 for <ath11k@lists.infradead.org>; Wed, 25 Sep 2019 04:47:19 +0000 (UTC)
From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: [PATCH bringup 3/5] ath11k: Move ath11k_ahb_read32() and
 ath11k_ahb_write32() to ahb.h
Date: Wed, 25 Sep 2019 10:13:57 +0530
Message-Id: <1569386639-1242-3-git-send-email-vthiagar@codeaurora.org>
In-Reply-To: <1569386639-1242-1-git-send-email-vthiagar@codeaurora.org>
References: <1569386639-1242-1-git-send-email-vthiagar@codeaurora.org>
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

And define them as static inline.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 10 ----------
 drivers/net/wireless/ath/ath11k/ahb.h | 12 ++++++++++--
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index a5e6956..0f26979 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -434,16 +434,6 @@ enum ext_irq_num {
 	tcl2host_status_ring,
 };
 
-inline u32 ath11k_ahb_read32(struct ath11k_base *ab, u32 offset)
-{
-	return ioread32(ab->mem + offset);
-}
-
-inline void ath11k_ahb_write32(struct ath11k_base *ab, u32 offset, u32 value)
-{
-	iowrite32(value, ab->mem + offset);
-}
-
 static void ath11k_ahb_kill_tasklets(struct ath11k_base *ab)
 {
 	int i;
diff --git a/drivers/net/wireless/ath/ath11k/ahb.h b/drivers/net/wireless/ath/ath11k/ahb.h
index 8a6b308..4646f1b 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.h
+++ b/drivers/net/wireless/ath/ath11k/ahb.h
@@ -10,8 +10,16 @@
 #define ATH11K_AHB_RECOVERY_TIMEOUT (3 * HZ)
 struct ath11k_base;
 
-u32 ath11k_ahb_read32(struct ath11k_base *ab, u32 address);
-void ath11k_ahb_write32(struct ath11k_base *ab, u32 address, u32 data);
+static inline u32 ath11k_ahb_read32(struct ath11k_base *ab, u32 offset)
+{
+	return ioread32(ab->mem + offset);
+}
+
+static inline void ath11k_ahb_write32(struct ath11k_base *ab, u32 offset, u32 value)
+{
+	iowrite32(value, ab->mem + offset);
+}
+
 void ath11k_ahb_ext_irq_enable(struct ath11k_base *ab);
 void ath11k_ahb_ext_irq_disable(struct ath11k_base *ab);
 int ath11k_ahb_start(struct ath11k_base *ab);
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
