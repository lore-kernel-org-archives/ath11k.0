Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45627C41513
	for <ath11k@archiver.kernel.org>; Thu, 27 Jul 2023 10:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HGHeZDAPXApn2QXflibo6pXTUcjXYl3V/PiaIvxQB2Q=; b=Y25vcfexDJ9GHA
	u/3eLHcwauYUH8trKnw2sYZ7r9LcVEuIBFdqGw69Gy5dYk2oPjDO2Rae19G+wUM0I3ryvwI5Qabsu
	zTOJi6jQ/LveG6Kv8MIHFPZf+ct14lTgmZK0/+crlAyR5A/WfY59qFEvq8OzpIy93sURHcoR6RxPD
	NNes+IvDUoaaSYrJf3Hx9mNZBOND+QBOxu3aTvuwVNeKApYcr8dQXrWaO4dCirWi7Nt7gY8KUSq75
	LTvW1+SbcbMsQHAz0vzOu+ijekQBVRKneF6BWAqZIk29X34kVCr3lBNR8THpU00osq/Rh9aUNgnZt
	5INHvZoUk8tcmzIo8FWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOxrI-00CvQE-2N;
	Thu, 27 Jul 2023 10:04:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOxrG-00CvPZ-1W
	for ath11k@lists.infradead.org;
	Thu, 27 Jul 2023 10:04:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BD91A61DF6
	for <ath11k@lists.infradead.org>; Thu, 27 Jul 2023 10:04:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B92DC433C7;
	Thu, 27 Jul 2023 10:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690452273;
	bh=VvxorfFjHb3zIR2wfuiAdZuvChNDahN8yMlJek4Epsk=;
	h=From:To:Cc:Subject:Date:From;
	b=qNO+jbEsjthVmwiMqTqCKzykRbuabYL2IjAnuiyzhya934fbR1Cub3t6Gp6vD8vbp
	 4gIFCoM+ZBsYefFlvfBQcfIMCtO5E0yAyM4ocQhu/LUkb84Viagt7Wju3tm7aYZL9G
	 1ghd5Cl0xSlkOO2kttbFSXPVR/DR93VAcYMf1jQMu6VS47mP4NB7kTtD3fQtYfCD62
	 NPXHJ7wM7jsRPcfXaboRlogQcitmrByEm/1oSDyTmi8nUN7xATmbklcaOgzTBi/Vk/
	 497TNl8W76tOBoSIRztvszlTg5ovPld7pRDwhaV04g6JnwW7OjBAGkkPnlX66jAeCl
	 5ekAK5lhDJHLA==
From: Kalle Valo <kvalo@kernel.org>
To: mhi@lists.linux.dev
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH v4 0/3] wifi: ath11k: support firmware-2.bin
Date: Thu, 27 Jul 2023 13:04:27 +0300
Message-Id: <20230727100430.3603551-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_030434_570002_D82CCB2F 
X-CRM114-Status: GOOD (  11.18  )
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

From: Kalle Valo <quic_kvalo@quicinc.com>

We need firmware-2.bin support in ath11k so that we can add ath11k specific meta
data to firmware releases, for example feature flags so that ath11k can
automatically detect what features the firmware release supports.  Also makes
it easier and more reliable to update the firmware for PCI devices as it's not
possible to mix firmware files, everything will be in one file.

Please review and comment.

v4:

* patch 1: document in struct struct mhi_controller_config::fw_data the
           fbc_download requirement (Jeffrey)

v3: https://patchwork.kernel.org/project/linux-wireless/list/?series=752266&state=*&order=date

* patch 1: add "bus: mhi: host: ..." to title

* patch 1: add a comment to mhi_fw_load_handler()

* patch 1: check sbl_size

* patch 3: for smooth backwards compatibility don't print an error "failed to
  load firmware-2.bin: -2"

v2: https://patchwork.kernel.org/project/linux-wireless/list/?series=727935&state=*&order=date

* mhi_fw_load_handler(): fold two lines into one

* struct mhi_controller_config: document that fbc_download needs to be set

* run pahole struct mhi_controller_config

v1: https://patchwork.kernel.org/project/linux-wireless/list/?series=710862&state=*&order=date

Anilkumar Kolli (1):
  wifi: ath11k: add firmware-2.bin support

Kalle Valo (2):
  bus: mhi: host: allow MHI client drivers to provide the firmware via a
    pointer
  wifi: ath11k: qmi: refactor ath11k_qmi_m3_load()

 drivers/bus/mhi/host/boot.c              |  34 +++--
 drivers/net/wireless/ath/ath11k/Makefile |   3 +-
 drivers/net/wireless/ath/ath11k/core.c   |   8 ++
 drivers/net/wireless/ath/ath11k/core.h   |  15 +++
 drivers/net/wireless/ath/ath11k/fw.c     | 157 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/fw.h     |  27 ++++
 drivers/net/wireless/ath/ath11k/mhi.c    |  18 ++-
 drivers/net/wireless/ath/ath11k/qmi.c    |  54 +++++---
 include/linux/mhi.h                      |   6 +
 9 files changed, 289 insertions(+), 33 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath11k/fw.c
 create mode 100644 drivers/net/wireless/ath/ath11k/fw.h


base-commit: 9102ee8eaa6d29624ed2068396502ad8545f2ff0
-- 
2.39.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
