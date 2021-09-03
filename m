Return-Path: <SRS0=YLPq=NZ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FF7CC4332F
	for <ath11k@archiver.kernel.org>; Fri,  3 Sep 2021 11:48:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D786761051
	for <ath11k@archiver.kernel.org>; Fri,  3 Sep 2021 11:48:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D786761051
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LvsCGWNumWQGeHVH/D1w878F6QACTYmG9uqQeUJmMgs=; b=O6Du9734E4vjAj
	b2UAPfii/wJblV/5bIFSALSq4PhPP/W1gCt91U+Dry9QHPehd+eqXS7/hlkR38bE14KU3JHP/zO+c
	g+VUS+4X4sE6GLAldBjIqzq1xCByqJGJMdvgEKMdMF+4gIKuJdEzrEMUj1Saf1xKDfGyGIf0ryING
	Fxl2mWEkzqpw7crmxVEyh45nUaTPw7gShSdgKuGHqAxMJTPutrxOak34a3ZgCuWjbQnF/5Jhn+MYl
	PyWQES2AAXMGlE720BimcuAIRiS2HuLIryF0LgTHnH+8Ct33+IMlOazW7Qz/7R2DaFPrAWEZkSh5R
	D2+gTocMCdxHRA8QFs3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mM7gY-00BpQX-BP; Fri, 03 Sep 2021 11:48:42 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mM7gU-00BpNx-Tq
 for ath11k@lists.infradead.org; Fri, 03 Sep 2021 11:48:40 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1630669715; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=dGN37s3jyUX7eiqRdMr8/XPiuEfd1mFm9MFNpMM8P24=;
 b=ZWhiXkl+iTGnceV44hTwiu+/FxfKkrIpMdaadQShQbQ0Hac8090Xa2HtuHG6aV73HRRZgQ9T
 Yq916Djyj/zGorQeetc4E57ZuQVikSWFhLmOFAWg7sQq1BOQ3vpcTbhXxS3RAxk23u6JldJo
 D7gCqjmzsTEav3NukT4Xe8OY9+Q=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 61320b9189cdb62061a5419e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 03 Sep 2021 11:48:33
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4B163C4360D; Fri,  3 Sep 2021 11:48:33 +0000 (UTC)
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (unknown
 [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9857CC43460;
 Fri,  3 Sep 2021 11:48:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 9857CC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: johannes@sipsolutions.net,
	ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	wgong@codeaurora.org
Subject: [PATCH v3 3/9] mac80211: add parse regulatory info in 6 GHz operation
 information
Date: Fri,  3 Sep 2021 07:48:15 -0400
Message-Id: <20210903114821.23346-4-wgong@codeaurora.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903114821.23346-1-wgong@codeaurora.org>
References: <20210903114821.23346-1-wgong@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210903_044839_078711_D03A414D 
X-CRM114-Status: GOOD (  11.89  )
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

This patch is to convert the regulatory info subfield in HE operation
element to power type and save in struct cfg80211_chan_def.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 net/mac80211/util.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/net/mac80211/util.c b/net/mac80211/util.c
index 93d96a4f9c3e..04f2ba530d4f 100644
--- a/net/mac80211/util.c
+++ b/net/mac80211/util.c
@@ -3352,6 +3352,7 @@ bool ieee80211_chandef_he_6ghz_oper(struct ieee80211_sub_if_data *sdata,
 	const struct ieee80211_sta_he_cap *he_cap;
 	struct cfg80211_chan_def he_chandef = *chandef;
 	const struct ieee80211_he_6ghz_oper *he_6ghz_oper;
+	struct ieee80211_bss_conf *bss_conf;
 	bool support_80_80, support_160;
 	u8 he_phy_cap;
 	u32 freq;
@@ -3395,6 +3396,18 @@ bool ieee80211_chandef_he_6ghz_oper(struct ieee80211_sub_if_data *sdata,
 					      NL80211_BAND_6GHZ);
 	he_chandef.chan = ieee80211_get_channel(sdata->local->hw.wiphy, freq);
 
+	bss_conf = &sdata->vif.bss_conf;
+
+	switch (u8_get_bits(he_6ghz_oper->control,
+			    IEEE80211_HE_6GHZ_OPER_CTRL_REG_INFO)) {
+	case IEEE80211_6GHZ_CTRL_REG_LPI_AP:
+		bss_conf->power_type = IEEE80211_REG_LPI_AP;
+		break;
+	case IEEE80211_6GHZ_CTRL_REG_SP_AP:
+		bss_conf->power_type = IEEE80211_REG_SP_AP;
+		break;
+	}
+
 	switch (u8_get_bits(he_6ghz_oper->control,
 			    IEEE80211_HE_6GHZ_OPER_CTRL_CHANWIDTH)) {
 	case IEEE80211_HE_6GHZ_OPER_CTRL_CHANWIDTH_20MHZ:
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
