Return-Path: <SRS0=YLPq=NZ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FEB0C43217
	for <ath11k@archiver.kernel.org>; Fri,  3 Sep 2021 11:48:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE31560FDC
	for <ath11k@archiver.kernel.org>; Fri,  3 Sep 2021 11:48:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DE31560FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p2qRKeKxIg0WxCj0KghTcUjDfRRJ8xYDLftypF7DiAI=; b=Wuh156uMnqC/KK
	2cPG9HvDTxNEVPENBYv6IJHOlia7SrQ04h/+GfEjtfMFDTrq9XfKJSav/h4ZgS3kfVMiphQu5SN+N
	pcl6v/grrVtOsoKGaaJQsrNYuryUG5UW+uGASwO5YLWAwOkqrYUh6uznRjGfreTp/E2oLKcLR2lvB
	w2jNma5cF07SBv6wUcZIc2ZfPixofzHSq/snHu8MBTvAIK8nst5aFUa36/SliG+WIoCP0sfXwizFP
	0EM5QqTOq8AsKuLULO470FFBcVmco5A11VcZTXpLC8DHErAJA1bH/D1OQnF+Evg0DgppyE9FA/HQ4
	8ncVaDyMYfZawTAe2ztg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mM7gY-00BpQd-N5; Fri, 03 Sep 2021 11:48:42 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mM7gU-00BpOH-TC
 for ath11k@lists.infradead.org; Fri, 03 Sep 2021 11:48:40 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1630669717; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=HdzZuCNAC1xDlrRxaW72yXJ2nEZjm7iGv5mmFGp4lPo=;
 b=pFmGCApAJ5/c2+ak+SBcYNxYLi174Ob5GC/WqWYmMZAHcAgt/i0QmQIlCig/OEr+9dDDk7X8
 PF68cRpYvJmpEWvCliS5QuJKFM2+dH37yn2aMJ5Lh8XfMRKTQupfZH3abgOXwahcKb7uw7Xx
 LYPmHLRKtuxll376bvBoHlXBqTg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 61320b93cd680e8969afd875 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 03 Sep 2021 11:48:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A7C71C43460; Fri,  3 Sep 2021 11:48:34 +0000 (UTC)
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (unknown
 [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1E12CC43616;
 Fri,  3 Sep 2021 11:48:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 1E12CC43616
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: johannes@sipsolutions.net,
	ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	wgong@codeaurora.org
Subject: [PATCH v3 4/9] cfg80211: add definition for 6 GHz power spectral
 density(psd)
Date: Fri,  3 Sep 2021 07:48:16 -0400
Message-Id: <20210903114821.23346-5-wgong@codeaurora.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903114821.23346-1-wgong@codeaurora.org>
References: <20210903114821.23346-1-wgong@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210903_044839_073334_7B32FC4C 
X-CRM114-Status: GOOD (  13.37  )
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

6 GHz regulatory domains introduces power spectral density(psd). This
patch is define the flags for psd.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 include/net/cfg80211.h       | 5 +++++
 include/net/regulatory.h     | 1 +
 include/uapi/linux/nl80211.h | 2 ++
 3 files changed, 8 insertions(+)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 58c2cd417e89..a03a0b84b44e 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -108,6 +108,8 @@ struct wiphy;
  *	on this channel.
  * @IEEE80211_CHAN_16MHZ: 16 MHz bandwidth is permitted
  *	on this channel.
+ * @IEEE80211_CHAN_PSD: power spectral density (in dBm)
+ *	on this channel.
  *
  */
 enum ieee80211_channel_flags {
@@ -130,6 +132,7 @@ enum ieee80211_channel_flags {
 	IEEE80211_CHAN_4MHZ		= 1<<16,
 	IEEE80211_CHAN_8MHZ		= 1<<17,
 	IEEE80211_CHAN_16MHZ		= 1<<18,
+	IEEE80211_CHAN_PSD		= 1<<19,
 };
 
 #define IEEE80211_CHAN_NO_HT40 \
@@ -163,6 +166,7 @@ enum ieee80211_channel_flags {
  *	on this channel.
  * @dfs_state_entered: timestamp (jiffies) when the dfs state was entered.
  * @dfs_cac_ms: DFS CAC time in milliseconds, this is valid for DFS channels.
+ * @psd: power spectral density (in dBm)
  */
 struct ieee80211_channel {
 	enum nl80211_band band;
@@ -179,6 +183,7 @@ struct ieee80211_channel {
 	enum nl80211_dfs_state dfs_state;
 	unsigned long dfs_state_entered;
 	unsigned int dfs_cac_ms;
+	s8 psd;
 };
 
 /**
diff --git a/include/net/regulatory.h b/include/net/regulatory.h
index 47f06f6f5a67..ed20004fb6a9 100644
--- a/include/net/regulatory.h
+++ b/include/net/regulatory.h
@@ -221,6 +221,7 @@ struct ieee80211_reg_rule {
 	u32 flags;
 	u32 dfs_cac_ms;
 	bool has_wmm;
+	s8 psd;
 };
 
 struct ieee80211_regdomain {
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index f962c06e9818..78b0f3a6cc13 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -4043,6 +4043,7 @@ enum nl80211_sched_scan_match_attr {
  * @NL80211_RRF_NO_80MHZ: 80MHz operation not allowed
  * @NL80211_RRF_NO_160MHZ: 160MHz operation not allowed
  * @NL80211_RRF_NO_HE: HE operation not allowed
+ * @NL80211_RRF_PSD: channels has power spectral density value
  */
 enum nl80211_reg_rule_flags {
 	NL80211_RRF_NO_OFDM		= 1<<0,
@@ -4061,6 +4062,7 @@ enum nl80211_reg_rule_flags {
 	NL80211_RRF_NO_80MHZ		= 1<<15,
 	NL80211_RRF_NO_160MHZ		= 1<<16,
 	NL80211_RRF_NO_HE		= 1<<17,
+	NL80211_RRF_PSD		= 1<<18,
 };
 
 #define NL80211_RRF_PASSIVE_SCAN	NL80211_RRF_NO_IR
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
