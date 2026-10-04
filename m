Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3340BCA5FF1
	for <ath11k@archiver.kernel.org>; Sun,  4 Oct 2026 11:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KMk7EA10g1nkTDaHhk/5Ru/VTE9WAOox/BmBAwF5SKg=; b=wPfJ/kC6skgeM0ApYzqx5NNRm1
	w54pyigRYQCYdBDJBbm0/ydL7uwxaGa7v9wmthBGLVlJ7eiWm0/16F9O9sEYV/ZnvFnlBiKr3xLZH
	8pCho7tcXiWRZO5cDhuzbvvYsD47eDpAKjCUuiNap+q3yqRPGoOao3+kcttA7d706jnblkqmCmIT0
	QC7zdIni6TRw8XzTttUGnfGqLuA7P2JHwBHoeOR8OIYiI36xdToL4pGXi5q38ccE2AEE4ZbZRgLxq
	a/DtafNjL+KpEjvZDjZKusZKR8H07uI5WRkjum6R4K+fg+yxIgCme64wiQTIWQRxcbDfoyDeq5EhS
	Oc6TdbRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDKKo-0000000EjeZ-3Las;
	Sun, 04 Oct 2026 11:24:50 +0000
Received: from vtj.irix.systems ([82.76.27.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDKKm-0000000EjdW-1r97
	for ath11k@lists.infradead.org;
	Sun, 04 Oct 2026 11:24:50 +0000
Received: from MAILGW-DELL.dell.vtj.corp.irix.systems (localhost [127.0.0.1])
	by vtj.irix.systems (Proxmox) with ESMTP id 90DDD13D2B;
	Sun, 04 Oct 2026 14:24:46 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=andrei-z.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=sig1; bh=KMk7EA10g1nkTDaHhk/5Ru/VTE9WAOox/BmBAwF5SKg=; b=
	bny5b1kyzHoXCdfkgciYDzScUPd9nqJMLyql3fxR9canggn0jUfkxK/qEO9DZdX8
	KQ13EOwZydxJa8rWQQtZCugzj5U5FQb8gT6FJZj2u8Xx/54+RTH5o99B2pHm3jtv
	VbU/v8fG1Pcak7fxhFeOyC99VUwLGqPiE0shpLLKf6OJOYPHTr2gpLJ0iJEmOL2S
	5Ybs4svX1vZoxy7ixN/B951Pdg+bXc+NvwxPJ0XCrgAbjheTsJq+zupWkYefSfZo
	ydRXcd5eLi9ZN2DigOIWC36d8q+kVtnSjoWV4Ad4voxvLm/qPpfJdmh91PhI0qVD
	aan9KDLEahH+xrC3yK1Njg==
Received: from VTJ-MX.corp.irix.systems (unknown [10.57.36.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by vtj.irix.systems (Proxmox) with ESMTPS id 993B413D2A;
	Sun, 04 Oct 2026 14:24:45 +0300 (EEST)
Received: from workspace.corp.irix.systems (2a02:2f04:1:9c23::c) by
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 4 Oct 2026 14:24:45 +0300
From: Andrei-Alexandru Bleortu <me@andrei-z.com>
To: Jeff Johnson <jjohnson@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-wireless@vger.kernel.org>, Felix Fietkau <nbd@nbd.name>
Subject: [PATCH ath-next 0/2] wifi: ath11k: firmware airtime fairness, BSS color while disabled
Date: Sun, 4 Oct 2026 14:24:38 +0300
Message-ID: <cover.1791111135.3.git.me@andrei-z.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2a02:2f04:1:9c23::c]
X-ClientProxiedBy: VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) To
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_042448_881766_9537EDF9 
X-CRM114-Status: GOOD (  10.32  )
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

Two ath11k patches that need the mac80211 changes in "[PATCH
wireless-next 0/2] wifi: mac80211: airtime weight op, BSS color during
a color change" (<cover.1791111135.1.git.me@andrei-z.com>):

1. Firmware airtime fairness (ATF) on the QCN9074 and IPQ5018, using
   Felix Fietkau's sta_set_airtime_weight op. Changes since v2: the
   command ID and TLV tags sit in their enums; a radio whose firmware
   refuses ATF keeps working without it; the commit message says the
   122 Mbit/s cap was measured with the firmware's strict scheduling
   set, which the patch does not do.
2. Keep the BSS color in the vdev parameter while the color is disabled
   during a color change (IEEE Std 802.11-2024, 26.11.4); with mac80211
   now keeping the color, the firmware gets it instead of 0.

They are based on ath-next with that series applied, and can wait for
it to reach ath-next.

The patches by me were written with an AI coding assistant (Claude
Code), which also drafted the changelogs; the testing described was done
on the hardware.

v2 also carried beacon protection, now dropped: with the firmware
signing beacons, a client that enforces beacon protection (Intel BE200,
iwlmld) lost every beacon on QCN9074 and IPQ5018, with either BIGTK
index and with or without a host-built MME. Until it is known what the
firmware needs, BIP stays in software and the feature is not advertised.

v2: https://lore.kernel.org/all/20261003155542.96363-1-me@andrei-z.com/

Andrei-Alexandru Bleortu (2):
  wifi: ath11k: support firmware airtime fairness
  wifi: ath11k: keep the BSS color while it is disabled

 drivers/net/wireless/ath/ath11k/core.h |   1 +
 drivers/net/wireless/ath/ath11k/mac.c  | 116 +++++++++++++++++++++++--
 drivers/net/wireless/ath/ath11k/wmi.c  |  97 +++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.h  |  51 +++++++++++
 4 files changed, 260 insertions(+), 5 deletions(-)


base-commit: f49defea7668d8c68ec19fa085ef3da6075561c7
prerequisite-patch-id: 0ce384d8e432a5ffedf43b8e02dd2576a52fb3fb
prerequisite-patch-id: f606f9dee7c5cdf33bf5f06e985885fd9deaf90a
-- 
2.47.3



