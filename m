Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3565DC48BF6
	for <ath11k@archiver.kernel.org>; Tue, 27 Feb 2024 02:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/7UEJNQG/gobSh6gH6G+5lkF2gCAP+NKKg9SbmgoMCA=; b=ceYDotNgvTusqP3PM5n8A7Whdd
	9zsn0JPLVOc48fZbQjwnq1g4Cbx2OlVBt/hy9Soe2F50UtEEu1M1tx7tfmRVDKzelCnzZeQetg2xM
	XaU6xhf2r/pKeTbcsUxOVu1tBht3fLl401SBgJj7gWnTfTMrAKbpktX7/++JumVPShRUv3vHwpk65
	pVeaczCw6xQpqGOocbDTj05zerj7BEjg7WnSBYq9vyeJye+viRhS/Kj0rq17rk4kfqROHXYga8JWv
	zZG9Y6Bro7UL58HAC++xiP3HarzbKIvevQeEJ6jtMsk0gnkPkV3SuODWDRoVd5cf0V+X89tWEqsBL
	FQK/FFwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1renT7-00000003W2X-34MY;
	Tue, 27 Feb 2024 02:45:22 +0000
Received: from ns.kevlo.org ([220.134.220.36] helo=mail.kevlo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1renT5-00000003W25-12k7
	for ath11k@lists.infradead.org;
	Tue, 27 Feb 2024 02:45:20 +0000
Received: from localhost (ns.kevlo.org [local])
	by ns.kevlo.org (OpenSMTPD) with ESMTPA id 61ec6d79;
	Tue, 27 Feb 2024 10:45:15 +0800 (CST)
Date: Tue, 27 Feb 2024 10:45:15 +0800
From: Kevin Lo <kevlo@kevlo.org>
To: ath11k@lists.infradead.org
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>,
	linux-wireless@vger.kernel.org
Subject: [PATCH] wifi: ath11k: adjust a comment to reflect reality
Message-ID: <Zd1Muyd8mtA1Hih7@ns.kevlo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_184519_667228_4EAFC7D6 
X-CRM114-Status: UNSURE (   4.67  )
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

In ath11k_mhi_set_mhictrl_reset(), I observed on QCA6390/QCN9074/WCN6855,
MHISTATUS has SYSERR bit always been set after SOC_GLOBAL_RESET.

Signed-off-by: Kevin Lo <kevlo@kevlo.org>
---
diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index 3de7fa6f88d0..1198e80d9dff 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -158,8 +158,8 @@ void ath11k_mhi_set_mhictrl_reset(struct ath11k_base *ab)
 
 	ath11k_dbg(ab, ATH11K_DBG_PCI, "mhistatus 0x%x\n", val);
 
-	/* Observed on QCA6390 that after SOC_GLOBAL_RESET, MHISTATUS
-	 * has SYSERR bit set and thus need to set MHICTRL_RESET
+	/* After SOC_GLOBAL_RESET, MHISTATUS has SYSERR bit
+	 * always been set and thus need to set MHICTRL_RESET
 	 * to clear SYSERR.
 	 */
 	ath11k_pcic_write32(ab, MHICTRL, MHICTRL_RESET_MASK);

