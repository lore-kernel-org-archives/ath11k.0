Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536ECCA5FE6
	for <ath11k@archiver.kernel.org>; Sun,  4 Oct 2026 11:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z14jOlj3j4hOPmIKQRS6Z8i1b6d3wA/Dft6otIb+H9I=; b=pi5Oem4vbS30X/RAws5vDQUAFm
	dnXo2qrb6Up0wTlh6MgdVB3erVckCF4bpoNZIYQT8bZRPnqc2AOxQpcEyWu6siIt5PyAMwCg9I91Z
	IDVL5Ci1izhemPvaGGkcJ3V3SlURt/Xf/SzFvYPEmMSU2zrK00UyPU/VuR9Wc5GSO7jeTHwZ6mZln
	8ezw4fvTmUw/RxijuMNMVfDE4XbccFruFf2PXu30TB7+qH4XrvsWzYC8hRr2t0DtBMBtIe8QgDSvV
	2gk9J/DAVvW+eHQFGrhRuXU9bblzX+yTkBMTP07XjdpBdURrZjr0LPGfOCQ4iT4ihSXcX5HvTDH5n
	sGpCngYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDKEV-0000000Einz-1oGe;
	Sun, 04 Oct 2026 11:18:19 +0000
Received: from vtj.irix.systems ([82.76.27.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDKES-0000000Einf-0fXC
	for ath11k@lists.infradead.org;
	Sun, 04 Oct 2026 11:18:17 +0000
Received: from MAILGW-DELL.dell.vtj.corp.irix.systems (localhost [127.0.0.1])
	by vtj.irix.systems (Proxmox) with ESMTP id 078F513C31;
	Sun, 04 Oct 2026 14:18:14 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=andrei-z.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=sig1; bh=z14jOlj3j4hOPmIKQRS6Z8i1b6d3wA/Dft6otIb+H9I=; b=
	RLLwMX1JL8m8yq+zaea709O7zEBxrAHDafnrzB/a9G0abCAfrRJOX9v9Oog7VeTl
	w2TsY8PYRrOZx49n4+j0r4XgLKP8nrGCSas1cCvU51oA16hZf0dPp42qN/ACTSIW
	o1IA6B9BDJGLdwoMoRw6lWhgLuBA2mdkPC6CbdMa7DEeeUAL2eGeUnlEz5//jWoh
	mildzP0VPI8TB+geuIGtnBMNoPH7HaoZeBrMqxK5+BRzz4oS00oZkG6+5MIWOqcr
	kf6ow7AQWcFaHRyxet+6rIfuu0mTf0aL5WkK3xv00cQbj5vVIa/h2fp9M+1i5AYL
	LFxN7heTXbph1htDKTeJHw==
Received: from VTJ-MX.corp.irix.systems (unknown [10.57.36.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by vtj.irix.systems (Proxmox) with ESMTPS id 086F413C30;
	Sun, 04 Oct 2026 14:18:13 +0300 (EEST)
Received: from workspace.corp.irix.systems (2a02:2f04:1:9c23::c) by
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 4 Oct 2026 14:18:12 +0300
From: Andrei-Alexandru Bleortu <me@andrei-z.com>
To: Jeff Johnson <jjohnson@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-wireless@vger.kernel.org>
Subject: [PATCH ath-next 0/5] wifi: ath11k: WMI services debugfs and HE AP fixes
Date: Sun, 4 Oct 2026 14:18:02 +0300
Message-ID: <cover.1791111135.2.git.me@andrei-z.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2a02:2f04:1:9c23::c]
X-ClientProxiedBy: VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) To
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_041816_381608_4AA1F96D 
X-CRM114-Status: UNSURE (   8.91  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

A debugfs file listing the firmware's WMI services, and fixes for an
ath11k HE AP found by checking it against IEEE Std 802.11-2024, each
tested on a QCN9074:

1. debugfs: wmi_services lists the services the firmware advertises.
   Earlier posted in the airtime fairness series, now split by tree;
   since v2 the commit message no longer claims to match ath10k's
   output.
2. Probe Responses during a channel switch carried the initial count:
   ath11k never counted down mac80211's CSA counter (as ath12k does).
3. Without spatial reuse parameters, an AP enabled non-SRG OBSS PD at
   -62 dBm; it now stays off, as in ath12k.
4. A 6 GHz AP never sent its per-20 MHz power limits to firmware (the
   TPC command was station only); it now does as an LPI AP, as in
   ath12k.
5. The hardware DSCP-TID tables used the class selector bits, while
   cfg80211 maps DSCP to UP per RFC 8325 section 4; checked on air
   through the firmware's per-TID peer statistics (CS1->1, AF21->3,
   EF->6, CS6->7).

None of them depends on the mac80211 series sent alongside.

The patches by me were written with an AI coding assistant (Claude
Code), which also drafted the changelogs; the testing described was done
on the hardware.

v2 of patch 1: https://lore.kernel.org/all/20261003155542.96363-2-me@andrei-z.com/

Andrei-Alexandru Bleortu (5):
  wifi: ath11k: add a debugfs file listing the firmware WMI services
  wifi: ath11k: count down channel switch announcements in mac80211
  wifi: ath11k: leave OBSS PD off when spatial reuse is not configured
  wifi: ath11k: set the 6 GHz transmit power limits of an AP
  wifi: ath11k: map DSCP to TID as cfg80211 does by default

 drivers/net/wireless/ath/ath11k/core.h    |  2 ++
 drivers/net/wireless/ath/ath11k/debugfs.c | 15 +++++++++++
 drivers/net/wireless/ath/ath11k/hal_tx.c  | 30 +++++++++++-----------
 drivers/net/wireless/ath/ath11k/mac.c     | 31 +++++++++++++++--------
 drivers/net/wireless/ath/ath11k/wmi.c     | 23 +++++++++++++----
 5 files changed, 71 insertions(+), 30 deletions(-)


base-commit: f49defea7668d8c68ec19fa085ef3da6075561c7
-- 
2.47.3



