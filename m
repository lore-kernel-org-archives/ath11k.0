Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19FE4C3601A
	for <ath11k@archiver.kernel.org>; Thu,  3 Apr 2025 19:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ibDC/bFndFvEdEb5gtW00+Kfe8FBFIcY1p8GoPyunyI=; b=SnWjCo3uLrWJPp9p1JToOskmsC
	sav847H5OQQQ2e1NGKihkqt4R6Kb58n0tOMIevnZSlbna1FPSQn5aXkfJqgfFDeSxG2dsjPUI8LHu
	lestrIrr9EpKcmBBbg4if3nHenEEjgi6ZzUnBQZKe3Pf78RydZ+TtkF7zqcHf3J+eUl6yuBm/JKJg
	An/rXgIfSNwOcff6O0nWamZbMRzDpQIxSHMDlc3ITR/E9rig6bHyU81MO2ALgreojqVxzXUgu2e4o
	HjjPWp4f44KFd7/4OzmaAJN8j0Asnb06DUbYobwjH5Nzz9d+UU1Ul/sSvLwO+Dj+U24cZ3i/p+cTI
	MloHCsYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0PpY-00000009d7f-3Uvl;
	Thu, 03 Apr 2025 19:02:24 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0PpV-00000009d5g-0p8r
	for ath11k@lists.infradead.org;
	Thu, 03 Apr 2025 19:02:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2F6A8A45A52;
	Thu,  3 Apr 2025 18:56:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3AD0C4CEE8;
	Thu,  3 Apr 2025 19:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743706938;
	bh=EZMuhSshL8pIrS8Y4e3bN/RLqQj4uKA4K5ZJfOpenUM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UQnsXx0rD305YW6p/vjJ+2fiLc5DUq4KUOwgbX36KJCqZuW1u98fGttj6AG0qtwun
	 Hi7tBdUqMlQ/tKIBjbI2zspNq/48AqoTOrTmBtZrZ5DApZoGHdoBTQMU4rYetNq4Xt
	 nK/2X/Io+4cGUGL/FeNONgmHc5uEltUA/w9lD1xDFFP1a8c5ms02HRMsIM5DUCDgHC
	 cutuEnGv/jhFWpFu1nVSWUEH+pGxfW+Z/apUSHJllWqsZ97dVXFHycz+tI2lSVGHVn
	 239zr7jwUGeS9Wdx9q29f1K6C0oDOKLQ7mAzrj8JcgFYKfYAiUbpp6hKDnsb/TL6gr
	 iXxNDdVQP9rbQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>,
	Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	jjohnson@kernel.org,
	ath11k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 03/54] wifi: ath11k: fix memory leak in ath11k_xxx_remove()
Date: Thu,  3 Apr 2025 15:01:18 -0400
Message-Id: <20250403190209.2675485-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403190209.2675485-1-sashal@kernel.org>
References: <20250403190209.2675485-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_120221_362870_9DE7250B 
X-CRM114-Status: GOOD (  11.68  )
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

From: Miaoqing Pan <quic_miaoqing@quicinc.com>

[ Upstream commit efb24b1f0d29537714dd3cc46fb335ac27855251 ]

The firmware memory was allocated in ath11k_pci_probe() or
ath11k_ahb_probe(), but not freed in ath11k_xxx_remove() in case
ATH11K_FLAG_QMI_FAIL bit is set. So call ath11k_fw_destroy() to
free the memory.

Found while fixing the same problem in ath12k:
https://lore.kernel.org/linux-wireless/20240314012746.2729101-1-quic_miaoqing@quicinc.com

Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04546-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1

Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Link: https://patch.msgid.link/20250123084948.1124357-1-quic_miaoqing@quicinc.com
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath11k/ahb.c  | 4 +++-
 drivers/net/wireless/ath/ath11k/core.c | 3 +--
 drivers/net/wireless/ath/ath11k/fw.c   | 3 ++-
 drivers/net/wireless/ath/ath11k/pci.c  | 3 ++-
 4 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index f2fc04596d481..eedba3766ba24 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/module.h>
@@ -1290,6 +1290,7 @@ static void ath11k_ahb_remove(struct platform_device *pdev)
 	ath11k_core_deinit(ab);
 
 qmi_fail:
+	ath11k_fw_destroy(ab);
 	ath11k_ahb_free_resources(ab);
 }
 
@@ -1309,6 +1310,7 @@ static void ath11k_ahb_shutdown(struct platform_device *pdev)
 	ath11k_core_deinit(ab);
 
 free_resources:
+	ath11k_fw_destroy(ab);
 	ath11k_ahb_free_resources(ab);
 }
 
diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index c576bbba52bf1..85077247b0251 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/module.h>
@@ -2346,7 +2346,6 @@ void ath11k_core_deinit(struct ath11k_base *ab)
 	ath11k_hif_power_down(ab);
 	ath11k_mac_destroy(ab);
 	ath11k_core_soc_destroy(ab);
-	ath11k_fw_destroy(ab);
 }
 EXPORT_SYMBOL(ath11k_core_deinit);
 
diff --git a/drivers/net/wireless/ath/ath11k/fw.c b/drivers/net/wireless/ath/ath11k/fw.c
index 4e36292a79db8..cbbd8e57119f2 100644
--- a/drivers/net/wireless/ath/ath11k/fw.c
+++ b/drivers/net/wireless/ath/ath11k/fw.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
- * Copyright (c) 2022-2023, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include "core.h"
@@ -166,3 +166,4 @@ void ath11k_fw_destroy(struct ath11k_base *ab)
 {
 	release_firmware(ab->fw.fw);
 }
+EXPORT_SYMBOL(ath11k_fw_destroy);
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index b93f04973ad79..f1121e3317194 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2019-2020 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/module.h>
@@ -984,6 +984,7 @@ static void ath11k_pci_remove(struct pci_dev *pdev)
 	ath11k_core_deinit(ab);
 
 qmi_fail:
+	ath11k_fw_destroy(ab);
 	ath11k_mhi_unregister(ab_pci);
 
 	ath11k_pcic_free_irq(ab);
-- 
2.39.5


