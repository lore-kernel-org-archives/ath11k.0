Return-Path: <SRS0=KApm=NQ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB56C432BE
	for <ath11k@archiver.kernel.org>; Wed, 25 Aug 2021 09:39:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FCD5610CE
	for <ath11k@archiver.kernel.org>; Wed, 25 Aug 2021 09:39:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0FCD5610CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kfBsQ0SuSh1z8eoPlZZK/w7flJMz1kBdOuSA10Y57Js=; b=YrjT1izD1txLsM
	VUs/Zps/54pBfy3MKFLqu8shOi+0pDmkbQoc4AWlHFTLLBewFlszegU+yjK0CRDLGvZoveQ3uRssb
	vSHP5XHcgsDXjx4Qcpvi6DyrFvylWQNsChewnJJb9Zk4CgaLxYwxXolg+YZyoMrnFpdgrfAl435B9
	tP12dAAEIbDFRmqV7KW4osqU4vfDGaYrJIhEO24Zbi7YJ6L1LLTCdyfMlnadF7zznmJVSMBNlnXnA
	OkOCTyiH2rFaS6hPLXkOrAjfFuSd+i9ekxiwHsWFylDEesHwuNueM7XqWGau/DJsy9vktIwA6qoqw
	4Ma8eBzzGRkCpV1M1Ddw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIpNN-006Ask-OW; Wed, 25 Aug 2021 09:39:17 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIpNF-006An9-GI
 for ath11k@lists.infradead.org; Wed, 25 Aug 2021 09:39:16 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1629884351; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=de8TobcEumw9VK4+1G1I+0LuxSLPA/v83oAY+GkKWbw=;
 b=cvb95JkeCLHrd1IXlw+lkmUA0qB5B69VVKW7q4U+IA5CcjKcJApBqDnrV3rYi+eY41St4yH3
 0KAcIR2NF8eNFdscRsFp8igZvDsw5hHJSbyFMoah0hu7Rm0RMCwByJqi4kAgfnVxyQuxc6XL
 1J1ZH2llQiKEHBfwKUCyHw20YXs=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 61260faa4cd90150372c2a49 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 25 Aug 2021 09:38:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1CB2AC4338F; Wed, 25 Aug 2021 09:38:50 +0000 (UTC)
Received: from ppranees-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: ppranees)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 65C3AC43616;
 Wed, 25 Aug 2021 09:38:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 65C3AC43616
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: P Praneesh <ppranees@codeaurora.org>
To: kvalo@codeaurora.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 P Praneesh <ppranees@codeaurora.org>,
 Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>,
 Sriram R <srirrama@codeaurora.org>, Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH v2 02/12] ath11k: allocate dst ring descriptors from cacheable
 memory
Date: Wed, 25 Aug 2021 15:07:47 +0530
Message-Id: <1629884277-18759-3-git-send-email-ppranees@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629884277-18759-1-git-send-email-ppranees@codeaurora.org>
References: <1629884277-18759-1-git-send-email-ppranees@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_023911_934584_9AE95CFE 
X-CRM114-Status: GOOD (  22.49  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

tcl_data and reo_dst rings are currently being allocated using
dma_allocate_coherent() which is non cacheable.

Allocating ring memory from cacheable memory area allows cached
descriptor access and prefetch next descriptors to optimize CPU
usage during descriptor processing on NAPI. Based on the hardware
param we can enable/disable this feature for the corresponding
platform.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1.r2-00012-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01695-QCAHKSWPL_SILICONZ-1

Co-developed-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Co-developed-by: Sriram R <srirrama@codeaurora.org>
Signed-off-by: Sriram R <srirrama@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
Signed-off-by: P Praneesh <ppranees@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c |  5 +++++
 drivers/net/wireless/ath/ath11k/dp.c   | 38 +++++++++++++++++++++++++++++-----
 drivers/net/wireless/ath/ath11k/dp.h   |  1 +
 drivers/net/wireless/ath/ath11k/hal.c  | 28 +++++++++++++++++++++++--
 drivers/net/wireless/ath/ath11k/hal.h  |  1 +
 drivers/net/wireless/ath/ath11k/hw.h   |  1 +
 6 files changed, 67 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 969bf1a..298c4dc 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -71,6 +71,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_suspend = false,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_ipq8074),
 		.fix_l1ss = true,
