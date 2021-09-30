Return-Path: <SRS0=03FT=OU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23211C433EF
	for <ath11k@archiver.kernel.org>; Thu, 30 Sep 2021 08:16:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0E78615E0
	for <ath11k@archiver.kernel.org>; Thu, 30 Sep 2021 08:16:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D0E78615E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1HCfezApa2Qo2mhsjf9FTMVVtS/quMEX2JcN1L+c3io=; b=d9gw+HWovSLtK9
	rpS8kvo76MnmGj+lCCOrYMFhPFObF0PBp2FqdzVWMbMlfKmtOLfmKgscK5Xyxtj2pi8IW8K37AP6d
	Txmzfh83X5j9x8px3k9+Z3yOyUjDCJKSxT7ggu+UzkqrXTTy4BoJVicjKHcrtTclqQvxFefQeB6DI
	l9Xt8XIEKI+VblhKfaaZjOfbCOrg5PHS49H8eHfTrMWK9nGlbiF9jTzkJ2oZQ+2n3epe4MioAs7Aq
	hAdzBtuZs3/Vn6KMPeC8ITOqzaW5RvYUSiH4FsJDEGXdVXOVqwjb/VCnNMepT0++CeRBuGqTpVkW1
	1vCCSu/zotlm5uHsCeuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVrEg-00DLqS-6A; Thu, 30 Sep 2021 08:16:10 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVrEa-00DLpC-EY
 for ath11k@lists.infradead.org; Thu, 30 Sep 2021 08:16:08 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632989765; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=0xTZoD9OiNUYm0bAZkUfnj3+242hlNTrKosJKt38oYk=;
 b=HXzD1q0scuXAtmDmq2IAan99smUyl3Kgp9sSlm07pyk3A/91I/Wm4nG0R4UZYmdl+iFrL3Qe
 RUCt6Hr7vXocF3cEwuUmgENlZUId3t1qA8YvFwWX2JdG4rm4YvUCPFHFRKQ2uBEe2aWnR5JY
 vZ8qoot6qTvxLkP9E9XRW/wpfrY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 6155722d713d5d6f96310e24 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 30 Sep 2021 08:15:41
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 39E8BC43616; Thu, 30 Sep 2021 08:15:41 +0000 (UTC)
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (unknown
 [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 43609C4338F;
 Thu, 30 Sep 2021 08:15:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 43609C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: johannes@sipsolutions.net,
	ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	wgong@codeaurora.org
Subject: [PATCH] cfg80211: seperate get channel number from ies
Date: Thu, 30 Sep 2021 04:15:33 -0400
Message-Id: <20210930081533.4898-1-wgong@codeaurora.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_011605_399442_5DE6E8F0 
X-CRM114-Status: GOOD (  17.94  )
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

Get channel number from ies is a common logic, so seperate it to a new
function, which could also be used by lower driver.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 include/net/cfg80211.h |  9 +++++++++
 net/wireless/scan.c    | 41 ++++++++++++++++++++++++++---------------
 2 files changed, 35 insertions(+), 15 deletions(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 911fae42b0c0..2ed677d203a7 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -6268,6 +6268,15 @@ static inline void cfg80211_gen_new_bssid(const u8 *bssid, u8 max_bssid,
 	u64_to_ether_addr(new_bssid_u64, new_bssid);
 }
 
+/**
+ * cfg80211_get_ies_channel_number - returns the channel number from ies
+ * @ie: ies
+ * @ielen: length of IEs
+ * @band: enum nl80211_band of the channel
+ */
+int cfg80211_get_ies_channel_number(const u8 *ie, size_t ielen,
+				    enum nl80211_band band);
+
 /**
  * cfg80211_is_element_inherited - returns if element ID should be inherited
  * @element: element to check
diff --git a/net/wireless/scan.c b/net/wireless/scan.c
index 019952d4fc7d..a0dd4fa136eb 100644
--- a/net/wireless/scan.c
+++ b/net/wireless/scan.c
@@ -1782,25 +1782,13 @@ cfg80211_bss_update(struct cfg80211_registered_device *rdev,
 	return NULL;
 }
 
-/*
- * Update RX channel information based on the available frame payload
- * information. This is mainly for the 2.4 GHz band where frames can be received
- * from neighboring channels and the Beacon frames use the DSSS Parameter Set
- * element to indicate the current (transmitting) channel, but this might also
- * be needed on other bands if RX frequency does not match with the actual
- * operating channel of a BSS.
- */
-static struct ieee80211_channel *
-cfg80211_get_bss_channel(struct wiphy *wiphy, const u8 *ie, size_t ielen,
-			 struct ieee80211_channel *channel,
-			 enum nl80211_bss_scan_width scan_width)
+int cfg80211_get_ies_channel_number(const u8 *ie, size_t ielen,
+				    enum nl80211_band band)
 {
 	const u8 *tmp;
-	u32 freq;
 	int channel_number = -1;
-	struct ieee80211_channel *alt_channel;
 
-	if (channel->band == NL80211_BAND_S1GHZ) {
+	if (band == NL80211_BAND_S1GHZ) {
 		tmp = cfg80211_find_ie(WLAN_EID_S1G_OPERATION, ie, ielen);
 		if (tmp && tmp[1] >= sizeof(struct ieee80211_s1g_oper_ie)) {
 			struct ieee80211_s1g_oper_ie *s1gop = (void *)(tmp + 2);
@@ -1820,6 +1808,29 @@ cfg80211_get_bss_channel(struct wiphy *wiphy, const u8 *ie, size_t ielen,
 			}
 		}
 	}
+	return channel_number;
+}
+EXPORT_SYMBOL(cfg80211_get_ies_channel_number);
+
+/*
+ * Update RX channel information based on the available frame payload
+ * information. This is mainly for the 2.4 GHz band where frames can be received
+ * from neighboring channels and the Beacon frames use the DSSS Parameter Set
+ * element to indicate the current (transmitting) channel, but this might also
+ * be needed on other bands if RX frequency does not match with the actual
+ * operating channel of a BSS.
+ */
+static struct ieee80211_channel *
+cfg80211_get_bss_channel(struct wiphy *wiphy, const u8 *ie, size_t ielen,
+			 struct ieee80211_channel *channel,
+			 enum nl80211_bss_scan_width scan_width)
+{
+	const u8 *tmp;
+	u32 freq;
+	int channel_number;
+	struct ieee80211_channel *alt_channel;
+
+	channel_number = cfg80211_get_ies_channel_number(ie, ielen, channel->band);
 
 	if (channel_number < 0) {
 		/* No channel information in frame payload */
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
