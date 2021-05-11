Return-Path: <SRS0=pDp8=KG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F16C433ED
	for <ath11k@archiver.kernel.org>; Tue, 11 May 2021 16:40:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A02B66191A
	for <ath11k@archiver.kernel.org>; Tue, 11 May 2021 16:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A02B66191A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jC4gpEijrjPHlxHTuTU5Z5tTB03d4YmvNfNXNsz2QjM=; b=dKm8u1CqqHhQflDkVkDWInNzh
	dkUTFS4EivS/R6RaGsQY9i/GWTKhhpPxyCLb3IIaxYsp32DNccQrgNfEsqwpaWIgfo6IeoE7oiPMQ
	JQKI/QlCDlhiAIOqizi2uZTzg8nR2mzVUrj3kL+jiWEe51CgkLCsxqHfzdJEe8WBMKb7wuwO3E8mT
	LUJP+EB1BOtrdmookYHz7AGjmTc35lMbrzNbGITnDvnL5iMBjfuz5zN128NnCNMHNfj7+alXG+J6v
	N8rSKt+0g/OToU57WgBpu/++1/KdWHJVCStNZT1Pd36VaPAxYVrUwv1Ao1tjVgEORipdXliyfeKOz
	kNlKEUdBQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgVQI-000mMq-Lo; Tue, 11 May 2021 16:39:54 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgV9u-000inW-JS
 for ath11k@desiato.infradead.org; Tue, 11 May 2021 16:23:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=hc/1p8cJTdVEDwtZzilpVuHsrAStI7FEtcQ/+B6Pr9Y=; b=TcBbDn0Ubw8mi+yLLzLlweZaTS
 5OLtizl5BDA3lDKjFEnV0Tnlsu0Dk92zDDQ82EKlarkB8TKxhva6PRqJJxloRXJW7mqmvPp2xzp5h
 /Aq1QEspZLCVBqZDhkFUq0SxYoU9jcECdfOIXbzPlRnhf6kEWn1kyuBaaCv8j6IB5AQhzAyqsY5f/
 uW707blFWHcM+wfCgHHN2ixmj9xFCNf9SyvZq0Vez+nnuqR68fKuWivGPwpllDt8MkcwNSlsOnnJ8
 pWn2ZytuG22QHwx3FDNqBafam7kYCKx1AcT/Izl3iCYs95go2STwVohCIP/gOdKR8fHxhcKeiJYB2
 p8dRlRoA==;
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgV9r-009l78-Hi
 for ath11k@lists.infradead.org; Tue, 11 May 2021 16:22:57 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1620750175; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=hc/1p8cJTdVEDwtZzilpVuHsrAStI7FEtcQ/+B6Pr9Y=;
 b=VXeEobUxNzlJHnpRpdV33phEseNwRJw44DJ9+FQ976FaL9zzcYjCD4rvIKJzLwW5TB1pvgkO
 1jOoNjga0GTkqzQGzzcLL2vDAce6WkRO6FeM5AsSbPd6kgorOLD6qUvNYUacSBN9RhK0IXBh
 7ADPnAOBFWdBWuX+ByErFx5PJLM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 609aaf5ee0211609c47d6db1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 11 May 2021 16:22:54
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7AE5EC43149; Tue, 11 May 2021 16:22:54 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-96-12-nat.elisa-mobile.fi
 [85.76.96.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id ED88EC433D3;
 Tue, 11 May 2021 16:22:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org ED88EC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Baochen Qiang <bqiang@codeaurora.org>,
 Govind Singh <govinds@codeaurora.org>, Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 1/7] ath11k: add hw reg support for WCN6855
Date: Tue, 11 May 2021 19:22:08 +0300
Message-Id: <20210511162214.29475-2-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210511162214.29475-1-jouni@codeaurora.org>
References: <20210511162214.29475-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_092255_829239_00C27001 
X-CRM114-Status: GOOD (  11.90  )
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

Reg address of WCN6855 is different from other devices,
so add separate reg definition for this target.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Govind Singh <govinds@codeaurora.org>
Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/hw.c | 71 ++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/hw.h |  1 +
 2 files changed, 72 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
index 377ae8d5b58f..d9d7c4608052 100644
--- a/drivers/net/wireless/ath/ath11k/hw.c
+++ b/drivers/net/wireless/ath/ath11k/hw.c
@@ -1688,3 +1688,74 @@ const struct ath11k_hw_regs qcn9074_regs = {
 	.pcie_qserdes_sysclk_en_sel = 0x01e0e0a8,
 	.pcie_pcs_osc_dtct_config_base = 0x01e0f45c,
 };