+		.alloc_cacheable_memory = true,
 	},
 	{
 		.hw_rev = ATH11K_HW_IPQ6018_HW10,
@@ -112,6 +113,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_suspend = false,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_ipq8074),
 		.fix_l1ss = true,
+		.alloc_cacheable_memory = true,
 	},
 	{
 		.name = "qca6390 hw2.0",
@@ -152,6 +154,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_suspend = true,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_ipq8074),
 		.fix_l1ss = true,
+		.alloc_cacheable_memory = false,
 	},
 	{
 		.name = "qcn9074 hw1.0",
@@ -190,6 +193,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_suspend = false,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_qcn9074),
 		.fix_l1ss = true,
+		.alloc_cacheable_memory = true,
 	},
 	{
 		.name = "wcn6855 hw2.0",
@@ -230,6 +234,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_suspend = true,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_wcn6855),
 		.fix_l1ss = false,
+		.alloc_cacheable_memory = false,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index b0c8f62..57059c6 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -101,8 +101,11 @@ void ath11k_dp_srng_cleanup(struct ath11k_base *ab, struct dp_srng *ring)
 	if (!ring->vaddr_unaligned)
 		return;
 
-	dma_free_coherent(ab->dev, ring->size, ring->vaddr_unaligned,
-			  ring->paddr_unaligned);
+	if (ring->cached)
+		kfree(ring->vaddr_unaligned);
+	else
+		dma_free_coherent(ab->dev, ring->size, ring->vaddr_unaligned,
+				  ring->paddr_unaligned);
 
 	ring->vaddr_unaligned = NULL;
 }
