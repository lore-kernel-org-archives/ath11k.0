Return-Path: <SRS0=yIgJ=IJ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F036CC433DB
	for <ath11k@archiver.kernel.org>; Thu, 11 Mar 2021 05:29:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84C8264FC4
	for <ath11k@archiver.kernel.org>; Thu, 11 Mar 2021 05:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84C8264FC4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nnjPtwyonoZnWR7za4NB/GjJJ9J8hM/485od/yU1p/E=; b=FcFIJDoPSA+DnKs3zms5W6pDt6
	WId325fSw/cnYNxr1hiS5K7Z2HqAT7jydiaoSxYQFcWx7TC40uMdiC/eaK4qrIt3LAMTQZwyI/YPG
	Ktxh0tL6jC1VgBaDbZUM0JpvsNZImhfLfJXLi2jqnEZXyXwUleOk9QV7Vd+czMVEE93WZE1f22OtT
	XtxK3r/fIaWHnoODHvS1Yon5Fp7WoV0At1ksZan0ddWpU9aJdnWQSJm973Bhfi9ZKQpKam9fV3yCm
	w+khr5KK54zJcaxA/7n4CXNC9PladfFGSX/s1eEgqVwP2SuYWJnrOmXVicxJFmkBOipbv2IcR5HUA
	gcCuf3rA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKDt1-008OvZ-0Q; Thu, 11 Mar 2021 05:29:27 +0000
Received: from m42-2.mailgun.net ([69.72.42.2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKDsx-008Ouz-3T
 for ath11k@lists.infradead.org; Thu, 11 Mar 2021 05:29:25 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1615440562; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=M868IokOWNxMGskrD6bNWiGJrGemsV9ceLeqP16ql+E=;
 b=l8XOy/QmBTNCc7sXvurXvODlq8hsN0zXXWwZL3qjHRpS8/l2TXG9t2oLB6sBVhCjwSLPNVLg
 vmRseA/HGYVCM6nxA1sTtGZukjCYpifj4haOUrU/KNa/pd8kG4192eNHzWpFnqZL8S7lzMsO
 qscql8Tt1IsXob1Pc2UnubB9gOI=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6049aab1d3a53bc38f533632 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Mar 2021 05:29:21
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9FA35C433C6; Thu, 11 Mar 2021 05:29:20 +0000 (UTC)
Received: from akalaise-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kathirve)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A8A49C433CA;
 Thu, 11 Mar 2021 05:29:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A8A49C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kathirve@codeaurora.org
From: Karthikeyan Kathirvel <kathirve@codeaurora.org>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 Karthikeyan Kathirvel <kathirve@codeaurora.org>
Subject: [PATCH v2] mac80211: choose first enabled channel for monitor
Date: Thu, 11 Mar 2021 10:59:07 +0530
Message-Id: <1615440547-7661-1-git-send-email-kathirve@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_052923_445573_3F044498 
X-CRM114-Status: GOOD (  11.19  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Though the first channel from sband channel list is invalid
or disabled still mac80211 is choosing this disabled channel
as a default channel for monitor interface. This will end-up
in choosing wrong channel.

Fixed by assigning the first available valid or enabled channel
to the respective radios.

Signed-off-by: Karthikeyan Kathirvel <kathirve@codeaurora.org>
---

v2:
	Addressed review comments on changing the subject

 net/mac80211/main.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/net/mac80211/main.c b/net/mac80211/main.c
index 4f3f8bb..1f8a5eb 100644
--- a/net/mac80211/main.c
+++ b/net/mac80211/main.c
@@ -973,8 +973,15 @@ int ieee80211_register_hw(struct ieee80211_hw *hw)
 			continue;
 
 		if (!dflt_chandef.chan) {
+			/*
+			 * Assigning the first enabled channel to dflt_chandef from the
+			 * list of channels available specific to country
+			 */
+			for (i = 0; i < sband->n_channels; i++)
+				if (!(sband->channels[i].flags & IEEE80211_CHAN_DISABLED))
+					break;
 			cfg80211_chandef_create(&dflt_chandef,
-						&sband->channels[0],
+						&sband->channels[i == sband->n_channels ? 0 : i],
 						NL80211_CHAN_NO_HT);
 			/* init channel we're on */
 			if (!local->use_chanctx && !local->_oper_chandef.chan) {
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
