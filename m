Return-Path: <SRS0=WqG4=HM=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B8BC433E0
	for <ath11k@archiver.kernel.org>; Wed, 10 Feb 2021 08:42:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5542064E08
	for <ath11k@archiver.kernel.org>; Wed, 10 Feb 2021 08:42:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5542064E08
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V3n4GyH3G6JanO3zP9PCA8lDWEsMlaATsQrdULZS1no=; b=uvurHnX4OVQZRnwTa5ajX9V3uq
	/Ub/sZFmlEQ5X3g12JB2/ODsFvT5oUPpT3xkNsXcPCmlbrpYiXY6IV7bJEeImtOcxKW/bHW8jO7VT
	TVW9ZSzNCnju4NzC6cENjVuu8AYl8Xp84ASHA9yxLq7zZEphUSBf0Z6iCei4e1eIPwsytP2Atnhmh
	SYmIbCHFxgG5KgjzweHaOUh4MCeXpoB45avOXeXsQ+3vih8y2SCV+IpOGZeBuGcwDfKSQSIl8jwqI
	EPKHR5Ivb7hYHMug0UtNQLJ/tBTKDnP2cnKpoqQ7tLGS+s1HdawEylaVkcM8wtEZgrOJNZOIQZ3XI
	T07Izl0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9l57-0006ph-SN; Wed, 10 Feb 2021 08:42:41 +0000
Received: from so15.mailgun.net ([198.61.254.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9l52-0006kY-Nk
 for ath11k@lists.infradead.org; Wed, 10 Feb 2021 08:42:40 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1612946558; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=SYg/XrSIBtJw/DAkLJFryOpQMUJWF97XRfn4q28tbR0=;
 b=b3t+zl0Tf6/1vgf6BrBFcBrMJl5MCZTXJEFGLP2a3esk3msQSnDfWRITpAi3nwSldzN50DTi
 EF7GUJF8cSOqBs/htErTWj/VnrbuVKIovnsTs0UQYLxheU0a3xqGnUzEt/l9xlbwNWLi+DdU
 +HK8rg3uRlpLhC+cmHvm2Hq3pLQ=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60239c73d5a7a3baae3cd018 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Feb 2021 08:42:27
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 60181C43461; Wed, 10 Feb 2021 08:42:27 +0000 (UTC)
Received: from vnaralas-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akolli)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8515EC433CA;
 Wed, 10 Feb 2021 08:42:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8515EC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akolli@codeaurora.org
From: Anilkumar Kolli <akolli@codeaurora.org>
To: ath11k@lists.infradead.org
Subject: [PATCH 02/11] ath11k: Move qmi service_ins_id to hw_params
Date: Wed, 10 Feb 2021 14:12:01 +0530
Message-Id: <1612946530-28504-3-git-send-email-akolli@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612946530-28504-1-git-send-email-akolli@codeaurora.org>
References: <1612946530-28504-1-git-send-email-akolli@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_034239_158412_01D23D30 
X-CRM114-Status: GOOD (  14.30  )
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

qmi service_ins_id is unique for QCA6390 and QCN9074,
this is needed for adding QCN9074 support. No functional
changes.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1.r2-00012-QCAHKSWPL_SILICONZ-1

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/ahb.c  | 2 +-
 drivers/net/wireless/ath/ath11k/core.c | 3 +++
 drivers/net/wireless/ath/ath11k/hw.h   | 1 +
 drivers/net/wireless/ath/ath11k/pci.c  | 2 +-
 4 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index d4ef45cd0685..8c9c781afc3e 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -373,7 +373,7 @@ static void ath11k_ahb_init_qmi_ce_config(struct ath11k_base *ab)
 	cfg->tgt_ce = ab->hw_params.target_ce_config;
 	cfg->svc_to_ce_map_len = ab->hw_params.svc_to_ce_map_len;
 	cfg->svc_to_ce_map = ab->hw_params.svc_to_ce_map;
-	ab->qmi.service_ins_id = ATH11K_QMI_WLFW_SERVICE_INS_ID_V01_IPQ8074;
+	ab->qmi.service_ins_id = ab->hw_params.qmi_service_ins_id;
 }
 
 static void ath11k_ahb_free_ext_irq(struct ath11k_base *ab)
diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 350b7913622c..9ccc7231afa0 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -45,6 +45,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.ring_mask = &ath11k_hw_ring_mask_ipq8074,
 		.internal_sleep_clock = false,
 		.regs = &ipq8074_regs,
+		.qmi_service_ins_id = ATH11K_QMI_WLFW_SERVICE_INS_ID_V01_IPQ8074,
 		.host_ce_config = ath11k_host_ce_config_ipq8074,
 		.ce_count = 12,
 		.target_ce_config = ath11k_target_ce_config_wlan_ipq8074,
@@ -83,6 +84,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.ring_mask = &ath11k_hw_ring_mask_ipq8074,
 		.internal_sleep_clock = false,
 		.regs = &ipq8074_regs,
+		.qmi_service_ins_id = ATH11K_QMI_WLFW_SERVICE_INS_ID_V01_IPQ8074,
 		.host_ce_config = ath11k_host_ce_config_ipq8074,
 		.ce_count = 12,
 		.target_ce_config = ath11k_target_ce_config_wlan_ipq8074,
@@ -121,6 +123,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.ring_mask = &ath11k_hw_ring_mask_qca6390,
 		.internal_sleep_clock = true,
 		.regs = &qca6390_regs,
+		.qmi_service_ins_id = ATH11K_QMI_WLFW_SERVICE_INS_ID_V01_QCA6390,
 		.host_ce_config = ath11k_host_ce_config_qca6390,
 		.ce_count = 9,
 		.target_ce_config = ath11k_target_ce_config_wlan_qca6390,
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 8af0034fdb05..94c36e6149cf 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -134,6 +134,7 @@ struct ath11k_hw_params {
 	bool internal_sleep_clock;
 
 	const struct ath11k_hw_regs *regs;
+	u32 qmi_service_ins_id;
 	const struct ce_attr *host_ce_config;
 	u32 ce_count;
 	const struct ce_pipe_config *target_ce_config;
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 0c6a6e7ef252..5edcb1ef9523 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -743,7 +743,7 @@ static void ath11k_pci_init_qmi_ce_config(struct ath11k_base *ab)
 
 	cfg->svc_to_ce_map = ab->hw_params.svc_to_ce_map;
 	cfg->svc_to_ce_map_len = ab->hw_params.svc_to_ce_map_len;
-	ab->qmi.service_ins_id = ATH11K_QMI_WLFW_SERVICE_INS_ID_V01_QCA6390;
+	ab->qmi.service_ins_id = ab->hw_params.qmi_service_ins_id;
 
 	ath11k_ce_get_shadow_config(ab, &cfg->shadow_reg_v2,
 				    &cfg->shadow_reg_v2_len);
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
