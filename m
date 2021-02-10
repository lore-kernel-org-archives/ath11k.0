Return-Path: <SRS0=WqG4=HM=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14F50C433E0
	for <ath11k@archiver.kernel.org>; Wed, 10 Feb 2021 08:42:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B513464E2A
	for <ath11k@archiver.kernel.org>; Wed, 10 Feb 2021 08:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B513464E2A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QE5h0OroN5Cg7tB88fGkM8uVdVgR3C/rYSXueOi74fs=; b=TKoZU723n9Uano0wwzBvzeHQzH
	dHUZZKyCJEjjtWtEjBUotVQwmiYRD5k+ZETgdTBdPoTiWUF8y4mXTgsgL2iUUtbRlVYYTJvvfCesb
	AHcFXQ0jSSE4Q2WUkxcD5j0nhBAhForiosjf2BGvMHuUc9LngBUlVwRnN3ab2bRxNmfkBlrnaJM0J
	ILf5j4AA0jeiE/ZfbgnFd1QexYVoY1jU+hbW8xShPo7ihQp98Gqvnn7lKDdHxkXk9sirc/8rgD5m0
	2jofVgOhx1hst2+cpDqOvWFEKrMX0fmYEhu4SOSjHuUd1npzoeoy55YBgTh1Cl9P2EWlLLVB633XM
	rzsEtkaw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9l5L-0006vE-54; Wed, 10 Feb 2021 08:42:55 +0000
Received: from so15.mailgun.net ([198.61.254.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9l5E-0006lH-Qe
 for ath11k@lists.infradead.org; Wed, 10 Feb 2021 08:42:52 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1612946570; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=BBsLnbBmUXR8PDMx9J7saA0GhoiQeq4eDjJpAjxuJ/s=;
 b=qxhC4Hm4xJX5tXz+HmlkhOJhhbtfaKInk+m6xlSXtgbbHzEB8pCxS5WADi6k3wqmtLGctabw
 ZEhRD9E+McmJ1YwwaD2fk1GqAGKJgKTg1eSUY+I0MPFT5WZcf0KLl7RASy7K+XH75/hEOVc/
 RJDH1viIBN9l6Rz+O+hZwgj1vbs=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 60239c86f112b7872c64145f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Feb 2021 08:42:46
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4A6C8C43466; Wed, 10 Feb 2021 08:42:46 +0000 (UTC)
Received: from vnaralas-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akolli)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 77D5BC43468;
 Wed, 10 Feb 2021 08:42:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 77D5BC43468
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akolli@codeaurora.org
From: Anilkumar Kolli <akolli@codeaurora.org>
To: ath11k@lists.infradead.org
Subject: [PATCH 11/11] ath11k: add qcn9074 pci device support
Date: Wed, 10 Feb 2021 14:12:10 +0530
Message-Id: <1612946530-28504-12-git-send-email-akolli@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612946530-28504-1-git-send-email-akolli@codeaurora.org>
References: <1612946530-28504-1-git-send-email-akolli@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_034250_781413_489E4C32 
X-CRM114-Status: GOOD (  16.02  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: Anilkumar Kolli <akolli@codeaurora.org>, linux-wireless@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

QCN9074 is PCI based 11ax radio.
	- has 2G/5G/6G variants.
	- has NSS 2x2 and 4x4 variants.

QCN9074 uses 45MB of HOST DDR memory, target requests host memory in
segments, each segment is of 2MB size and is physcial contiguous and
use static window configuration.

Below QMI issues are seen with QCN9074,
Issue 1:
 ath11k_pci 0000:06:00.0: qmi failed memory request, err = -110
 ath11k_pci 0000:06:00.0: qmi failed to respond fw mem req:-110
Issue 2:
 ath11k_pci 0000:06:00.0: firmware crashed: MHI_CB_SYS_ERROR
 ath11k_pci 0000:06:00.0: qmi failed set mode request, mode: 0, err = -110
 ath11k_pci 0000:06:00.0: qmi failed to send wlan fw mode:-110

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1.r2-00012-QCAHKSWPL_SILICONZ-1

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/pci.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 70dcb80475b1..259a39e59a91 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -34,10 +34,12 @@
  */
 #define ACCESS_ALWAYS_OFF 0xFE0
 
-#define QCA6390_DEVICE_ID		0x1101
+#define QCA6390_DEVICE_ID              0x1101
+#define QCN9074_DEVICE_ID              0x1104
 
 static const struct pci_device_id ath11k_pci_id_table[] = {
 	{ PCI_VDEVICE(QCOM, QCA6390_DEVICE_ID) },
+	{ PCI_VDEVICE(QCOM, QCN9074_DEVICE_ID) },
 	{0}
 };
 
@@ -61,6 +63,15 @@ static const struct ath11k_msi_config ath11k_msi_config[] = {
 			{ .name = "DP", .num_vectors = 18, .base_vector = 14 },
 		},
 	},
+	{
+		.total_vectors = 16,
+		.total_users = 3,
+		.users = (struct ath11k_msi_user[]) {
+			{ .name = "MHI", .num_vectors = 3, .base_vector = 0 },
+			{ .name = "CE", .num_vectors = 5, .base_vector = 3 },
+			{ .name = "DP", .num_vectors = 8, .base_vector = 8 },
+		},
+	},
 };
 
 static const char *irq_name[ATH11K_IRQ_NUM_MAX] = {
@@ -1219,6 +1230,12 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 			ret = -EOPNOTSUPP;
 			goto err_pci_free_region;
 		}
+		ab_pci->msi_config = &ath11k_msi_config[0];
+		break;
+	case QCN9074_DEVICE_ID:
+		ab_pci->msi_config = &ath11k_msi_config[1];
+		ab->bus_params.static_window_map = true;
+		ab->hw_rev = ATH11K_HW_QCN9074_HW10;
 		break;
 	default:
 		dev_err(&pdev->dev, "Unknown PCI device found: 0x%x\n",
@@ -1227,7 +1244,6 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 		goto err_pci_free_region;
 	}
 
-	ab_pci->msi_config = &ath11k_msi_config[0];
 	ret = ath11k_pci_enable_msi(ab_pci);
 	if (ret) {
 		ath11k_err(ab, "failed to enable msi: %d\n", ret);
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
