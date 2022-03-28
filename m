Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8FACC433EF
	for <ath11k@archiver.kernel.org>; Mon, 28 Mar 2022 05:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=faCvHwUbf7MhLKPB59WTS+5hUCelynz2yQ7axilym6k=; b=oGFLoQL8/52LWM
	I5dNKyA9gkLW3NU9QI/Tl2OKf6qunAuJnDR/U4P7dbs+AD9QYjJELDqWcTN44ixnJUeIkvRD81CEr
	WpehqQuxsfLqe4lBiW9yowQgjLi7zowHBLIBhTlo5Z30oSTalv1aihwp9gjlVUMGuiEkHUViiAGnz
	iuuYOebNxuf7+9wNtl/vR+xrwdXb6hZfL1eNKEgBoY//YlwT9nyJL/xE+jLCiciSQhQtiwEuC8cWO
	PEz1LL724lLIHjnfrouYLy88MQslbH8EvRXJjBTDWh8d8fKvgeAF+3QqMgg8XST1pyLa4CQqJY+RZ
	cJyBFazJvZNm2a6v7G2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYiNw-007Mx4-Qi; Mon, 28 Mar 2022 05:57:48 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYiNt-007Mu0-7h
 for ath11k@lists.infradead.org; Mon, 28 Mar 2022 05:57:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648447065; x=1679983065;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=93Bkt8yN2Yi4EfTLh9I87JFjQSNdnYmuUNO/BJ0pbiw=;
 b=oeBVVUnuD07KWxwbl19EQjmLdKun43A4O3WaxhcPo/+meY6K2JzI1Jti
 8ZnPp2ITIfuMjQEf2R+zFhOHFgeA0zSyR2VSUe8jb/IkHQREec+Ggf1Zw
 TC/g6VonN5+QKNjCRMLh3RBOjqsUTfqWJ08r6SnB/m/w37kKd2/IylZnL s=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 27 Mar 2022 22:57:45 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2022 22:57:45 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sun, 27 Mar 2022 22:57:44 -0700
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sun, 27 Mar 2022 22:57:42 -0700
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Manikanta Pubbisetty
 <quic_mpubbise@quicinc.com>
Subject: [PATCH v3 3/5] ath11k: Choose MSI config based on HW revision
Date: Mon, 28 Mar 2022 11:27:12 +0530
Message-ID: <20220328055714.6449-4-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220328055714.6449-1-quic_mpubbise@quicinc.com>
References: <20220328055714.6449-1-quic_mpubbise@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220327_225745_343157_5F2A6A00 
X-CRM114-Status: GOOD (  17.11  )
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

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1

Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/pci.c  | 31 +++---------
 drivers/net/wireless/ath/ath11k/pci.h  |  1 +
 drivers/net/wireless/ath/ath11k/pcic.c | 70 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/pcic.h |  1 +
 4 files changed, 78 insertions(+), 25 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index bffbcace63ae..ab6572b14937 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -43,28 +43,6 @@ static const struct ath11k_bus_params ath11k_pci_bus_params = {
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
@@ -667,10 +645,8 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
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
@@ -700,7 +676,6 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 			ret = -EOPNOTSUPP;
 			goto err_pci_free_region;
 		}
-		ab_pci->msi_config = &ath11k_msi_config[0];
 		break;
 	default:
 		dev_err(&pdev->dev, "Unknown PCI device found: 0x%x\n",
@@ -709,6 +684,12 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 		goto err_pci_free_region;
 	}
 
+	ret = ath11k_pcic_init_msi_config(ab);
+	if (ret) {
+		ath11k_err(ab, "failed to init msi config: %d\n", ret);
+		goto err_pci_free_region;
+	}
+
 	ret = ath11k_pci_alloc_msi(ab_pci);
 	if (ret) {
 		ath11k_err(ab, "failed to enable msi: %d\n", ret);
diff --git a/drivers/net/wireless/ath/ath11k/pci.h b/drivers/net/wireless/ath/ath11k/pci.h
index 038e4152987c..7e225de6eb6e 100644
--- a/drivers/net/wireless/ath/ath11k/pci.h
+++ b/drivers/net/wireless/ath/ath11k/pci.h
@@ -63,6 +63,7 @@ struct ath11k_msi_config {
 	int total_vectors;
 	int total_users;
 	struct ath11k_msi_user *users;
+	u16 hw_rev;
 };
 
 enum ath11k_pci_flags {
diff --git a/drivers/net/wireless/ath/ath11k/pcic.c b/drivers/net/wireless/ath/ath11k/pcic.c
index 391c308455e5..eab153453106 100644
--- a/drivers/net/wireless/ath/ath11k/pcic.c
+++ b/drivers/net/wireless/ath/ath11k/pcic.c
@@ -63,6 +63,76 @@ static const char *irq_name[ATH11K_IRQ_NUM_MAX] = {
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
+	{
+		.total_vectors = 32,
+		.total_users = 4,
+		.users = (struct ath11k_msi_user[]) {
+			{ .name = "MHI", .num_vectors = 3, .base_vector = 0 },
+			{ .name = "CE", .num_vectors = 10, .base_vector = 3 },
+			{ .name = "WAKE", .num_vectors = 1, .base_vector = 13 },
+			{ .name = "DP", .num_vectors = 18, .base_vector = 14 },
+		},
+		.hw_rev = ATH11K_HW_WCN6855_HW21,
+	},
+};
+
+int ath11k_pcic_init_msi_config(struct ath11k_base *ab)
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
+EXPORT_SYMBOL(ath11k_pcic_init_msi_config);
+
 void ath11k_pcic_aspm_restore(struct ath11k_pci *ab_pci)
 {
 	if (test_and_clear_bit(ATH11K_PCI_ASPM_RESTORE, &ab_pci->flags))
diff --git a/drivers/net/wireless/ath/ath11k/pcic.h b/drivers/net/wireless/ath/ath11k/pcic.h
index 6780f7e8bc64..d5fe315ccc61 100644
--- a/drivers/net/wireless/ath/ath11k/pcic.h
+++ b/drivers/net/wireless/ath/ath11k/pcic.h
@@ -50,4 +50,5 @@ int ath11k_get_user_msi_assignment(struct ath11k_base *ab, char *user_name,
 void ath11k_pcic_aspm_restore(struct ath11k_pci *ab_pci);
 int ath11k_pcic_set_irq_affinity_hint(struct ath11k_pci *ab_pci,
 				      const struct cpumask *m);
+int ath11k_pcic_init_msi_config(struct ath11k_base *ab);
 #endif
-- 
2.35.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
