Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696CFC7EE23
	for <ath11k@archiver.kernel.org>; Tue, 30 May 2023 14:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XC/4O8RRlcoGNZBE6p7oQheTW7a6+DaYhhxKLzQs9f4=; b=VpDwnxBOW0XkT/
	v4JgrIY3UnqtaLwRZTw4V5KSvLqY4lMyam687bYwb61RfHMwNn4VrRdw2B/giCTh5NRL7Hv1F/zIN
	OzcAPJEk/9dY4WbsQ7tWoCDHSjH0dNf4R889HF4YsAHq+MAjnhNA/bk/LKzwexkbf6XQd4wBhNnSt
	jCgaOyOgdwwVoDVav154OwF2PWETTalvCM7fdwdm9gI0DTzEGPv0kUnW6k32ix02T8uahIeY417zx
	/iNKvBomy1YowiA5fbCTr02P534gz8s5qpT1jck1KwbSgnBN+4W57OGn4QbJDYTt3qIzCmsRRNvkY
	QV+5idBxfocN4tqjPQrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q40B4-00EDDX-0H;
	Tue, 30 May 2023 14:18:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q40B1-00EDBk-1B
	for ath11k@lists.infradead.org;
	Tue, 30 May 2023 14:18:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BCA376310C
	for <ath11k@lists.infradead.org>; Tue, 30 May 2023 14:18:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54AD6C433AA;
	Tue, 30 May 2023 14:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685456298;
	bh=YTR5umqFyzBEGCvS9LW8/0sc38qNreh5rcxNd8kpAzw=;
	h=From:To:Cc:Subject:Date:From;
	b=KUQsCVQASidWlAYzA+avxVn7jotV9kkIA309j8KkTdyf0Jh+CS/m32+eNRD8KIh2R
	 MACu2HG0kueWbwehXT2bvRvVPBCcC1DQj/fkBc9WDwBtorS/uVU3cGb9Sq9LKT8VpG
	 UuESg0dk6PRzL9PTYDKdULvsGJ9jMg/5/Ten3GHQlRAPjX/6MlwiF5++ohBEqQ/SKP
	 ztyJxODj/yn+QVu3ONK1eLwqscjVnzKEjCLIxP6H2KDGRxgaR1t6NvyZ9aIVc59mSG
	 ipnWB1mDrr6cWcJVFKMIVfkbKql+gjk/AZhhUQxAef8pYfyw0pjHciHsbGRZ1qmHaP
	 xcvYHsqJfSCGA==
From: Kalle Valo <kvalo@kernel.org>
To: mhi@lists.linux.dev
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH v3 0/3] wifi: ath11k: support firmware-2.bin
Date: Tue, 30 May 2023 17:18:10 +0300
Message-Id: <20230530141813.29333-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_071819_452706_3240A44A 
X-CRM114-Status: GOOD (  12.23  )
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

v3:

* patch 1: add "bus: mhi: host: ..." to title

* patch 1: add a comment to mhi_fw_load_handler()

* patch 1: check sbl_size

* patch 3: for smooth backwards compatibility don't print an error "failed to
  load firmware-2.bin: -2"

v2:

https://patchwork.kernel.org/project/linux-wireless/list/?series=727935&state=*&order=date

* mhi_fw_load_handler(): fold two lines into one

* struct mhi_controller_config: document that fbc_download needs to be set

* run pahole struct mhi_controller_config

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


base-commit: 4ab7f08db5310ded48a5c1f3ec3f2e177ba6b1c2
-- 
2.30.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
