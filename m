Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D5AD1CA3B
	for <ath11k@archiver.kernel.org>; Tue,  5 Nov 2024 07:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D4pbRyJDV+CMI+2Ak/iQ5t+dqjvGmpn5Q4Ypq8GuBEs=; b=Sz+MPEqj6xh5pDe1de0l+FiZA9
	rO2P3RFlKYNz2h7Nr28w8KlJ1qsRp0SmWngqThgReS4Z1A+8nhxkvGsEvGf3Cwknd445VhuvRfZsY
	Tjwf+K3vAM48SOPgNU7AeQ6Vp6fTWf2Dhk7/ySTrcmmkD1hC0rWPWyJOuEPG3PU5pcIJ+unzFJGQm
	Fvf2nllt8GElkUMCx2qzTRx5L9EM7/wfDG13T5JB/VVJeixCJH1LANVfQD44ceLHm2OTm+R3YrWNz
	6vgPybOL3kBt8+4gc9MuP/DJMZb3sMQ6jyps+7yNEou0P5nb5Cv2kaE9/ffzIUDiK9hCGIm5CF3Sr
	V7Ft3zBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8DfJ-0000000G9Xo-3JzU;
	Tue, 05 Nov 2024 07:07:49 +0000
Received: from ionic.de ([2001:41d0:700:3394:1::2] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8DfG-0000000G9V3-1WCd
	for ath11k@lists.infradead.org;
	Tue, 05 Nov 2024 07:07:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1730790463; bh=80kBqevVD8DrG64LSfqTitLDMzPJBX75cIsj7JDmjNE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DZTL6ygeDWs77mDVmpHIyKdDFuDbrl1qksBYhenMqs4t5pFPBiWASdgx7Hadd0MEl
	 SM+KsLN5N3Y4oiKgGJWpOn/MC/srrhJIGfhMzcJy3sEFE1LAYj2/JpFIsMq9eyWpgg
	 KHrcoZ1Rp6Yv4o4zuNVlvFZrzw2HGiClQ+8BFY8I=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id 53E041488DD4;
	Tue, 05 Nov 2024 08:07:43 +0100 (CET)
From: Mihai Moldovan <ionic@ionic.de>
To: ath11k@lists.infradead.org
Cc: Mihai Moldovan <ionic@ionic.de>
Subject: [DONOTMERGE] [NOTEVENRFC] [PATCH 06/11] wifi: ath11k: stub QRTR endpoint ID fetching for AHB
Date: Tue,  5 Nov 2024 08:06:20 +0100
Message-ID: <f1e05d7ac7459f9f9596c45833e96cc9802e7e41.1730790062.git.ionic@ionic.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1730790058.git.ionic@ionic.de>
References: <cover.1730790058.git.ionic@ionic.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_230746_675110_B66B228F 
X-CRM114-Status: UNSURE (   8.78  )
X-CRM114-Notice: Please train this message.
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

QRTR endpoint ID fetching will currently not be available for AHB.

Signed-off-by: Mihai Moldovan <ionic@ionic.de>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 916402ad06b8..19c958b04b7a 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -773,6 +773,7 @@ static const struct ath11k_hif_ops ath11k_ahb_hif_ops_ipq8074 = {
 	.map_service_to_pipe = ath11k_ahb_map_service_to_pipe,
 	.power_down = ath11k_ahb_power_down,
 	.power_up = ath11k_ahb_power_up,
+	.set_qrtr_endpoint_id = ath11k_ahb_set_qrtr_endpoint_id,
 };
 
 static const struct ath11k_hif_ops ath11k_ahb_hif_ops_wcn6750 = {
@@ -792,6 +793,7 @@ static const struct ath11k_hif_ops ath11k_ahb_hif_ops_wcn6750 = {
 	.resume = ath11k_ahb_hif_resume,
 	.ce_irq_enable = ath11k_pci_enable_ce_irqs_except_wake_irq,
 	.ce_irq_disable = ath11k_pci_disable_ce_irqs_except_wake_irq,
+	.set_qrtr_endpoint_id = ath11k_ahb_set_qrtr_endpoint_id,
 };
 
 static int ath11k_core_get_rproc(struct ath11k_base *ab)
@@ -1312,6 +1314,11 @@ static void ath11k_ahb_shutdown(struct platform_device *pdev)
 	ath11k_ahb_free_resources(ab);
 }
 
+static ath11k_ahb_set_qrtr_endpoint_id(struct ath11k_base *ab)
+{
+	return -ENOSYS;
+}
+
 static struct platform_driver ath11k_ahb_driver = {
 	.driver         = {
 		.name   = "ath11k",
-- 
2.45.2


