Return-Path: <SRS0=5A3f=PK=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78F5BC433F5
	for <ath11k@archiver.kernel.org>; Fri, 22 Oct 2021 12:39:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45C706109E
	for <ath11k@archiver.kernel.org>; Fri, 22 Oct 2021 12:39:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 45C706109E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I4hwC1LEVE8kdEuYSTXrVZvf3P3uklDOXPYEBq7VBV0=; b=V9Kx/7j+8M+QiL
	6oN1jYEFxrC3MfiuyGxNvd6sZYGSgeb9MRs/CKmdb1Jf09hJcRn77Yuj1dwP9vfgqdzQ/UsWvaz5E
	WUyPQyexvFIMbVK0PlwbSTcErmHysespSiwGQ8K6TOQYzhGRRd4+cTBaLToc5ev25G2VkBYf9H+68
	zleQX9OU/yfTMZtNMtlmy9cxCip7rgapO7Krhgmn/YfaB4s6madj4ut8CvDS59fC+dixMll6ix5Um
	N8YGX686oOAZblVNDAwh+OiXhA6dR2Stgoz5zI6GFA3oWoTxXt7N/j/ALlcsLrK7FTofavC43h7J4
	/pvZG8Qb2Q5x5cvhvqsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdtpa-00Au3H-NL; Fri, 22 Oct 2021 12:39:30 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdtpW-00Au0w-Q5
 for ath11k@lists.infradead.org; Fri, 22 Oct 2021 12:39:28 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634906366; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=qVNec6QWGpzrB+x5tAsrYszgLkbhZwBZq/zeaJmayUo=;
 b=WhAUWv7Bx7At0qGjtJQhAB9TW9w4a+cLMz4ecXX1muoCgOBhni2EPQ86XSngmfA8d8VD8dnh
 /puhkAzGF+e+am4W5Soq+88w853ueivk8V2m7SRyPijxJ3Mc1B9HD25YMcIjPsvqit1YLc4E
 gqHobuP7u79WSohyN9/mNs73orw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6172b0e95ca800b6c1bf3d05 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 22 Oct 2021 12:39:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C93A3C43460; Fri, 22 Oct 2021 12:39:04 +0000 (UTC)
Received: from ppranees-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: ppranees)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 03B40C4360D;
 Fri, 22 Oct 2021 12:39:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 03B40C4360D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: P Praneesh <ppranees@codeaurora.org>
To: ath11k@lists.infradead.org,
	johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org,
	P Praneesh <ppranees@codeaurora.org>
Subject: [PATCH v3 0/3] mac80211: Add extended ROC support for 40-80 MHz
 bandwidth
Date: Fri, 22 Oct 2021 18:07:04 +0530
Message-Id: <1634906227-22028-1-git-send-email-ppranees@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_053926_953182_32F2DF3E 
X-CRM114-Status: UNSURE (   9.55  )
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

This patch add extended roc support for 40 and 80 Mhz bandwidth.
It helps to handle remain on channel for wide band scan in ath11k.
---
v3:
	- addressed Johannes comment to use ROC instead of SCAN command and
	  changed cover letter title from 'add Wide Band Scan support' to
	  'mac80211: Add extended ROC support for 40-80 MHz bandwidth'
v2:
	- updated message on cover letter.
---

P Praneesh (3):
  nl80211: Extended ROC support for 40-80 MHz bandwidth
  ath11k: Refactor update channel list function
  ath11k: Add ROC support for wide band scan

 drivers/net/wireless/ath/ath10k/mac.c              |   3 +-
 drivers/net/wireless/ath/ath11k/core.c             |   1 +
 drivers/net/wireless/ath/ath11k/mac.c              | 203 ++++++++++++++++++---
 drivers/net/wireless/ath/ath11k/reg.c              |  99 +---------
 drivers/net/wireless/ath/ath11k/reg.h              |   1 -
 drivers/net/wireless/ath/ath11k/wmi.c              | 160 +++++++++++++++-
 drivers/net/wireless/ath/ath11k/wmi.h              |  31 +++-
 drivers/net/wireless/ath/ath6kl/cfg80211.c         |   3 +-
 drivers/net/wireless/ath/ath9k/main.c              |   4 +-
 drivers/net/wireless/ath/wil6210/cfg80211.c        |   3 +-
 .../net/wireless/broadcom/brcm80211/brcmfmac/p2p.c |   3 +-
 .../net/wireless/broadcom/brcm80211/brcmfmac/p2p.h |   2 +-
 drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c  |   3 +-
 drivers/net/wireless/mac80211_hwsim.c              |   3 +-
 drivers/net/wireless/marvell/mwifiex/cfg80211.c    |   3 +-
 drivers/net/wireless/mediatek/mt76/mt7615/main.c   |   3 +-
 drivers/net/wireless/microchip/wilc1000/cfg80211.c |   3 +-
 drivers/net/wireless/rsi/rsi_91x_mac80211.c        |   3 +-
 drivers/net/wireless/ti/wlcore/main.c              |   3 +-
 include/net/cfg80211.h                             |   2 +-
 include/net/mac80211.h                             |   2 +-
 net/mac80211/driver-ops.h                          |   6 +-
 net/mac80211/ieee80211_i.h                         |   4 +-
 net/mac80211/offchannel.c                          |  56 ++++--
 net/mac80211/trace.h                               |  11 +-
 net/wireless/nl80211.c                             |   2 +-
 net/wireless/rdev-ops.h                            |   6 +-
 net/wireless/trace.h                               |   6 +-
 28 files changed, 452 insertions(+), 177 deletions(-)

-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
