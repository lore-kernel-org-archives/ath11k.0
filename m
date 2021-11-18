Return-Path: <SRS0=Pndp=QF=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73CF7C433F5
	for <ath11k@archiver.kernel.org>; Thu, 18 Nov 2021 14:15:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3617D6113A
	for <ath11k@archiver.kernel.org>; Thu, 18 Nov 2021 14:15:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3617D6113A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ajODGiyOjKX9lD+LdRP7W1t2l+vuE71oNj1ioFf9WVk=; b=q422t/iarAkAYI
	volD3wT32KuIaDB5KOym8AgNg2UmapQToOChkhXFBy3+ssRMsjnu7fOc8meafh1lo/WEGHgJqVPwJ
	/ahNj2Cqf1PHAQUBfYpoQt7pU8ipCNGPfJ06MKoKW2ViAvq2jNToLUqWxoz7OIEFML8vmBO6XB5jU
	tDOsEJR+f+q4+pkI0Lil0YJMederaGsH3eigcP+4xgOKEC45pphbm8SP4Zi746pA8/scO3SDChNXd
	lXilcee/hShmxsir+z7ph1GVfKSI2EbdzqMo6hvZ+B+nnBeNHoytuOYwW4T/gR3X2RD7PQq4MjLIr
	5Ll23cBE5dDOV640yslA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mniC1-00847R-AG; Thu, 18 Nov 2021 14:15:13 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mniBw-00845A-LH
 for ath11k@lists.infradead.org; Thu, 18 Nov 2021 14:15:11 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637244909; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=rkeaKW1N7ZMxs/oERRuUfh83BXz8PuMjXBFR9pk5E60=;
 b=utrcnq6ITjkJViB67aWY0L9e9TgJxu+g1RbLcXo3pswGS3tGd5O+wXG7qTOLIy8uFqzBRs6b
 6Y820VVCUGDrkOKOv1UgX+007hT0+ZVgSGz81A+PUfOIw0YRxV1Ezy68r/1M361vZaO5Lg2l
 SOogMsWEF6Q3S7CrUVdPDQpLIx4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 61965feab920912d579d5191 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 18 Nov 2021 14:15:06
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 066FEC4360C; Thu, 18 Nov 2021 14:15:06 +0000 (UTC)
Received: from akolli-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akolli)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1ADE9C43616;
 Thu, 18 Nov 2021 14:15:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 1ADE9C43616
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Anilkumar Kolli <akolli@codeaurora.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
 robh@kernel.org, Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATH v3 2/2] ath11k: Use reserved host DDR addresses from DT for PCI
 devices
Date: Thu, 18 Nov 2021 19:44:52 +0530
Message-Id: <1637244892-27267-2-git-send-email-akolli@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637244892-27267-1-git-send-email-akolli@codeaurora.org>
References: <1637244892-27267-1-git-send-email-akolli@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_061509_403142_BDBF42EA 
X-CRM114-Status: GOOD (  23.18  )
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

Host DDR memory (contiguous 45 MB in mode-0 or 15 MB in mode-2)
is reserved through DT entries for firmware usage. Send the base
address from DT entries.
If DT entry is available, PCI device will work with
fixed_mem_region else host allocates multiple segments.

IPQ8074 on HK10 board supports multiple PCI devices.
IPQ8074 + QCN9074 is tested with this patch.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01838-QCAHKSWPL_SILICONZ-1

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
V3:
  - remove type cast and use of_property_read_u32_array() (Kalle)
