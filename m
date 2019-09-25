Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCzD0-0003Fx-LB
 for ath11k@lists.infradead.org; Wed, 25 Sep 2019 04:47:24 +0000
Received: from vasanth-lnx.qca.qualcomm.com
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: vthiagar@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6C28E6016D
 for <ath11k@lists.infradead.org>; Wed, 25 Sep 2019 04:47:21 +0000 (UTC)
From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: [PATCH bringup 4/5] ath11k: Avoid code duplication in set/clear of a
 register bit values
Date: Wed, 25 Sep 2019 10:13:58 +0530
Message-Id: <1569386639-1242-4-git-send-email-vthiagar@codeaurora.org>
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

Define helpers to set/clear a particular bit in a register.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 52 +++++++++++++++++------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 0f26979..29157fb 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -482,49 +482,49 @@ static void ath11k_ahb_ext_grp_enable(struct ath11k_ext_irq_grp *irq_grp)
 		enable_irq(irq_grp->ab->irq_num[irq_grp->irqs[i]]);
 }
 
+static void ath11k_ahb_setbit32(struct ath11k_base *ab, u8 bit, u32 offset)
+{
+	u32 val;
+
+	val = ath11k_ahb_read32(ab, offset);
+	ath11k_ahb_write32(ab, offset, val | BIT(bit));
+}
+
+static void ath11k_ahb_clearbit32(struct ath11k_base *ab, u8 bit, u32 offset)
+{
+	u32 val;
+
+	val = ath11k_ahb_read32(ab, offset);
+	ath11k_ahb_write32(ab, offset, val & ~BIT(bit));
+}
+
 static void ath11k_ahb_ce_irq_enable(struct ath11k_base *ab, u16 ce_id)
 {
 	const struct ce_pipe_config *ce_config;
-	u32 val;
 
 	ce_config = &target_ce_config_wlan[ce_id];
-	if (__le32_to_cpu(ce_config->pipedir) & PIPEDIR_OUT) {
-		val = ath11k_ahb_read32(ab, CE_HOST_IE_ADDRESS);
-		val |= BIT(ce_id);
-		ath11k_ahb_write32(ab, CE_HOST_IE_ADDRESS, val);
-	}
+	if (__le32_to_cpu(ce_config->pipedir) & PIPEDIR_OUT)
+		ath11k_ahb_setbit32(ab, ce_id, CE_HOST_IE_ADDRESS);
 
 	if (__le32_to_cpu(ce_config->pipedir) & PIPEDIR_IN) {
-		val = ath11k_ahb_read32(ab, CE_HOST_IE_2_ADDRESS);
-		val |= BIT(ce_id);
-		ath11k_ahb_write32(ab, CE_HOST_IE_2_ADDRESS, val);
-
-		val = ath11k_ahb_read32(ab, CE_HOST_IE_3_ADDRESS);
-		val |= BIT(ce_id + CE_HOST_IE_3_SHIFT);
-		ath11k_ahb_write32(ab, CE_HOST_IE_3_ADDRESS, val);
+		ath11k_ahb_setbit32(ab, ce_id, CE_HOST_IE_2_ADDRESS);
+		ath11k_ahb_setbit32(ab, ce_id + CE_HOST_IE_3_SHIFT,
+				    CE_HOST_IE_3_ADDRESS);
 	}
 }
 
 static void ath11k_ahb_ce_irq_disable(struct ath11k_base *ab, u16 ce_id)
 {
 	const struct ce_pipe_config *ce_config;
-	u32 val;
 
 	ce_config = &target_ce_config_wlan[ce_id];
-	if (__le32_to_cpu(ce_config->pipedir) & PIPEDIR_OUT) {
-		val = ath11k_ahb_read32(ab, CE_HOST_IE_ADDRESS);
-		val &= ~BIT(ce_id);
-		ath11k_ahb_write32(ab, CE_HOST_IE_ADDRESS, val);
-	}
+	if (__le32_to_cpu(ce_config->pipedir) & PIPEDIR_OUT)
+		ath11k_ahb_clearbit32(ab, ce_id, CE_HOST_IE_ADDRESS);
 
 	if (__le32_to_cpu(ce_config->pipedir) & PIPEDIR_IN) {
-		val = ath11k_ahb_read32(ab, CE_HOST_IE_2_ADDRESS);
-		val &= ~BIT(ce_id);
-		ath11k_ahb_write32(ab, CE_HOST_IE_2_ADDRESS, val);
-
-		val = ath11k_ahb_read32(ab, CE_HOST_IE_3_ADDRESS);
-		val &= ~BIT(ce_id + CE_HOST_IE_3_SHIFT);
-		ath11k_ahb_write32(ab, CE_HOST_IE_3_ADDRESS, val);
+		ath11k_ahb_clearbit32(ab, ce_id, CE_HOST_IE_2_ADDRESS);
+		ath11k_ahb_clearbit32(ab, ce_id + CE_HOST_IE_3_SHIFT,
+				      CE_HOST_IE_3_ADDRESS);
 	}
 }
 
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
