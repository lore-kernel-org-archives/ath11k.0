Return-Path: <SRS0=TAbk=KM=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42142C43460
	for <ath11k@archiver.kernel.org>; Mon, 17 May 2021 20:20:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1CFF60FEB
	for <ath11k@archiver.kernel.org>; Mon, 17 May 2021 20:20:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1CFF60FEB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oQ3avgkifZ8vpE8+PgEyKb6FjJOj/4gURaMJ4wLpIxw=; b=Ft4XiiIu0zOI0XaygDKCXonLs
	lFjFq8PRLiInx3QiNBiUh95eDu+3UHa4nMpe8I0z/AhqIPt9SuHwp5hLhqhLGJGoMbfSKpp0SryvV
	v1Dpl8ZxIgnGFkiGyu0F+TT51RxSKTyXCZzaUgMCMW0b8+8DwQOGCUgeVW6djCDBfdZmJIOUoEXch
	cY6AOeyXqLHV/RvUF1xLVCLcamhFF/UMQcPHQ6/ctaD6MeWKJnbXi4f2selV7YmTNEF5nvJYEKutv
	ozHc9CFZZeC5DV3yqEG01lt3be9rz+BZzvq1c7z6mqfQE/Vmrz5enZe4J1upFNrSLJK3iey+yyp1L
	s/ZvVnF9Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lijip-00G2hf-MN; Mon, 17 May 2021 20:20:15 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lijik-00G2go-KO
 for ath11k@desiato.infradead.org; Mon, 17 May 2021 20:20:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=r4C048Cyt1NAQETCpOJSuLki6BUx/oLBHbbMepKinxY=; b=yqmYwlZpjSTw+5PdZDiej7h/9H
 mLE5grxIBiAn36ib3U9Z8usu51ViSD6GFdHY3y0x0hAYp0E3463PD5XfHTc9ObQdjuM7xYvezcOs4
 y6NF5fWIcKQJnAb9Xyx0bfmsA41RPHNvvVHrJvXf5mYV1uJFuLXYStM318Np5/LV3agXBqJGQOPVY
 p0UIy2cN67F6OIYf0EONVKIIqbv3N62iHSWm0hERnN1SEgmyIEvCQVha6T0Puwvv4Tp9aywOYI4V3
 +SHSiCSSSPyghkMuKAXld2lloltZn3k+2Tuw8VspAllwkZXdeC9H8ouj8Aoj/D1/Zm9zV5DR2r5ze
 sSSU3sOA==;
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lijii-00E7mO-2d
 for ath11k@lists.infradead.org; Mon, 17 May 2021 20:20:09 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1621282807; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=r4C048Cyt1NAQETCpOJSuLki6BUx/oLBHbbMepKinxY=;
 b=UbQRKhFKhQatbVavm5Jj/fQvjKrDJh9k/SFImNzhgfzQrONRh+m7+sbTsKVVMbv5qqzqvyz9
 326fFPEyTpUkPEVMety2G0PJDzAP9aU5iqQySJKlRx8nVVub2mUKM4PcIK1gsywB83QfDzKS
 vOQQ7MKemp1oRMwjyb7KAoDxxZ0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60a2cff65f788b52a542f7a1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 17 May 2021 20:20:06
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7F155C43217; Mon, 17 May 2021 20:20:06 +0000 (UTC)
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (unknown
 [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9D1D7C4338A;
 Mon, 17 May 2021 20:20:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9D1D7C4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=wgong@codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: ath11k@lists.infradead.org,
	johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org,
	wgong@codeaurora.org
Subject: [PATCH 1/9] cfg80211: add power type definition for 6G Hz
Date: Mon, 17 May 2021 16:19:24 -0400
Message-Id: <20210517201932.8860-2-wgong@codeaurora.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517201932.8860-1-wgong@codeaurora.org>
References: <20210517201932.8860-1-wgong@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_132008_184840_9385968F 
X-CRM114-Status: GOOD (  12.29  )
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

6GHz regulatory domains introduces different modes for 6GHz AP
operations Low Power Indoor(LPI), Standard Power(SP) and Very Low
Power(VLP). 6GHz STAs could be operated as either Regular or
Subordinate clients. This patch is define the flags for power type
of AP and STATION mode.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 include/net/cfg80211.h       |  2 ++
 include/uapi/linux/nl80211.h | 30 ++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 911fae42b0c0..13d92c643794 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -675,6 +675,7 @@ struct key_params {
  *	chan will define the primary channel and all other
  *	parameters are ignored.
  * @freq1_offset: offset from @center_freq1, in KHz
+ * @power_type: power type of BSS for 6G
  */
 struct cfg80211_chan_def {
 	struct ieee80211_channel *chan;
@@ -683,6 +684,7 @@ struct cfg80211_chan_def {
 	u32 center_freq2;
 	struct ieee80211_edmg edmg;
 	u16 freq1_offset;
+	enum nl80211_ap_reg_power power_type;
 };
 
 /*
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index ac78da99fccd..9f8e9e49a16a 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -4085,6 +4085,36 @@ enum nl80211_dfs_regions {
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
+	NL80211_REG_MAX_AP_TYPE = 3,
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
+	NL80211_REG_MAX_CLIENT_TYPE = 2,
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
