Return-Path: <SRS0=fz0E=MO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C0C9C63793
	for <ath11k@archiver.kernel.org>; Thu, 22 Jul 2021 10:21:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F22661285
	for <ath11k@archiver.kernel.org>; Thu, 22 Jul 2021 10:21:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F22661285
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vTvs5mqbPOxVXKC3T4grckmun50LqWVCmSIhtl4mHsc=; b=z/SKyT9ZWqXDLa
	tFpu7b6h14cClSG6rZdtXr+LWUuuqCMONr66IVNJ+7jLLVyYqSnybCj8gkbX3XPVHDR2flRHEj6mN
	ytLTd874SBc/bSjLd4gG6eyPskH5EDnszJtx6mdhVBBPuq7+CNSQaCGnmI8pwj3wUv+kb4E4sZD2q
	AlzT2J5RpUgkFg/sUYr72xtcz6qiZF+8asAMkxkVGr/cRJvqgqRmsSCvdFrneuZDpCIPirEf5LnNi
	b7H9jDgIv8C3Jfdrej1cCGvShp89Y6ILeLRamIxoSjQtE4NBZ+RxQ1oclAXyx7A1TWZqooKYpZCvs
	SCJDzvX7dZcjcmi2AWIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6VpW-001CXD-4O; Thu, 22 Jul 2021 10:21:26 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6VpI-001CSc-W1
 for ath11k@lists.infradead.org; Thu, 22 Jul 2021 10:21:14 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1626949271; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=sEI8O3MRZYX32rujGHdALGWFcR20l7QSJ0dWH7WlTls=;
 b=RjvKfg6Xw9UbmEPLJUMJ93Rls8LJUsygqUlL15TNZr0aYx9e+INOrl6GQT7/+KcEQsI9TGf1
 vtR8ulr4hI39EJcDXOao2/6TcKFlP+j4SV6AycdzIIa+FP7Pd9lxj7xdL5uGNsHMcTBepQn6
 ugxx2Fqr7zulPIj8OkdCfs4HqZk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60f946934815712f3a2f8dc0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 22 Jul 2021 10:21:07
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2DACDC433F1; Thu, 22 Jul 2021 10:21:07 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-67-217-nat.elisa-mobile.fi
 [85.76.67.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 730A5C433D3;
 Thu, 22 Jul 2021 10:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 730A5C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 3/3] ath11k: fix survey dump collection in 6 GHz
Date: Thu, 22 Jul 2021 13:20:54 +0300
Message-Id: <20210722102054.43419-3-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722102054.43419-1-jouni@codeaurora.org>
References: <20210722102054.43419-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_032113_153162_E00F046F 
X-CRM114-Status: GOOD (  12.66  )
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

From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>

When ath11k receives survey request, choose the 6 GHz band when enabled.
Without this, survey request does not include any 6 GHz band results,
thereby causing auto channel selection to fail.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01386-QCAHKSWPL_SILICONZ-1

Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 56120407bfdd..133ecb351365 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -7073,7 +7073,13 @@ static int ath11k_mac_op_get_survey(struct ieee80211_hw *hw, int idx,
 
 	if (!sband)
 		sband = hw->wiphy->bands[NL80211_BAND_5GHZ];
+	if (sband && idx >= sband->n_channels) {
+		idx -= sband->n_channels;
+		sband = NULL;
+	}
 
+	if (!sband)
+		sband = hw->wiphy->bands[NL80211_BAND_6GHZ];
 	if (!sband || idx >= sband->n_channels) {
 		ret = -ENOENT;
 		goto exit;
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
