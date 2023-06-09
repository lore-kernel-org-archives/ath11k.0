Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D93C7EE43
	for <ath11k@archiver.kernel.org>; Fri,  9 Jun 2023 14:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lsYz9+aG3amuyhthcuS1VJH0Y+cCklRRXt3gzSmtJmo=; b=ELw+ymr1hhDf2d
	70luHhCDwV37m8pWGFq/2Zcns/LuAjFOwvIGPYpy363JzYUL1V2uc+3xGw5CcYFRhb5P7fF/AQxAy
	2TBLEDfmHJ7JPHR3kYZ7pUIpeZ3v+iXjZfAyTSOKik9apr0XcmjqNDDx18v/6735Y/3G1+/PiQSiE
	04v74P60k/FvWpxf5Q4rPMVejPONd7P4F+XCBV6A07pIGtIDDm7Oh9RpC5OS/3HxFd9p6MX5nrB/i
	kVnFYBjZVvc+X4Vun16jSZ1x2exqByz95rZ12sAVCSj2E7ny/uLkfrqHeCrMHF9cG68B4sqJQxpWE
	FXk0akQn44re2okFTeOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7d2u-00DFcT-2h;
	Fri, 09 Jun 2023 14:24:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7d2s-00DFXJ-02
	for ath11k@lists.infradead.org;
	Fri, 09 Jun 2023 14:24:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D5E6B60F55
	for <ath11k@lists.infradead.org>; Fri,  9 Jun 2023 14:24:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1ACEC4339B;
	Fri,  9 Jun 2023 14:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686320693;
	bh=XJM4efbDN9/nsy1quLg+hU/zIBHiE+i02mW42DmLAtY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aj09FfOaAdDTmX8+oRCeGbr1u6/gOXT/M7TZd74w3//wIvOLv5NxlKYhyrugJ+Kze
	 bagLj7t4EtpH8ZNIc4BaM81KFSycf9FHDWrBQ1auWpTvpJOX4vboQELtmxtUX9vuJG
	 PCWKDxtv+mgwcI3vP2nTl6lmRk6ucIhCV7sK/zEge9hkI/s+WppdW1C7drEUqxLq/T
	 G3XzL6BihHyOy6XLrOvKKIczAdHC6r3lXp13U8vrjg/PXieKwfDQYBhQ9dlEmVZcy7
	 uU1GB5WpHVtT51Ul1UF7d06xPsnn/P+8vvVBFTHVvQJm8FgecBrtSXy5GyVgeB4ohQ
	 RRwA8FtHuTqeg==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 09/15] wifi: ath11k: pci: cleanup debug logging
Date: Fri,  9 Jun 2023 17:24:34 +0300
Message-Id: <20230609142440.24643-10-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230609142440.24643-1-kvalo@kernel.org>
References: <20230609142440.24643-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_072454_125544_E29DE7DE 
X-CRM114-Status: GOOD (  13.49  )
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

From: Kalle Valo <quic_kvalo@quicinc.com>

For better readability fix PCI debug messages to follow the preferred style.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mhi.c  |  4 ++--
 drivers/net/wireless/ath/ath11k/pci.c  | 10 +++++-----
 drivers/net/wireless/ath/ath11k/pcic.c |  6 +++---
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index d5f25e708bdc..3ac689f1def4 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -211,7 +211,7 @@ void ath11k_mhi_set_mhictrl_reset(struct ath11k_base *ab)
 
 	val = ath11k_pcic_read32(ab, MHISTATUS);
 
-	ath11k_dbg(ab, ATH11K_DBG_PCI, "MHISTATUS 0x%x\n", val);
+	ath11k_dbg(ab, ATH11K_DBG_PCI, "mhistatus 0x%x\n", val);
 
 	/* Observed on QCA6390 that after SOC_GLOBAL_RESET, MHISTATUS
 	 * has SYSERR bit set and thus need to set MHICTRL_RESET
@@ -263,7 +263,7 @@ static int ath11k_mhi_get_msi(struct ath11k_pci *ab_pci)
 	if (ret)
 		return ret;
 
-	ath11k_dbg(ab, ATH11K_DBG_PCI, "Number of assigned MSI for MHI is %d, base vector is %d\n",
+	ath11k_dbg(ab, ATH11K_DBG_PCI, "num_vectors %d base_vector %d\n",
 		   num_vectors, base_vector);
 
 	irq = kcalloc(num_vectors, sizeof(int), GFP_KERNEL);
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 75157e6be632..ee67bfd90abe 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -203,10 +203,10 @@ static void ath11k_pci_clear_dbg_registers(struct ath11k_base *ab)
 
 	/* read cookie */
 	val = ath11k_pcic_read32(ab, PCIE_Q6_COOKIE_ADDR);
