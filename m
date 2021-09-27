Return-Path: <SRS0=w2Qz=OR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B41C433F5
	for <ath11k@archiver.kernel.org>; Mon, 27 Sep 2021 13:42:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A627660F39
	for <ath11k@archiver.kernel.org>; Mon, 27 Sep 2021 13:42:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A627660F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oq1/IO89tLPA0tq5AEbgkoFlwS9f38ElT+ksJmdPWA0=; b=Ep/k8vXGZ55N3b
	TLB3ZlL832HUO7/zIo7bXFd8CfuyDupVf3OL3L3zytgi5jCsTgFoHT5uMKMyWwbsARYRk+x/jstOM
	gNdF+yCAx0b0k6UZmmCjxvJkeHJqG5cp6BnRZxY0/DlTQ1+jvn/63Dn3xy9iyp1tJXaOhhkJ50Muf
	aZE5/5d1LWR8xQevErEPLA4nGUNCsxyzeTjO+qdCD3qg5Cs6xw1WziCZP/dvQegXFsZa2A2zoSnXE
	XnJmGJ2CU8OSltvR4iIBRqo79kqOPtHkHA/2gayXBJLfIR8nuXenALxqg/f+K8QVc88jYg1p9QVL0
	zzfez80BK8RQEwVuFPiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUqu2-002n1O-Cl; Mon, 27 Sep 2021 13:42:42 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUqtu-002mwG-0P
 for ath11k@lists.infradead.org; Mon, 27 Sep 2021 13:42:41 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632750160; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Z37yVYh8YICEJtn+fkhkvwtyMzcivSLYdi245wxWQ6w=;
 b=gXDS0L1SEOOeu6X7AP/Z5c5EV05IVFCvRa6RdhqiNiWkViMDOMPs3vnyyfVm5JpzFK14QZyu
 Dd/lpB+51QsCjSP7etmnaAsKw44UD7pk3WwwCdW2Dhxjsqp8zNiapuokKEZWVLInipwL/C8r
 teKRkfJscg/WiFVwn1Z99A8H31s=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6151ca23713d5d6f96d4c813 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 27 Sep 2021 13:41:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 15774C43460; Mon, 27 Sep 2021 13:41:55 +0000 (UTC)
Received: from cdchalpyex0390930-lin.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: tmariyap)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5F0F2C4360C;
 Mon, 27 Sep 2021 13:41:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 5F0F2C4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Thiraviyam Mariyappan <tmariyap@codeaurora.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
 Thiraviyam Mariyappan <tmariyap@codeaurora.org>
Subject: [PATCH] mac80211: fix incorrect nss config
Date: Mon, 27 Sep 2021 19:11:44 +0530
Message-Id: <1632750104-1722-1-git-send-email-tmariyap@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_064240_411727_FC7666FF 
X-CRM114-Status: UNSURE (   9.11  )
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

In HE capabilities, HE-MCS Rx map field filled with value 0x3 for all eight
spatial streams if txrx chains configured as incorrect value.
This patch changes configure at least single spatial stream for HE-MCS
0 to 7 in all supported channel widths if nss configured as incorrect
value.

Signed-off-by: Thiraviyam Mariyappan <tmariyap@codeaurora.org>
---
 net/mac80211/he.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/net/mac80211/he.c b/net/mac80211/he.c
index c05af70..ee113ff5 100644
--- a/net/mac80211/he.c
+++ b/net/mac80211/he.c
@@ -151,6 +151,13 @@ ieee80211_he_cap_ie_to_sta_he_cap(struct ieee80211_sub_if_data *sdata,
 		       &he_cap_ie[sizeof(he_cap->he_cap_elem) + mcs_nss_size],
 		       he_ppe_size);
 
+	if (he_cap->he_mcs_nss_supp.rx_mcs_80 == cpu_to_le16(0xFFFF)) {
+		he_cap->has_he = false;
+		sdata_info(sdata, "Ignoring HE IE from %pM due to incorrect rx_mcs_80\n",
+			   sta->addr);
+		return;
+	}
+
 	he_cap->has_he = true;
 
 	sta->cur_max_bandwidth = ieee80211_sta_cap_rx_bw(sta);
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
