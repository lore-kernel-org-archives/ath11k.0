Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0880DC433FE
	for <ath11k@archiver.kernel.org>; Fri,  1 Apr 2022 17:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eP7abGARCCYHPZsDnSXyJB/WHwkaRduegxJXhmWHdl8=; b=1anGebltYnDFjC
	1QWuNREw4EzA3DeBWIMpWdR15jGiHslht0qaUWCBaRxetsVsXDC2uH1mFi4g2dMoYFvVVlLi9hk+7
	fuI79XEqwMMCx+u0f/07YznZRZ0f+b58fmz4IQkIFUEFYRppCsdztF+3rmfpzngqHjQKv2n3FhJut
	2J5EkTH8bxacRIeRwhX7nMEFv5uVHtSCfF/vJvcX6/Ooo7NoJKr3v5gZKMuPj+XXhPWFngDME5jO4
	aCuHNOcbA7tG4njYYQoeaCQlPBsTguXkHHgDou/xAZVhVyIsetU8qrdaC/z4COGLu3q8xGsgJ3pYy
	FgTLCFSL8ByXbKVkXvyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naL6s-006i7M-Kq; Fri, 01 Apr 2022 17:30:54 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naL6p-006i58-7S
 for ath11k@lists.infradead.org; Fri, 01 Apr 2022 17:30:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EC9B9B82591
 for <ath11k@lists.infradead.org>; Fri,  1 Apr 2022 17:30:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 252E6C2BBE4;
 Fri,  1 Apr 2022 17:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648834248;
 bh=AGUbQ/6tuDhyCxox2uCn1cj6QMdBMBZn2WDJZ7Y3XWs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=THJsbTClVnoE6JaSctC2GiG4TVcvrqN/3jesTnhGjR8bWA3XnWWhpjQmrY/SQSNyt
 DvDziymXiG5ptMyzQWCc+X+rm0yrM0EqzFie57G4kudEo6zU1jnUrcECuPmOTWGUZL
 9OfTJS00HrJeNjWPqwUfcqICrY+ol+x1CsyHuH985W7CUXhKikd0s3mEd7kWLfOF4J
 1pRyYCp+QHUqRE1nCCHwKuBYPUhYz5ANAoTJoLmTmEg0V6UBvb49MXTHw+KtVVJM+O
 ucN//y2xqrAghb8uvoD4ejt0iUcHyUFswUdT/p8n3AtwWBZfNu8gaPMqdNywTrFN4T
 T5O0MHcEB/HGQ==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 2/3] ath11k: mhi: add error handling for suspend and resume
Date: Fri,  1 Apr 2022 20:30:41 +0300
Message-Id: <20220401173042.17467-3-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220401173042.17467-1-kvalo@kernel.org>
References: <20220401173042.17467-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_103051_583598_7407A34D 
X-CRM114-Status: GOOD (  15.69  )
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

From: Kalle Valo <quic_kvalo@quicinc.com>

While reviewing the mhi.c I noticed we were just ignoring the errors coming
from MHI subsystem during suspend and resume. Add proper checks and warning
messages. Also pass the error value to callers.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03003-QCAHSPSWPL_V1_V2_SILICONZ_LITE-2

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mhi.c | 26 ++++++++++++++++++++++----
 drivers/net/wireless/ath/ath11k/mhi.h |  4 ++--
 drivers/net/wireless/ath/ath11k/pci.c |  8 ++------
 3 files changed, 26 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index d9b63a1f8219..706de7b0b4a1 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -487,16 +487,34 @@ void ath11k_mhi_stop(struct ath11k_pci *ab_pci)
 	mhi_unprepare_after_power_down(ab_pci->mhi_ctrl);
 }
 
-void ath11k_mhi_suspend(struct ath11k_pci *ab_pci)
+int ath11k_mhi_suspend(struct ath11k_pci *ab_pci)
 {
-	mhi_pm_suspend(ab_pci->mhi_ctrl);
+	struct ath11k_base *ab = ab_pci->ab;
+	int ret;
+
+	ret = mhi_pm_suspend(ab_pci->mhi_ctrl);
+	if (ret) {
+		ath11k_warn(ab, "failed to suspend mhi: %d", ret);
+		return ret;
+	}
+
+	return 0;
 }
 
-void ath11k_mhi_resume(struct ath11k_pci *ab_pci)
+int ath11k_mhi_resume(struct ath11k_pci *ab_pci)
 {
+	struct ath11k_base *ab = ab_pci->ab;
+	int ret;
+
 	/* Do force MHI resume as some devices like QCA6390, WCN6855
 	 * are not in M3 state but they are functional. So just ignore
 	 * the MHI state while resuming.
 	 */
-	mhi_pm_resume_force(ab_pci->mhi_ctrl);
+	ret = mhi_pm_resume_force(ab_pci->mhi_ctrl);
+	if (ret) {
+		ath11k_warn(ab, "failed to resume mhi: %d", ret);
+		return ret;
+	}
+
+	return 0;
 }
diff --git a/drivers/net/wireless/ath/ath11k/mhi.h b/drivers/net/wireless/ath/ath11k/mhi.h
index 5dd024f879c4..8d9f852da695 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.h
+++ b/drivers/net/wireless/ath/ath11k/mhi.h
@@ -23,7 +23,7 @@ void ath11k_mhi_unregister(struct ath11k_pci *ar_pci);
 void ath11k_mhi_set_mhictrl_reset(struct ath11k_base *ab);
 void ath11k_mhi_clear_vector(struct ath11k_base *ab);
 
-void ath11k_mhi_suspend(struct ath11k_pci *ar_pci);
-void ath11k_mhi_resume(struct ath11k_pci *ar_pci);
+int ath11k_mhi_suspend(struct ath11k_pci *ar_pci);
+int ath11k_mhi_resume(struct ath11k_pci *ar_pci);
 
 #endif
diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 8a3ff12057e8..d2f220b4121a 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -1206,18 +1206,14 @@ static int ath11k_pci_hif_suspend(struct ath11k_base *ab)
 {
 	struct ath11k_pci *ar_pci = ath11k_pci_priv(ab);
 
-	ath11k_mhi_suspend(ar_pci);
-
-	return 0;
+	return ath11k_mhi_suspend(ar_pci);
 }
 
 static int ath11k_pci_hif_resume(struct ath11k_base *ab)
 {
 	struct ath11k_pci *ar_pci = ath11k_pci_priv(ab);
 
-	ath11k_mhi_resume(ar_pci);
-
-	return 0;
+	return ath11k_mhi_resume(ar_pci);
 }
 
 static void ath11k_pci_kill_tasklets(struct ath11k_base *ab)
-- 
2.30.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
