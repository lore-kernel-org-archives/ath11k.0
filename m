Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57600C4332F
	for <ath11k@archiver.kernel.org>; Mon, 21 Mar 2022 17:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VmEUNP8Hj3JOEBmeM51kCt98zXjOxHioigxOi5scGVc=; b=zmvlPQxt7kVe1j
	t1gBwDfcZu2fQKkfSdDa1/bJ/tfmT5Na5Un17ItDxja+kLnl6H+3XMUmepvaU5G4wK6SnXMLZfQ/E
	SReRBejnL/uYG8wC4qGEzwaR+mDH5Wzn0B6yTz6lR01wi2HDGvV+MgZUrZKnL0NIsq6No6n/RX/eH
	xwjzoAdE5Hjv9Hka0le5StRiKEf6pO6vj0lcUpwovRF4fFbkG/SCe3Ej0UyMZJ6ZoKex9xdobNipr
	aSdVpi+DWQboNJ7kPoD0ytB5dsUHo+Sb5mIE4QWrPzpiHcDSr/YDcQ3yYRRjw6x1aWd9g/utYGuRp
	QcRVgwoU68bkU3/Xt4uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWLkU-008bp2-W7; Mon, 21 Mar 2022 17:23:19 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWLkQ-008bn1-Vj
 for ath11k@lists.infradead.org; Mon, 21 Mar 2022 17:23:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647883395; x=1679419395;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=yirBN0FCyH1Z6wIMXksUg4ALNTNGcfiiNQVe+V5YtEI=;
 b=rjWnwF5sYZqJvpmPXKAbV4gSMOGLMh1asV/pWAOb3Pxz2jqjTEM9ikTJ
 qCVcBW7Gxjy+gnEyrsMBnpiQ13HFHsCaZg7u1PxmbAJzQQ9qNijEBs1FJ
 c5+pfV7h3WLzFxTMzg24bQM+EirdarJFG9nlt8bNeb4g4LbhCJdr2WqWA w=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 21 Mar 2022 10:23:11 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 10:23:11 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 21 Mar 2022 10:23:11 -0700
Received: from ppranees-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 21 Mar 2022 03:17:15 -0700
From: P Praneesh <quic_ppranees@quicinc.com>
To: <ath11k@lists.infradead.org>, <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>
Subject: [PATCH v4 0/3] mac80211: Add extended ROC support for 40-80 MHz
 bandwidth
Date: Mon, 21 Mar 2022 15:46:34 +0530
Message-ID: <1647857797-19749-1-git-send-email-quic_ppranees@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_102315_110742_D8EB98C2 
X-CRM114-Status: UNSURE (   8.69  )
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

This patch add extended roc support for 40 and 80 Mhz bandwidth.
It helps to handle remain on channel for wide band scan in ath11k.
---
v4:
	- added feature check based on the hardware advertisement
	  SUPPORTS_EXT_REMAIN_ON_CHAN and addressed other review comments.
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
 drivers/net/wireless/ath/ath11k/mac.c              | 215 ++++++++++++++++++---
 drivers/net/wireless/ath/ath11k/reg.c              |  49 +++--
 drivers/net/wireless/ath/ath11k/reg.h              |   2 +-
 drivers/net/wireless/ath/ath11k/wmi.c              |  59 +++++-
 drivers/net/wireless/ath/ath11k/wmi.h              |  26 ++-
 drivers/net/wireless/ath/ath6kl/cfg80211.c         |   5 +-
 drivers/net/wireless/ath/ath6kl/wmi.c              |  10 +-
 drivers/net/wireless/ath/ath9k/main.c              |   4 +-
 drivers/net/wireless/ath/wil6210/cfg80211.c        |  13 +-
 drivers/net/wireless/ath/wil6210/p2p.c             |  27 ++-
 .../broadcom/brcm80211/brcmfmac/cfg80211.c         |   2 +-
 .../net/wireless/broadcom/brcm80211/brcmfmac/p2p.c |  10 +-
 .../net/wireless/broadcom/brcm80211/brcmfmac/p2p.h |   2 +-
 drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c  |   3 +-
 drivers/net/wireless/mac80211_hwsim.c              |   3 +-
 drivers/net/wireless/marvell/mwifiex/cfg80211.c    |  10 +-
 drivers/net/wireless/marvell/mwifiex/sta_event.c   |   4 +-
 drivers/net/wireless/marvell/mwifiex/uap_event.c   |   4 +-
 drivers/net/wireless/mediatek/mt76/mt7615/main.c   |   3 +-
 drivers/net/wireless/microchip/wilc1000/cfg80211.c |  17 +-
 drivers/net/wireless/rsi/rsi_91x_mac80211.c        |   3 +-
 drivers/net/wireless/ti/wlcore/main.c              |   3 +-
 drivers/staging/rtl8723bs/include/ioctl_cfg80211.h |   4 +-
 include/net/cfg80211.h                             |  17 +-
 include/net/mac80211.h                             |   5 +-
 net/mac80211/debugfs.c                             |   1 +
 net/mac80211/driver-ops.h                          |   6 +-
 net/mac80211/ieee80211_i.h                         |   4 +-
 net/mac80211/offchannel.c                          |  64 +++---
 net/mac80211/trace.h                               |   9 +-
 net/wireless/nl80211.c                             |  27 +--
 net/wireless/rdev-ops.h                            |   6 +-
 net/wireless/trace.h                               |  44 ++---
 35 files changed, 489 insertions(+), 176 deletions(-)

-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
