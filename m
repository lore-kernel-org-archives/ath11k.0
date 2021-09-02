Return-Path: <SRS0=LT8G=NY=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D1BBC432BE
	for <ath11k@archiver.kernel.org>; Thu,  2 Sep 2021 05:34:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D2AB610C8
	for <ath11k@archiver.kernel.org>; Thu,  2 Sep 2021 05:34:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D2AB610C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l9dnVnkBxKtSdLc/Qa62BDAO905D3aTeBq6nQWW8NH4=; b=ZGtLVDrp/tmXJM
	3uRRcNS6og8N2La0Kwfq58Sv02dWaTG+oigoQxFrpzoO6LRiEZ+1zuMGhq+4rwjzMBk3jrIsac1mw
	wUUhwtuny/H3pGEne9fQbAP81I9I/beMpLnuD9ySOuH4ogsBA+tabt77asLMS7juQyTDD8Opf9aVv
	Ul/nCkfm7Ih6h2x9sM8DkDQHJTAPH3UrhmWASN/bLu2ViCvbTmipIYAo5IL7N40tNyMBC+8rtg4VQ
	dAnMyAm4pFIIog4ZJpYYPHwJTBtlPEutyr+H5G+AECTuT7AUd0NGaCbw/tp+WREp8VApS4ad+oBlU
	6LYMRDZ35/xGCinMYKeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLfNB-008Ysz-Un; Thu, 02 Sep 2021 05:34:49 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLfN8-008Ypz-5o
 for ath11k@lists.infradead.org; Thu, 02 Sep 2021 05:34:48 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1630560886; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=2S0bTeAXmnDiO/K5oS5s0t6PTSBZNHu7Oq5kBfZ63Ok=;
 b=hpsmq5hEpHSw7MIDQAkskMq6FUFD+gEbJ5I6A/y9Ff+TVbtCLyEBL6KUKL+lbYpddMrebQXS
 mvAASwRukBJRRnIMXQ07cHGI6NxDnvfOKvWryMNVlaGlrcjlm81mal8pMdRvtalse1PhnS8h
 ygFnBCIY6RFv3VTlN9qqrxVv8GI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 6130627589cdb620613e26e2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 02 Sep 2021 05:34:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 33793C43618; Thu,  2 Sep 2021 05:34:45 +0000 (UTC)
Received: from ppranees-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: ppranees)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C638AC4338F;
 Thu,  2 Sep 2021 05:34:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org C638AC4338F
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
Subject: [PATCH v3 02/12] ath11k: allocate dst ring descriptors from cacheable
 memory
Date: Thu,  2 Sep 2021 11:03:30 +0530
Message-Id: <1630560820-21905-3-git-send-email-ppranees@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630560820-21905-1-git-send-email-ppranees@codeaurora.org>
References: <1630560820-21905-1-git-send-email-ppranees@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_223446_338610_C9D57ACB 
X-CRM114-Status: GOOD (  23.05  )
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

Allocating ring memory from cacheable memory area allows cached descriptor
access and prefetch next descriptors to optimize CPU usage during
descriptor processing on NAPI. Based on the hardware param we can enable
or disable this feature for the corresponding platform.

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
index b0c8f62..943d0a7 100644
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
 
+	if (cached) {
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
