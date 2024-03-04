Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD794C54E41
	for <ath11k@archiver.kernel.org>; Mon,  4 Mar 2024 08:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IgfgkF06Cp984PSM7M0x4D1nIGv0BQaF6qAWutgwl1U=; b=QnKdiv8j7rmlA0K/PE0DKy1WX9
	Z4RusCODMb1In0NAmvlk/fvkarbRnUF0U0ShDiGnzSbFq8V1oRicLWxhDPj1jL3QRaLVZ3LfVfJ6u
	mdJsl2I9pyWLYPIT8tHykJ5KuKw1JykjWeJxMpTml0BDuXyQvITVD3sTJtSF4ru6v7xlmUBQZCxzm
	HYO93GzMqbhVKxRT6C+A85CJ1v9Ctkr6TOa0qCnyi10z05HF9F/BwvzhKf0taUSw1kEbvW1mgkHmQ
	lHcOBoor7ONqgca/v7FEx4c2iTLLF2FHWzczrupjAPjUEGVVtU7jShyjKKvM6rrMCqebwrydQ/h4v
	yoRTjF+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh3aN-000000087kM-0uGT;
	Mon, 04 Mar 2024 08:22:11 +0000
Received: from ns.kevlo.org ([220.134.220.36] helo=mail.kevlo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh3aI-000000087jA-27t0
	for ath11k@lists.infradead.org;
	Mon, 04 Mar 2024 08:22:08 +0000
Received: from localhost (ns.kevlo.org [local])
	by ns.kevlo.org (OpenSMTPD) with ESMTPA id 07a1ee66;
	Mon, 4 Mar 2024 16:22:00 +0800 (CST)
Date: Mon, 4 Mar 2024 16:22:00 +0800
From: Kevin Lo <kevlo@kevlo.org>
To: ath11k@lists.infradead.org
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, Kalle Valo <kvalo@kernel.org>,
	linux-wireless@vger.kernel.org
Subject: [PATCH v2] wifi: ath11k: adjust a comment to reflect reality
Message-ID: <ZeWEqGVibkMg2APi@ns.kevlo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_002207_091859_53BF0CC3 
X-CRM114-Status: UNSURE (   6.10  )
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

On QCA6390/QCN9074/WCN6855, MHISTATUS may still have SYSERR bit set
after SOC_GLOBAL_RESET.

changes for v2:
- update comment about resetting MHICTRL to clear SYSERR

Signed-off-by: Kevin Lo <kevlo@kevlo.org>
--- 
diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index fb4ecf9a103e..956fff0d4962 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -158,9 +158,8 @@ void ath11k_mhi_set_mhictrl_reset(struct ath11k_base *ab)
 
 	ath11k_dbg(ab, ATH11K_DBG_PCI, "mhistatus 0x%x\n", val);
 
-	/* Observed on QCA6390 that after SOC_GLOBAL_RESET, MHISTATUS
-	 * has SYSERR bit set and thus need to set MHICTRL_RESET
-	 * to clear SYSERR.
+	/* After SOC_GLOBAL_RESET, MHISTATUS may still have SYSERR bit set 
+	 * and thus need to set MHICTRL_RESET to clear SYSERR.
 	 */
 	ath11k_pcic_write32(ab, MHICTRL, MHICTRL_RESET_MASK);
 

