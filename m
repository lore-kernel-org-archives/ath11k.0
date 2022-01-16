Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5051AC4321E
	for <ath11k@archiver.kernel.org>; Sun, 16 Jan 2022 12:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TyZoWiwTQ0BC/VKhOeM06llQvoJbVrNOBspXccajqpc=; b=KdcOijyqnbVVkE
	HLoWMCbni8DQrl86U20ReeHNXvEq2cOj2v4/h/pl664vnaIuc5CVxvGFK0K1kiWv8Gf9JuXdW01Q5
	IdyDwiPHZ1rX2niLaK0nB6AaM5ITEx3gyt4ctQUoiAZr7wXo1IrEIC7cnSwg71GJ3FL25KuJkJ4x0
	dpdhcJxHcwOeF279GohZyZHiR4zroB18PRDQz+OSKzYj9OdoWeA8zSfErkxbyDp6Aozbb+tHinZOp
	qrE4CuQ5sy3RG6fXaQUp012OhLkd+GZerXdIl82G49gt16duUbVKatSz7q/lAbAh+BbHcKOr7aHGE
	sCUplOCAseq98O3nBp6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n94wv-00CPoX-1l; Sun, 16 Jan 2022 12:47:57 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n94wq-00CPl4-V8
 for ath11k@lists.infradead.org; Sun, 16 Jan 2022 12:47:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1642337273; x=1673873273;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=KEeBZrxLsC+7Qk0cbiTj+P4PnuuRpVAeoPUOuiCRcx8=;
 b=gZfS9vcdcyul9ZPekQH7gIXpL5wPLF3C4Me6w0NcnZHrl20/q9oxT0cY
 H66wOUNn3trRjD1BrSLvvBhYg278N8upGFJUV68L52QIusjI71G+gEGqM
 rbSHAIWbiBvYeSDLSBpOsH5tXliFZ4xC7TQIaMgKaYLrwsUBtVUpRO0Ko 4=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 16 Jan 2022 04:47:49 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2022 04:47:49 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Sun, 16 Jan 2022 04:47:37 -0800
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Sun, 16 Jan 2022 04:47:34 -0800
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <robh@kernel.org>, Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Subject: [PATCH v2 03/19] ath11k: Choose MSI config based on HW revision
Date: Sun, 16 Jan 2022 18:16:59 +0530
Message-ID: <1642337235-8618-4-git-send-email-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642337235-8618-1-git-send-email-quic_mpubbise@quicinc.com>
References: <1642337235-8618-1-git-send-email-quic_mpubbise@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_044753_075275_957841F3 
X-CRM114-Status: GOOD (  17.81  )
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

Instead of selecting MSI config based on magic numbers, make
the assignment based on HW revision. The logic is similar to
the selection of HW params. This improves readability of the
code and also simplifies new additions.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00573-QCAMSLSWPLZ-1
Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1

Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/pci.c     | 31 ++++-------------
 drivers/net/wireless/ath/ath11k/pci.h     |  1 +
 drivers/net/wireless/ath/ath11k/pci_cmn.c | 58 +++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/pci_cmn.h |  1 +
 4 files changed, 66 insertions(+), 25 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 81ee647..f8548f5 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -45,28 +45,6 @@ static const struct ath11k_bus_params ath11k_pci_bus_params = {
 	.fixed_mem_region = false,
 };
 
-static const struct ath11k_msi_config ath11k_msi_config[] = {
-	{
-		.total_vectors = 32,
-		.total_users = 4,
-		.users = (struct ath11k_msi_user[]) {
-			{ .name = "MHI", .num_vectors = 3, .base_vector = 0 },
-			{ .name = "CE", .num_vectors = 10, .base_vector = 3 },
-			{ .name = "WAKE", .num_vectors = 1, .base_vector = 13 },
-			{ .name = "DP", .num_vectors = 18, .base_vector = 14 },
-		},
-	},
-	{
-		.total_vectors = 16,
-		.total_users = 3,
-		.users = (struct ath11k_msi_user[]) {
-			{ .name = "MHI", .num_vectors = 3, .base_vector = 0 },
-			{ .name = "CE", .num_vectors = 5, .base_vector = 3 },
-			{ .name = "DP", .num_vectors = 8, .base_vector = 8 },
-		},
-	},
-};
-
 static const struct ath11k_msi_config msi_config_one_msi = {
 	.total_vectors = 1,
 	.total_users = 4,
@@ -669,10 +647,8 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 			ret = -EOPNOTSUPP;
 			goto err_pci_free_region;
 		}
-		ab_pci->msi_config = &ath11k_msi_config[0];
 		break;
 	case QCN9074_DEVICE_ID:
-		ab_pci->msi_config = &ath11k_msi_config[1];
 		ab->bus_params.static_window_map = true;
 		ab->hw_rev = ATH11K_HW_QCN9074_HW10;
 		break;
@@ -702,7 +678,6 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 			ret = -EOPNOTSUPP;
 			goto err_pci_free_region;
 		}
