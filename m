Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08793C83030
	for <ath11k@archiver.kernel.org>; Thu,  3 Jul 2025 22:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eDO8I3naK//cosZlYZcBUUh8nM6O2c8g3w+ut8LSeyM=; b=VpLGY8bR944uW0R/jm9ROGfz02
	FJFwhjav9MsFDz3O2Vnf99+EzU6bY/7gQYYfAhZF7oD5Bn4JMLyyZ1AS31hJ9cFYAmmBICs4Q3lX+
	aRR0GrRwRXONLlaUbaMrQ0W7sQ8Ew4qH+hrLIELnMl2VkVQeTgO+WfeaOXudVaVJjpNs9qHKaLKTM
	GurvPmRqha/847MRU5VDzEQ3EXIitFUi738RYHh9uSUcX65SbVeTE6c3aftQfbNbeD9LfptZqPda6
	uY7ZwmWIXl1HcjzwfSmH39QhYjkw5Qi2wDzyL5ZZc+nJe3OdUpYs/raFLEMoO+U44YgQyEP0taMxu
	RnPcoNFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXS9u-0000000Ch9n-2lDP;
	Thu, 03 Jul 2025 22:11:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXOm3-0000000CFUe-2UfS;
	Thu, 03 Jul 2025 18:35:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 11FBD5C676F;
	Thu,  3 Jul 2025 18:35:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76A11C4CEEB;
	Thu,  3 Jul 2025 18:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751567706;
	bh=oQJxz7AsS+vnaXVxBJfrbdUGXV9WZlv60FGu/AgCo/8=;
	h=From:To:Cc:Subject:Date:From;
	b=CD0XQ8SIrPwDatdyuxIeN97jUm5gWGeYJoxaMC/IQuTCKLCbTRhuwNbO3OUQNqYtJ
	 OjkXulFwfGmXq5/zzJNRxYDLzvFbxkFxEpi+jQuRWaVjCVNrzN9rkgGqemAfVp9tT5
	 yk+Bx8jWkS+efI7OxHif+7pGeUXJw5MTHaQy0dcP/+GFiqcnRrosO79UcvGcuZwVLU
	 Vhig93WWef1H5iPAWNxS0azpS+VLTjMZ3rmQRviiXPdwkA5xbCdnMufvjHzuj1YIjx
	 WukkFz2Zpt4bHXdsHIv9QyNrFaIBx+zVNsoSZxpNKH/xIWmk4iQsdpq6fZsIvC7WvT
	 I0VyNgJ6NBHPQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] wireless: Use of_reserved_mem_region_to_resource() for "memory-region"
