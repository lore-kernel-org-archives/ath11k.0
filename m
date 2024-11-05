Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9235DD1CA11
	for <ath11k@archiver.kernel.org>; Tue,  5 Nov 2024 07:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zjpakYIoLhvd3mhZhPjqZ7seR7IJGV0ZW/12U1jn6qA=; b=IREyTNdwc7uDQWKGTVmuhHNjnE
	fSVY5eQiMui75+TVcWpVTNjU8HNxuJnRVMU2K+Xx3K8X3zxjMqdhcSoLsFaUJWiendMAaa0ijmH3P
	EK6Vs+oGF2XKyqCUJ8z/5YlPj5AwLZUpX/lYcDB80DOSXwPpQf79QNJHFZKP3wy7j7QN7sled/azz
	JW2NdXiI8KuzjDa6OTHI3Iggo5zqhIAvTaf3cdLKER7plgG042g7JTGVfFNbI6lLQdhD0WsJOR2E3
	2Fk4Brte6oRxp6xKmSO++YhIyupOT+coUlOayXNHOmLH0gC3UeY8DR92anQQJIfOH9XRi+pIpsplo
	ZHFooASw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8DfO-0000000G9bF-0p1s;
	Tue, 05 Nov 2024 07:07:54 +0000
Received: from ionic.de ([2001:41d0:700:3394:1::2] helo=mail.ionic.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8DfH-0000000G9Vi-3E2P
	for ath11k@lists.infradead.org;
	Tue, 05 Nov 2024 07:07:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1730790463; bh=kVf/I+lKWSpyZ7mumJhc1+AlGS9WVUs9A3bpL5P0L5g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EQQmecwiGiHEwRhdi2MYvZbStX1tbBqArAk4FIP47DWsFjAUyj/HNsms2vLjSiUn6
	 s/LvBa2GMOiA34ZoIQO1J56sYlGe/EHb1vxvjdfIU9OSSfoZ0ZsckruGFs1/eDm0iF
	 o455ufHYS22mkoYP9EIH1/c94bZfpOIJ3LR9ZIQU=
Received: from grml.local.home.ionic.de (unknown [IPv6:2a00:11:fb41:7a00:21b:21ff:fe5e:dddc])
	by mail.ionic.de (Postfix) with ESMTPSA id D35BF148928D;
	Tue, 05 Nov 2024 08:07:43 +0100 (CET)
From: Mihai Moldovan <ionic@ionic.de>
To: ath11k@lists.infradead.org
Cc: Mihai Moldovan <ionic@ionic.de>
Subject: [DONOTMERGE] [NOTEVENRFC] [PATCH 10/11] wifi: ath12k: implement QRTR endpoint ID fetching for PCI
Date: Tue,  5 Nov 2024 08:06:24 +0100
Message-ID: <2ed1f24d3e12486570bff27bfbd18a1df2227488.1730790063.git.ionic@ionic.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1730790058.git.ionic@ionic.de>
References: <cover.1730790058.git.ionic@ionic.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_230747_979515_672A4933 
X-CRM114-Status: UNSURE (   8.90  )
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

QRTR endpoint ID fetching for PCIe devices will use MHI.

Signed-off-by: Mihai Moldovan <ionic@ionic.de>
---
 drivers/net/wireless/ath/ath12k/mhi.c | 17 +++++++++++++++++
 drivers/net/wireless/ath/ath12k/mhi.h |  2 ++
 drivers/net/wireless/ath/ath12k/pci.c |  1 +
 3 files changed, 20 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless/ath/ath12k/mhi.c
index 2f6d14382ed7..30b3efc283b9 100644
--- a/drivers/net/wireless/ath/ath12k/mhi.c
+++ b/drivers/net/wireless/ath/ath12k/mhi.c
@@ -654,3 +654,20 @@ void ath12k_mhi_coredump(struct mhi_controller *mhi_ctrl, bool in_panic)
 {
 	mhi_download_rddm_image(mhi_ctrl, in_panic);
 }
+
+int ath12k_mhi_set_qrtr_endpoint_id(struct ath12k_base *ab)
+{
+	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
+	struct ath12k_qmi *qmi = &ab->qmi;
+	int ret;
+
+	/* Pass endpoint ID up for QMI usage. */
+	ret = mhi_get_qrtr_endpoint_id(ab_pci->mhi_ctrl->mhi_dev, &qmi->handle.endpoint_id);
+	ath12k_dbg(ab, ATH12K_DBG_PCI, "queried mhi_device QRTR endpoint ID: %u\n", qmi->handle.endpoint_id);
+	if (ret) {
+		ath12k_warn(ab, "failed to query QRTR endpoint ID: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
diff --git a/drivers/net/wireless/ath/ath12k/mhi.h b/drivers/net/wireless/ath/ath12k/mhi.h
index 7358b8477536..c4e00c1747c8 100644
--- a/drivers/net/wireless/ath/ath12k/mhi.h
+++ b/drivers/net/wireless/ath/ath12k/mhi.h
@@ -44,4 +44,6 @@ void ath12k_mhi_clear_vector(struct ath12k_base *ab);
 void ath12k_mhi_suspend(struct ath12k_pci *ar_pci);
 void ath12k_mhi_resume(struct ath12k_pci *ar_pci);
 void ath12k_mhi_coredump(struct mhi_controller *mhi_ctrl, bool in_panic);
+
+int ath12k_mhi_set_qrtr_endpoint_id(struct ath12k_base *ab);
 #endif
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index cf907550e6a4..3d65c64d1b31 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -1514,6 +1514,7 @@ static const struct ath12k_hif_ops ath12k_pci_hif_ops = {
 #ifdef CONFIG_ATH12K_COREDUMP
 	.coredump_download = ath12k_pci_coredump_download,
 #endif
+	.set_qrtr_endpoint_id = ath12k_mhi_set_qrtr_endpoint_id,
 };
 
 static
-- 
2.45.2


