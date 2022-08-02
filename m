Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1640CC00140
	for <ath11k@archiver.kernel.org>; Tue,  2 Aug 2022 07:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oNleeg0Vi9kx95HZWzgKEWpEaMnZ6xsXEs7gW0WhrDc=; b=tNuHJvmUlU/pss
	zlCQ8Fjzg3yWSOmLShI2353dscUfe2JbU6ypQS0oLgyK662LUpetdOe0089hEm5rndzOJB35rkQwC
	u/vQBts9bJJl1eKwfnGAAs35bR5LU11oEPRWlSMLPfrdtMOKWdXEJccBJq05smHh6o1QBVhy6aQ59
	IArB47QKynE5Emb7ztEtv3RS5k1IJL3ro3ZpQczB4JOItvTce4SCUQxh/4C9xUm/L14oMWanS7sWt
	MdFUFnDA0rWt0CBJ6woQOkLRcLQGOxmafnWcn+qZTPXK+6xsQmkM0OfV2o2X03z1nVVk2CEC4WaG0
	iwTxi/tfASBiG4tRF6wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oImlF-00BZCX-G7; Tue, 02 Aug 2022 07:56:17 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIml5-00BZ1y-Th
	for ath11k@lists.infradead.org; Tue, 02 Aug 2022 07:56:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1659426967; x=1690962967;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2OVORaTVItjsSXwRIf9omLMX8UTzvsqWk2fA5aAbF5g=;
  b=KYwTTLeyopq/wmpTQxV6NU1jEfvQ6M5eck+BIZxcRB5huAyVat1Cg0jP
   dJGpbLFSIOOsQpt0dJPxU0GfrMD4SdtqBVpd/EjZzq6SWkllmeSSUdCb8
   fwZqMNR6eTSX6imJ3dY8FM+N2noN8Q+AtFNyxwXFPWE1yRAzLx4KEj/W+
   s=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 02 Aug 2022 00:55:58 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2022 00:55:58 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 2 Aug 2022 00:55:58 -0700
Received: from bqiang-Celadon-RN.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 2 Aug 2022 00:55:57 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH v2 1/2] wifi: ath11k: Split PCI write/read functions
Date: Tue, 2 Aug 2022 15:55:32 +0800
Message-ID: <20220802075533.1744-2-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220802075533.1744-1-quic_bqiang@quicinc.com>
References: <20220802075533.1744-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_005608_110919_CC68DC89 
X-CRM114-Status: GOOD (  12.85  )
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

ath11k_pcic_write32/read32 tries to do wake up before doing actual
write/read work, which means each time a u32 is written/read, wake
up is performed. This is not necessary in case where we do a
large amount of write/read, because only one time of wake up is needed.
So split each one into two parts, the first part does wake up and
release, and the second one does actual write/read work.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
v2:
  1: rebased on latest ath.git

 drivers/net/wireless/ath/ath11k/pcic.c | 50 ++++++++++++++++----------
 1 file changed, 32 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/pcic.c b/drivers/net/wireless/ath/ath11k/pcic.c
index 1adf20ebef27..15ca069e501f 100644
--- a/drivers/net/wireless/ath/ath11k/pcic.c
+++ b/drivers/net/wireless/ath/ath11k/pcic.c
@@ -140,49 +140,63 @@ int ath11k_pcic_init_msi_config(struct ath11k_base *ab)
 }
 EXPORT_SYMBOL(ath11k_pcic_init_msi_config);
 
+static void ath11k_pcic_do_write32(struct ath11k_base *ab, u32 offset, u32 value)
+{
+	if (offset < ATH11K_PCI_WINDOW_START)
+		iowrite32(value, ab->mem  + offset);
+	else
+		ab->pci.ops->window_write32(ab, offset, value);
+}
+
 void ath11k_pcic_write32(struct ath11k_base *ab, u32 offset, u32 value)
 {
 	int ret = 0;
+	bool wakeup_required;
 
 	/* for offset beyond BAR + 4K - 32, may
 	 * need to wakeup the device to access.
 	 */
-	if (test_bit(ATH11K_FLAG_DEVICE_INIT_DONE, &ab->dev_flags) &&
-	    offset >= ATH11K_PCI_ACCESS_ALWAYS_OFF && ab->pci.ops->wakeup)
+	wakeup_required = test_bit(ATH11K_FLAG_DEVICE_INIT_DONE, &ab->dev_flags) &&
+			  offset >= ATH11K_PCI_ACCESS_ALWAYS_OFF;
+	if (wakeup_required && ab->pci.ops->wakeup)
 		ret = ab->pci.ops->wakeup(ab);
 
-	if (offset < ATH11K_PCI_WINDOW_START)
-		iowrite32(value, ab->mem  + offset);
-	else
-		ab->pci.ops->window_write32(ab, offset, value);
+	ath11k_pcic_do_write32(ab, offset, value);
 
-	if (test_bit(ATH11K_FLAG_DEVICE_INIT_DONE, &ab->dev_flags) &&
-	    offset >= ATH11K_PCI_ACCESS_ALWAYS_OFF && ab->pci.ops->release &&
-	    !ret)
+	if (wakeup_required && !ret && ab->pci.ops->release)
 		ab->pci.ops->release(ab);
 }
 EXPORT_SYMBOL(ath11k_pcic_write32);
 
+static u32 ath11k_pcic_do_read32(struct ath11k_base *ab, u32 offset)
+{
+	u32 val;
+
+	if (offset < ATH11K_PCI_WINDOW_START)
+		val = ioread32(ab->mem + offset);
+	else
+		val = ab->pci.ops->window_read32(ab, offset);
+
+	return val;
+}
+
 u32 ath11k_pcic_read32(struct ath11k_base *ab, u32 offset)
 {
 	int ret = 0;
 	u32 val;
+	bool wakeup_required;
 
 	/* for offset beyond BAR + 4K - 32, may
 	 * need to wakeup the device to access.
 	 */
-	if (test_bit(ATH11K_FLAG_DEVICE_INIT_DONE, &ab->dev_flags) &&
-	    offset >= ATH11K_PCI_ACCESS_ALWAYS_OFF && ab->pci.ops->wakeup)
+	wakeup_required = test_bit(ATH11K_FLAG_DEVICE_INIT_DONE, &ab->dev_flags) &&
+			  offset >= ATH11K_PCI_ACCESS_ALWAYS_OFF;
+	if (wakeup_required && ab->pci.ops->wakeup)
 		ret = ab->pci.ops->wakeup(ab);
 
-	if (offset < ATH11K_PCI_WINDOW_START)
-		val = ioread32(ab->mem + offset);
-	else
-		val = ab->pci.ops->window_read32(ab, offset);
+	val = ath11k_pcic_do_read32(ab, offset);
 
-	if (test_bit(ATH11K_FLAG_DEVICE_INIT_DONE, &ab->dev_flags) &&
-	    offset >= ATH11K_PCI_ACCESS_ALWAYS_OFF && ab->pci.ops->release &&
-	    !ret)
+	if (wakeup_required && !ret && ab->pci.ops->release)
 		ab->pci.ops->release(ab);
 
 	return val;
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
