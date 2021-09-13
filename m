Return-Path: <SRS0=KMo3=OD=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69FA6C433F5
	for <ath11k@archiver.kernel.org>; Mon, 13 Sep 2021 18:03:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BC56610CE
	for <ath11k@archiver.kernel.org>; Mon, 13 Sep 2021 18:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2BC56610CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LMVQvJW7AxNYsXgE/quPwdHI9qgWqoW3tmITek+dM64=; b=xLjatCN4f53Yws
	LlzWEm7ZcLnjIRRdVYtR+RYbQq3xAHVHwxo9OVWe7G5aJRgh/qJiNu2UWW4Te8ScDU6abYsFXPQYs
	zwpvDSbEvxT2njRD/3eFxXMTZUluYBHHp2z+wM2CTMMkNBkydI9Wxpc+xbjIKyi1jWQofzHiMYGlP
	UNOLrtbL8Aci28bocjJuTNiSu0AjESJcnV0oaeuwvxBICzvEAlO282Ecza+nY0t1/Ju77FMqTE8KU
	yW+2h7mbF3jzDkEiTH91z90q5BsSKBgye03W6tiYpcAIkj/7z6p2HQvd2y0RDNItQ0L+RPMMhQK31
	Gl7vZ3sb8VJJddpQsO/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPqIm-002t9V-AS; Mon, 13 Sep 2021 18:03:32 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPqIb-002t0x-M1
 for ath11k@lists.infradead.org; Mon, 13 Sep 2021 18:03:30 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631556208; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=jv8bQGeZ41RIMqdQj1FGk47Jpd/siyCfxBzIJ7dFueQ=;
 b=pi+MEk/do5EOYME1KP3R9Mephf5PE896oBeAqgtDoDg8rTFcFMdtaN8qp6iLKY2hWj0lScuM
 sfrqGqDkjslz/NQ9u4ogqj55xdZz5FSVKLLtNIO1zwBS6qyoy9fMLq/yQjyXxRMDrChww4Q7
 weypYeiD4Xz8guJQLixa/yWE0dc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 613f925b65c3cc8c63a71ecb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 13 Sep 2021 18:03:07
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4C074C4360D; Mon, 13 Sep 2021 18:03:07 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-72-211-nat.elisa-mobile.fi
 [85.76.72.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 80BBDC43617;
 Mon, 13 Sep 2021 18:03:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 80BBDC43617
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Baochen Qiang <bqiang@codeaurora.org>, Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 5/5] ath11k: Handle MSI enablement during rmmod and SSR
Date: Mon, 13 Sep 2021 21:02:46 +0300
Message-Id: <20210913180246.193388-5-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913180246.193388-1-jouni@codeaurora.org>
References: <20210913180246.193388-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_110328_836383_58887440 
X-CRM114-Status: GOOD (  15.47  )
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

When doing "rmmod ath11k_pci", ath11k performs global SOC reset
and MHI reset, where 0 address access is captured by IOMMU. See
log below:

...
[  133.953860] ath11k_pci 0000:02:00.0: setting mhi state: DEINIT(1)
[  133.959714] ath11k_pci 0000:02:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x000a address=0x0 flags=0x0020]
[  133.973854] ath11k_pci 0000:02:00.0: MHISTATUS 0xff04
[  133.974095] ath11k_pci 0000:02:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x000a address=0x0 flags=0x0020]
...

This issue is also observed in SSR process, cause a similar
sequence as above is performed.

Such an invalid access occurs because, during rmmod or SSR, MSI
address is cleared but HW MSI functionality not disabled, thus HW
target is able to raise an MSI transaction with 0 as MSI address.

So it can be fixed by simply disabling MSI before reset. For SSR,
since MSI functionality is still needed after target is brought
back, we need to reenable it.

Also change naming of some interfaces related.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/pci.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 7b3bce0ba76e..1094b53465bc 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -855,7 +855,18 @@ static void ath11k_pci_ce_irqs_enable(struct ath11k_base *ab)
 	}
 }
 
-static int ath11k_pci_enable_msi(struct ath11k_pci *ab_pci)
+static void ath11k_pci_enable_msi(struct pci_dev *dev, bool enable)
+{
+	u16 control;
+
+	pci_read_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, &control);
+	control &= ~PCI_MSI_FLAGS_ENABLE;
+	if (enable)
+		control |= PCI_MSI_FLAGS_ENABLE;
+	pci_write_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, control);
+}
+
+static int ath11k_pci_alloc_msi(struct ath11k_pci *ab_pci)
 {
 	struct ath11k_base *ab = ab_pci->ab;
 	const struct ath11k_msi_config *msi_config = ab_pci->msi_config;
@@ -876,6 +887,7 @@ static int ath11k_pci_enable_msi(struct ath11k_pci *ab_pci)
 		else
 			return num_vectors;
 	}
+	ath11k_pci_enable_msi(ab_pci->pdev, false);
 
 	msi_desc = irq_get_msi_desc(ab_pci->pdev->irq);
 	if (!msi_desc) {
@@ -898,7 +910,7 @@ static int ath11k_pci_enable_msi(struct ath11k_pci *ab_pci)
 	return ret;
 }
 
-static void ath11k_pci_disable_msi(struct ath11k_pci *ab_pci)
+static void ath11k_pci_free_msi(struct ath11k_pci *ab_pci)
 {
 	pci_free_irq_vectors(ab_pci->pdev);
 }
@@ -1019,6 +1031,8 @@ static int ath11k_pci_power_up(struct ath11k_base *ab)
 	 */
 	ath11k_pci_aspm_disable(ab_pci);
 
+	ath11k_pci_enable_msi(ab_pci->pdev, true);
+
 	ret = ath11k_mhi_start(ab_pci);
 	if (ret) {
 		ath11k_err(ab, "failed to start mhi: %d\n", ret);
@@ -1039,6 +1053,9 @@ static void ath11k_pci_power_down(struct ath11k_base *ab)
 	ath11k_pci_aspm_restore(ab_pci);
 
 	ath11k_pci_force_wake(ab_pci->ab);
+
+	ath11k_pci_enable_msi(ab_pci->pdev, false);
+
 	ath11k_mhi_stop(ab_pci);
 	clear_bit(ATH11K_PCI_FLAG_INIT_DONE, &ab_pci->flags);
 	ath11k_pci_sw_reset(ab_pci->ab, false);
@@ -1263,7 +1280,7 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 		goto err_pci_free_region;
 	}
 
-	ret = ath11k_pci_enable_msi(ab_pci);
+	ret = ath11k_pci_alloc_msi(ab_pci);
 	if (ret) {
 		ath11k_err(ab, "failed to enable msi: %d\n", ret);
 		goto err_pci_free_region;
@@ -1317,7 +1334,7 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
 	ath11k_mhi_unregister(ab_pci);
 
 err_pci_disable_msi:
-	ath11k_pci_disable_msi(ab_pci);
+	ath11k_pci_free_msi(ab_pci);
 
 err_pci_free_region:
 	ath11k_pci_free_region(ab_pci);
@@ -1348,7 +1365,7 @@ static void ath11k_pci_remove(struct pci_dev *pdev)
 	ath11k_mhi_unregister(ab_pci);
 
 	ath11k_pci_free_irq(ab);
-	ath11k_pci_disable_msi(ab_pci);
+	ath11k_pci_free_msi(ab_pci);
 	ath11k_pci_free_region(ab_pci);
 
 	ath11k_hal_srng_deinit(ab);
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
