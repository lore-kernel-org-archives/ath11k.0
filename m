Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7218C5479D
	for <ath11k@archiver.kernel.org>; Wed, 11 Jan 2023 09:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NX18jdinIeMbTeYXG1/MZEGazSugQ3UI8grypEpGPCE=; b=MUnqAKxLgrTCWD
	ZnfZf4IJOziTHxQqJq3NKmuecSb6saJL1YfkYvOdCsmJjSliAABLv8CfEjoGHx3K9m7lN0AOx+leO
	Xa0ycCt/R5O33zgc7Bq5W6zw70PCT9RUsBFSoX/ialgP50eDCJt5b/lGeZjLKCmVRPikFN/TjSQiE
	gqOkmt/AnVnLaDw/YN5mUYUXBINt5yxBoBsQtgZtvx+In5O2AGbHZkAAvoQiQ+O2byxm/SsZ7Twtz
	CzqZjq9xD5wCQoj2aFTEUmMI5iSawvGkWu333+m40v4UkVJUasIcr4NdyR2/cww6O2YJsJoxGZTfa
	SIBUSWqhOq+XVSBN/FkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFXMr-00AWoC-3D; Wed, 11 Jan 2023 09:25:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFXMo-00AWmg-24
	for ath11k@lists.infradead.org; Wed, 11 Jan 2023 09:25:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CFFD661B09
	for <ath11k@lists.infradead.org>; Wed, 11 Jan 2023 09:25:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A360C433F1;
	Wed, 11 Jan 2023 09:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673429152;
	bh=bQOjgYMu84xfkGdNoPs9j41dDKTO/R86agsQSXtGGI8=;
	h=From:To:Cc:Subject:Date:From;
	b=idx/o2r8x5QvqPzYLMhp/fNKhZPkU76m6maMNot+/pnenMK9NzLlIQpTZ7hYrzHJk
	 eGWfTo08omRGbBKZeb/U3aXSRA9jmhhiHBZCtm5p22JWhirw+wifN46NPILnoVNWGv
	 ZuDfjWPSgb2IhDz/AQy1e1d0MnKWyX4X1MxI2hzLD1PdFG8K8U7umyz4BbkMF/hrhX
	 D58foXWv1a07tg4KgjZ5mWoGDekgoCAuHebrLq67Zl9XyP85XoDXgweA9AJ8pBLbPT
	 ZmqKTeavSLshu3KkOdHq3kWAcGVIwi/MTZDMRrRbza2QpmmHrOmKeKAd637mAoTKO/
	 G56rado9lYJSQ==
From: Kalle Valo <kvalo@kernel.org>
To: mhi@lists.linux.dev
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH 0/3] ath11k: support firmware-2.bin
Date: Wed, 11 Jan 2023 11:25:44 +0200
Message-Id: <20230111092547.21425-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_012554_186944_3B750E3A 
X-CRM114-Status: GOOD (  12.78  )
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

Please review and comment. It would be easier if I could take the MHI patch
(patch 1) to my ath.git tree along with the rest of the patches but let's
discuss that separately.

Anilkumar Kolli (1):
  ath11k: add firmware-2.bin support

Kalle Valo (2):
  mhi: allow MHI client drivers to provide the firmware via a pointer
  ath11k: qmi: refactor ath11k_qmi_m3_load()

 drivers/bus/mhi/host/boot.c              |  27 ++--
 drivers/net/wireless/ath/ath11k/Makefile |   3 +-
 drivers/net/wireless/ath/ath11k/core.c   |   8 ++
 drivers/net/wireless/ath/ath11k/core.h   |  15 +++
 drivers/net/wireless/ath/ath11k/fw.c     | 157 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/fw.h     |  27 ++++
 drivers/net/wireless/ath/ath11k/mhi.c    |  18 ++-
 drivers/net/wireless/ath/ath11k/qmi.c    |  54 +++++---
 include/linux/mhi.h                      |   6 +
 9 files changed, 283 insertions(+), 32 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath11k/fw.c
 create mode 100644 drivers/net/wireless/ath/ath11k/fw.h


base-commit: e51980bf88c65f6ad4916baf720ad1234de01791
-- 
2.30.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
