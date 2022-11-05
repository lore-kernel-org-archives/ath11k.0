Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9BE6C4332F
	for <ath11k@archiver.kernel.org>; Sat,  5 Nov 2022 19:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FBD1oRa8lt5MWNIgpQeb/TpUOS8p2AImtPziiIDMrPE=; b=DcOF8oxTBnmSwp
	4RVAlFWAvpaO8CwJzoaWZKPP4EXrvKEGUNK2F14Ikq4a0AfKMk4u36DGCox5aurgqZJ7ofukyPWZT
	HKACVWLEBs8pbn2giQwjPdoP0JMx9+21+CGkOmtyCE1vL1rnTV6YRek/T6o8lCVEmJmv1cJBL7F5X
	xAWRsL+P7miRFMgjVzfX4v6HE0KvZmpLBkr1GGRcm9+wfv/iNgiUvEZaqwbyXn1J/rm+JpspWHX3K
	XylFIn4L9eRdQk1duC3MAt96BKnZ89/bGGmpPBfkJ8XRHHRW1nRWQzpBGIk1FlP8OyFWdic1h8eJ4
	PMVX2JlPzs1QWPmxWrWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orPB3-007BYL-6n; Sat, 05 Nov 2022 19:50:01 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orPAy-007BTU-Kd
	for ath11k@lists.infradead.org; Sat, 05 Nov 2022 19:50:00 +0000
Received: by mail-ej1-x62a.google.com with SMTP id q9so21219795ejd.0
        for <ath11k@lists.infradead.org>; Sat, 05 Nov 2022 12:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5Uw4achefntbuDEmtPAMe547HVX41/nVL2BQsQgEJM=;
        b=FhCNcouAY5y5+AGNSTDP5XFLuOrKlAGBqJFYOo0biY635FJLas5iDZCn2pWESDoR/d
         vFWXuvDJDgNzMmPnn2U/5DlggQlCEgBfo/qraD3qc8ANARFWx5zOo8LfzBY7kzeiqOAS
         42y7vDYO8N/CoxJPHASA3OA5d0ptjuMmCvU50fD8yXTbS6F+ZCzyrWN85Wv5J+ntoW8r
         vsf5Mx1HsJ/1+la1ab33HIx4FjC80ZSBza60CF/nic6OXXGNffOK1c5OHlcWgCzaCH5A
         Y3by5pi2w6i8gWRxFJQmUuEWsbJW+m5GPQ7r89TSAAIyDUnYTGfW2pXJcKvRyvoVC8EA
         XfkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J5Uw4achefntbuDEmtPAMe547HVX41/nVL2BQsQgEJM=;
        b=MMJWPNxG9heBLLyDY+jp/JTL53+Uq/pBtxko0qc5rrJXvRlXkGhbCbSGv5qyExD6LC
         1fxcPEC6pFj+oxMSp82Zryf6dqlYoHWGHBA6WSXR7f7sxEET72G2O/ZbmKa84raOO/+S
         G324WJIsy+Yty9F2qJsD3Wnrwg1MRB5KhYHgszQ+6o7BdOXkSvDpT+nkZYuIONL3SBsN
         8SbFebLm+yH/KnWrKjzUIU+mDx718zLWHFSADyqTMA/dyUu6/ADLxw/1ZU1xdE5Gn422
         ZR9/0rUtkxzBKv42C2ZWGHQomDTJ+3COn5gecUprKiHsrdiYJ5Ctgbzi2UGUf3AH3/op
         lqhQ==
X-Gm-Message-State: ACrzQf2zNJnZg40Rg5p//Ey89Per+fixpp7f6M1UlDBc/f+KJeh4o2Z1
	TDZFs66tHZlIKKJFZwC6j6A=
