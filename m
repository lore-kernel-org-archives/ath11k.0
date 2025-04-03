Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7934C369A4
	for <ath11k@archiver.kernel.org>; Thu,  3 Apr 2025 19:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6V3Sd040ODhEdsnlKsmFhTCt9/e/PWoeawWYct6EWhs=; b=IN9cASQ3gHPwzMeSTcUp+wABNN
	FZPPKYn519f85UsM15G2HE4vCi8F4Ju+PQqb3X7FnbknCb2O/BYIhP/9i9igL2e0Kwe+VVky+n23J
	g8lIGtFFWUJo3tv596zvwEzlzF80odLwpCh77p6D3qBkr3u+gUA7HERpUyEIWodUuWBlVuXj665Iz
	VQn3rgEhPYHZiy0WFkoZYVTYMsWPYocKOhsaSW1kuuBoNuVX+ASqob2+l6AUAiZBzaz0G087lpBs0
	cVBiaq+hoHR3aDdavMapON50EYwxnI+psjvBbmrz0sxgGXStYWDqO2b8XVkInT0kJ3eGtY5z5RM/e
	v8R8eA9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0PuW-00000009eT8-0ASe;
	Thu, 03 Apr 2025 19:07:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0PrK-00000009dhZ-3hpG
	for ath11k@lists.infradead.org;
	Thu, 03 Apr 2025 19:04:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 52B966115B;
	Thu,  3 Apr 2025 19:04:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 238E2C4CEE3;
	Thu,  3 Apr 2025 19:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743707054;
	bh=bsfGNVZereGziP6a6jhMX98pXTisX/n5km5SiqiMg70=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JLNKwpzfWUb1xRpIvN6L1vbbByY6Li9VL0o2o38DhpPRfBx9utKqsSdLr1NO9a75N
	 D64mFHi6o4FnK/3Wtr/BJ/6U/9dnG+he6XQ9IB77j/oXK68k0LaQeIKiucJzltJhPK
	 QQb6OgCXaPIQg9SCWKGb9dSR/g6vBoQeOe9odwS/Yjdg2bbA2n6SfUW58zYZCiQs9R
	 JkXvoPZBXeZzS6FwvTnynIIl+Xe+3FcPipKaX63z25VMzjMZ+wKI8pMNtFdmy19hLm
	 jIRI7k9cImV/Z5nn+RI1DZP9JcDZybEyld1/eQ2bgB1A0MebWEof8gjuqnrGlbCBbn
	 aGhtXrtyhzVnQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>,
	Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	jjohnson@kernel.org,
	ath11k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.13 02/49] wifi: ath11k: fix memory leak in ath11k_xxx_remove()
Date: Thu,  3 Apr 2025 15:03:21 -0400
Message-Id: <20250403190408.2676344-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403190408.2676344-1-sashal@kernel.org>
References: <20250403190408.2676344-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.9
Content-Transfer-Encoding: 8bit
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
index be67382c00f6d..950e93177d674 100644
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
@@ -2214,7 +2214,6 @@ void ath11k_core_deinit(struct ath11k_base *ab)
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
index be9d2c69cc413..6ebfa5d02e2e5 100644
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
@@ -981,6 +981,7 @@ static void ath11k_pci_remove(struct pci_dev *pdev)
 	ath11k_core_deinit(ab);
 
 qmi_fail:
+	ath11k_fw_destroy(ab);
 	ath11k_mhi_unregister(ab_pci);
 
 	ath11k_pcic_free_irq(ab);
-- 
2.39.5


