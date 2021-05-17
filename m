Return-Path: <SRS0=TAbk=KM=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00BC9C433B4
	for <ath11k@archiver.kernel.org>; Mon, 17 May 2021 20:20:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 781C160FEB
	for <ath11k@archiver.kernel.org>; Mon, 17 May 2021 20:20:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 781C160FEB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tFauKI8myyWXVXjWYsWTbkSAP3cG7ozUHYfgufZERrE=; b=Vmjmrhd5bo0P6le3kz0eMD+uiv
	GYGKye88jALSKe4lHvggkeUUe4GAubvSqVwQnod3KYjcvjSQAQBFxN5GdyTfviQIlWZ+8CO91ll0V
	W02fwMRVzLk2+UPNL4Os2a20YmH4pyqNh6ICGJ49P4hBgu0qFVg196YpRiFLW5NB7Zsvz8tnxuZkb
	URnrJeFIKHcIDo7JyLPXZmIfNCQUb7n1HxQrV0J4tls29P+PmiLZ3vB9X/Jd/y4zCTZDDF7JyLRw/
	w9a9TnouSrPEEiFP2I4avEDZKt3loJEmXoli8uKaf83U+ivkBWMLBGlf7+v+4FR+NXGPBblDZy5H6
	K4Gpv9LA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lijil-00G2hE-4N; Mon, 17 May 2021 20:20:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lijij-00G2ga-Ce
 for ath11k@desiato.infradead.org; Mon, 17 May 2021 20:20:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=ISOOlr+OeaWAxjcX1uSyVjyImbajiEK/ItgpI+8j1VM=; b=zvj4fxTR9nsJ9UEdKVku67GTFZ
 K8jLgk5GnVLGh3S1d/ilc85/J9XCtuMpWnzzLpJvtO5drC+tmyaqx4hXtXcMyn3dNqhrymWE4sqqN
 nrQUu/otvS7WwEJPoC7dtSSlUZ0JcxBOgQxxe0C/qjuDhVrYkpuQ5i3F5z6O3vVeoC8ozor1vKu/c
 4I6mBqN+u8kBRw9qejYM4cx9Vtrz6xrnJ2NXIKmdrH2ZOjCcTu4+htQuG0oc0raUcm+o3gsjXkX1M
 ICL2/OZ5NFvQQN0DGYN9faGf5pEbd6wb8XpN8TSgmnro7jHcXnTFk24MmQbwW3kSMimL9sqvjfNId
 yR3fAKqw==;
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lijig-00E7mB-Jn
 for ath11k@lists.infradead.org; Mon, 17 May 2021 20:20:08 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1621282805; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=ISOOlr+OeaWAxjcX1uSyVjyImbajiEK/ItgpI+8j1VM=;
 b=ow1Qf4JxP/8NahpckpFZHeooMhq4GLSPXoJjV5gRayVj+9LE9BsO5WNM7WwDwI23UFZlMDWX
 cdAYc1VkvaDHe1q6oiAqykvqF8tNq3JB5cVgrNW+UnMTUuUyl8RicfM7b59ba1KEpNLJYjfs
 ha+LaOyNkolsthWJwBOiEEy+y3Y=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60a2cff4b15734c8f9719c32 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 17 May 2021 20:20:04
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9D91FC43217; Mon, 17 May 2021 20:20:03 +0000 (UTC)
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (unknown
 [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 05BCCC433D3;
 Mon, 17 May 2021 20:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 05BCCC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=wgong@codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: ath11k@lists.infradead.org,
	johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org,
	wgong@codeaurora.org
Subject: [PATCH 0/9] cfg80211/mac80211: Add support for 6GHZ STA for various
 modes : LPI, SP and VLP
Date: Mon, 17 May 2021 16:19:23 -0400
Message-Id: <20210517201932.8860-1-wgong@codeaurora.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_132006_744002_FB908918 
X-CRM114-Status: UNSURE (   9.87  )
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

It introduced some new concept:
power type of AP(STANDARD_POWER_AP, INDOOR_AP, VERY_LOW_POWER_AP)
power type of STATION(DEFAULT_CLIENT, SUBORDINATE_CLIENT)
power spectral density(psd)

This patchset for cfg80211/mac80211 is to add the definition of new
concept of 6G and add basic parse of IE(transmit power envelope
element) in beacon and save power spectral density(psd) reported
by lower-driver for 6G channel, the info will be passed to lower
driver when connecting to 6G AP.

Wen Gong (9):
  cfg80211: add power type definition for 6G Hz
  mac80211: add definition of regulatory info in 6G Hz operation
    information
  mac80211: add parse regulatory info in 6G Hz operation information
  cfg80211: add definition for 6G power spectral density(psd)
  cfg80211: save power spectral density(psd) of regulatory rule
  mac80211: add definition for transmit power envelope element
  mac80211: add parse transmit power envelope element
  mac80211: add transmit power envelope element and power constraint in
    bss_conf
  mac80211: save transmit power envelope element and power constraint

 include/linux/ieee80211.h    | 35 ++++++++++++++++++++++++++++++++++-
 include/net/cfg80211.h       |  7 +++++++
 include/net/mac80211.h       |  6 ++++++
 include/net/regulatory.h     |  1 +
 include/uapi/linux/nl80211.h | 32 ++++++++++++++++++++++++++++++++
 net/mac80211/ieee80211_i.h   |  3 +++
 net/mac80211/mlme.c          | 21 +++++++++++++++++++++
 net/mac80211/util.c          | 18 ++++++++++++++++++
 net/wireless/reg.c           | 14 ++++++++++++++
 9 files changed, 136 insertions(+), 1 deletion(-)

-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
