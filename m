Return-Path: <SRS0=2oQt=IO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C48C433DB
	for <ath11k@archiver.kernel.org>; Tue, 16 Mar 2021 15:48:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02CB1650CD
	for <ath11k@archiver.kernel.org>; Tue, 16 Mar 2021 15:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02CB1650CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RwcmoQ4ta0mvwAHsrnkXQeztHPalVJbvG5cGufhyEWk=; b=eBCVC2LYFlItql62h79X5g3Swo
	IgjXYXxh70pI9qTrxdKPwZKM8dDqDiuSNneDHRAT4hsHvPqCCYPA9vfSCT7bWT6J1kIxu3hd0M75q
	2xkuZCV89Osedt8UrGQYL9qVg/DzPuy0BUI8ppIVgDYlMGI4hHLCu2BQCJBTYWFAIZl3ummoC/0+U
	ri5CqVbjmirjuw8ti/fbDptTT/jF/WM+aKnivgjeYkR90ER7IVxCd/kMeVOppPrUUKefg4+M25Vb3
	jEmpEn19hAyn0Xryo79EWG/ItFi2YEmp3/69U/5jSVUaYlSQZB8rOLCExMSGjzotWzYXdpmhEP8vZ
	7YMmjR6Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMBw4-00188U-KK; Tue, 16 Mar 2021 15:48:44 +0000
Received: from m42-2.mailgun.net ([69.72.42.2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMBvw-00185E-7l
 for ath11k@lists.infradead.org; Tue, 16 Mar 2021 15:48:41 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1615909717; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=GXZ4+vm4fjxDMZeZv5adoETyWw+/5fuT5KFGMoyetH8=;
 b=gpMvGFf79Rxb01XgUIJzBFpq8PclXPO3NdcqIzsHcXaAf8B7bOj/MvfNc+Kf5KahcuwGdTUm
 zdIMDi6c/L0cNNeg421F66gh/JqPEJMsHMOsnw6ATLb/rvpBs/1S0Sn3p976wCiJSULlatqM
 LTUZ7N0wfvX+dSHIVoxw2Z1IkWk=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 6050d34be3fca7d0a60c5574 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 16 Mar 2021 15:48:27
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4A216C433ED; Tue, 16 Mar 2021 15:48:26 +0000 (UTC)
Received: from c-gsamin-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: gsamin)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5D1C6C433C6;
 Tue, 16 Mar 2021 15:48:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5D1C6C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=gsamin@codeaurora.org
From: Govindaraj <gsamin@codeaurora.org>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 Govindaraj <gsamin@codeaurora.org>
Subject: [PATCH] mac80211: fix low throughput due to invalid addba extension
Date: Tue, 16 Mar 2021 21:17:54 +0530
Message-Id: <1615909674-13412-1-git-send-email-gsamin@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_154838_578653_EA980E03 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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

Addba request action frame received with the extension element from
certain 11ac stations, but the cmd id and length not matching to addba
extension and it failing in element parsing. Due to this, addba request
not acknowledged and aggregation not started which is causing low
throughput. Hence validating the cmd id before processing addba extension.

Signed-off-by: Govindaraj <gsamin@codeaurora.org>
---
 net/mac80211/agg-rx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/mac80211/agg-rx.c b/net/mac80211/agg-rx.c
index cce28e3..ea473d7 100644
--- a/net/mac80211/agg-rx.c
+++ b/net/mac80211/agg-rx.c
@@ -494,7 +494,8 @@ void ieee80211_process_addba_request(struct ieee80211_local *local,
 
 	ies_len = len - offsetof(struct ieee80211_mgmt,
 				 u.action.u.addba_req.variable);
-	if (ies_len) {
+	if (ies_len &&
+	    mgmt->u.action.u.addba_req.variable[0] == WLAN_EID_ADDBA_EXT) {
 		ieee802_11_parse_elems(mgmt->u.action.u.addba_req.variable,
                                 ies_len, true, &elems, mgmt->bssid, NULL);
 		if (elems.parse_error)
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