+
+const struct ath11k_hw_regs wcn6855_regs = {
+	/* SW2TCL(x) R0 ring configuration address */
+	.hal_tcl1_ring_base_lsb = 0x00000690,
+	.hal_tcl1_ring_base_msb = 0x00000694,
+	.hal_tcl1_ring_id = 0x00000698,
+	.hal_tcl1_ring_misc = 0x000006a0,
+	.hal_tcl1_ring_tp_addr_lsb = 0x000006ac,
+	.hal_tcl1_ring_tp_addr_msb = 0x000006b0,
+	.hal_tcl1_ring_consumer_int_setup_ix0 = 0x000006c0,
+	.hal_tcl1_ring_consumer_int_setup_ix1 = 0x000006c4,
+	.hal_tcl1_ring_msi1_base_lsb = 0x000006d8,
+	.hal_tcl1_ring_msi1_base_msb = 0x000006dc,
+	.hal_tcl1_ring_msi1_data = 0x000006e0,
+	.hal_tcl2_ring_base_lsb = 0x000006e8,
+	.hal_tcl_ring_base_lsb = 0x00000798,
+
+	/* TCL STATUS ring address */
+	.hal_tcl_status_ring_base_lsb = 0x000008a0,
+
+	/* REO2SW(x) R0 ring configuration address */
+	.hal_reo1_ring_base_lsb = 0x00000244,
+	.hal_reo1_ring_base_msb = 0x00000248,
+	.hal_reo1_ring_id = 0x0000024c,
+	.hal_reo1_ring_misc = 0x00000254,
+	.hal_reo1_ring_hp_addr_lsb = 0x00000258,
+	.hal_reo1_ring_hp_addr_msb = 0x0000025c,
+	.hal_reo1_ring_producer_int_setup = 0x00000268,
+	.hal_reo1_ring_msi1_base_lsb = 0x0000028c,
+	.hal_reo1_ring_msi1_base_msb = 0x00000290,
+	.hal_reo1_ring_msi1_data = 0x00000294,
+	.hal_reo2_ring_base_lsb = 0x0000029c,
+	.hal_reo1_aging_thresh_ix_0 = 0x000005bc,
+	.hal_reo1_aging_thresh_ix_1 = 0x000005c0,
+	.hal_reo1_aging_thresh_ix_2 = 0x000005c4,
+	.hal_reo1_aging_thresh_ix_3 = 0x000005c8,
+
+	/* REO2SW(x) R2 ring pointers (head/tail) address */
+	.hal_reo1_ring_hp = 0x00003030,
+	.hal_reo1_ring_tp = 0x00003034,
+	.hal_reo2_ring_hp = 0x00003038,
+
+	/* REO2TCL R0 ring configuration address */
+	.hal_reo_tcl_ring_base_lsb = 0x00000454,
+	.hal_reo_tcl_ring_hp = 0x00003060,
+
+	/* REO status address */
+	.hal_reo_status_ring_base_lsb = 0x0000055c,
+	.hal_reo_status_hp = 0x00003078,
+
+	/* WCSS relative address */
+	.hal_seq_wcss_umac_ce0_src_reg = 0x1b80000,
+	.hal_seq_wcss_umac_ce0_dst_reg = 0x1b81000,
+	.hal_seq_wcss_umac_ce1_src_reg = 0x1b82000,
+	.hal_seq_wcss_umac_ce1_dst_reg = 0x1b83000,
+
+	/* WBM Idle address */
+	.hal_wbm_idle_link_ring_base_lsb = 0x00000870,
+	.hal_wbm_idle_link_ring_misc = 0x00000880,
+
+	/* SW2WBM release address */
+	.hal_wbm_release_ring_base_lsb = 0x000001e8,
+
+	/* WBM2SW release address */
+	.hal_wbm0_release_ring_base_lsb = 0x00000920,
+	.hal_wbm1_release_ring_base_lsb = 0x00000978,
+
+	/* PCIe base address */
+	.pcie_qserdes_sysclk_en_sel = 0x01e0c0ac,
+	.pcie_pcs_osc_dtct_config_base = 0x01e0c628,
+};
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index c81a6328361d..4e7261c0dca1 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -318,5 +318,6 @@ struct ath11k_hw_regs {
 extern const struct ath11k_hw_regs ipq8074_regs;
 extern const struct ath11k_hw_regs qca6390_regs;
 extern const struct ath11k_hw_regs qcn9074_regs;
+extern const struct ath11k_hw_regs wcn6855_regs;
 
 #endif
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
