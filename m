Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95965C83F10
	for <ath11k@archiver.kernel.org>; Wed,  9 Jul 2025 02:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jXrtrYFEhYlzt5UZp6LFKbKXrT6KmTSQDgeF5Rd5AWo=; b=H2nG5M+cQt8bvRmlwAOCwX04sa
	Wa9VctxtA+8myRqUQGaEEyWnUiEeSl1azky/s9+Q0JWQgk7sfyEXnwjV6T+A30oTnRPNMggcNlK1Q
	qvxyQumr5XefO3tzg6v/2lHpwE7fNv0ZnunXwHS3WZ32v/Ss5iMlLkXUp2m/jeDadj2I+SAiCZTNY
	qCPP0TaK7SxcgrubvXTB2miMhhEbVbDzb4TTvml/d8ZGdsC51xrHvDto0W4FCdSn/zTPM2xSGe9QU
	1FwEKTjOSf9Hy8vmhoRW1tAvUIVN9dWt/+yjiliAiiPM2lH73t3xHq9V0M9SStUAh7WBSmZpf1Vxj
	lTWTUTCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZKRe-00000007AVU-3ng4;
	Wed, 09 Jul 2025 02:22:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZKRc-00000007AUy-00X1;
	Wed, 09 Jul 2025 02:22:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9591144DCC;
	Wed,  9 Jul 2025 02:21:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50B4EC4CEED;
	Wed,  9 Jul 2025 02:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752027719;
	bh=WVnCMirBoe/sRlO5FFxK0aMqkw1TVZvzSz18OUJ96So=;
	h=From:To:Cc:Subject:Date:From;
	b=a0k/quRHTU6fbPFnwo3t93nfjhugf1HwI8LOZLIWd0Th7GcWeO8EodpJojQOHHhh7
	 NsYJgl/IqYBb6EwY0xBjBw0fWojOBRsiFrNNiyCASf3LAUWcmO+fc4DlpiZ7pyUJ8Z
	 etoZacMryOMpuYROtQ2uZWl3mFD4+JGUUIrgybvPWoyqGhzaj71U0Q4at/5OpU+U80
	 DSBcepMZSdnKpimea37kYILhuUPoa/Uxz5lXf2ZSm4gc3Ftl7eN7VjXhW5bv5X5RKs
	 6RPbnNBRkb45YEvoXZW6WmU9hv8V4dHbouB+D0bc4RE02UnFCwot0w96/ScFJzMHI6
	 xrsvd22ZiKCWQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ath11k@lists.infradead.org
Subject: [PATCH v2] wifi: ath: Use of_reserved_mem_region_to_resource() for "memory-region"
Date: Tue,  8 Jul 2025 21:21:50 -0500
Message-ID: <20250709022151.2090523-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_192200_084299_3BD14EE8 
X-CRM114-Status: GOOD (  15.16  )
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
v2:
  - Split to separate patch
---
 drivers/net/wireless/ath/ath10k/snoc.c | 14 +++-----------
 drivers/net/wireless/ath/ath11k/ahb.c  | 17 +++--------------
 drivers/net/wireless/ath/ath11k/qmi.c  | 17 ++++-------------
 3 files changed, 10 insertions(+), 38 deletions(-)

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
-- 
2.47.2


