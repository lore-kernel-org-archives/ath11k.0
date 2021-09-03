Return-Path: <SRS0=YLPq=NZ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55FFEC433EF
	for <ath11k@archiver.kernel.org>; Fri,  3 Sep 2021 11:48:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24D5F61051
	for <ath11k@archiver.kernel.org>; Fri,  3 Sep 2021 11:48:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 24D5F61051
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3LsMLbRWrB36NH0bRve+2jBeATNpopHuVaYofbHa44A=; b=PPcbYHuwPmjyub
	uUSfuQG4wrZ8UsgV/7GbIJbuj5YyC+DOOBpVvXNbisP1zjj79MMfPrA+W7DSOQ/lA5QOgzv6yaJHa
	9YoYXEmQ4mGEP9fR5rc1Q20F720EwwIbJ2Y9a7rpviiIjcH0vbhPawckE9z4++rJjicDk/Gajs7oB
	5XqTMPkiI5iWJ63LKpaqGfZCweLPaEpR+EeBZU1TmA2HA2I07Mkpstlj+3uW4TYIgtVrUjFhhkZYt
	Tf2p++I49mAwu1caM/1OXdbE66hgHulmwOke1WkJaIH/e9p0J0hBMF7I6B5tqWAqmWiyijdqViWq3
	X1sK7KTZEqOxij1ZtkwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mM7gZ-00BpQm-46; Fri, 03 Sep 2021 11:48:43 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mM7gV-00BpNy-AZ
 for ath11k@lists.infradead.org; Fri, 03 Sep 2021 11:48:41 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1630669717; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=8J3XuegD4iyKDqBo+ZnOhIoK9/VlPL5UQ/Otmdr5d8o=;
 b=fk3CtTSMgBtAvUkbVaReNmZdu4Me+5+hvVFef7zVmL9QupXk09RmmIqPiK2ewmi+5FVJQCyF
 WwT1oZ++88NDzgTyHYmZ609Q/v6maRyHwD0/lrJ2d1X+VK4ybWsYLZZ7nPfEERF8be32Cqwo
 mc1qDcpJzSAYFbV1CYg4vxSxWZY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 61320b8d6fc2cf7ad9a22849 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 03 Sep 2021 11:48:29
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B254EC43616; Fri,  3 Sep 2021 11:48:28 +0000 (UTC)
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (unknown
 [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 14805C4338F;
 Fri,  3 Sep 2021 11:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 14805C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: johannes@sipsolutions.net,
	ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	wgong@codeaurora.org
Subject: [PATCH v3 0/9] cfg80211/mac80211: Add support for 6GHZ STA for
 various modes : LPI, SP and VLP
Date: Fri,  3 Sep 2021 07:48:12 -0400
Message-Id: <20210903114821.23346-1-wgong@codeaurora.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210903_044839_468505_B69286C9 
X-CRM114-Status: GOOD (  11.77  )
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

From: Wen Gong <wgong@qti-qualcomm.corp-partner.google.com>

v3: change per comments of Johannes.
    1. add patch "mac80211: use ieee802_11_parse_elems() to find ies instead of ieee80211_bss_get_ie()"
    2. move nl80211_ap_reg_power to ieee80211
    3. change some comments, length check, stack big size variable...

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


Wen Gong (9):
  mac80211: add power type definition for 6 GHz
  ieee80211: add definition of regulatory info in 6 GHz operation
    information
  mac80211: add parse regulatory info in 6 GHz operation information
  cfg80211: add definition for 6 GHz power spectral density(psd)
  cfg80211: save power spectral density(psd) of regulatory rule
  ieee80211: add definition for transmit power envelope element
  mac80211: add parse transmit power envelope element
  mac80211: use ieee802_11_parse_elems() to find ies instead of
    ieee80211_bss_get_ie()
  mac80211: save transmit power envelope element and power constraint

 include/linux/ieee80211.h    | 80 +++++++++++++++++++++++++++++++++++-
 include/net/cfg80211.h       |  5 +++
 include/net/mac80211.h       |  8 ++++
 include/net/regulatory.h     |  1 +
 include/uapi/linux/nl80211.h |  2 +
 net/mac80211/ieee80211_i.h   |  3 ++
 net/mac80211/mlme.c          | 70 +++++++++++++++++++++++--------
 net/mac80211/util.c          | 23 +++++++++++
 net/wireless/reg.c           | 17 ++++++++
 9 files changed, 192 insertions(+), 17 deletions(-)

-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
