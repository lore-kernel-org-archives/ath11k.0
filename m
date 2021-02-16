Return-Path: <SRS0=GJml=HS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C019C433DB
	for <ath11k@archiver.kernel.org>; Tue, 16 Feb 2021 07:22:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8EBA64DDA
	for <ath11k@archiver.kernel.org>; Tue, 16 Feb 2021 07:22:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8EBA64DDA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lRNcxKScwasrGpYTYsnyL1PXQgsmYDN2Kd8VgRBLWb4=; b=N0Y2BvLMOI51WZRPwq4hJ5xrFq
	nxsG7adVhDGhCJBL3DdZIOBnZr7JJzIrizN2Gj/mrHHmkXgurtgnBX8XGhCDcNHW55iTkqQcL/fPy
	dVBdSudj9QnBJTCf77e+4ZUAmhkycGYAngrerZMw0Zvk4q0O5vMwk7wJijLk9teuAlW8M5XBifwf2
	YEejYvcJbaroCeGbd+FbvmKUyujFjBtEXMPh8zC/voiufdj2Z49JtdbAbX3MK/qiRRBurY6RjJ1Sm
	Xs6dbBjWnEjl0k1+K+ny/cIMdg+gd+X6IIhaYoKsHRXXdixhsHuFFlFUjtwgMkiOvScNqrxlbDpgd
	+KJ5BakQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBugs-00008B-MR; Tue, 16 Feb 2021 07:22:34 +0000
Received: from z11.mailgun.us ([104.130.96.11])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBugp-00007e-FU
 for ath11k@lists.infradead.org; Tue, 16 Feb 2021 07:22:33 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1613460152; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=J7Z5Sdzsu6muTrj/phu9Vt/0bJW3Zaz7PLKsnc1Razg=;
 b=GJwerjiQ3IItqqpBmVMKdkLZhUL0pKuW/AwvqFPALWQckp8FFz3o9WEnqVTiwpuvUwvEoPjj
 VPeAEQxTLi5gVeC8VYPGTihjXshMcy25zWxv42FyCeLTFvxI+TtQpFpW+GVgD3AZ4viy8FUB
 tJGO4Y4AhDSE0ksfSOYH0AiZySg=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 602b72b2e4842e912899d1db (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 16 Feb 2021 07:22:26
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 19FEEC433C6; Tue, 16 Feb 2021 07:22:26 +0000 (UTC)
Received: from lavaks-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: lavaks)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5E6EDC433CA;
 Tue, 16 Feb 2021 07:22:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5E6EDC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=lavaks@codeaurora.org
From: Lavanya Suresh <lavaks@codeaurora.org>
To: ath11k@lists.infradead.org
Subject: [PATCH] ath11k: Fix sounding dimension config in HE cap
Date: Tue, 16 Feb 2021 12:52:16 +0530
Message-Id: <1613460136-7170-1-git-send-email-lavaks@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_022232_866798_D2BE4CDC 
X-CRM114-Status: GOOD (  11.28  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: Lavanya Suresh <lavaks@codeaurora.org>, linux-wireless@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Number of Sounding dimensions config received from firmware for
bandwidth above 80MHz is cleared, and proper value is not set again.
So not resetting it to accept the config from firmware.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01689-QCAHKSWPL_SILICONZ-1

Signed-off-by: Lavanya Suresh <lavaks@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 5e5026c..61c166e 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4604,8 +4604,6 @@ static int ath11k_mac_copy_he_cap(struct ath11k *ar,
 
 		he_cap_elem->phy_cap_info[5] &=
 			~IEEE80211_HE_PHY_CAP5_BEAMFORMEE_NUM_SND_DIM_UNDER_80MHZ_MASK;
-		he_cap_elem->phy_cap_info[5] &=
-			~IEEE80211_HE_PHY_CAP5_BEAMFORMEE_NUM_SND_DIM_ABOVE_80MHZ_MASK;
 		he_cap_elem->phy_cap_info[5] |= ar->num_tx_chains - 1;
 
 		switch (i) {
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