X-Google-Smtp-Source: AMsMyM70hd6yCcN13TFAX1z7xRADsiD537lD/kbznKBVMkYevbQFVIitQC1j2CNHnGuT48zwFXV4Vw==
X-Received: by 2002:a17:907:8688:b0:791:91a0:fdb3 with SMTP id qa8-20020a170907868800b0079191a0fdb3mr38971607ejc.499.1667677788695;
        Sat, 05 Nov 2022 12:49:48 -0700 (PDT)
Received: from fedora.. (dh207-96-23.xnet.hr. [88.207.96.23])
        by smtp.googlemail.com with ESMTPSA id et19-20020a170907295300b0079b9f7509a0sm1289409ejc.52.2022.11.05.12.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Nov 2022 12:49:48 -0700 (PDT)
From: Robert Marko <robimarko@gmail.com>
To: mani@kernel.org,
	kvalo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	gregkh@linuxfoundation.org,
	elder@linaro.org,
	hemantk@codeaurora.org,
	quic_jhugo@quicinc.com,
	quic_qianyu@quicinc.com,
	bbhatt@codeaurora.org,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org
Cc: ansuelsmth@gmail.com,
	Robert Marko <robimarko@gmail.com>
Subject: [PATCH 2/2] wifi: ath11k: use unique QRTR instance ID
Date: Sat,  5 Nov 2022 20:49:43 +0100
Message-Id: <20221105194943.826847-2-robimarko@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221105194943.826847-1-robimarko@gmail.com>
References: <20221105194943.826847-1-robimarko@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221105_124956_726411_C2BF273E 
X-CRM114-Status: GOOD (  14.99  )
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

Currently, trying to use AHB + PCI/MHI cards or multiple PCI/MHI cards
will cause a clash in the QRTR instance node ID and prevent the driver
from talking via QMI to the card and thus initializing it with:
[    9.836329] ath11k c000000.wifi: host capability request failed: 1 90
[    9.842047] ath11k c000000.wifi: failed to send qmi host cap: -22

So, in order to allow for this combination of cards, especially AHB + PCI
cards like IPQ8074 + QCN9074 (Used by me and tested on) set the desired
QRTR instance ID offset by calculating a unique one based on PCI domain
and bus ID-s and writing it to bits 7-0 of BHI_ERRDBG2 MHI register by
using the SBL state callback that is added as part of the series.
We also have to make sure that new QRTR offset is added on top of the
default QRTR instance ID-s that are currently used in the driver.

This finally allows using AHB + PCI or multiple PCI cards on the same
system.

Before:
root@OpenWrt:/# qrtr-lookup
  Service Version Instance Node  Port
     1054       1        0    7     1 <unknown>
       69       1        2    7     3 ATH10k WLAN firmware service

After:
root@OpenWrt:/# qrtr-lookup
  Service Version Instance Node  Port
     1054       1        0    7     1 <unknown>
       69       1        2    7     3 ATH10k WLAN firmware service
       15       1        0    8     1 Test service
       69       1        8    8     2 ATH10k WLAN firmware service

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 drivers/net/wireless/ath/ath11k/mhi.c | 47 ++++++++++++++++++---------
 drivers/net/wireless/ath/ath11k/mhi.h |  3 ++
 drivers/net/wireless/ath/ath11k/pci.c |  5 ++-
 3 files changed, 38 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index 86995e8dc913..23e85ea902f5 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -294,6 +294,32 @@ static void ath11k_mhi_op_runtime_put(struct mhi_controller *mhi_cntrl)
 {
 }
 
