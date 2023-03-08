Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782E4C678D5
	for <ath11k@archiver.kernel.org>; Wed,  8 Mar 2023 15:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rC8KHWd9+QU152q7/cRNekz9IBM4ouH/Xf3qf7/phiU=; b=xHa+Qbtboedn5u
	i+NBGImx+hc74VzmCBpEC79WNSjCJRDMonyTOQbhxdx9ngQESCaJBNZaGpU0PCGMiTkjSeV9veO+h
	6pQImxa2fdIZO6xumNrJ3xvM4+4yqwlhbIsbexCYfvzDMEMrQ9W3sc51XcxMSAbcTiReQFc2CIIwd
	EdUoOsBU55ulOll9h8NmzoRhONqx1oXp6CYe5Mc88OdYaMM/TG4Kkb4DcGtO26PYOvbAVAXKOxj3I
	sV4Jpfo8aAqJB6Vd7rwC0651sDeLYEld4ojlvJKuKARC6ORNXd/z27zq2H1fo+kQeKrGFgnaeMRsi
	65I8u0ZA1vHvUOzAz7QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZvfX-005hD7-TX; Wed, 08 Mar 2023 15:25:31 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZvfU-005hBk-Kg
	for ath11k@lists.infradead.org; Wed, 08 Mar 2023 15:25:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EDEEAB81D3F
	for <ath11k@lists.infradead.org>; Wed,  8 Mar 2023 15:25:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFA82C433EF;
	Wed,  8 Mar 2023 15:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678289125;
	bh=tzxT+qCmj2RHGT/ahZ/7xgh9qauM2zkewaeW0iGIDvY=;
	h=From:To:Cc:Subject:Date:From;
	b=E5pxg6JlB5Qq+xSu8tKT7+SP2Xm+UbSOcruM6b8P6gUqCOujgDi0zDbTF4fPhfoqr
	 xBw/JbDH8l3wakppqlIsza75TeLo2nsMdoGm7F7GWdt79eGB8QS7LpQzpvfS5GrnO7
	 4UvEIoZ9rUQOIrJWUWGrzegyg3Q+CTxhfHFmx1/AFguOzBvtk1s4ePo4RZguP25j58
	 vf0JcTZ9S7s6rLYNdCOJbk4e7/XSrEjRQPb1+w+1D5fito/I635ZdUdRsXc6TJoDDx
	 SuKyPfx9VsR+7wq/OcHYTWs2jM70L0cttcLEnWYgVH1kX8/lEQRFIosfHOHMzm1qeb
	 5RKjJm4ZngJow==
From: Kalle Valo <kvalo@kernel.org>
To: mhi@lists.linux.dev
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH v2 0/3] wifi: ath11k: support firmware-2.bin
Date: Wed,  8 Mar 2023 17:25:19 +0200
Message-Id: <20230308152522.6728-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_072528_849084_7D47CD88 
X-CRM114-Status: GOOD (  11.59  )
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

v2:

* mhi_fw_load_handler(): fold two lines into one

* struct mhi_controller_config: document that fbc_download needs to be set

* run pahole struct mhi_controller_config

Anilkumar Kolli (1):
  wifi: ath11k: add firmware-2.bin support

Kalle Valo (2):
  mhi: allow MHI client drivers to provide the firmware via a pointer
  wifi: ath11k: qmi: refactor ath11k_qmi_m3_load()

 drivers/bus/mhi/host/boot.c              |  28 ++--
 drivers/net/wireless/ath/ath11k/Makefile |   3 +-
 drivers/net/wireless/ath/ath11k/core.c   |   8 ++
 drivers/net/wireless/ath/ath11k/core.h   |  15 +++
 drivers/net/wireless/ath/ath11k/fw.c     | 157 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/fw.h     |  27 ++++
 drivers/net/wireless/ath/ath11k/mhi.c    |  18 ++-
 drivers/net/wireless/ath/ath11k/qmi.c    |  54 +++++---
 include/linux/mhi.h                      |   6 +
 9 files changed, 283 insertions(+), 33 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath11k/fw.c
 create mode 100644 drivers/net/wireless/ath/ath11k/fw.h


base-commit: 1a304987a22c9f383f163f93beb47e89080d1cee
-- 
2.30.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