-	ath11k_dbg(ab, ATH11K_DBG_PCI, "cookie:0x%x\n", val);
+	ath11k_dbg(ab, ATH11K_DBG_PCI, "pcie_q6_cookie_addr 0x%x\n", val);
 
 	val = ath11k_pcic_read32(ab, WLAON_WARM_SW_ENTRY);
-	ath11k_dbg(ab, ATH11K_DBG_PCI, "WLAON_WARM_SW_ENTRY 0x%x\n", val);
+	ath11k_dbg(ab, ATH11K_DBG_PCI, "wlaon_warm_sw_entry 0x%x\n", val);
 
 	/* TODO: exact time to sleep is uncertain */
 	mdelay(10);
@@ -218,13 +218,13 @@ static void ath11k_pci_clear_dbg_registers(struct ath11k_base *ab)
 	mdelay(10);
 
 	val = ath11k_pcic_read32(ab, WLAON_WARM_SW_ENTRY);
-	ath11k_dbg(ab, ATH11K_DBG_PCI, "WLAON_WARM_SW_ENTRY 0x%x\n", val);
+	ath11k_dbg(ab, ATH11K_DBG_PCI, "wlaon_warm_sw_entry 0x%x\n", val);
 
 	/* A read clear register. clear the register to prevent
 	 * Q6 from entering wrong code path.
 	 */
 	val = ath11k_pcic_read32(ab, WLAON_SOC_RESET_CAUSE_REG);
-	ath11k_dbg(ab, ATH11K_DBG_PCI, "soc reset cause:%d\n", val);
+	ath11k_dbg(ab, ATH11K_DBG_PCI, "soc reset cause %d\n", val);
 }
 
 static int ath11k_pci_set_link_reg(struct ath11k_base *ab,
@@ -433,7 +433,7 @@ static int ath11k_pci_alloc_msi(struct ath11k_pci *ab_pci)
 		}
 		clear_bit(ATH11K_FLAG_MULTI_MSI_VECTORS, &ab->dev_flags);
 		ab->pci.msi.config = &msi_config_one_msi;
-		ath11k_dbg(ab, ATH11K_DBG_PCI, "request MSI one vector\n");
+		ath11k_dbg(ab, ATH11K_DBG_PCI, "request one msi vector\n");
 	}
 	ath11k_info(ab, "MSI vectors: %d\n", num_vectors);
 
diff --git a/drivers/net/wireless/ath/ath11k/pcic.c b/drivers/net/wireless/ath/ath11k/pcic.c
index 30d66147223f..c899616fbee4 100644
--- a/drivers/net/wireless/ath/ath11k/pcic.c
+++ b/drivers/net/wireless/ath/ath11k/pcic.c
@@ -263,7 +263,7 @@ int ath11k_pcic_get_user_msi_assignment(struct ath11k_base *ab, char *user_name,
 			*user_base_data = *base_vector + ab->pci.msi.ep_base_data;
 
 			ath11k_dbg(ab, ATH11K_DBG_PCI,
-				   "Assign MSI to user: %s, num_vectors: %d, user_base_data: %u, base_vector: %u\n",
+				   "msi assignment %s num_vectors %d user_base_data %u base_vector %u\n",
 				   user_name, *num_vectors, *user_base_data,
 				   *base_vector);
 
@@ -527,7 +527,7 @@ static irqreturn_t ath11k_pcic_ext_interrupt_handler(int irq, void *arg)
 	if (!test_bit(ATH11K_FLAG_EXT_IRQ_ENABLED, &ab->dev_flags))
 		return IRQ_HANDLED;
 
-	ath11k_dbg(irq_grp->ab, ATH11K_DBG_PCI, "ext irq:%d\n", irq);
+	ath11k_dbg(irq_grp->ab, ATH11K_DBG_PCI, "ext irq %d\n", irq);
 
 	/* last interrupt received for this group */
 	irq_grp->timestamp = jiffies;
@@ -597,7 +597,7 @@ static int ath11k_pcic_ext_irq_config(struct ath11k_base *ab)
 			ab->irq_num[irq_idx] = irq;
 
 			ath11k_dbg(ab, ATH11K_DBG_PCI,
-				   "irq:%d group:%d\n", irq, i);
+				   "irq %d group %d\n", irq, i);
 
 			irq_set_status_flags(irq, IRQ_DISABLE_UNLAZY);
 			ret = request_irq(irq, ath11k_pcic_ext_interrupt_handler,
-- 
2.30.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
