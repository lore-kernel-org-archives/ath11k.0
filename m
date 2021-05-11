Return-Path: <SRS0=pDp8=KG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5144EC433B4
	for <ath11k@archiver.kernel.org>; Tue, 11 May 2021 16:40:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A705E613BE
	for <ath11k@archiver.kernel.org>; Tue, 11 May 2021 16:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A705E613BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VQwWThxzUfdHLpJVLIdUi3KrmziWpXHnDrfPelTTdf4=; b=AMS33iHrmeoQfIKd9zeV/5HHq
	VFXTFBpphNHCbYbofPhtpvQSp64LdZ3fWg3NU6fESFXqRORLxxyONBOItYaywuJ/OKUZPs55CeT7q
	UbOJD+56ZzA2pTzMNTxfrN+X7B5lMfHOx4BfOa3Uyhsp6IJQP0/Oc5R19kxM4/Ku4PQInybltp2Uw
	2/3Gct2vZ71JOTuXYbfpU5AkgQf/4lmWrPy1oeTk5p9t9CU1bc2KAsZL6bY2jNQ/f29icUcKg/qvI
	SOqpJwkUqkhx/ByepLo2v14/ZBNbp6v+4KAkLL+uh5Zh29vu6jChjP6MVZ1E66XCY6WHWFrozdu8C
	hzm/UsKOQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgVQa-000mTZ-W5; Tue, 11 May 2021 16:40:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgVAO-000iuC-FT
 for ath11k@desiato.infradead.org; Tue, 11 May 2021 16:23:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=AfSPUrmRAcB/sHgHK1Q7qoHcXJ3wk4tu6xmzhYQC2ps=; b=1rBXV/efldxPh8Qow8mvR8C5ud
 cGd5Wg4alBBXcbKSrHPPo2CQx3fQO51B+649ASDZx1X8MMcJzrn3nkUp1nS9mBwoMivY8S+7jIbxj
 Ecqq9t+LT0TtcZSnaPUXhVJdruoxz+7A4IJbwTBXmEC0xYLcYrx6xDdc7eX5DuV4Usvp8aEczZPKZ
 mE/6cigj/ig1Ubzp+ISwGPxxfF6oMUF0X95x73jeD7iC+IUsDTkfhAX2W1ywGMIirZZqOI+zAnwvb
 ggvRLbMaVL967HiIDV4KG3nuIZouvUeYb2BcPiTesRGUOXYqoWzGWoJNMtSegNyTEb7Ie9x1rm/3H
 OckXXpew==;
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgVAA-009l6R-MT
 for ath11k@lists.infradead.org; Tue, 11 May 2021 16:23:27 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1620750204; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=AfSPUrmRAcB/sHgHK1Q7qoHcXJ3wk4tu6xmzhYQC2ps=;
 b=R0GWRuMoqqJwxbOzIEzGQq9GE6W4qmZenEydwSkB6YTq8tLNJ0u2ZOiVB/3Kgj+NVkKMXb29
 cXN7RJ+p+9KDGP7IcY3GP1feL2MXvh5eUaA9fZeZlKoGzzyVoEOnqD/S10mii/Hn9wasrPZw
 qy6lmpW3ltgNRKbyV/WwQqqeRQM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 609aaf65ff1bb9beec18c61d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 11 May 2021 16:23:01
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1B412C43149; Tue, 11 May 2021 16:23:01 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-96-12-nat.elisa-mobile.fi
 [85.76.96.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2E896C43147;
 Tue, 11 May 2021 16:22:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2E896C43147
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Baochen Qiang <bqiang@codeaurora.org>, Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 3/7] ath11k: setup REO for WCN6855
Date: Tue, 11 May 2021 19:22:10 +0300
Message-Id: <20210511162214.29475-4-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210511162214.29475-1-jouni@codeaurora.org>
References: <20210511162214.29475-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_092325_183828_3E2F4D5E 
X-CRM114-Status: GOOD (  18.87  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

From: Baochen Qiang <bqiang@codeaurora.org>

WCN6855 needs a different reo configuration, so add separate handling
for this target in ath11k_hw_ops.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp.c     | 16 +----
 drivers/net/wireless/ath/ath11k/hal.h    |  3 +-
 drivers/net/wireless/ath/ath11k/hal_rx.c | 36 ----------
 drivers/net/wireless/ath/ath11k/hw.c     | 91 ++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/hw.h     |  1 +
 5 files changed, 96 insertions(+), 51 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index 04f6c4e0658b..b0c8f6290099 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -342,7 +342,6 @@ static int ath11k_dp_srng_common_setup(struct ath11k_base *ab)
 	struct ath11k_dp *dp = &ab->dp;
 	struct hal_srng *srng;
 	int i, ret;
-	u32 ring_hash_map;
 
 	ret = ath11k_dp_srng_setup(ab, &dp->wbm_desc_rel_ring,
 				   HAL_SW2WBM_RELEASE, 0, 0,
@@ -439,20 +438,9 @@ static int ath11k_dp_srng_common_setup(struct ath11k_base *ab)
 	}
 
 	/* When hash based routing of rx packet is enabled, 32 entries to map
-	 * the hash values to the ring will be configured. Each hash entry uses
-	 * three bits to map to a particular ring. The ring mapping will be
-	 * 0:TCL, 1:SW1, 2:SW2, 3:SW3, 4:SW4, 5:Release, 6:FW and 7:Not used.
+	 * the hash values to the ring will be configured.
 	 */
-	ring_hash_map = HAL_HASH_ROUTING_RING_SW1 << 0 |
-			HAL_HASH_ROUTING_RING_SW2 << 3 |
-			HAL_HASH_ROUTING_RING_SW3 << 6 |
-			HAL_HASH_ROUTING_RING_SW4 << 9 |
-			HAL_HASH_ROUTING_RING_SW1 << 12 |
-			HAL_HASH_ROUTING_RING_SW2 << 15 |
-			HAL_HASH_ROUTING_RING_SW3 << 18 |
-			HAL_HASH_ROUTING_RING_SW4 << 21;
-
-	ath11k_hal_reo_hw_setup(ab, ring_hash_map);
+	ab->hw_params.hw_ops->reo_setup(ab);
 
 	return 0;
 
diff --git a/drivers/net/wireless/ath/ath11k/hal.h b/drivers/net/wireless/ath/ath11k/hal.h
index 91d1428b8b94..35ed3a14e200 100644
--- a/drivers/net/wireless/ath/ath11k/hal.h
+++ b/drivers/net/wireless/ath/ath11k/hal.h
@@ -120,6 +120,7 @@ struct ath11k_base;
 #define HAL_REO1_DEST_RING_CTRL_IX_1		0x00000008
 #define HAL_REO1_DEST_RING_CTRL_IX_2		0x0000000c
 #define HAL_REO1_DEST_RING_CTRL_IX_3		0x00000010
+#define HAL_REO1_MISC_CTL			0x00000630
 #define HAL_REO1_RING_BASE_LSB(ab)		ab->hw_params.regs->hal_reo1_ring_base_lsb
 #define HAL_REO1_RING_BASE_MSB(ab)		ab->hw_params.regs->hal_reo1_ring_base_msb
 #define HAL_REO1_RING_ID(ab)			ab->hw_params.regs->hal_reo1_ring_id
@@ -280,6 +281,7 @@ struct ath11k_base;
 #define HAL_REO1_GEN_ENABLE_FRAG_DST_RING		GENMASK(25, 23)
 #define HAL_REO1_GEN_ENABLE_AGING_LIST_ENABLE		BIT(2)
 #define HAL_REO1_GEN_ENABLE_AGING_FLUSH_ENABLE		BIT(3)
+#define HAL_REO1_MISC_CTL_FRAGMENT_DST_RING		GENMASK(20, 17)
 
 /* CE ring bit field mask and shift */
 #define HAL_CE_DST_R0_DEST_CTRL_MAX_LEN			GENMASK(15, 0)
@@ -906,7 +908,6 @@ void ath11k_hal_reo_qdesc_setup(void *vaddr, int tid, u32 ba_window_size,
 				u32 start_seq, enum hal_pn_type type);
 void ath11k_hal_reo_init_cmd_ring(struct ath11k_base *ab,
 				  struct hal_srng *srng);
-void ath11k_hal_reo_hw_setup(struct ath11k_base *ab, u32 ring_hash_map);
 void ath11k_hal_setup_link_idle_list(struct ath11k_base *ab,
 				     struct hal_wbm_idle_scatter_list *sbuf,
 				     u32 nsbufs, u32 tot_link_desc,
diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.c b/drivers/net/wireless/ath/ath11k/hal_rx.c
index fac2396edf32..b479d93bee32 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.c
@@ -801,42 +801,6 @@ void ath11k_hal_reo_init_cmd_ring(struct ath11k_base *ab,
 	}
 }
 
-void ath11k_hal_reo_hw_setup(struct ath11k_base *ab, u32 ring_hash_map)
-{
-	u32 reo_base = HAL_SEQ_WCSS_UMAC_REO_REG;
-	u32 val;
-
-	val = ath11k_hif_read32(ab, reo_base + HAL_REO1_GEN_ENABLE);
-
-	val &= ~HAL_REO1_GEN_ENABLE_FRAG_DST_RING;
-	val |= FIELD_PREP(HAL_REO1_GEN_ENABLE_FRAG_DST_RING,
-			  HAL_SRNG_RING_ID_REO2SW1) |
-	       FIELD_PREP(HAL_REO1_GEN_ENABLE_AGING_LIST_ENABLE, 1) |
-	       FIELD_PREP(HAL_REO1_GEN_ENABLE_AGING_FLUSH_ENABLE, 1);
-	ath11k_hif_write32(ab, reo_base + HAL_REO1_GEN_ENABLE, val);
-
-	ath11k_hif_write32(ab, reo_base + HAL_REO1_AGING_THRESH_IX_0(ab),
-			   HAL_DEFAULT_REO_TIMEOUT_USEC);
-	ath11k_hif_write32(ab, reo_base + HAL_REO1_AGING_THRESH_IX_1(ab),
-			   HAL_DEFAULT_REO_TIMEOUT_USEC);
-	ath11k_hif_write32(ab, reo_base + HAL_REO1_AGING_THRESH_IX_2(ab),
-			   HAL_DEFAULT_REO_TIMEOUT_USEC);
-	ath11k_hif_write32(ab, reo_base + HAL_REO1_AGING_THRESH_IX_3(ab),
-			   HAL_DEFAULT_REO_TIMEOUT_USEC);
-
-	ath11k_hif_write32(ab, reo_base + HAL_REO1_DEST_RING_CTRL_IX_0,
-			   FIELD_PREP(HAL_REO_DEST_RING_CTRL_HASH_RING_MAP,
-				      ring_hash_map));
-	ath11k_hif_write32(ab, reo_base + HAL_REO1_DEST_RING_CTRL_IX_1,
-			   FIELD_PREP(HAL_REO_DEST_RING_CTRL_HASH_RING_MAP,
-				      ring_hash_map));
-	ath11k_hif_write32(ab, reo_base + HAL_REO1_DEST_RING_CTRL_IX_2,
-			   FIELD_PREP(HAL_REO_DEST_RING_CTRL_HASH_RING_MAP,
-				      ring_hash_map));
-	ath11k_hif_write32(ab, reo_base + HAL_REO1_DEST_RING_CTRL_IX_3,
-			   FIELD_PREP(HAL_REO_DEST_RING_CTRL_HASH_RING_MAP,
-				      ring_hash_map));
-}
 
 static enum hal_rx_mon_status
 ath11k_hal_rx_parse_mon_status_tlv(struct ath11k_base *ab,
diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
index 023047df954c..01207b50a454 100644
--- a/drivers/net/wireless/ath/ath11k/hw.c
+++ b/drivers/net/wireless/ath/ath11k/hw.c
@@ -10,6 +10,7 @@
 #include "hw.h"
 #include "core.h"
 #include "ce.h"
+#include "hif.h"
 
 /* Map from pdev index to hw mac index */
 static u8 ath11k_hw_ipq8074_mac_from_pdev_id(int pdev_idx)
@@ -98,6 +99,52 @@ static void ath11k_init_wmi_config_qca6390(struct ath11k_base *ab,
 	config->num_keep_alive_pattern = 0;
 }
 
+static void ath11k_hw_ipq8074_reo_setup(struct ath11k_base *ab)
+{
+	u32 reo_base = HAL_SEQ_WCSS_UMAC_REO_REG;
+	u32 val;
+	/* Each hash entry uses three bits to map to a particular ring. */
+	u32 ring_hash_map = HAL_HASH_ROUTING_RING_SW1 << 0 |
+		HAL_HASH_ROUTING_RING_SW2 << 3 |
+		HAL_HASH_ROUTING_RING_SW3 << 6 |
+		HAL_HASH_ROUTING_RING_SW4 << 9 |
+		HAL_HASH_ROUTING_RING_SW1 << 12 |
+		HAL_HASH_ROUTING_RING_SW2 << 15 |
+		HAL_HASH_ROUTING_RING_SW3 << 18 |
+		HAL_HASH_ROUTING_RING_SW4 << 21;
+
+	val = ath11k_hif_read32(ab, reo_base + HAL_REO1_GEN_ENABLE);
+
+	val &= ~HAL_REO1_GEN_ENABLE_FRAG_DST_RING;
+	val |= FIELD_PREP(HAL_REO1_GEN_ENABLE_FRAG_DST_RING,
+			HAL_SRNG_RING_ID_REO2SW1) |
+		FIELD_PREP(HAL_REO1_GEN_ENABLE_AGING_LIST_ENABLE, 1) |
+		FIELD_PREP(HAL_REO1_GEN_ENABLE_AGING_FLUSH_ENABLE, 1);
+	ath11k_hif_write32(ab, reo_base + HAL_REO1_GEN_ENABLE, val);
+
+	ath11k_hif_write32(ab, reo_base + HAL_REO1_AGING_THRESH_IX_0(ab),
+			   HAL_DEFAULT_REO_TIMEOUT_USEC);
+	ath11k_hif_write32(ab, reo_base + HAL_REO1_AGING_THRESH_IX_1(ab),
+			   HAL_DEFAULT_REO_TIMEOUT_USEC);
+	ath11k_hif_write32(ab, reo_base + HAL_REO1_AGING_THRESH_IX_2(ab),
+			   HAL_DEFAULT_REO_TIMEOUT_USEC);
+	ath11k_hif_write32(ab, reo_base + HAL_REO1_AGING_THRESH_IX_3(ab),
+			   HAL_DEFAULT_REO_TIMEOUT_USEC);
+
+	ath11k_hif_write32(ab, reo_base + HAL_REO1_DEST_RING_CTRL_IX_0,
+			   FIELD_PREP(HAL_REO_DEST_RING_CTRL_HASH_RING_MAP,
+				      ring_hash_map));
+	ath11k_hif_write32(ab, reo_base + HAL_REO1_DEST_RING_CTRL_IX_1,
+			   FIELD_PREP(HAL_REO_DEST_RING_CTRL_HASH_RING_MAP,
+				      ring_hash_map));
+	ath11k_hif_write32(ab, reo_base + HAL_REO1_DEST_RING_CTRL_IX_2,
+			   FIELD_PREP(HAL_REO_DEST_RING_CTRL_HASH_RING_MAP,
+				      ring_hash_map));
+	ath11k_hif_write32(ab, reo_base + HAL_REO1_DEST_RING_CTRL_IX_3,
+			   FIELD_PREP(HAL_REO_DEST_RING_CTRL_HASH_RING_MAP,
+				      ring_hash_map));
+}
+
 static void ath11k_init_wmi_config_ipq8074(struct ath11k_base *ab,
 					   struct target_resource_config *config)
 {
@@ -656,6 +703,45 @@ static u8 *ath11k_hw_wcn6855_rx_desc_get_msdu_payload(struct hal_rx_desc *desc)
 	return &desc->u.wcn6855.msdu_payload[0];
 }
 
+static void ath11k_hw_wcn6855_reo_setup(struct ath11k_base *ab)
+{
+	u32 reo_base = HAL_SEQ_WCSS_UMAC_REO_REG;
+	u32 val;
+	/* Each hash entry uses four bits to map to a particular ring. */
+	u32 ring_hash_map = HAL_HASH_ROUTING_RING_SW1 << 0 |
+		HAL_HASH_ROUTING_RING_SW2 << 4 |
+		HAL_HASH_ROUTING_RING_SW3 << 8 |
+		HAL_HASH_ROUTING_RING_SW4 << 12 |
+		HAL_HASH_ROUTING_RING_SW1 << 16 |
+		HAL_HASH_ROUTING_RING_SW2 << 20 |
+		HAL_HASH_ROUTING_RING_SW3 << 24 |
+		HAL_HASH_ROUTING_RING_SW4 << 28;
+
+	val = ath11k_hif_read32(ab, reo_base + HAL_REO1_GEN_ENABLE);
+	val |= FIELD_PREP(HAL_REO1_GEN_ENABLE_AGING_LIST_ENABLE, 1) |
+		FIELD_PREP(HAL_REO1_GEN_ENABLE_AGING_FLUSH_ENABLE, 1);
+	ath11k_hif_write32(ab, reo_base + HAL_REO1_GEN_ENABLE, val);
+
+	val = ath11k_hif_read32(ab, reo_base + HAL_REO1_MISC_CTL);
+	val &= ~HAL_REO1_MISC_CTL_FRAGMENT_DST_RING;
+	val |= FIELD_PREP(HAL_REO1_MISC_CTL_FRAGMENT_DST_RING, HAL_SRNG_RING_ID_REO2SW1);
+	ath11k_hif_write32(ab, reo_base + HAL_REO1_MISC_CTL, val);
+
+	ath11k_hif_write32(ab, reo_base + HAL_REO1_AGING_THRESH_IX_0(ab),
+			   HAL_DEFAULT_REO_TIMEOUT_USEC);
+	ath11k_hif_write32(ab, reo_base + HAL_REO1_AGING_THRESH_IX_1(ab),
+			   HAL_DEFAULT_REO_TIMEOUT_USEC);
+	ath11k_hif_write32(ab, reo_base + HAL_REO1_AGING_THRESH_IX_2(ab),
+			   HAL_DEFAULT_REO_TIMEOUT_USEC);
+	ath11k_hif_write32(ab, reo_base + HAL_REO1_AGING_THRESH_IX_3(ab),
+			   HAL_DEFAULT_REO_TIMEOUT_USEC);
+
+	ath11k_hif_write32(ab, reo_base + HAL_REO1_DEST_RING_CTRL_IX_2,
+			   ring_hash_map);
+	ath11k_hif_write32(ab, reo_base + HAL_REO1_DEST_RING_CTRL_IX_3,
+			   ring_hash_map);
+}
+
 const struct ath11k_hw_ops ipq8074_ops = {
 	.get_hw_mac_from_pdev_id = ath11k_hw_ipq8074_mac_from_pdev_id,
 	.wmi_init_config = ath11k_init_wmi_config_ipq8074,
@@ -688,6 +774,7 @@ const struct ath11k_hw_ops ipq8074_ops = {
 	.rx_desc_set_msdu_len = ath11k_hw_ipq8074_rx_desc_set_msdu_len,
 	.rx_desc_get_attention = ath11k_hw_ipq8074_rx_desc_get_attention,
 	.rx_desc_get_msdu_payload = ath11k_hw_ipq8074_rx_desc_get_msdu_payload,
+	.reo_setup = ath11k_hw_ipq8074_reo_setup,
 };
 
 const struct ath11k_hw_ops ipq6018_ops = {
@@ -722,6 +809,7 @@ const struct ath11k_hw_ops ipq6018_ops = {
 	.rx_desc_set_msdu_len = ath11k_hw_ipq8074_rx_desc_set_msdu_len,
 	.rx_desc_get_attention = ath11k_hw_ipq8074_rx_desc_get_attention,
 	.rx_desc_get_msdu_payload = ath11k_hw_ipq8074_rx_desc_get_msdu_payload,
+	.reo_setup = ath11k_hw_ipq8074_reo_setup,
 };
 
 const struct ath11k_hw_ops qca6390_ops = {
@@ -756,6 +844,7 @@ const struct ath11k_hw_ops qca6390_ops = {
 	.rx_desc_set_msdu_len = ath11k_hw_ipq8074_rx_desc_set_msdu_len,
 	.rx_desc_get_attention = ath11k_hw_ipq8074_rx_desc_get_attention,
 	.rx_desc_get_msdu_payload = ath11k_hw_ipq8074_rx_desc_get_msdu_payload,
+	.reo_setup = ath11k_hw_ipq8074_reo_setup,
 };
 
 const struct ath11k_hw_ops qcn9074_ops = {
@@ -790,6 +879,7 @@ const struct ath11k_hw_ops qcn9074_ops = {
 	.rx_desc_set_msdu_len = ath11k_hw_qcn9074_rx_desc_set_msdu_len,
 	.rx_desc_get_attention = ath11k_hw_qcn9074_rx_desc_get_attention,
 	.rx_desc_get_msdu_payload = ath11k_hw_qcn9074_rx_desc_get_msdu_payload,
+	.reo_setup = ath11k_hw_ipq8074_reo_setup,
 };
 
 const struct ath11k_hw_ops wcn6855_ops = {
@@ -824,6 +914,7 @@ const struct ath11k_hw_ops wcn6855_ops = {
 	.rx_desc_set_msdu_len = ath11k_hw_wcn6855_rx_desc_set_msdu_len,
 	.rx_desc_get_attention = ath11k_hw_wcn6855_rx_desc_get_attention,
 	.rx_desc_get_msdu_payload = ath11k_hw_wcn6855_rx_desc_get_msdu_payload,
+	.reo_setup = ath11k_hw_wcn6855_reo_setup,
 };
 
 #define ATH11K_TX_RING_MASK_0 0x1
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 6e924f628f22..afe3b3c71695 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -199,6 +199,7 @@ struct ath11k_hw_ops {
 	void (*rx_desc_set_msdu_len)(struct hal_rx_desc *desc, u16 len);
 	struct rx_attention *(*rx_desc_get_attention)(struct hal_rx_desc *desc);
 	u8 *(*rx_desc_get_msdu_payload)(struct hal_rx_desc *desc);
+	void (*reo_setup)(struct ath11k_base *ab);
 };
 
 extern const struct ath11k_hw_ops ipq8074_ops;
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
