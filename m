Return-Path: <SRS0=xirI=NL=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA209C4338F
	for <ath11k@archiver.kernel.org>; Fri, 20 Aug 2021 12:21:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F41F60F45
	for <ath11k@archiver.kernel.org>; Fri, 20 Aug 2021 12:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F41F60F45
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9pKMG+7iXntOraktKbJR5I0RMmdJNe8RDFjYPhlf+UY=; b=kkmoPGPdUXXxnB
	YmUOTMe696d86CxLIY0vBKjjfhXmzN5utU1St/c66DQTpoOD4f9nHK3RjMSVtzbMSyhJzLjLjSL/i
	GKdsA8cDGPiYMGTwL5xEjLq+t6LMGvai/OJ3JJJW3sDWF4a/gQ8vOY1n8E2qQYgfZPBzWDet8AGcM
	YR2nI8HC+Qd4GkKdNkDgxWgN9vT5r+UH1Y0ke7/WuPKOORRuLebZwOYaofbYXAVtRsSRDlwSmLDr3
	QgtRUjcmXtWl/Y8UIm+MEDqiasBwYtPTR7lhbzyjqggf1qXkI4tgf+HVHDXR5nINH1reG2pNUqTrY
	wvfJhuHyrhuzOEub4V8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH3WO-00B6in-Vq; Fri, 20 Aug 2021 12:21:17 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH3W9-00B6bp-2k
 for ath11k@lists.infradead.org; Fri, 20 Aug 2021 12:21:09 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1629462068; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=TNsFo9asXxTaILvhClQleGhoJKkPqv7/MQpYITwgVmY=;
 b=p0l2TiyTrQ6wKzeqHbCYErO3fX6AuUeqYa7DsRk/lrnm6CMSFKSWQecQe+oZpDf8fpUM/G2P
 aJFs3UMKK1cG9Zc7OWC6iRn1/v5EzIvzS3mfpaXl0hRl96NRfZif0ECx7iH9VfXzjkey7jnq
 mq1FbeXxEwmPMb6yE63fIOfsxvs=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 611f9e201ea75edcc3ad6387 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 20 Aug 2021 12:20:48
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 79E35C43460; Fri, 20 Aug 2021 12:20:48 +0000 (UTC)
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (unknown
 [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1F5AEC4338F;
 Fri, 20 Aug 2021 12:20:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 1F5AEC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: johannes@sipsolutions.net,
	ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	wgong@codeaurora.org
Subject: [PATCH v2 0/8] cfg80211/mac80211: Add support for 6GHZ STA for
 various modes : LPI, SP and VLP
Date: Fri, 20 Aug 2021 08:20:33 -0400
Message-Id: <20210820122041.12157-1-wgong@codeaurora.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_052108_260810_2FF7E37F 
X-CRM114-Status: UNSURE (   9.69  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

v2: change per comments of johannes.
    including code style, code logic, patch merge, commit log... 

It introduced some new concept:
power type of AP(STANDARD_POWER_AP, INDOOR_AP, VERY_LOW_POWER_AP)
power type of STATION(DEFAULT_CLIENT, SUBORDINATE_CLIENT)
power spectral density(psd)

This patchset for cfg80211/mac80211 is to add the definition of new
concept of 6G and add basic parse of IE(transmit power envelope
element) in beacon and save power spectral density(psd) reported
by lower-driver for 6G channel, the info will be passed to lower
driver when connecting to 6G AP.

Wen Gong (8):
  cfg80211: add power type definition for 6 GHz
  mac80211: add definition of regulatory info in 6 GHz operation
    information
  mac80211: add parse regulatory info in 6 GHz operation information
  cfg80211: add definition for 6 GHz power spectral density(psd)
  cfg80211: save power spectral density(psd) of regulatory rule
  mac80211: add definition for transmit power envelope element
  mac80211: add parse transmit power envelope element
  mac80211: save transmit power envelope element and power constraint

 include/linux/ieee80211.h    | 43 +++++++++++++++++++++++++++++++++++-
 include/net/cfg80211.h       |  7 ++++++
 include/net/mac80211.h       |  6 +++++
 include/net/regulatory.h     |  1 +
 include/uapi/linux/nl80211.h | 36 ++++++++++++++++++++++++++++++
 net/mac80211/chan.c          |  9 ++++++++
 net/mac80211/ieee80211_i.h   |  3 +++
 net/mac80211/mlme.c          | 26 ++++++++++++++++++++++
 net/mac80211/util.c          | 19 ++++++++++++++++
 net/wireless/reg.c           | 14 ++++++++++++
 10 files changed, 163 insertions(+), 1 deletion(-)

-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
