Return-Path: <SRS0=Iy3B=GI=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4139C433E0
	for <ath11k@archiver.kernel.org>; Tue,  5 Jan 2021 03:08:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3E6922581
	for <ath11k@archiver.kernel.org>; Tue,  5 Jan 2021 03:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3E6922581
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fI22lQZJ3hsbVNISVyRPGdyvhpZDO7UX4/INQ2b64C4=; b=PU8nuNpOavslkrJGnAKZsug6Ch
	qjd0sLHVGikUE+SDB/e38u0pyKVB+4MrS0pXevCdyJ7yNAnsqQ9/DwqfTCvMuHZfLgMw4hT7f0NmV
	xYbJMHfwxSqndhYHnby5D4rEn3XtlpjIAoZPav5ASce6rdw0s2wMbkpoZXvxUgbzVOEBs08ohSsUX
	8MD8S2GNrzb5tkmrM/MQgO0NH/xKYPeH2FOGoxXO8mQD3rnG27RzqYg9nJkF76ZWisahbZpP9wPB3
	IkkNLvN60J0PVjNzW6zhbMBvtvLtyx+gYQDBzAM8/fVbp3fLDiV/AOv3HC+CsDy/5h+3pRO4s+GCb
	13sYz/uA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwchn-0008Nl-EJ; Tue, 05 Jan 2021 03:08:19 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwchF-0007yb-Cl
 for ath11k@lists.infradead.org; Tue, 05 Jan 2021 03:07:47 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1609816064; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=O19Q5KtcGNHtJCX/RiqrbhKDGoWzDR4uwAm5QRHXfTQ=;
 b=bEsz9n9Z9K3wUI6+4mCUnf3mhSK90I5dtyL+c3OM56Uz01aB1vs0ssQST2hDTApCKnc9D3l1
 J6X+ihpRphIxUEdnCB7I11AWX7ZLNHuIhdgR1+eYJOzfDzOvCCQcH6ob0942YtyKqUYgH3Wz
 DMgxaf/vcU8EtpePp8zEdn1+pM0=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5ff3d7ffd3eb3c36b41ad93e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 05 Jan 2021 03:07:43
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id AE424C43462; Tue,  5 Jan 2021 03:07:43 +0000 (UTC)
Received: from gongwen-ThinkPad-T420.qca.qualcomm.com (unknown [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 01337C43461;
 Tue,  5 Jan 2021 03:07:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 01337C43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=wgong@codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: ath11k@lists.infradead.org,
	johannes@sipsolutions.net
Subject: [PATCH v3 1/2] mac80211: remove NSS number of 160MHz if not support
 160MHz for HE
Date: Tue,  5 Jan 2021 11:08:39 +0800
Message-Id: <1609816120-9411-2-git-send-email-wgong@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609816120-9411-1-git-send-email-wgong@codeaurora.org>
References: <1609816120-9411-1-git-send-email-wgong@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_220745_497018_489E30C7 
X-CRM114-Status: GOOD (  13.42  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: linux-wireless@vger.kernel.org, wgong@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

When it does not support 160MHz in HE phy capabilities information,
it should not treat the NSS number of 160MHz as a valid number,
otherwise the final NSS will be set to 0.

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 net/mac80211/vht.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/net/mac80211/vht.c b/net/mac80211/vht.c
index d87e020715b3..d872f1d4d946 100644
--- a/net/mac80211/vht.c
+++ b/net/mac80211/vht.c
@@ -484,6 +484,7 @@ enum ieee80211_sta_rx_bandwidth ieee80211_sta_cur_vht_bw(struct sta_info *sta)
 void ieee80211_sta_set_rx_nss(struct sta_info *sta)
 {
 	u8 ht_rx_nss = 0, vht_rx_nss = 0, he_rx_nss = 0, rx_nss;
+	bool support_160;
 
 	/* if we received a notification already don't overwrite it */
 	if (sta->sta.rx_nss)
@@ -514,7 +515,13 @@ void ieee80211_sta_set_rx_nss(struct sta_info *sta)
 			}
 		}
 
-		he_rx_nss = min(rx_mcs_80, rx_mcs_160);
+		support_160 = !!(he_cap->he_cap_elem.phy_cap_info[0] &
+			  IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G);
+
+		if (support_160)
+			he_rx_nss = min(rx_mcs_80, rx_mcs_160);
+		else
+			he_rx_nss = rx_mcs_80;
 	}
 
 	if (sta->sta.ht_cap.ht_supported) {
-- 
2.23.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
