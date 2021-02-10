Return-Path: <SRS0=WqG4=HM=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23CC5C433E0
	for <ath11k@archiver.kernel.org>; Wed, 10 Feb 2021 08:42:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAEB164E2A
	for <ath11k@archiver.kernel.org>; Wed, 10 Feb 2021 08:42:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAEB164E2A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+h/y+yzQeMNNPIJ86CsSKhMxOCxkJy9DJfjjBKQm1/8=; b=piAW+pHesDkHD3g7+TuewI4MXW
	qZAV0R4ew0i0yOjI53dzgqctztIeL8mcFTkH9HImHl5yCZBXrDHrmHa1e1pn9zbr7WOUha68aMGUS
	dm8qDicF9Mmkw6mkiZMPEiY3xOVqfMvJLaX8brdQKXTZ0JirpamcXE07xf/VTbW1TZKx9O8EyN2dt
	Zj68dGJh7DOkCx9lwF5jE+fJc4e1M5xCTiDnKe+a4VzQGbv2yXJG/L2YAUaa1feQhXwDjDtFQphKp
	PcA/BJD2IpfwAkMlvrMrYYD+al/UR5qiLtUToLetC2WVbife+TLBLEcPFOSnRxF/HAf4oQwTpwt1t
	YCtNupOg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9l50-0006m9-1B; Wed, 10 Feb 2021 08:42:34 +0000
Received: from so15.mailgun.net ([198.61.254.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9l4w-0006kY-7o
 for ath11k@lists.infradead.org; Wed, 10 Feb 2021 08:42:31 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1612946550; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=p9ct0e2K+fGsSZ5H5jmyA1gY6fdoFbdvJP63mSfFcEE=;
 b=RcUpgSCdMGdqEps3zsLXawXoQrNYw/oKjmUAZ6MP756vuvaRgoJoWhnzlGOlDfaW7Gmy8evS
 ycawX3gKkf2A33uPKKhKSYa4B93WKqTnfTWnVQl0Io89o8gAAe+Uh6rYU3JpqWyzyMoeTAl8
 OHVd8e4UDZpOurP1pQ9BYtafbJY=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60239c71f112b7872c63ee26 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Feb 2021 08:42:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A8214C433C6; Wed, 10 Feb 2021 08:42:25 +0000 (UTC)
Received: from vnaralas-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akolli)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7F5EFC433C6;
 Wed, 10 Feb 2021 08:42:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7F5EFC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akolli@codeaurora.org
From: Anilkumar Kolli <akolli@codeaurora.org>
To: ath11k@lists.infradead.org
Subject: [PATCH 01/11] ath11k: Refactor ath11k_msi_config
Date: Wed, 10 Feb 2021 14:12:00 +0530
Message-Id: <1612946530-28504-2-git-send-email-akolli@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612946530-28504-1-git-send-email-akolli@codeaurora.org>
References: <1612946530-28504-1-git-send-email-akolli@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_034230_924046_57F8849B 
X-CRM114-Status: GOOD (  17.60  )
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

Move ath11k_msi_config to array of structures to add multiple
pci devices support. No functional changes.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1.r2-00012-QCAHKSWPL_SILICONZ-1

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/pci.c | 39 ++++++++++++++++++++---------------
 drivers/net/wireless/ath/ath11k/pci.h |  1 +
 2 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 78478b2b3ba5..0c6a6e7ef252 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -50,14 +50,16 @@ static const struct ath11k_bus_params ath11k_pci_bus_params = {
 	.fixed_mem_region = false,
 };
 
-static const struct ath11k_msi_config msi_config = {
-	.total_vectors = 32,
-	.total_users = 4,
-	.users = (struct ath11k_msi_user[]) {
-		{ .name = "MHI", .num_vectors = 3, .base_vector = 0 },
-		{ .name = "CE", .num_vectors = 10, .base_vector = 3 },
-		{ .name = "WAKE", .num_vectors = 1, .base_vector = 13 },
-		{ .name = "DP", .num_vectors = 18, .base_vector = 14 },
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
 	},
 };
 
@@ -406,14 +408,15 @@ int ath11k_pci_get_user_msi_assignment(struct ath11k_pci *ab_pci, char *user_nam
 				       u32 *base_vector)
 {
 	struct ath11k_base *ab = ab_pci->ab;
+	const struct ath11k_msi_config *msi_config = ab_pci->msi_config;
 	int idx;
 
-	for (idx = 0; idx < msi_config.total_users; idx++) {
-		if (strcmp(user_name, msi_config.users[idx].name) == 0) {
-			*num_vectors = msi_config.users[idx].num_vectors;
-			*user_base_data = msi_config.users[idx].base_vector
+	for (idx = 0; idx < msi_config->total_users; idx++) {
+		if (strcmp(user_name, msi_config->users[idx].name) == 0) {
+			*num_vectors = msi_config->users[idx].num_vectors;
+			*user_base_data = msi_config->users[idx].base_vector
 				+ ab_pci->msi_ep_base_data;
-			*base_vector = msi_config.users[idx].base_vector;
+			*base_vector = msi_config->users[idx].base_vector;
 
 			ath11k_dbg(ab, ATH11K_DBG_PCI, "Assign MSI to user: %s, num_vectors: %d, user_base_data: %u, base_vector: %u\n",
 				   user_name, *num_vectors, *user_base_data,
@@ -760,17 +763,18 @@ static void ath11k_pci_ce_irqs_enable(struct ath11k_base *ab)
 static int ath11k_pci_enable_msi(struct ath11k_pci *ab_pci)
 {
 	struct ath11k_base *ab = ab_pci->ab;
+	const struct ath11k_msi_config *msi_config = ab_pci->msi_config;
 	struct msi_desc *msi_desc;
 	int num_vectors;
 	int ret;
 
 	num_vectors = pci_alloc_irq_vectors(ab_pci->pdev,
-					    msi_config.total_vectors,
-					    msi_config.total_vectors,
+					    msi_config->total_vectors,
+					    msi_config->total_vectors,
 					    PCI_IRQ_MSI);
-	if (num_vectors != msi_config.total_vectors) {
+	if (num_vectors != msi_config->total_vectors) {
 		ath11k_err(ab, "failed to get %d MSI vectors, only %d available",
-			   msi_config.total_vectors, num_vectors);
+			   msi_config->total_vectors, num_vectors);
 
 		if (num_vectors >= 0)
 			return -EINVAL;
@@ -1140,6 +1144,7 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 		goto err_pci_free_region;
 	}
 
+	ab_pci->msi_config = &ath11k_msi_config[0];
 	ret = ath11k_pci_enable_msi(ab_pci);
 	if (ret) {
 		ath11k_err(ab, "failed to enable msi: %d\n", ret);
diff --git a/drivers/net/wireless/ath/ath11k/pci.h b/drivers/net/wireless/ath/ath11k/pci.h
index fe44d0dfce19..92eeb7c30546 100644
--- a/drivers/net/wireless/ath/ath11k/pci.h
+++ b/drivers/net/wireless/ath/ath11k/pci.h
@@ -73,6 +73,7 @@ struct ath11k_pci {
 	char amss_path[100];
 	u32 msi_ep_base_data;
 	struct mhi_controller *mhi_ctrl;
+	const struct ath11k_msi_config *msi_config;
 	unsigned long mhi_state;
 	u32 register_window;
 
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
