Return-Path: <SRS0=d2dB=OO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AEF8C433EF
	for <ath11k@archiver.kernel.org>; Fri, 24 Sep 2021 10:02:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7D6A60E9B
	for <ath11k@archiver.kernel.org>; Fri, 24 Sep 2021 10:02:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D7D6A60E9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FUpWbqcFEzIuROlo+ZuSZuQGurerls/2U3fYJV/VSkM=; b=L1OzNsLORz93bH
	Nrce0dx098G6ja1yRFJF0kJI6E1vIhQfnp7EXLDUHGlJLUg44eyzXqyWtlTmP7U55YQfcxlLkucXw
	rAQlSnof2y9Jdn9oSYJbTEars1FGCIG+ZDITYvHonXBnt9BKC2SXLf7mflvACH6cy2duxvLeTEbYs
	gWJkGFVLl7poiS/6jvXwtyGzZ/YO8t9YIUJxltKYuEQeiPkIvgH3SjDprehqAgVygW1g/x4ckJPyn
	OI7ibOLngn9b4R0slcB/VWGe3b57esMoWKXP9xC0Gp/AUbAwcSZK80HdDr2Pe3SYxjAUKDjMVMu22
	x31UWfM7EwzCuv4BtZig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTi1w-00E1mN-5R; Fri, 24 Sep 2021 10:02:08 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTi1p-00E1ch-J9
 for ath11k@lists.infradead.org; Fri, 24 Sep 2021 10:02:07 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632477725; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=uwFxiwjJGfWbbq/xc4B8uB5Lsb5yhYjskzkDkMxdh6Q=;
 b=RZB8lJcUut0IyY8YfKtmhzXBwDzesGU9aFQf9JVTIw/Z/3KbG/icAb24Wk0I0ZnfVBCMcsL6
 KgnLtWbl0T2igH8hUVXbJar1OanYY+/IExLRmi/olFtZJbonsXGN75+jaebPF+R2L7RMtY6U
 xEaRjXxSVbLCBqFn7iloDRzKwP4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 614da1ed44830700e1cff3c7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 24 Sep 2021 10:01:17
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1D321C43460; Fri, 24 Sep 2021 10:01:17 +0000 (UTC)
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (unknown
 [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4A036C43460;
 Fri, 24 Sep 2021 10:01:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 4A036C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: johannes@sipsolutions.net,
	ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	wgong@codeaurora.org
Subject: [PATCH v4 1/6] mac80211: add power type definition for 6 GHz
Date: Fri, 24 Sep 2021 06:00:47 -0400
Message-Id: <20210924100052.32029-2-wgong@codeaurora.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924100052.32029-1-wgong@codeaurora.org>
References: <20210924100052.32029-1-wgong@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_030205_867090_1A6C6C0C 
X-CRM114-Status: GOOD (  12.40  )
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
 include/linux/ieee80211.h | 34 ++++++++++++++++++++++++++++++++++
 include/net/mac80211.h    |  2 ++
 2 files changed, 36 insertions(+)

diff --git a/include/linux/ieee80211.h b/include/linux/ieee80211.h
index 694264503119..1e2d7f25d4f9 100644
--- a/include/linux/ieee80211.h
+++ b/include/linux/ieee80211.h
@@ -1988,6 +1988,40 @@ int ieee80211_get_vht_max_nss(struct ieee80211_vht_cap *cap,
 			      int mcs, bool ext_nss_bw_capable,
 			      unsigned int max_vht_nss);
 
+/**
+ * enum ieee80211_ap_reg_power - regulatory power for a Access Point
+ *
+ * @IEEE80211_REG_UNSET_AP: Access Point has no regulatory power mode
+ * @IEEE80211_REG_LPI: Indoor Access Point
+ * @IEEE80211_REG_SP: Standard power Access Point
+ * @IEEE80211_REG_VLP: Very low power Access Point
+ */
+enum ieee80211_ap_reg_power {
+	IEEE80211_REG_UNSET_AP,
+	IEEE80211_REG_LPI_AP,
+	IEEE80211_REG_SP_AP,
+	IEEE80211_REG_VLP_AP,
+	IEEE80211_REG_AP_POWER_AFTER_LAST,
+	IEEE80211_REG_AP_POWER_MAX =
+		IEEE80211_REG_AP_POWER_AFTER_LAST - 1,
+};
+
+/**
+ * enum ieee80211_client_reg_power - regulatory power for a client
+ *
+ * @IEEE80211_REG_UNSET_CLIENT: Client has no regulatory power mode
+ * @IEEE80211_REG_DEFAULT_CLIENT: Default Client
+ * @IEEE80211_REG_SUBORDINATE_CLIENT: Subordinate Client
+ */
+enum ieee80211_client_reg_power {
+	IEEE80211_REG_UNSET_CLIENT,
+	IEEE80211_REG_DEFAULT_CLIENT,
+	IEEE80211_REG_SUBORDINATE_CLIENT,
+	IEEE80211_REG_CLIENT_POWER_AFTER_LAST,
+	IEEE80211_REG_CLIENT_POWER_MAX =
+		IEEE80211_REG_CLIENT_POWER_AFTER_LAST - 1,
+};
+
 /* 802.11ax HE MAC capabilities */
 #define IEEE80211_HE_MAC_CAP0_HTC_HE				0x01
 #define IEEE80211_HE_MAC_CAP0_TWT_REQ				0x02
diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index af0fc13cea34..8923a9fc4126 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -632,6 +632,7 @@ struct ieee80211_fils_discovery {
  * @s1g: BSS is S1G BSS (affects Association Request format).
  * @beacon_tx_rate: The configured beacon transmit rate that needs to be passed
  *	to driver when rate control is offloaded to firmware.
+ * @power_type: power type of BSS for 6 GHz
  */
 struct ieee80211_bss_conf {
 	const u8 *bssid;
@@ -702,6 +703,7 @@ struct ieee80211_bss_conf {
 	u32 unsol_bcast_probe_resp_interval;
 	bool s1g;
 	struct cfg80211_bitrate_mask beacon_tx_rate;
+	enum ieee80211_ap_reg_power power_type;
 };
 
 /**
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
