Return-Path: <SRS0=xirI=NL=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D404C4320A
	for <ath11k@archiver.kernel.org>; Fri, 20 Aug 2021 12:21:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC58560FE7
	for <ath11k@archiver.kernel.org>; Fri, 20 Aug 2021 12:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC58560FE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h9l+1JiqAUW12tDBOfEl+Cw6BH0UnVssIbsH+fH3hc8=; b=Zm2kuhYE5UasTm
	EXyKhUxuKYLhBQaX7LF7MdUWBYC6c//22RypyPfh2+vbAhlcVVeQJGysIvBsngmS0cNcZZ/btZj0z
	GMIOEEvBz+6T9xzxRWB4WFgMYzhavtfOBY0eSTp7i+dT0CgwM1civbX4VM+xN4vsAFUZQNvSlNfR8
	S3hxaPF7h91M2hzeYYTECdhMF6IV9vVLWgbDt/RQppwUG/mceS5Gj3d7NQJUFTNUBlLwLRiYd/E64
	B/PhKBMfbIeTD8xzO4ceddBdzW9EJwl+777ARrjkpnwswYN2DQDqaBHquF/F1uAYCc9m4uSHk+K/4
	jLgMyUsxtUWHJo1j9L1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH3WC-00B6cm-PC; Fri, 20 Aug 2021 12:21:04 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH3W1-00B6aG-TX
 for ath11k@lists.infradead.org; Fri, 20 Aug 2021 12:21:01 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1629462057; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=B1eeBXXRanM2y/whbXRJaHJkVYC5X+/SfXDWh1SVWAw=;
 b=tt5/YL7e5DErVTIqfqn/8dzVGPEGUAq4TYoNmWZWw7fGkv2AGc8I3cf9qpMFPr32xUvqIEnx
 EXjoHkcWGU1WPqCapE1O3N0uvWLdOOE6cS42ISyu6yr6AHCtHPZ0mnnBf3KYzOBnjOLL7JPs
 wq4XG1FW8OK7S4YCrdEdKh7KCac=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 611f9e230f9b337f11cd073a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 20 Aug 2021 12:20:51
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 81BE4C43616; Fri, 20 Aug 2021 12:20:50 +0000 (UTC)
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (unknown
 [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A3166C43460;
 Fri, 20 Aug 2021 12:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org A3166C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: johannes@sipsolutions.net,
	ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	wgong@codeaurora.org
Subject: [PATCH v2 1/8] cfg80211: add power type definition for 6 GHz
Date: Fri, 20 Aug 2021 08:20:34 -0400
Message-Id: <20210820122041.12157-2-wgong@codeaurora.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210820122041.12157-1-wgong@codeaurora.org>
References: <20210820122041.12157-1-wgong@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_052058_054009_CBB0B919 
X-CRM114-Status: GOOD (  12.79  )
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

6 GHz regulatory domains introduces different modes for 6 GHz AP
operations Low Power Indoor(LPI), Standard Power(SP) and Very Low
Power(VLP). 6 GHz STAs could be operated as either Regular or
Subordinate clients. This patch is define the flags for power type
of AP and STATION mode.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 include/net/cfg80211.h       |  2 ++
 include/uapi/linux/nl80211.h | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 58c2cd417e89..f17a4d1202fc 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -676,6 +676,7 @@ struct key_params {
  *	chan will define the primary channel and all other
  *	parameters are ignored.
  * @freq1_offset: offset from @center_freq1, in KHz
+ * @power_type: power type of BSS for 6 GHz
  */
 struct cfg80211_chan_def {
 	struct ieee80211_channel *chan;
@@ -684,6 +685,7 @@ struct cfg80211_chan_def {
 	u32 center_freq2;
 	struct ieee80211_edmg edmg;
 	u16 freq1_offset;
+	enum nl80211_ap_reg_power power_type;
 };
 
 /*
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index f962c06e9818..ab1d4aa85272 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -4088,6 +4088,40 @@ enum nl80211_dfs_regions {
 	NL80211_DFS_JP		= 3,
 };
 
+/**
+ * enum nl80211_ap_reg_power - regulatory power for a Access Point
+ *
+ * @NL80211_REG_UNSET_AP: Access Point has no regulatory power mode
+ * @NL80211_REG_LPI: Indoor Access Point
+ * @NL80211_REG_SP: Standard power Access Point
+ * @NL80211_REG_VLP: Very low power Access Point
+ */
+enum nl80211_ap_reg_power {
+	NL80211_REG_UNSET_AP,
+	NL80211_REG_LPI_AP,
+	NL80211_REG_SP_AP,
+	NL80211_REG_VLP_AP,
+	NL80211_REG_AP_POWER_AFTER_LAST,
+	NL80211_REG_AP_POWER_MAX =
+		NL80211_REG_AP_POWER_AFTER_LAST - 1,
+};
+
+/**
+ * enum nl80211_client_reg_power - regulatory power for a client
+ *
+ * @NL80211_REG_UNSET_CLIENT: Client has no regulatory power mode
+ * @NL80211_REG_DEFAULT_CLIENT: Default Client
+ * @NL80211_REG_SUBORDINATE_CLIENT: Subordinate Client
+ */
+enum nl80211_client_reg_power {
+	NL80211_REG_UNSET_CLIENT,
+	NL80211_REG_DEFAULT_CLIENT,
+	NL80211_REG_SUBORDINATE_CLIENT,
+	NL80211_REG_CLIENT_POWER_AFTER_LAST,
+	NL80211_REG_CLIENT_POWER_MAX =
+		NL80211_REG_CLIENT_POWER_AFTER_LAST - 1,
+};
+
 /**
  * enum nl80211_user_reg_hint_type - type of user regulatory hint
  *
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
