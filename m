Return-Path: <SRS0=H079=MN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82A71C12002
	for <ath11k@archiver.kernel.org>; Wed, 21 Jul 2021 18:08:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 565916113C
	for <ath11k@archiver.kernel.org>; Wed, 21 Jul 2021 18:08:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 565916113C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bt70vhPodz+G9J4sR65ORdRPyJTWOqNRcwiT+QUvTFw=; b=ZXLjaxmooMciQ3
	nfIdGWI878V0VjAFZC55bVTom3ZD7m29NKnV5o6wCi3VFSv+lo7VuUA4svMiahnSSjeIHMHcJs3/m
	WmF7HaHFTdxwmD+u7PLPWKb7nF7a2srWHlN1u4hwqSME4Zc7EUiOJERFQ1z37w7ozO9jreaTubJeX
	hZ/OxOuEfjQj1xdXn/N9CfKUXZcSabDkHSPQ0OpucIFCXWgRAXbSa0OJKOHvXHSnD49q5IqvJUXBN
	UpGE21lAPTUbVSynowbcq4gJHE+izsGT915mEJ56pWwd4CV4Ey3zQRdVCCrpRACZWgAnr2bfvG9nq
	ifkDNPbtG7YMCIaBwYPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6GeH-00Gno9-9r; Wed, 21 Jul 2021 18:08:49 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6Ge6-00GnkF-IQ
 for ath11k@lists.infradead.org; Wed, 21 Jul 2021 18:08:48 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1626890926; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=QHPS1WTyQDVEqPmun+UsVZICtnG1iaZHXWu8Tqi7l3c=;
 b=GKKRMfn/vqsknh+LLHerpkNY8ye8bFLKuckcPR4fW3G3W0+eZ06nlJWi4hM7kyTxCUYxPyUh
 te3xxPzVwWp9JndXzfWCJcRcXnZjutuPX1exhlSYm5ao1QF1UkKWMOmerMDiuKyble+JW9Ua
 X0hAL8w0PqIXiRmEaZfFFT07cR0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60f862a04815712f3a03f44e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Jul 2021 18:08:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 97192C43144; Wed, 21 Jul 2021 18:08:30 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-67-217-nat.elisa-mobile.fi
 [85.76.67.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 985FAC433D3;
 Wed, 21 Jul 2021 18:08:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 985FAC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Karthikeyan Periyasamy <periyasa@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 3/4] ath11k: Fix the spectral minimum FFT bin count
Date: Wed, 21 Jul 2021 21:08:08 +0300
Message-Id: <20210721180809.90960-4-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721180809.90960-1-jouni@codeaurora.org>
References: <20210721180809.90960-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_110846_928983_F37026AE 
X-CRM114-Status: GOOD (  15.18  )
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

From: Karthikeyan Periyasamy <periyasa@codeaurora.org>

User was not able to configure the spectral with the FFT bin count 32.
In all supported platforms, the expected minimum FFT bin count is 32 but
it was wrongly defined as 64. This restrict the user to not configure
down to the actually supported minimum FFT bin count. So update the
minimum FFT bin count as 32.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01492-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ6018 hw1.0 AHB WLAN.HK.2.4.0.1-00330-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/spectral.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/spectral.c b/drivers/net/wireless/ath/ath11k/spectral.c
index aca3c523632e..7473d1f3ddf5 100644
--- a/drivers/net/wireless/ath/ath11k/spectral.c
+++ b/drivers/net/wireless/ath/ath11k/spectral.c
@@ -11,7 +11,7 @@
 #define ATH11K_SPECTRAL_EVENT_TIMEOUT_MS	1
 
 #define ATH11K_SPECTRAL_DWORD_SIZE		4
-#define ATH11K_SPECTRAL_MIN_BINS		64
+#define ATH11K_SPECTRAL_MIN_BINS		32
 #define ATH11K_SPECTRAL_MIN_IB_BINS	(ATH11K_SPECTRAL_MIN_BINS >> 1)
 #define ATH11K_SPECTRAL_MAX_IB_BINS(x)	((x)->hw_params.spectral.max_fft_bins >> 1)
 
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
