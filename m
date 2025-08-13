Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0F2CA0EE0
	for <ath11k@archiver.kernel.org>; Wed, 13 Aug 2025 22:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OS5cU5c4w/EwjEmywL/2IEMqEDK30q6X7fzmSHMSQkE=; b=3IjAEF8sObN4KxmfE8i83Eqx3/
	Gm18op8HjlqvLnOZBcQh2UvQks8/vSB/8KJLT3YNM9rlh7p1PuA3muuO8VJ0A8QkJVKXbH+MOPMlC
	HLNz1XYcgc6wLmHyg+GN3jZUj4o7+lzN/b3DSar/T6CMKS02BqjYgi+SzFIWkR2t09SA/EEKz2Se9
	I3KGtipokz1d03OqihL4QsE9fqvj5a7mod1RH38H7YreETDqc0Uz42u/Dcba1XXOVWy27CAWil5La
	8wrQd7rDXGJSTLmmrXJ9K4DSweGMC0zLuzvx6efQ65IwoXx/0IGdHErQqf5enUbpWDnaCq//zv5au
	vx4YC8Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umJiF-0000000F7vF-1pQH;
	Wed, 13 Aug 2025 22:12:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umJLw-0000000F4zw-0jfL;
	Wed, 13 Aug 2025 21:49:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=OS5cU5c4w/EwjEmywL/2IEMqEDK30q6X7fzmSHMSQkE=; b=g0ThF+fAv5CR3HR3qaLFbyqEpG
	++V+wrfX7Q8O5c/+p4jlQFo14rji45g082uxM5z+yrxcdSyQ25Pqi+xCmHDcdosxhtUpaEPl84hpk
	s0tZmBjcOw9jbrJSq/U4HW4WtJXZ9N3knZiWG8daxQQ00UrAQArHQJwNGTPNJ22Irx1F6+hgev0If
	Olq4QyARJxe2dZIyneBdPvyOO0Eg0lnkTbSdxP0PG7w/6nIV1SXli4CD9JX71EIrPFrXw3nnsiCLx
	4GomyYtDcUu1MIEAAeYh7N0PR7Y7v1Q1eM8IUHi2yUqJXdtalxtzZmln+vJ9mvx1+1WYgo6RlSBbP
	LxAMdleg==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umJLq-0000000GDAE-0CWE;
	Wed, 13 Aug 2025 21:49:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 698725C4B3C;
	Wed, 13 Aug 2025 21:49:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F38AEC4CEED;
	Wed, 13 Aug 2025 21:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755121780;
	bh=NclLB94FEads0s4wh/ojsqj8Dq8b0xrIiaxPQNruk1g=;
	h=From:To:Cc:Subject:Date:From;
	b=bMKXxF1hFhVnUL6Dcj0fqhs2g+ajhAFtv9QdVA4QyOQaRp+Q+ilC/aDYYFyj6zj3a
	 m9elP7www1VkNZunGrBSI8TXMHp0KJWBGH3PjFpa6P7IOZgq5DixpGJQSz8Bx0SOx/
	 3VnYXfDdXUQVtCNL5oVplDxlBogjQ2Rcn444E/dmXvlwkyVgTodNP6rSHLMNjJqfFR
	 zvoPVymioIggCrdawoBz6BWbM5rCzfb6lFR53tPHXUV8PlHCFB+5QUgZ7JInhLiFEg
	 vKKzRO1rD6uhlsdHsH+Auztfj30L+CsMAD5PTx1DNfMdt9vCmJPz8Nd6+0N8Ca633O
	 GtUiiwv2M5RsA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ath11k@lists.infradead.org
Subject: [PATCH v3] wifi: ath: Use of_reserved_mem_region_to_resource() for "memory-region"
Date: Wed, 13 Aug 2025 16:49:32 -0500
Message-ID: <20250813214933.897486-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_224942_549496_2B9A8ABF 
X-CRM114-Status: GOOD (  15.17  )
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
v3:
 - Rebase on v6.17-rc1

v2:
  - Split to separate patch
---
 drivers/net/wireless/ath/ath10k/snoc.c | 14 +++-----------
 drivers/net/wireless/ath/ath11k/ahb.c  | 17 +++--------------
 drivers/net/wireless/ath/ath11k/qmi.c  | 17 ++++-------------
 3 files changed, 10 insertions(+), 38 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index f0713bd36173..b3f6424c17d3 100644
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
@@ -1559,19 +1559,11 @@ static void ath10k_modem_deinit(struct ath10k *ar)
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
index 50809cc1dad4..8dfe9b40c126 100644
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
index 378ac96b861b..2b547b26ed20 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -13,7 +13,7 @@
 #include "debug.h"
 #include "hif.h"
 #include <linux/of.h>
-#include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/ioport.h>
 #include <linux/firmware.h>
 #include <linux/of_irq.h>
@@ -2040,23 +2040,14 @@ static int ath11k_qmi_alloc_target_mem_chunk(struct ath11k_base *ab)
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
@@ -2095,7 +2086,7 @@ static int ath11k_qmi_assign_target_mem_chunk(struct ath11k_base *ab)
 			}
 
 			if (ath11k_core_coldboot_cal_support(ab)) {
-				if (hremote_node) {
+				if (resource_size(&res)) {
 					ab->qmi.target_mem[idx].paddr =
 							res.start + host_ddr_sz;
 					ab->qmi.target_mem[idx].iaddr =
-- 
2.47.2


