Return-Path: <SRS0=KMo3=OD=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85284C433F5
	for <ath11k@archiver.kernel.org>; Mon, 13 Sep 2021 18:09:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E87960EE9
	for <ath11k@archiver.kernel.org>; Mon, 13 Sep 2021 18:09:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E87960EE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8kvKjV+TD+VktWaaVT/auwOAzX9bHAO/YOSUQRJh+kY=; b=iS2/AXgqkKk9Ti
	Q3mfDPhiLSWOuwIMQ7gMloiK62mnoSNt9T2NAAaTvKC6UAj7RQ43ci8CFuCc9/pnbRk8FYdXxqKI3
	8qx61v6EnyotqmzwavigjLTAOUc9+702nbBvp5mlXns0fc7/X0fGNCC50VXXGNAt7AZvGquDqXb1J
	MDoYSL6Ld/vnS6wxwcM0xQvfNzYgMg/57vpqt89hKdGkHiHeJSiTiM81EtGMe89qKIKk46NeMA4O3
	+qEP2+U3uiA+nZHJwR1iwEBuB59Cq18+nP0g9KvTH6NtDWwumiiHAMvfrTMd4LyMR30b02seHNcr1
	3I88jnfgDzb/vySC5riw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPqOa-002ta5-BN; Mon, 13 Sep 2021 18:09:32 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPqOU-002tXs-SM
 for ath11k@lists.infradead.org; Mon, 13 Sep 2021 18:09:30 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631556569; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=UDyTXV2qIFPeqGGM5DT0KdVaxQKpk0kdL/OeV+VHVSo=;
 b=aJE2cNL4ltGfOYjaJ50gdcm8691F2EgKnnBhSeqXIvazg4loo+19/TpzmB+sE4K9IpB0HXo3
 maw/fz4z8IZnPTm8IxjpySVI7Lv0A85xhQMgt+a3M/RA1ASp5Vzi8Qhu9DSoxyLnGU84VOeS
 tUsFJNx4WTspwxhQOD/9/1a8q9w=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 613f93ce507800c880726173 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 13 Sep 2021 18:09:18
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1A3B8C4338F; Mon, 13 Sep 2021 18:09:18 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-72-211-nat.elisa-mobile.fi
 [85.76.72.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 48BDEC43460;
 Mon, 13 Sep 2021 18:09:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 48BDEC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Baochen Qiang <bqiang@codeaurora.org>, Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 1/3] ath11k: Split PCI write/read functions
Date: Mon, 13 Sep 2021 21:09:00 +0300
Message-Id: <20210913180902.193874-2-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913180902.193874-1-jouni@codeaurora.org>
References: <20210913180902.193874-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_110929_470988_1074D31E 
X-CRM114-Status: GOOD (  17.62  )
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

ath11k_pci_write32/read32 tries to wake up MHI before doing actual
write/read work, which means each time a u32 is written/read, MHI
wake up is performed. This is not necessary in case where we do a
large amount of write/read, cause only one time of wake up is needed.
So split each one into two parts, the first part does MHI get/put
and the second one does actual write/read work.

Also avoid the put operation if the previous get operation fails.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/pci.c | 61 ++++++++++++++++++---------
 1 file changed, 42 insertions(+), 19 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 1094b53465bc..5c3ec3e7be89 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -174,18 +174,11 @@ static inline u32 ath11k_pci_get_window_start(struct ath11k_base *ab,
 	return window_start;
 }
 
-void ath11k_pci_write32(struct ath11k_base *ab, u32 offset, u32 value)
+void ath11k_pci_do_write32(struct ath11k_base *ab, u32 offset, u32 value)
 {
 	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
 	u32 window_start;
 
-	/* for offset beyond BAR + 4K - 32, may
-	 * need to wakeup MHI to access.
-	 */
-	if (test_bit(ATH11K_PCI_FLAG_INIT_DONE, &ab_pci->flags) &&
-	    offset >= ACCESS_ALWAYS_OFF)
-		mhi_device_get_sync(ab_pci->mhi_ctrl->mhi_dev);
-
 	if (offset < WINDOW_START) {
 		iowrite32(value, ab->mem  + offset);
 	} else {
@@ -205,23 +198,33 @@ void ath11k_pci_write32(struct ath11k_base *ab, u32 offset, u32 value)
 				  (offset & WINDOW_RANGE_MASK));
 		}
 	}
-
-	if (test_bit(ATH11K_PCI_FLAG_INIT_DONE, &ab_pci->flags) &&
-	    offset >= ACCESS_ALWAYS_OFF)
-		mhi_device_put(ab_pci->mhi_ctrl->mhi_dev);
 }
 
-u32 ath11k_pci_read32(struct ath11k_base *ab, u32 offset)
+void ath11k_pci_write32(struct ath11k_base *ab, u32 offset, u32 value)
 {
 	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
-	u32 val, window_start;
+	bool wakeup_required;
+	int ret;
 
 	/* for offset beyond BAR + 4K - 32, may
 	 * need to wakeup MHI to access.
 	 */
-	if (test_bit(ATH11K_PCI_FLAG_INIT_DONE, &ab_pci->flags) &&
-	    offset >= ACCESS_ALWAYS_OFF)
-		mhi_device_get_sync(ab_pci->mhi_ctrl->mhi_dev);
+	wakeup_required = test_bit(ATH11K_PCI_FLAG_INIT_DONE, &ab_pci->flags) &&
+			  offset >= ACCESS_ALWAYS_OFF;
+
+	if (wakeup_required)
+		ret = mhi_device_get_sync(ab_pci->mhi_ctrl->mhi_dev);
+
+	ath11k_pci_do_write32(ab, offset, value);
+
+	if (wakeup_required && !ret)
+		mhi_device_put(ab_pci->mhi_ctrl->mhi_dev);
+}
+
+u32 ath11k_pci_do_read32(struct ath11k_base *ab, u32 offset)
+{
+	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
+	u32 val, window_start;
 
 	if (offset < WINDOW_START) {
 		val = ioread32(ab->mem + offset);
@@ -243,8 +246,28 @@ u32 ath11k_pci_read32(struct ath11k_base *ab, u32 offset)
 		}
 	}
 
-	if (test_bit(ATH11K_PCI_FLAG_INIT_DONE, &ab_pci->flags) &&
-	    offset >= ACCESS_ALWAYS_OFF)
+	return val;
+}
+
+u32 ath11k_pci_read32(struct ath11k_base *ab, u32 offset)
+{
+	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
+	u32 val;
+	bool wakeup_required;
+	int ret;
+
+	/* for offset beyond BAR + 4K - 32, may
+	 * need to wakeup MHI to access.
+	 */
+	wakeup_required = test_bit(ATH11K_PCI_FLAG_INIT_DONE, &ab_pci->flags) &&
+			  offset >= ACCESS_ALWAYS_OFF;
+
+	if (wakeup_required)
+		ret = mhi_device_get_sync(ab_pci->mhi_ctrl->mhi_dev);
+
+	val = ath11k_pci_do_read32(ab, offset);
+
+	if (wakeup_required && !ret)
 		mhi_device_put(ab_pci->mhi_ctrl->mhi_dev);
 
 	return val;
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
