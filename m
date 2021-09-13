Return-Path: <SRS0=KMo3=OD=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E59C4332F
	for <ath11k@archiver.kernel.org>; Mon, 13 Sep 2021 18:03:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 521FA60EE9
	for <ath11k@archiver.kernel.org>; Mon, 13 Sep 2021 18:03:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 521FA60EE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I7PT/Lwp4pNYaIhvboIQhb/dfC69aqA18iDDVDpAvGg=; b=W90a3FmpZJ6jQ7
	83aQvCVoMRHMo1Jy90J/k8HYHhIWMt5JKgFbHwEXZLyqgIsb7/f2xICiFnzxPbgc31s4w8B9ZO+e7
	+rVQpkahzPy4kvCHL7ictud0PHrUku2G07UAT45yced6oosehw942DioOLqhS2F6h8pO7KlwneElE
	PnzvDPiDFPEJK88NjAcww7knvx29XK1d6INaOZAIX3xHU1Fizb6v0QRRFkmwKysOoSfOxWyM3o1dk
	TUgbPGgatw0D08OLu/o8T+RujeEvaEkrRJrZTgvj+OO27wByQQqcJ9AcVuVQqU5EdMUJlnRvM7cvg
	CJDWOklvBncBAcuI9AlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPqId-002t2P-BA; Mon, 13 Sep 2021 18:03:23 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPqIX-002t16-II
 for ath11k@lists.infradead.org; Mon, 13 Sep 2021 18:03:22 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631556200; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=QoSTpIAMWKIF35clN5Hl3YPd5ziftjbn1GcRrPdFY3U=;
 b=mwLMGOdGgvgf3MraEXLncP+JsN+r4TednUSMZUDus/42cEX0hh5huJ7OAnhQZdJ073bsrOCe
 6KDOBt85LvDVTz0LoE0mLWOcNuMw11qas2kN7CT6vl7lMzZcpRocM45tnXMy1HyJjcN7Yoo7
 aHuc0zsp0y5Xuh4fktl7xX6xsec=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 613f9257648642cc1c713548 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 13 Sep 2021 18:03:03
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 85975C43616; Mon, 13 Sep 2021 18:03:03 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-72-211-nat.elisa-mobile.fi
 [85.76.72.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BA270C4338F;
 Mon, 13 Sep 2021 18:03:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org BA270C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Baochen Qiang <bqiang@codeaurora.org>, Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 3/5] ath11k: Fix inaccessible debug registers
Date: Mon, 13 Sep 2021 21:02:44 +0300
Message-Id: <20210913180246.193388-3-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913180246.193388-1-jouni@codeaurora.org>
References: <20210913180246.193388-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_110320_862496_CDA927DD 
X-CRM114-Status: GOOD (  13.50  )
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

Current code clears debug registers after SOC global reset performed
in ath11k_pci_sw_reset. However at that time those registers are
not accessible due to reset, thus they are actually not cleared at all.
For WCN6855, it may cause target fail to initialize. This issue can be
fixed by moving clear action ahead.

In addition, on some specific platforms, need to add delay to wait
those registers to become accessible.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/pci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 5abb38cc3b55..7b3bce0ba76e 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -430,6 +430,8 @@ static void ath11k_pci_force_wake(struct ath11k_base *ab)
 
 static void ath11k_pci_sw_reset(struct ath11k_base *ab, bool power_on)
 {
+	mdelay(100);
+
 	if (power_on) {
 		ath11k_pci_enable_ltssm(ab);
 		ath11k_pci_clear_all_intrs(ab);
@@ -439,9 +441,9 @@ static void ath11k_pci_sw_reset(struct ath11k_base *ab, bool power_on)
 	}
 
 	ath11k_mhi_clear_vector(ab);
+	ath11k_pci_clear_dbg_registers(ab);
 	ath11k_pci_soc_global_reset(ab);
 	ath11k_mhi_set_mhictrl_reset(ab);
-	ath11k_pci_clear_dbg_registers(ab);
 }
 
 int ath11k_pci_get_msi_irq(struct device *dev, unsigned int vector)
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