V2:
  - Use of_ API to read from dt node (Rob)

 drivers/net/wireless/ath/ath11k/core.h |  1 +
 drivers/net/wireless/ath/ath11k/mhi.c  | 31 ++++++++++++++-
 drivers/net/wireless/ath/ath11k/pci.c  | 10 ++++-
 drivers/net/wireless/ath/ath11k/qmi.c  | 73 +++++++++++++++++++++++++++++-----
 drivers/net/wireless/ath/ath11k/qmi.h  |  1 +
 5 files changed, 104 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 2f1e10b7cc17..8492ca7efb92 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -194,6 +194,7 @@ enum ath11k_dev_flags {
 	ATH11K_FLAG_REGISTERED,
 	ATH11K_FLAG_QMI_FAIL,
 	ATH11K_FLAG_HTC_SUSPEND_COMPLETE,
+	ATH11K_FLAG_FIXED_MEM_RGN,
 };
 
 enum ath11k_monitor_flags {
diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index 26c7ae242db6..cf335c80cd11 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -3,6 +3,7 @@
 
 #include <linux/msi.h>
 #include <linux/pci.h>
+#include <linux/of.h>
 
 #include "core.h"
 #include "debug.h"
@@ -311,6 +312,26 @@ static void ath11k_mhi_op_write_reg(struct mhi_controller *mhi_cntrl,
 	writel(val, addr);
 }
 
+static bool ath11k_mhi_read_addr_from_dt(struct mhi_controller *mhi_ctrl)
+{
+	struct device_node *np;
+	u32 reg[4];
+	dma_addr_t start;
+
+	np = of_find_node_by_type(NULL, "memory");
+	if (!np)
+		return false;
+
+	if (of_property_read_u32_array(np, "reg", reg, 4))
+		return false;
+
+	start = reg[0] + reg[1];
+	mhi_ctrl->iova_start = start + 0x1000000;
+	mhi_ctrl->iova_stop = start + reg[2] + reg[3];
+
+	return true;
+}
+
 int ath11k_mhi_register(struct ath11k_pci *ab_pci)
 {
 	struct ath11k_base *ab = ab_pci->ab;
@@ -339,8 +360,14 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
 		return ret;
 	}
 
-	mhi_ctrl->iova_start = 0;
-	mhi_ctrl->iova_stop = 0xffffffff;
+	if ((test_bit(ATH11K_FLAG_FIXED_MEM_RGN, &ab->dev_flags))) {
+		if (!ath11k_mhi_read_addr_from_dt(mhi_ctrl))
+			return -ENODATA;
+	} else {
+		mhi_ctrl->iova_start = 0;
+		mhi_ctrl->iova_stop = 0xFFFFFFFF;
+	}
+
 	mhi_ctrl->sbl_size = SZ_512K;
 	mhi_ctrl->seg_len = SZ_512K;
 	mhi_ctrl->fbc_download = true;
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 3d353e7c9d5c..26378c508d28 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -6,6 +6,7 @@
 #include <linux/module.h>
 #include <linux/msi.h>
 #include <linux/pci.h>
+#include <linux/of.h>
 
 #include "pci.h"
 #include "core.h"
@@ -1225,7 +1226,7 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 {
 	struct ath11k_base *ab;
 	struct ath11k_pci *ab_pci;
-	u32 soc_hw_version_major, soc_hw_version_minor;
+	u32 soc_hw_version_major, soc_hw_version_minor, addr;
 	int ret;
 
 	ab = ath11k_core_alloc(&pdev->dev, sizeof(*ab_pci), ATH11K_BUS_PCI,
@@ -1245,6 +1246,13 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 	pci_set_drvdata(pdev, ab);
 	spin_lock_init(&ab_pci->window_lock);
 
+	/* Set fixed_mem_region to true for platforms support reserved memory
+	 * from DT. If memory is reserved from DT for FW, ath11k driver need not
+	 * allocate memory.
+	 */
+	if (!of_property_read_u32(ab->dev->of_node, "memory-region", &addr))
+		set_bit(ATH11K_FLAG_FIXED_MEM_RGN, &ab->dev_flags);
+
 	ret = ath11k_pci_claim(ab_pci, pdev);
 	if (ret) {
 		ath11k_err(ab, "failed to claim device: %d\n", ret);
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index fa73118de6db..90d11ec0d436 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1749,7 +1749,9 @@ static int ath11k_qmi_respond_fw_mem_request(struct ath11k_base *ab)
 	 * failure to FW and FW will then request mulitple blocks of small
 	 * chunk size memory.
 	 */
-	if (!ab->bus_params.fixed_mem_region && ab->qmi.target_mem_delayed) {
+	if (!(ab->bus_params.fixed_mem_region ||
+	      test_bit(ATH11K_FLAG_FIXED_MEM_RGN, &ab->dev_flags)) &&
+	      ab->qmi.target_mem_delayed) {
 		delayed = true;
 		ath11k_dbg(ab, ATH11K_DBG_QMI, "qmi delays mem_request %d\n",
 			   ab->qmi.mem_seg_count);
@@ -1815,10 +1817,12 @@ static void ath11k_qmi_free_target_mem_chunk(struct ath11k_base *ab)
 {
 	int i;
 
-	if (ab->bus_params.fixed_mem_region)
-		return;
-
 	for (i = 0; i < ab->qmi.mem_seg_count; i++) {
+		if ((ab->bus_params.fixed_mem_region ||
+		     test_bit(ATH11K_FLAG_FIXED_MEM_RGN, &ab->dev_flags)) &&
+		     ab->qmi.target_mem[i].iaddr)
+			iounmap(ab->qmi.target_mem[i].iaddr);
+
 		if (!ab->qmi.target_mem[i].vaddr)
 			continue;
 
@@ -1866,10 +1870,54 @@ static int ath11k_qmi_alloc_target_mem_chunk(struct ath11k_base *ab)
 
 static int ath11k_qmi_assign_target_mem_chunk(struct ath11k_base *ab)
 {
+	struct device *dev = ab->dev;
+	struct device_node *hremote_node = NULL;
+	phandle hremote_phandle;
+	dma_addr_t start;
+	u32 reg[4], size, host_ddr_sz;
 	int i, idx;
 
 	for (i = 0, idx = 0; i < ab->qmi.mem_seg_count; i++) {
 		switch (ab->qmi.target_mem[i].type) {
+		case HOST_DDR_REGION_TYPE:
+			if (of_property_read_u32(dev->of_node, "memory-region",
+						 &hremote_phandle)) {
+				ath11k_dbg(ab, ATH11K_DBG_QMI,
+					   "qmi fail to get hremote phandle\n");
+				return 0;
+			}
+
+			hremote_node = of_find_node_by_phandle(hremote_phandle);
+			if (!hremote_node) {
+				ath11k_dbg(ab, ATH11K_DBG_QMI,
+					   "qmi fail to get hremote_node\n");
+				return 0;
+			}
+
+			if (of_property_read_u32_array(hremote_node, "reg", reg, 4)) {
+				ath11k_dbg(ab, ATH11K_DBG_QMI,
+					   "qmi fail to get reg from hremote\n");
+				return 0;
+			}
+
+			start = reg[0] + reg[1];
+			size = reg[2] + reg[3];
+
+			if (size < ab->qmi.target_mem[i].size) {
+				ath11k_dbg(ab, ATH11K_DBG_QMI,
+					   "qmi fail to assign memory of sz %u\n", size);
+				return 0;
+			}
+
+			ab->qmi.target_mem[idx].paddr = start;
+			ab->qmi.target_mem[idx].iaddr =
+				ioremap(ab->qmi.target_mem[idx].paddr,
+					ab->qmi.target_mem[i].size);
+			ab->qmi.target_mem[idx].size = ab->qmi.target_mem[i].size;
+			host_ddr_sz = ab->qmi.target_mem[i].size;
+			ab->qmi.target_mem[idx].type = ab->qmi.target_mem[i].type;
+			idx++;
+			break;
 		case BDF_MEM_REGION_TYPE:
 			ab->qmi.target_mem[idx].paddr = ab->hw_params.bdf_addr;
 			ab->qmi.target_mem[idx].vaddr = NULL;
@@ -1884,10 +1932,16 @@ static int ath11k_qmi_assign_target_mem_chunk(struct ath11k_base *ab)
 			}
 
 			if (ath11k_cold_boot_cal && ab->hw_params.cold_boot_calib) {
-				ab->qmi.target_mem[idx].paddr =
-						     ATH11K_QMI_CALDB_ADDRESS;
-				ab->qmi.target_mem[idx].vaddr =
-						     (void *)ATH11K_QMI_CALDB_ADDRESS;
+				if (hremote_node) {
+					ab->qmi.target_mem[idx].paddr =
+							start + host_ddr_sz;
+					ab->qmi.target_mem[idx].iaddr =
+						ioremap(ab->qmi.target_mem[idx].paddr,
+							ab->qmi.target_mem[i].size);
+				} else {
+					ab->qmi.target_mem[idx].paddr =
+						ATH11K_QMI_CALDB_ADDRESS;
+				}
 			} else {
 				ab->qmi.target_mem[idx].paddr = 0;
 				ab->qmi.target_mem[idx].vaddr = NULL;
@@ -2614,7 +2668,8 @@ static void ath11k_qmi_msg_mem_request_cb(struct qmi_handle *qmi_hdl,
 			   msg->mem_seg[i].type, msg->mem_seg[i].size);
 	}
 
-	if (ab->bus_params.fixed_mem_region) {
+	if (ab->bus_params.fixed_mem_region ||
+	    test_bit(ATH11K_FLAG_FIXED_MEM_RGN, &ab->dev_flags)) {
 		ret = ath11k_qmi_assign_target_mem_chunk(ab);
 		if (ret) {
 			ath11k_warn(ab, "failed to assign qmi target memory: %d\n",
diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index 3bb0f9ef7996..f8d45b7dc821 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -95,6 +95,7 @@ struct target_mem_chunk {
 	u32 type;
 	dma_addr_t paddr;
 	u32 *vaddr;
+	void __iomem *iaddr;
 };
 
 struct target_info {
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
