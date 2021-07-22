Return-Path: <SRS0=fz0E=MO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65DFEC6377D
	for <ath11k@archiver.kernel.org>; Thu, 22 Jul 2021 10:21:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 756CC61287
	for <ath11k@archiver.kernel.org>; Thu, 22 Jul 2021 10:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 756CC61287
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7Z7kwXn+VYPalodRqa+xIOu7691fJanSZJ+Xd8oVE68=; b=E69Cv/TT64bQCD
	q7RUqFprl2q2/XyX3WXOa2dXknMx0WdVPN0x1c5oIK3u8XbHVwkUJyWDAfu2Q1WjDtK9F4cdaJXD1
	kWXW6tbS7+s5D7A7MPR4CwCLvuv8ltdslUha4ivTQuBhLn/6O4hMcek65AWMeNWAk1W4ebetwe44s
	ogulAfLbK45rDWqMhD/XQG/RivK7I5na1wDNT6Wnbdex57fNtiiS7xmX7X1CcFtJDN/1CD3j/Y6hJ
	p/SxzyGZFodCORqOMUd7ym+8ILnCI72FgFSJp844go07Xr9t0TPipqH4rGDdE4tbQ5b1bbKIXRHAG
	qDWoK/+CVD87OkARE6Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6Vpd-001Caq-3S; Thu, 22 Jul 2021 10:21:33 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6VpW-001CWa-2u
 for ath11k@lists.infradead.org; Thu, 22 Jul 2021 10:21:31 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1626949289; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=8LtPGJGunu592abx+3Vdgj3yMYEyAgHRF3rksHbKtnM=;
 b=lDmPUJJwHv8SFZKCQzRyp4vpmFdhBcuD1/iuumMAskYQ51yNAWIpE2ktJiJ/qhr6axW10Gde
 hNTxsj3MZMqOwjCSd7RIln8ykVOTj+JM9Mc+FpA2AhlN7J/8Ly5jPS7VsxUqkP8dEgpXIzDZ
 YhZtbwTwk9lbokF0UbfbdDsjiZM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 60f9468efcf9fe7b7876cce9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 22 Jul 2021 10:21:02
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 11736C433F1; Thu, 22 Jul 2021 10:21:02 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-67-217-nat.elisa-mobile.fi
 [85.76.67.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0A9F9C4338A;
 Thu, 22 Jul 2021 10:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0A9F9C4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 1/3] ath11k: add channel 2 into 6 GHz channel list
Date: Thu, 22 Jul 2021 13:20:52 +0300
Message-Id: <20210722102054.43419-1-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_032129_941766_8D3EDB27 
X-CRM114-Status: GOOD (  13.75  )
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

Add support for the 6 GHz channel 2 with center frequency 5935 MHz and
operating class 136 per IEEE Std 802.11ax-2021, Table E-4.

Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.h | 4 ++--
 drivers/net/wireless/ath/ath11k/mac.c  | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 79c52d28a3a2..d58ca38d78c7 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -381,9 +381,9 @@ struct ath11k_sta {
 };
 
 #define ATH11K_MIN_5G_FREQ 4150
-#define ATH11K_MIN_6G_FREQ 5945
+#define ATH11K_MIN_6G_FREQ 5925
 #define ATH11K_MAX_6G_FREQ 7115
-#define ATH11K_NUM_CHANS 100
+#define ATH11K_NUM_CHANS 101
 #define ATH11K_MAX_5G_CHAN 173
 
 enum ath11k_state {
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 10a838563683..56120407bfdd 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -150,6 +150,9 @@ static const struct ieee80211_channel ath11k_6ghz_channels[] = {
 	CHAN6G(225, 7075, 0),
 	CHAN6G(229, 7095, 0),
 	CHAN6G(233, 7115, 0),
+
+	/* new addition in IEEE Std 802.11ax-2021 */
+	CHAN6G(2, 5935, 0),
 };
 
 static struct ieee80211_rate ath11k_legacy_rates[] = {
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
