Return-Path: <SRS0=d2dB=OO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F55C433F5
	for <ath11k@archiver.kernel.org>; Fri, 24 Sep 2021 10:02:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAD6160E9B
	for <ath11k@archiver.kernel.org>; Fri, 24 Sep 2021 10:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AAD6160E9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D4EgEiISUflWCr3qN48wkLwjf0Nbrum9iA3cZMugwhM=; b=qgK2rjg8DbLfTA
	LUdJxeoaczsl6qbFPpjRSppOLstFWtqJ3RBP7RaFM2f1qO4Bcz6EfzinQ6gIxpn0OOS9XNzB/MdD4
	Jm88l/X+PPtDNj9eoZGwgELxmCr/2qF3fUmOwmC+q/T5ckkJq9RADiagkKbDw5TO09vb1UOBIH0mg
	y/qKjnkkgJ2nXObB+TbWjDQslISoCbbAJkj8AH7TgkGMyK2Jl66mt8W7hdOCwEhA8D/bd+XGJq/N5
	NHXIIrK3qzQmM/NDkoTYIHYvIAIVtktBh6q5A21+1UVyYxaUSX8BO8aurzhI548v10artgP65O1Em
	FvRp9URQoq7WsSDYcNHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTi22-00E1oy-RZ; Fri, 24 Sep 2021 10:02:14 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTi1v-00E1fj-Eg
 for ath11k@lists.infradead.org; Fri, 24 Sep 2021 10:02:13 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632477732; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=IZmqxqhxc/rmWPSKNvrTIIRji06x0+o64kg1VFKkrXw=;
 b=jZzP/WJ2PeCMFyoEH3XniuDlvo4yDtPPyIetVIjinEIYcSwJysF4YilSmZ8ywhJDoBlhzpGc
 5xwEBwGFmCzI4M0NJ7ubt3nSfNdJDeFewE+yFjjAq8d+EpUNST2NNqJ93B7dair+jv2SDM/+
 ZfkhIlOhCPYAXYYyxpI8+Oi7CNg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 614da1efe0f78151d6dbddf8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 24 Sep 2021 10:01:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DA814C4360D; Fri, 24 Sep 2021 10:01:19 +0000 (UTC)
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (unknown
 [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 63E38C43460;
 Fri, 24 Sep 2021 10:01:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 63E38C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: johannes@sipsolutions.net,
	ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	wgong@codeaurora.org
Subject: [PATCH v4 3/6] cfg80211: add definition for 6 GHz power spectral
 density(psd)
Date: Fri, 24 Sep 2021 06:00:49 -0400
Message-Id: <20210924100052.32029-4-wgong@codeaurora.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924100052.32029-1-wgong@codeaurora.org>
References: <20210924100052.32029-1-wgong@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_030212_411404_460BEB86 
X-CRM114-Status: GOOD (  12.53  )
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
index 62dd8422e0dc..f8e0cc19e0ce 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -109,6 +109,8 @@ struct wiphy;
  *	on this channel.
  * @IEEE80211_CHAN_16MHZ: 16 MHz bandwidth is permitted
  *	on this channel.
+ * @IEEE80211_CHAN_PSD: power spectral density (in dBm)
+ *	on this channel.
  *
  */
 enum ieee80211_channel_flags {
@@ -131,6 +133,7 @@ enum ieee80211_channel_flags {
 	IEEE80211_CHAN_4MHZ		= 1<<16,
 	IEEE80211_CHAN_8MHZ		= 1<<17,
 	IEEE80211_CHAN_16MHZ		= 1<<18,
+	IEEE80211_CHAN_PSD		= 1<<19,
 };
 
 #define IEEE80211_CHAN_NO_HT40 \
@@ -164,6 +167,7 @@ enum ieee80211_channel_flags {
  *	on this channel.
  * @dfs_state_entered: timestamp (jiffies) when the dfs state was entered.
  * @dfs_cac_ms: DFS CAC time in milliseconds, this is valid for DFS channels.
+ * @psd: power spectral density (in dBm)
  */
 struct ieee80211_channel {
 	enum nl80211_band band;
@@ -180,6 +184,7 @@ struct ieee80211_channel {
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
index c2efea98e060..2ca8fa06f536 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -4085,6 +4085,7 @@ enum nl80211_sched_scan_match_attr {
  * @NL80211_RRF_NO_80MHZ: 80MHz operation not allowed
  * @NL80211_RRF_NO_160MHZ: 160MHz operation not allowed
  * @NL80211_RRF_NO_HE: HE operation not allowed
+ * @NL80211_RRF_PSD: channels has power spectral density value
  */
 enum nl80211_reg_rule_flags {
 	NL80211_RRF_NO_OFDM		= 1<<0,
@@ -4103,6 +4104,7 @@ enum nl80211_reg_rule_flags {
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