+static int ath11k_mhi_op_read_reg(struct mhi_controller *mhi_cntrl,
+				  void __iomem *addr,
+				  u32 *out)
+{
+	*out = readl(addr);
+
+	return 0;
+}
+
+static void ath11k_mhi_op_write_reg(struct mhi_controller *mhi_cntrl,
+				    void __iomem *addr,
+				    u32 val)
+{
+	writel(val, addr);
+}
+
+static void ath11k_mhi_qrtr_instance_set(struct mhi_controller *mhi_cntrl)
+{
+	struct ath11k_base *ab = dev_get_drvdata(mhi_cntrl->cntrl_dev);
+
+	ath11k_mhi_op_write_reg(mhi_cntrl,
+				mhi_cntrl->bhi + BHI_ERRDBG2,
+				FIELD_PREP(QRTR_INSTANCE_MASK,
+				ab->qmi.service_ins_id - ab->hw_params.qmi_service_ins_id));
+}
+
 static char *ath11k_mhi_op_callback_to_str(enum mhi_callback reason)
 {
 	switch (reason) {
@@ -315,6 +341,8 @@ static char *ath11k_mhi_op_callback_to_str(enum mhi_callback reason)
 		return "MHI_CB_FATAL_ERROR";
 	case MHI_CB_BW_REQ:
 		return "MHI_CB_BW_REQ";
+	case MHI_CB_EE_SBL_MODE:
+		return "MHI_CB_EE_SBL_MODE";
 	default:
 		return "UNKNOWN";
 	}
@@ -336,27 +364,14 @@ static void ath11k_mhi_op_status_cb(struct mhi_controller *mhi_cntrl,
 		if (!(test_bit(ATH11K_FLAG_UNREGISTERING, &ab->dev_flags)))
 			queue_work(ab->workqueue_aux, &ab->reset_work);
 		break;
+	case MHI_CB_EE_SBL_MODE:
+		ath11k_mhi_qrtr_instance_set(mhi_cntrl);
+		break;
 	default:
 		break;
 	}
 }
 
-static int ath11k_mhi_op_read_reg(struct mhi_controller *mhi_cntrl,
-				  void __iomem *addr,
-				  u32 *out)
-{
-	*out = readl(addr);
-
-	return 0;
-}
-
-static void ath11k_mhi_op_write_reg(struct mhi_controller *mhi_cntrl,
-				    void __iomem *addr,
-				    u32 val)
-{
-	writel(val, addr);
-}
-
 static int ath11k_mhi_read_addr_from_dt(struct mhi_controller *mhi_ctrl)
 {
 	struct device_node *np;
diff --git a/drivers/net/wireless/ath/ath11k/mhi.h b/drivers/net/wireless/ath/ath11k/mhi.h
index 8d9f852da695..0db308bc3047 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.h
+++ b/drivers/net/wireless/ath/ath11k/mhi.h
@@ -16,6 +16,9 @@
 #define MHICTRL					0x38
 #define MHICTRL_RESET_MASK			0x2
 
+#define BHI_ERRDBG2				0x38
+#define QRTR_INSTANCE_MASK			GENMASK(7, 0)
+
 int ath11k_mhi_start(struct ath11k_pci *ar_pci);
 void ath11k_mhi_stop(struct ath11k_pci *ar_pci);
 int ath11k_mhi_register(struct ath11k_pci *ar_pci);
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 99cf3357c66e..cd26c1567415 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -370,13 +370,16 @@ static void ath11k_pci_sw_reset(struct ath11k_base *ab, bool power_on)
 static void ath11k_pci_init_qmi_ce_config(struct ath11k_base *ab)
 {
 	struct ath11k_qmi_ce_cfg *cfg = &ab->qmi.ce_cfg;
+	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
+	struct pci_bus *bus = ab_pci->pdev->bus;
 
 	cfg->tgt_ce = ab->hw_params.target_ce_config;
 	cfg->tgt_ce_len = ab->hw_params.target_ce_count;
 
 	cfg->svc_to_ce_map = ab->hw_params.svc_to_ce_map;
 	cfg->svc_to_ce_map_len = ab->hw_params.svc_to_ce_map_len;
-	ab->qmi.service_ins_id = ab->hw_params.qmi_service_ins_id;
+	ab->qmi.service_ins_id = ab->hw_params.qmi_service_ins_id +
+	(((pci_domain_nr(bus) & 0xF) << 4) | (bus->number & 0xF));
 
 	ath11k_ce_get_shadow_config(ab, &cfg->shadow_reg_v2,
 				    &cfg->shadow_reg_v2_len);
-- 
2.38.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