Date: Thu,  3 Jul 2025 13:35:01 -0500
Message-ID: <20250703183502.2074538-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_113507_718445_D0139C76 
X-CRM114-Status: GOOD (  16.05  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Use the newly added of_reserved_mem_region_to_resource() function to
handle "memory-region" properties.

The error handling is a bit different for ath10k. "memory-region" is
optional, so failed lookup is not an error. But then an error in
of_address_to_resource() is treated as an error. However, that
distinction is not really important. Either the region is available
and usable or it is not. So now, it is just
of_reserved_mem_region_to_resource() which is checked for an error.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/net/wireless/ath/ath10k/snoc.c        | 14 +++----------
 drivers/net/wireless/ath/ath11k/ahb.c         | 17 +++------------
 drivers/net/wireless/ath/ath11k/qmi.c         | 17 ++++-----------
 .../net/wireless/mediatek/mt76/mt7915/soc.c   | 21 +++++++------------
 4 files changed, 18 insertions(+), 51 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index b2bf9d72b92f..5c61a3abd33b 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -13,7 +13,7 @@
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
 #include <linux/remoteproc/qcom_rproc.h>
-#include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/iommu.h>
 
 #include "ce.h"
@@ -1557,19 +1557,11 @@ static void ath10k_modem_deinit(struct ath10k *ar)
 static int ath10k_setup_msa_resources(struct ath10k *ar, u32 msa_size)
 {
 	struct device *dev = ar->dev;
-	struct device_node *node;
 	struct resource r;
 	int ret;
 
-	node = of_parse_phandle(dev->of_node, "memory-region", 0);
-	if (node) {
-		ret = of_address_to_resource(node, 0, &r);
-		of_node_put(node);
-		if (ret) {
-			dev_err(dev, "failed to resolve msa fixed region\n");
-			return ret;
-		}
-
+	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &r);
+	if (!ret) {
 		ar->msa.paddr = r.start;
 		ar->msa.mem_size = resource_size(&r);
 		ar->msa.vaddr = devm_memremap(dev, ar->msa.paddr,
diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index fde1ce43c499..2e8a77ceb8bb 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -9,8 +9,8 @@
 #include <linux/property.h>
 #include <linux/of_device.h>
 #include <linux/of.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/dma-mapping.h>
-#include <linux/of_address.h>
 #include <linux/iommu.h>
 #include "ahb.h"
 #include "debug.h"
@@ -919,16 +919,10 @@ static int ath11k_ahb_setup_msa_resources(struct ath11k_base *ab)
 {
 	struct ath11k_ahb *ab_ahb = ath11k_ahb_priv(ab);
 	struct device *dev = ab->dev;
-	struct device_node *node;
 	struct resource r;
 	int ret;
 
-	node = of_parse_phandle(dev->of_node, "memory-region", 0);
-	if (!node)
-		return -ENOENT;
-
-	ret = of_address_to_resource(node, 0, &r);
-	of_node_put(node);
+	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &r);
 	if (ret) {
 		dev_err(dev, "failed to resolve msa fixed region\n");
 		return ret;
@@ -937,12 +931,7 @@ static int ath11k_ahb_setup_msa_resources(struct ath11k_base *ab)
 	ab_ahb->fw.msa_paddr = r.start;
 	ab_ahb->fw.msa_size = resource_size(&r);
 
-	node = of_parse_phandle(dev->of_node, "memory-region", 1);
-	if (!node)
-		return -ENOENT;
-
-	ret = of_address_to_resource(node, 0, &r);
-	of_node_put(node);
+	ret = of_reserved_mem_region_to_resource(dev->of_node, 1, &r);
 	if (ret) {
 		dev_err(dev, "failed to resolve ce fixed region\n");
 		return ret;
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 2782f4723e41..fb53efbc5b68 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -11,7 +11,7 @@
 #include "debug.h"
 #include "hif.h"
 #include <linux/of.h>
-#include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/ioport.h>
 #include <linux/firmware.h>
 #include <linux/of_irq.h>
@@ -2038,23 +2038,14 @@ static int ath11k_qmi_alloc_target_mem_chunk(struct ath11k_base *ab)
 static int ath11k_qmi_assign_target_mem_chunk(struct ath11k_base *ab)
 {
 	struct device *dev = ab->dev;
-	struct device_node *hremote_node = NULL;
-	struct resource res;
+	struct resource res = {};
 	u32 host_ddr_sz;
 	int i, idx, ret;
 
 	for (i = 0, idx = 0; i < ab->qmi.mem_seg_count; i++) {
 		switch (ab->qmi.target_mem[i].type) {
 		case HOST_DDR_REGION_TYPE:
-			hremote_node = of_parse_phandle(dev->of_node, "memory-region", 0);
-			if (!hremote_node) {
-				ath11k_dbg(ab, ATH11K_DBG_QMI,
-					   "fail to get hremote_node\n");
-				return -ENODEV;
-			}
-
-			ret = of_address_to_resource(hremote_node, 0, &res);
-			of_node_put(hremote_node);
+			ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
 			if (ret) {
 				ath11k_dbg(ab, ATH11K_DBG_QMI,
 					   "fail to get reg from hremote\n");
@@ -2093,7 +2084,7 @@ static int ath11k_qmi_assign_target_mem_chunk(struct ath11k_base *ab)
 			}
 
 			if (ath11k_core_coldboot_cal_support(ab)) {
-				if (hremote_node) {
+				if (resource_size(&res)) {
 					ab->qmi.target_mem[idx].paddr =
 							res.start + host_ddr_sz;
 					ab->qmi.target_mem[idx].iaddr =
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/soc.c b/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
index c823a7554a3a..5f19b506cc50 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
@@ -284,20 +284,15 @@ static int mt798x_wmac_coninfra_check(struct mt7915_dev *dev)
 static int mt798x_wmac_coninfra_setup(struct mt7915_dev *dev)
 {
 	struct device *pdev = dev->mt76.dev;
-	struct reserved_mem *rmem;
-	struct device_node *np;
+	struct resource res;
 	u32 val;
+	int ret;
 
-	np = of_parse_phandle(pdev->of_node, "memory-region", 0);
-	if (!np)
-		return -EINVAL;
-
-	rmem = of_reserved_mem_lookup(np);
-	of_node_put(np);
-	if (!rmem)
-		return -EINVAL;
+	ret = of_reserved_mem_region_to_resource(pdev->of_node, 0, &res);
+	if (ret)
+		return ret;
 
-	val = (rmem->base >> 16) & MT_TOP_MCU_EMI_BASE_MASK;
+	val = (res.start >> 16) & MT_TOP_MCU_EMI_BASE_MASK;
 
 	if (is_mt7986(&dev->mt76)) {
 		/* Set conninfra subsys PLL check */
@@ -318,8 +313,8 @@ static int mt798x_wmac_coninfra_setup(struct mt7915_dev *dev)
 			       MT_TOP_EFUSE_BASE_MASK, 0x11f20000 >> 16);
 	}
 
-	mt76_wr(dev, MT_INFRA_BUS_EMI_START, rmem->base);
-	mt76_wr(dev, MT_INFRA_BUS_EMI_END, rmem->size);
+	mt76_wr(dev, MT_INFRA_BUS_EMI_START, res.start);
+	mt76_wr(dev, MT_INFRA_BUS_EMI_END, resource_size(&res));
 
 	mt76_rr(dev, MT_CONN_INFRA_EFUSE);
 
-- 
2.47.2


