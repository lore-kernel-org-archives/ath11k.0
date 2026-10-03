Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4D3CA5FEC
	for <ath11k@archiver.kernel.org>; Sat,  3 Oct 2026 15:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XvIrXc1fFfzKNgh15SbDAaaz7UPjmjrI0Y9cfPx7zxg=; b=xTl+xIDHIUg5v8YzVeR1gZ8AGh
	H5ZpvJImLJcwaw/968gHZM3BO59o3+l+go3qkLDRNB5hjJA+gkUq12XT6HoBM2bMmrcXfPpbW6LaJ
	1vUP1SNZKW5tHl9HSglv/EuJ1QsKIhD8X/1SuPEb8R+SorpsfOtonwWUcg3/6sMRVyWDlmp2xrlPM
	YK0BiXi6H+GpMOFnvXctnuuYQ9TUiLa8xZDwmqBeJs0wl8N9VsZvk28nsy7asRZvZy8mFiUX5nsq4
	sZV73rn9MaGpEQWygHvBkbLNp+LoXo/BH0Xbn/RLx37WUDSDTt7c+5JOi7ioZXY/pLhgTEN179fOF
	LEbmA3Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD25k-0000000Diqp-1dzP;
	Sat, 03 Oct 2026 15:56:04 +0000
Received: from vtj.irix.systems ([82.76.27.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD25g-0000000DioT-2Wae
	for ath11k@lists.infradead.org;
	Sat, 03 Oct 2026 15:56:02 +0000
Received: from MAILGW-BIG.big.vtj.corp.irix.systems (localhost [127.0.0.1])
	by vtj.irix.systems (Proxmox) with ESMTP id 4FA71E1C3;
	Sat, 03 Oct 2026 18:55:48 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=andrei-z.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=sig1; bh=XvIrXc1fFfzKNgh15SbDAaaz7UPjmjrI0Y9cfPx7zxg=; b=
	Dp7yRJmRLVkGNZctwULHvBw+rfVifuZiaZfAnptPRTjFQlxDMpB3Hj5RiSI/PdBL
	xY1slMbiHdUXubmCQg6AH38Novku61Pw2dNrREroH0qnGZxkh0sihSGYQgcW8ebc
	SGlrHWmYAUyeF634OPJ9nxpaKCoX56KcZHl52M+/D36PxveF8vRRU8Kk5qfId7sH
	OWyWTlBcZ9GuIvVsbVWurqEPwS9ysW0Oe2PK+BCrodMKe4nJRZupuJcjeMkzRJvp
	4vSGTsCInEvpZayrCtPH+O3FiQTcDlcC58GCsF4Ubp74ifhnJKN/F3LRuytzMyxq
	HDLYTFjacItKqcXENnaSkA==
Received: from VTJ-MX.corp.irix.systems (unknown [IPv6:2a02:2f04:1:9c24::6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by vtj.irix.systems (Proxmox) with ESMTPS id D11DEE16F;
	Sat, 03 Oct 2026 18:55:47 +0300 (EEST)
Received: from workspace.corp.irix.systems (2a02:2f04:1:9c23::c) by
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 18:55:47 +0300
From: Andrei-Alexandru Bleortu <me@andrei-z.com>
To: Jeff Johnson <jjohnson@kernel.org>, Johannes Berg
	<johannes@sipsolutions.net>
CC: <ath11k@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-wireless@vger.kernel.org>, Felix Fietkau <nbd@nbd.name>
Subject: [PATCH 0/4] wifi: ath11k: beacon protection and firmware airtime fairness
Date: Sat, 3 Oct 2026 18:55:38 +0300
Message-ID: <20261003155542.96363-1-me@andrei-z.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2a02:2f04:1:9c23::c]
X-ClientProxiedBy: VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) To
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_085600_831411_3D7B076F 
X-CRM114-Status: GOOD (  11.53  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Firmware features ath11k does not use yet, found while bringing up a
Ubiquiti UniFi U6 Enterprise (IPQ5018 with two QCN9074) with the data
path offloaded to NSS: a debugfs view of the firmware's services, beacon
protection and firmware airtime fairness, plus the mac80211 change the
last one needs.

Patch 1 lists the firmware's WMI service bits in debugfs, as ath10k
does: whether a feature exists is usually a service bit, and ath11k only
logs part of the map at debug level.

Patch 2 is beacon protection, following ath12k's implementation: the
firmware signs beacons with the BIGTK. Checked over the air on both
chips: every beacon in a monitor capture carried a Management MIC
element whose BIP-CMAC-128 MIC verifies against the BIGTK hostapd
installed (624 of 624; none with another radio's key), and a
wpa_supplicant client verified the SSID from a protected beacon.

Patch 3 is Felix Fietkau's mac80211 change from OpenWrt, which gives
drivers the station airtime weight (sta_set_airtime_weight). Patch 4
needs it; it is included unchanged, with his authorship.

Patch 4 is firmware airtime fairness: per-station airtime shares the
firmware schedules by, derived from the stations' airtime weights. With
the data path offloaded, mac80211's own airtime scheduler never sees the
frames, so the firmware is the only place fairness can happen there. A
station capped at 10% under strict scheduling drops from 885 to
122 Mbit/s and recovers when uncapped; at its normal fair share
throughput is unchanged (900 Mbit/s on 5 GHz HE80). The firmware needs
its ATF group defined before it accepts shares, which the commit
message details.

Patch 3 is for mac80211; the others go through the ath tree, and patch 4
depends on patch 3.

The patches were written with an AI coding assistant (Claude Code),
which also drafted the changelogs; the testing above was done on the
device.

Andrei-Alexandru Bleortu (3):
  wifi: ath11k: add a debugfs file listing the firmware WMI services
  wifi: ath11k: support beacon protection
  wifi: ath11k: support firmware airtime fairness

Felix Fietkau (1):
  wifi: mac80211: notify driver on airtime weight changes

 drivers/net/wireless/ath/ath11k/core.h    |   2 +
 drivers/net/wireless/ath/ath11k/debugfs.c |  15 ++
 drivers/net/wireless/ath/ath11k/mac.c     | 166 +++++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/wmi.c     |  99 +++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.h     |  58 +++++++-
 include/net/mac80211.h                    |   5 +
 net/mac80211/cfg.c                        |   6 +-
 net/mac80211/driver-ops.c                 |   4 +
 net/mac80211/driver-ops.h                 |  19 +++
 net/mac80211/sta_info.c                   |   7 +-
 net/mac80211/trace.h                      |  27 ++++
 11 files changed, 400 insertions(+), 8 deletions(-)


base-commit: f0406245cb9855e6318335a8a223551354291a46


