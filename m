Return-Path: <SRS0=pDp8=KG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FEF9C433B4
	for <ath11k@archiver.kernel.org>; Tue, 11 May 2021 16:40:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A115B6190A
	for <ath11k@archiver.kernel.org>; Tue, 11 May 2021 16:40:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A115B6190A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=66pbl3/hFpRNxYnGb6M/DLx04uaB8eZkmhDR4w3nT7M=; b=a/Uc+da5o9UBl2nQrmW2sHuGY
	+xhS33nGSVBCRS22Jf7YQ4WgluTPcOEivcITjtnuLRBoIaR++BvQhXZnxRA/X9kLs2wvn6kppwxH2
	R9x+C1aiD23HwNwRzb3tcVreybk9ZKBnCmN6UxLgv5VPS0bxcOdkAkEjo5Zp3X5ALPo+2l9onfa0f
	kdYshzciU1P9TFmuSoAzXf1vqmSghp5naofWgSDTCj096QA5lCbL0DyOX4jATaw0VqKtyWUr89r6J
	otirin26ce4sboF8y3IVjw+l5rHeGeNv4phtDzq8U6ro3GhvX62I50dQJq4ZwjsQjjuqexyt14tKj
	UurrPXLJA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgVQT-000mQT-9c; Tue, 11 May 2021 16:40:05 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgVAF-000irB-VB
 for ath11k@desiato.infradead.org; Tue, 11 May 2021 16:23:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=TUpFo7fqbEDDZ7AMoUDruakSieCRFrnRHfwDZQngGPY=; b=NJKabL7bYQq9IwYuGvv3MQe1w8
 K2ELpwkD0U7/ZHCuJXHowcjRDzjp4tSTCJwEiqeyL3BNcFlVFfCT9OrJHQ3NPNS/7jj6azJf//mT2
 h5d7NSKQx2eqCArnS0DpKu1OVJSBTEchPpld1Yg9KVDErhkkDQXXRWMcXA2d5elV4/xv9cGlprjTs
 lx4HtpJIGmcw882aukA9i91ZF/73sbZJ4CiFBqHa5NrRemy6O+BFgGEfuk3IHmaXX3jzfdMcfK/O9
 L6TcDG+7HIQ0lnumcjli0WX6NBl4Iw0DtjgHmnm2+ZFyeZHZdVLuMgJd1iWfxzieCSCBvzJYgUxBn
 vzaLl+Hw==;
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgVAB-009l78-AT
 for ath11k@lists.infradead.org; Tue, 11 May 2021 16:23:18 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1620750197; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=TUpFo7fqbEDDZ7AMoUDruakSieCRFrnRHfwDZQngGPY=;
 b=h+oQyogQ3IVKjO94D8hD6535X1N6FclREjjz8urOw8lAuig4ngKPjDfJ7kr0+Fjsbfz8fevl
 DIEHr8vvFFR1IjYYPeSf93emKc/UIVahNQ08Upn7mPjoooBFZYmpJ/G/nMIvG4+/R4Q/4md0
 GSD0jIqDSBbOk3rHxQCg5ZauRIo=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 609aaf6eff1bb9beec18fec1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 11 May 2021 16:23:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id F330CC4338A; Tue, 11 May 2021 16:23:09 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-96-12-nat.elisa-mobile.fi
 [85.76.96.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D3CD6C43145;
 Tue, 11 May 2021 16:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D3CD6C43145
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Baochen Qiang <bqiang@codeaurora.org>, Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 7/7] ath11k: don't call ath11k_pci_set_l1ss for WCN6855
Date: Tue, 11 May 2021 19:22:14 +0300
Message-Id: <20210511162214.29475-8-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210511162214.29475-1-jouni@codeaurora.org>
References: <20210511162214.29475-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_092317_250451_F8F77D5D 
X-CRM114-Status: GOOD (  15.77  )
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

From: Baochen Qiang <bqiang@codeaurora.org>

For QCA6390, one PCI related clock drifts sometimes, and it makes
PCI link difficult to quit L1ss. Current implementation fixed this
by configuring some related regs using ath11k_pci_fix_l1ss.

WCN6855 does not have this clock drift problem, so no need to set
these regs.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c | 5 +++++
 drivers/net/wireless/ath/ath11k/hw.h   | 1 +
 drivers/net/wireless/ath/ath11k/pci.c  | 3 ++-
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index fd8941905fdb..4a1051418f33 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -70,6 +70,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.cold_boot_calib = true,
 		.supports_suspend = false,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_ipq8074),
+		.fix_l1ss = true,
 	},
 	{
 		.hw_rev = ATH11K_HW_IPQ6018_HW10,
@@ -110,6 +111,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.cold_boot_calib = true,
 		.supports_suspend = false,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_ipq8074),
+		.fix_l1ss = true,
 	},
 	{
 		.name = "qca6390 hw2.0",
@@ -149,6 +151,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.cold_boot_calib = false,
 		.supports_suspend = true,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_ipq8074),
+		.fix_l1ss = true,
 	},
 	{
 		.name = "qcn9074 hw1.0",
@@ -186,6 +189,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.cold_boot_calib = false,
 		.supports_suspend = false,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_qcn9074),
+		.fix_l1ss = true,
 	},
 	{
 		.name = "wcn6855 hw2.0",
@@ -225,6 +229,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.cold_boot_calib = false,
 		.supports_suspend = true,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_wcn6855),
+		.fix_l1ss = false,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index be62f0c2e25e..62f5978b3005 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -162,6 +162,7 @@ struct ath11k_hw_params {
 	bool cold_boot_calib;
 	bool supports_suspend;
 	u32 hal_desc_sz;
+	bool fix_l1ss;
 };
 
 struct ath11k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index d33b5d66b494..9fe42194f488 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -434,7 +434,8 @@ static void ath11k_pci_sw_reset(struct ath11k_base *ab, bool power_on)
 		ath11k_pci_enable_ltssm(ab);
 		ath11k_pci_clear_all_intrs(ab);
 		ath11k_pci_set_wlaon_pwr_ctrl(ab);
-		ath11k_pci_fix_l1ss(ab);
+		if (ab->hw_params.fix_l1ss)
+			ath11k_pci_fix_l1ss(ab);
 	}
 
 	ath11k_mhi_clear_vector(ab);
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