-		ab_pci->msi_config = &ath11k_msi_config[0];
 		break;
 	default:
 		dev_err(&pdev->dev, "Unknown PCI device found: 0x%x\n",
@@ -711,6 +686,12 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 		goto err_pci_free_region;
 	}
 
+	ret = ath11k_pci_get_msi_config(ab);
+	if (ret) {
+		ath11k_err(ab, "failed to fetch msi config: %d\n", ret);
+		goto err_pci_free_region;
+	}
+
 	ret = ath11k_pci_alloc_msi(ab_pci);
 	if (ret) {
 		ath11k_err(ab, "failed to enable msi: %d\n", ret);
diff --git a/drivers/net/wireless/ath/ath11k/pci.h b/drivers/net/wireless/ath/ath11k/pci.h
index 35c8152..03868f3f 100644
--- a/drivers/net/wireless/ath/ath11k/pci.h
+++ b/drivers/net/wireless/ath/ath11k/pci.h
@@ -63,6 +63,7 @@ struct ath11k_msi_config {
 	int total_vectors;
 	int total_users;
 	struct ath11k_msi_user *users;
+	u16 hw_rev;
 };
 
 enum ath11k_pci_flags {
diff --git a/drivers/net/wireless/ath/ath11k/pci_cmn.c b/drivers/net/wireless/ath/ath11k/pci_cmn.c
index 0e3a98b..b5eca2d 100644
--- a/drivers/net/wireless/ath/ath11k/pci_cmn.c
+++ b/drivers/net/wireless/ath/ath11k/pci_cmn.c
@@ -63,6 +63,64 @@ static const char *irq_name[ATH11K_IRQ_NUM_MAX] = {
 	"tcl2host-status-ring",
 };
 
+static const struct ath11k_msi_config ath11k_msi_config[] = {
+	{
+		.total_vectors = 32,
+		.total_users = 4,
+		.users = (struct ath11k_msi_user[]) {
+			{ .name = "MHI", .num_vectors = 3, .base_vector = 0 },
+			{ .name = "CE", .num_vectors = 10, .base_vector = 3 },
+			{ .name = "WAKE", .num_vectors = 1, .base_vector = 13 },
+			{ .name = "DP", .num_vectors = 18, .base_vector = 14 },
+		},
+		.hw_rev = ATH11K_HW_QCA6390_HW20,
+	},
+	{
+		.total_vectors = 16,
+		.total_users = 3,
+		.users = (struct ath11k_msi_user[]) {
+			{ .name = "MHI", .num_vectors = 3, .base_vector = 0 },
+			{ .name = "CE", .num_vectors = 5, .base_vector = 3 },
+			{ .name = "DP", .num_vectors = 8, .base_vector = 8 },
+		},
+		.hw_rev = ATH11K_HW_QCN9074_HW10,
+	},
+	{
+		.total_vectors = 32,
+		.total_users = 4,
+		.users = (struct ath11k_msi_user[]) {
+			{ .name = "MHI", .num_vectors = 3, .base_vector = 0 },
+			{ .name = "CE", .num_vectors = 10, .base_vector = 3 },
+			{ .name = "WAKE", .num_vectors = 1, .base_vector = 13 },
+			{ .name = "DP", .num_vectors = 18, .base_vector = 14 },
+		},
+		.hw_rev = ATH11K_HW_WCN6855_HW20,
+	},
+};
+
+int ath11k_pci_get_msi_config(struct ath11k_base *ab)
+{
+	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
+	const struct ath11k_msi_config *msi_config;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(ath11k_msi_config); i++) {
+		msi_config = &ath11k_msi_config[i];
+
+		if (msi_config->hw_rev == ab->hw_rev)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(ath11k_msi_config)) {
+		ath11k_err(ab, "failed to fetch msi config, unsupported hw version: 0x%x\n",
+			   ab->hw_rev);
+		return -EINVAL;
+	}
+
+	ab_pci->msi_config = msi_config;
+	return 0;
+}
+
 void ath11k_pci_aspm_restore(struct ath11k_pci *ab_pci)
 {
 	if (test_and_clear_bit(ATH11K_PCI_ASPM_RESTORE, &ab_pci->flags))
diff --git a/drivers/net/wireless/ath/ath11k/pci_cmn.h b/drivers/net/wireless/ath/ath11k/pci_cmn.h
index 5fb1cf1..f5916da 100644
--- a/drivers/net/wireless/ath/ath11k/pci_cmn.h
+++ b/drivers/net/wireless/ath/ath11k/pci_cmn.h
@@ -50,4 +50,5 @@ int ath11k_get_user_msi_assignment(struct ath11k_base *ab, char *user_name,
 void ath11k_pci_aspm_restore(struct ath11k_pci *ab_pci);
 int ath11k_pci_set_irq_affinity_hint(struct ath11k_pci *ab_pci,
 				     const struct cpumask *m);
+int ath11k_pci_get_msi_config(struct ath11k_base *ab);
 #endif
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