@@ -222,6 +225,7 @@ int ath11k_dp_srng_setup(struct ath11k_base *ab, struct dp_srng *ring,
 	int entry_sz = ath11k_hal_srng_get_entrysize(ab, type);
 	int max_entries = ath11k_hal_srng_get_max_entries(ab, type);
 	int ret;
+	bool cached = false;
 
 	if (max_entries < 0 || entry_sz < 0)
 		return -EINVAL;
@@ -230,9 +234,28 @@ int ath11k_dp_srng_setup(struct ath11k_base *ab, struct dp_srng *ring,
 		num_entries = max_entries;
 
 	ring->size = (num_entries * entry_sz) + HAL_RING_BASE_ALIGN - 1;
-	ring->vaddr_unaligned = dma_alloc_coherent(ab->dev, ring->size,
-						   &ring->paddr_unaligned,
-						   GFP_KERNEL);
+
+	if (ab->hw_params.alloc_cacheable_memory) {
+		/* Allocate the reo dst and tx completion rings from cacheable memory */
+		switch (type) {
+		case HAL_REO_DST:
+			cached = true;
+			break;
+		default:
+			cached = false;
+		}
+
+		if (cached) {
+			ring->vaddr_unaligned = kzalloc(ring->size, GFP_KERNEL);
+			ring->paddr_unaligned = virt_to_phys(ring->vaddr_unaligned);
+		}
+	}
+
+	if (!cached)
+		ring->vaddr_unaligned = dma_alloc_coherent(ab->dev, ring->size,
+							   &ring->paddr_unaligned,
+							   GFP_KERNEL);
+
 	if (!ring->vaddr_unaligned)
 		return -ENOMEM;
 
@@ -292,6 +315,11 @@ int ath11k_dp_srng_setup(struct ath11k_base *ab, struct dp_srng *ring,
 		return -EINVAL;
 	}
 
+	if (cached && ab->hw_params.alloc_cacheable_memory) {
+		params.flags |= HAL_SRNG_FLAGS_CACHED;
+		ring->cached = 1;
+	}
+
 	ret = ath11k_hal_srng_setup(ab, type, ring_num, mac_id, &params);
 	if (ret < 0) {
 		ath11k_warn(ab, "failed to setup srng: %d ring_id %d\n",
diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index ee768cc..e659148 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -64,6 +64,7 @@ struct dp_srng {
 	dma_addr_t paddr;
 	int size;
 	u32 ring_id;
+	u8 cached;
 };
 
 struct dp_rxdma_ring {
diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index eaa0edc..f04edaf 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -627,6 +627,21 @@ u32 *ath11k_hal_srng_dst_peek(struct ath11k_base *ab, struct hal_srng *srng)
 	return NULL;
 }
 
+static void ath11k_hal_srng_prefetch_desc(struct ath11k_base *ab,
+					  struct hal_srng *srng)
+{
+	u32 *desc;
+
+	/* prefetch only if desc is available */
+	desc = ath11k_hal_srng_dst_peek(ab, srng);
+	if (likely(desc)) {
+		dma_sync_single_for_cpu(ab->dev, virt_to_phys(desc),
+					(srng->entry_size * sizeof(u32)),
+					DMA_FROM_DEVICE);
+		prefetch(desc);
+	}
+}
+
 u32 *ath11k_hal_srng_dst_get_next_entry(struct ath11k_base *ab,
 					struct hal_srng *srng)
 {
@@ -642,6 +657,10 @@ u32 *ath11k_hal_srng_dst_get_next_entry(struct ath11k_base *ab,
 	srng->u.dst_ring.tp = (srng->u.dst_ring.tp + srng->entry_size) %
 			      srng->ring_size;
 
+	/* Try to prefetch the next descriptor in the ring */
+	if (srng->flags & HAL_SRNG_FLAGS_CACHED)
+		ath11k_hal_srng_prefetch_desc(ab, srng);
+
 	return desc;
 }
 
@@ -775,11 +794,16 @@ void ath11k_hal_srng_access_begin(struct ath11k_base *ab, struct hal_srng *srng)
 {
 	lockdep_assert_held(&srng->lock);
 
-	if (srng->ring_dir == HAL_SRNG_DIR_SRC)
+	if (srng->ring_dir == HAL_SRNG_DIR_SRC) {
 		srng->u.src_ring.cached_tp =
 			*(volatile u32 *)srng->u.src_ring.tp_addr;
-	else
+	} else {
 		srng->u.dst_ring.cached_hp = *srng->u.dst_ring.hp_addr;
+
+		/* Try to prefetch the next descriptor in the ring */
+		if (srng->flags & HAL_SRNG_FLAGS_CACHED)
+			ath11k_hal_srng_prefetch_desc(ab, srng);
+	}
 }
 
 /* Update cached ring head/tail pointers to HW. ath11k_hal_srng_access_begin()
diff --git a/drivers/net/wireless/ath/ath11k/hal.h b/drivers/net/wireless/ath/ath11k/hal.h
index 35ed3a1..0f4f9ce 100644
--- a/drivers/net/wireless/ath/ath11k/hal.h
+++ b/drivers/net/wireless/ath/ath11k/hal.h
@@ -513,6 +513,7 @@ enum hal_srng_dir {
 #define HAL_SRNG_FLAGS_DATA_TLV_SWAP		0x00000020
 #define HAL_SRNG_FLAGS_LOW_THRESH_INTR_EN	0x00010000
 #define HAL_SRNG_FLAGS_MSI_INTR			0x00020000
+#define HAL_SRNG_FLAGS_CACHED                   0x20000000
 #define HAL_SRNG_FLAGS_LMAC_RING		0x80000000
 
 #define HAL_SRNG_TLV_HDR_TAG		GENMASK(9, 1)
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 62f5978..7fe8edb 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -163,6 +163,7 @@ struct ath11k_hw_params {
 	bool supports_suspend;
 	u32 hal_desc_sz;
 	bool fix_l1ss;
+	bool alloc_cacheable_memory;
 };
 
 struct ath11k_hw_ops {
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
