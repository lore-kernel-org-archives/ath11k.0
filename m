Return-Path: <SRS0=xirI=NL=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B2CC4338F
	for <ath11k@archiver.kernel.org>; Fri, 20 Aug 2021 12:21:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BFE560FE6
	for <ath11k@archiver.kernel.org>; Fri, 20 Aug 2021 12:21:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9BFE560FE6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4zQmo1lE035VC8WT6S4I8sI3gJiKY9UbILC+OT9jqRM=; b=HaScVFL2l9ik6i
	Tn/JF/YOlePTp+aBFnVMmbhjrI9q+ozBI5oUY5vtw9VDtcZ22GLoeX6ovs2s8RHg659rxoPpi6HBy
	aGKwo9nzdc2dc2nD6pSWczKwe8l/JJvx6/VD8pGahAo4MTdwE5t1xBWgerKQ5ynYoGhnnhPhLziL1
	G7glpQ2wjNuIn4q0O+MW2gnJd4u4BWbpwzemDetLaHjG1b9B256RAGFsxSDWjO2nBDHUcfTwEwLy6
	PZxRBCRHKvTGYU3tEI+rlV0+JgwSi3QhGE5tihyrUKeXvi/EH1DRNhl7jD78HCG/QwXWZovHdmD7G
	rDiDkzqDuZT+Mj2dZmGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH3WT-00B6m8-VI; Fri, 20 Aug 2021 12:21:22 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH3WH-00B6aG-Bq
 for ath11k@lists.infradead.org; Fri, 20 Aug 2021 12:21:14 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1629462071; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=gYPhCj6vSaMMPbRt9/kJHWdB9b96bS7GiHWcKDc4lt8=;
 b=KyIXSupsRWZe7aRsFL359Z/6RX3aHW2pPXtLsdAzIDCM8uLkalnTTtBJmpu6P4pJk388Zwjx
 SKHMUkOnBDpXkOisvuf2iTKc5YqoRK6sXWj3Pxf9w4YKDBfRc3z/YxF3ie32MROuMkJLBZAT
 uQRtd+0vuEy1IeGbni9uRRFre74=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 611f9e2534bfa769799c866e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 20 Aug 2021 12:20:53
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 64891C4360D; Fri, 20 Aug 2021 12:20:53 +0000 (UTC)
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (unknown
 [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CBF5DC4338F;
 Fri, 20 Aug 2021 12:20:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org CBF5DC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: johannes@sipsolutions.net,
	ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	wgong@codeaurora.org
Subject: [PATCH v2 3/8] mac80211: add parse regulatory info in 6 GHz operation
 information
Date: Fri, 20 Aug 2021 08:20:36 -0400
Message-Id: <20210820122041.12157-4-wgong@codeaurora.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210820122041.12157-1-wgong@codeaurora.org>
References: <20210820122041.12157-1-wgong@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_052111_242688_67C174AB 
X-CRM114-Status: GOOD (  10.36  )
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
 net/mac80211/util.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/net/mac80211/util.c b/net/mac80211/util.c
index 93d96a4f9c3e..cb1c35d8ef48 100644
--- a/net/mac80211/util.c
+++ b/net/mac80211/util.c
@@ -3395,6 +3395,16 @@ bool ieee80211_chandef_he_6ghz_oper(struct ieee80211_sub_if_data *sdata,
 					      NL80211_BAND_6GHZ);
 	he_chandef.chan = ieee80211_get_channel(sdata->local->hw.wiphy, freq);
 
+	switch (u8_get_bits(he_6ghz_oper->control,
+			    IEEE80211_HE_6GHZ_OPER_CTRL_REG_INFO)) {
+	case IEEE80211_6GHZ_CTRL_REG_LPI_AP:
+		he_chandef.power_type = NL80211_REG_LPI_AP;
+		break;
+	case IEEE80211_6GHZ_CTRL_REG_SP_AP:
+		he_chandef.power_type = NL80211_REG_SP_AP;
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
