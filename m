Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993EDC433F5
	for <ath11k@archiver.kernel.org>; Wed, 27 Apr 2022 11:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z0rlzkv+mXxnS8RVdnJtHFqRZ0amqHJ1fLqTh9ADjCk=; b=MLznn2n1C336VU
	9V4q45lmB6HtsdDHKurBDw+Ip6jN9WKnmgInsNzZdOSM0rVSCSRbF6zht0eF2CwAPODBdhr5sktXA
	pO11b/wCGetjcbLE/bkRnAzWT78kpYIr3x+nYkCd9Bclobhtv5VpJxLyLAUfgZT47PZUtIscfiZp/
	0JMdGbJpozg56Mqf1b+JpFv4Zoatp9A0+EfIT2aVpybXp9Nn5fQ4828u85U/O8MJo43EybH6tBwS2
	OgSarlaZB/bn+ckGnn/CeQpbdo7npcZAUeEiCn3YekSEZ0OlR2qX59E9AckYdoK7/v5DsRNyArxqc
	QFzJaUdjizOKhyfloHyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njfhX-0013PG-3f; Wed, 27 Apr 2022 11:19:19 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njfhU-0013LP-36
 for ath11k@lists.infradead.org; Wed, 27 Apr 2022 11:19:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651058356; x=1682594356;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YHUI8It2Nca0K7+UnVYz8KwyL5zVLLx9r/4p/ptVvsc=;
 b=ZvYDV1MBHlYdZBbAHHs3w5Y/bt5wnr/GXwuu6vQo1IMC6DQblKx0sCVJ
 Qs+5aq+m8/Aolpqq+/7kpIXs4mKRjbM2blVchwndPowew9czfL8NZ+1/B
 HtpFYMAloxJLIZraecoYDiPhpHmzUaqoonXWPlKryBWtnueSw408aIVmn Y=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 27 Apr 2022 04:19:15 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 04:19:15 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 27 Apr 2022 04:19:15 -0700
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 27 Apr 2022 04:19:12 -0700
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <robh@kernel.org>, <mka@chromium.org>, Manikanta Pubbisetty
 <quic_mpubbise@quicinc.com>
Subject: [PATCH v6 3/9] ath11k: Add bus params for WCN6750
Date: Wed, 27 Apr 2022 16:48:42 +0530
Message-ID: <20220427111848.9257-4-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220427111848.9257-1-quic_mpubbise@quicinc.com>
References: <20220427111848.9257-1-quic_mpubbise@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_041916_194623_E5587CA3 
X-CRM114-Status: GOOD (  13.76  )
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

WCN6750 is a PCIe based solution that is attached to and enumerated
by the WPSS (Wireless Processor SubSystem) Q6 processor.

Though it is a PCIe device, since it is not attached to APSS processor
(Application Processor SubSystem), APSS will be unaware of such a decice
and hence it is registered to the APSS processor as a platform device(AHB).
Because of this hybrid nature, it is called as a hybrid bus device.

A new variable is defined in bus params to indicate the hybrid nature.
Add bus params for WCN6750.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1

Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/ahb.c  | 10 ++++++++++
 drivers/net/wireless/ath/ath11k/ahb.h  |  2 ++
 drivers/net/wireless/ath/ath11k/core.h |  1 +
 drivers/net/wireless/ath/ath11k/pci.c  |  1 +
 4 files changed, 14 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index f407d4af2074..cfdd415f0203 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021-2022, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/module.h>
@@ -33,6 +34,15 @@ static const struct ath11k_bus_params ath11k_ahb_bus_params = {
 	.m3_fw_support = false,
 	.fixed_bdf_addr = true,
 	.fixed_mem_region = true,
+	.hybrid_bus_type = false,
+};
+
+const struct ath11k_bus_params ath11k_ahb_hybrid_bus_params = {
+	.mhi_support = false,
+	.m3_fw_support = false,
+	.fixed_bdf_addr = false,
+	.fixed_mem_region = false,
+	.hybrid_bus_type = true,
 };
 
 #define ATH11K_IRQ_CE0_OFFSET 4
diff --git a/drivers/net/wireless/ath/ath11k/ahb.h b/drivers/net/wireless/ath/ath11k/ahb.h
index 51e6e4a5f686..a276e3d1dff8 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.h
+++ b/drivers/net/wireless/ath/ath11k/ahb.h
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021-2022, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 #ifndef ATH11K_AHB_H
 #define ATH11K_AHB_H
@@ -9,6 +10,7 @@
 
 #define ATH11K_AHB_RECOVERY_TIMEOUT (3 * HZ)
 struct ath11k_base;
+extern const struct ath11k_bus_params ath11k_ahb_hybrid_bus_params;
 
 struct ath11k_ahb {
 	struct rproc *tgt_rproc;
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 8f775cdd0b93..51f313dd7f26 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -755,6 +755,7 @@ struct ath11k_bus_params {
 	bool fixed_bdf_addr;
 	bool fixed_mem_region;
 	bool static_window_map;
+	bool hybrid_bus_type;
 };
 
 struct ath11k_pci_ops {
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 024661a17008..ddd1e2de6a2e 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -120,6 +120,7 @@ static const struct ath11k_bus_params ath11k_pci_bus_params = {
 	.m3_fw_support = true,
 	.fixed_bdf_addr = false,
 	.fixed_mem_region = false,
+	.hybrid_bus_type = false,
 };
 
 static const struct ath11k_msi_config msi_config_one_msi = {
-- 
2.35.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
