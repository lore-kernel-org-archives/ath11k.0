Return-Path: <SRS0=YLPq=NZ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C305BC433F5
	for <ath11k@archiver.kernel.org>; Fri,  3 Sep 2021 11:48:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F9BC60FDC
	for <ath11k@archiver.kernel.org>; Fri,  3 Sep 2021 11:48:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8F9BC60FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xvx+2wrh3xcKYPc4UuUGn+p2AKcFpGTq6BWSLZXkS8w=; b=S3s2owRK26tiX5
	gB8G1i7KLIQhGrSUDqEiqr74GGhXuNc2EEXpqwF0xBpOnQwdx1A+AhjvEQjgQF55z9GSIAQ7AiIIV
	3bNBOaK5Wd3cFFO5dqa/tm72nQ+MELWHfqN9wZ0GdshmWJhn6crq3bOmAkMAxeQ0s33Nn/pjMLavc
	3dfcKo1SjV2nzDi4vju/6dYMwU8+H1PKOfimjY6Jgjy0nMuxT1cbDXMKuidcST9PajEP8th9p8YSL
	U6iDQX5jNWQK7W9jC0gl5b2mndXiW+0GcSPR/2ZNFrvTbq7K/WEOES1p6xX1dkdNJ4UBFM48fPm5V
	D0OICXSBjjm+V/RXfJmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mM7gZ-00BpR0-Lx; Fri, 03 Sep 2021 11:48:43 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mM7gV-00BpOT-U5
 for ath11k@lists.infradead.org; Fri, 03 Sep 2021 11:48:41 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1630669717; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=XI+1JWFKXuTIl053ryCOv7u9PvZrXBuAZlr+HypEck4=;
 b=KeKO2iYL49OamfQESuXE/yPfGt7qXjV9FqbhgKRgnGmBYBJN7C6xTRHyg1W1xUwniHc9dWpV
 jmyMDUt3xAlJOEi+pkOkNqEpaN5T9zAAIebP9LGaVJWAxPMjo10RJ29+DctwE4J2B2Yx82Qo
 vz+DvYmNYn5wtxWZrnEG/FiI0Vg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 61320b946fc2cf7ad9a24124 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 03 Sep 2021 11:48:36
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 11640C4338F; Fri,  3 Sep 2021 11:48:36 +0000 (UTC)
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (unknown
 [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A0566C43617;
 Fri,  3 Sep 2021 11:48:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org A0566C43617
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: johannes@sipsolutions.net,
	ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	wgong@codeaurora.org
Subject: [PATCH v3 5/9] cfg80211: save power spectral density(psd) of
 regulatory rule
Date: Fri,  3 Sep 2021 07:48:17 -0400
Message-Id: <20210903114821.23346-6-wgong@codeaurora.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903114821.23346-1-wgong@codeaurora.org>
References: <20210903114821.23346-1-wgong@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210903_044840_079224_0B20CD71 
X-CRM114-Status: GOOD (  13.23  )
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

The power spectral density(psd) of regulatory rule should be take
effect to the channels. This patch is to save the values to the
channel which has psd value.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 net/wireless/reg.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/net/wireless/reg.c b/net/wireless/reg.c
index 0406ce7334fa..a971d97aaf12 100644
--- a/net/wireless/reg.c
+++ b/net/wireless/reg.c
@@ -1583,6 +1583,8 @@ static u32 map_regdom_flags(u32 rd_flags)
 		channel_flags |= IEEE80211_CHAN_NO_160MHZ;
 	if (rd_flags & NL80211_RRF_NO_HE)
 		channel_flags |= IEEE80211_CHAN_NO_HE;
+	if (rd_flags & NL80211_RRF_PSD)
+		channel_flags |= IEEE80211_CHAN_PSD;
 	return channel_flags;
 }
 
@@ -1787,6 +1789,9 @@ static void handle_channel_single_rule(struct wiphy *wiphy,
 				chan->dfs_cac_ms = reg_rule->dfs_cac_ms;
 		}
 
+		if (chan->flags & IEEE80211_CHAN_PSD)
+			chan->psd = reg_rule->psd;
+
 		return;
 	}
 
@@ -1807,6 +1812,9 @@ static void handle_channel_single_rule(struct wiphy *wiphy,
 			chan->dfs_cac_ms = IEEE80211_DFS_MIN_CAC_TIME_MS;
 	}
 
+	if (chan->flags & IEEE80211_CHAN_PSD)
+		chan->psd = reg_rule->psd;
+
 	if (chan->orig_mpwr) {
 		/*
 		 * Devices that use REGULATORY_COUNTRY_IE_FOLLOW_POWER
@@ -1876,6 +1884,12 @@ static void handle_channel_adjacent_rules(struct wiphy *wiphy,
 							 rrule2->dfs_cac_ms);
 		}
 
+		if ((rrule1->flags & NL80211_RRF_PSD) &&
+		    (rrule2->flags & NL80211_RRF_PSD))
+			chan->psd = min_t(s8, rrule1->psd, rrule2->psd);
+		else
+			chan->flags &= ~NL80211_RRF_PSD;
+
 		return;
 	}
 
@@ -2533,6 +2547,9 @@ static void handle_channel_custom(struct wiphy *wiphy,
 			chan->dfs_cac_ms = IEEE80211_DFS_MIN_CAC_TIME_MS;
 	}
 
+	if (chan->flags & IEEE80211_CHAN_PSD)
+		chan->psd = reg_rule->psd;
+
 	chan->max_power = chan->max_reg_power;
 }
 
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
