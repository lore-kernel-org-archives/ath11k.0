Return-Path: <SRS0=H079=MN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2091C636C9
	for <ath11k@archiver.kernel.org>; Wed, 21 Jul 2021 17:20:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79E2961241
	for <ath11k@archiver.kernel.org>; Wed, 21 Jul 2021 17:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79E2961241
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NJZ/XTCx1ht+18HjOIegS+Ec9MvzaD85V9cz3otAHRQ=; b=Iivlgvnz0hcr0N
	ZHQFCJuOWlNAV5cxdDq3D/BrdsDqH1TQufglF3cNY4JGn/VQZgTj3xPlGJ3rOM+8jD70kTBbkbJqH
	Bf3t2ZfyCnxYq7dx9Chz8LYGC8LriDRhloQYqkIRWREpoIv/hGCQfjFkuAgcI6hsMwcPUIAW283j9
	Uje7UA42ABRLXZ57xDybZc7tS3sOpS599fd4EnGIG8rL2WdchPeaPdQoAsEQB2665ByRbIFa9uJFX
	CRS3kO42+k1qHgorOeTPm9u/sGfBh8zJFF3Ul1jpEZBWtt+VAAPxry3AU+1YDybXUHGsh2fAB8Q/X
	Zwi1JzOGpTwKqVFiS/Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6Ft1-00GiVM-IO; Wed, 21 Jul 2021 17:19:59 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6Fsv-00GiU7-Jy
 for ath11k@lists.infradead.org; Wed, 21 Jul 2021 17:19:58 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1626887996; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=xD7sUyBOQgIC7r+VcldJp0iMM/C0O7dJy5HBTETTP/0=;
 b=ouQRSo1vldjC9qmPRopQB+4wciX9Z3WHT7lwFe6Qxh99vAPXwFhP3YvXx6/0hCJ7w1WbTvlw
 ddtdR3wOD/4+fGoDNB0gv5hdI8HpISWJ8Ng4M/menn9ol9SNIbJpjA+X6JktKZoqXLeB3ZdB
 o6ZzVP5gSL8ey9Ld6ZlP8X7D2rQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 60f8572efcf9fe7b78773636 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Jul 2021 17:19:42
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 84578C43217; Wed, 21 Jul 2021 17:19:42 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-67-217-nat.elisa-mobile.fi
 [85.76.67.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 96035C4338A;
 Wed, 21 Jul 2021 17:19:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 96035C4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH 0/3] ath11k: add full monitor mode support for QCN9074
Date: Wed, 21 Jul 2021 20:19:02 +0300
Message-Id: <20210721171905.61838-1-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_101956_877875_DA03178B 
X-CRM114-Status: GOOD (  11.46  )
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

From: Anilkumar Kolli <akolli@codeaurora.org>

QCN9074 hardware supports full monitor mode. The advantage with
full monitor mode is hardware has status buffers available for
all the MPDUs in mon_dst_ring.

HTT_H2T_MSG_TYPE_RX_FULL_MONITOR_MODE cmd is sent to firmware
to enable the full monitor mode.

A new hw_param full_monitor_mode is added to enable full
monitor support for QCN9074.

In full monitor mode, monitor destination ring is read in
software monitor ring descriptor format instead of
reo_entrance_ring format. Add new sw_mon_ring descriptor.

In full monitor mode, monitor destination ring is read before
monitor status ring. mon_dst_ring has PPDU id, reap till the
end of PPDU. Add all the MPDUs to a list. Start processing the
status ring, if PPDU id in status ring is lagging behind, reap
the status ring, once the PPDU ID matches, deliver the MSDU to
upper layer. If status PPDU id leading, reap the mon_dst_ring.

Anilkumar Kolli (3):
  ath11k: Add htt cmd to enable full monitor mode
  ath11k: add software monitor ring descriptor for full monitor
  ath11k: Process full monitor mode rx support

---
Depends-On: "ath11k: monitor mode clean up to use separate APIs"
Depends-On: "ath11k: add separate APIs for monitor mode"
Depends-On: "ath11k: move static function ath11k_mac_vdev_setup_sync to top"

 drivers/net/wireless/ath/ath11k/core.c     |   4 +
 drivers/net/wireless/ath/ath11k/dp.c       |   1 +
 drivers/net/wireless/ath/ath11k/dp.h       | 100 ++++++-
 drivers/net/wireless/ath/ath11k/dp_rx.c    | 413 ++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/dp_tx.c    |  48 ++++
 drivers/net/wireless/ath/ath11k/dp_tx.h    |   2 +
 drivers/net/wireless/ath/ath11k/hal_desc.h |  19 ++
 drivers/net/wireless/ath/ath11k/hal_rx.c   |  44 +++
 drivers/net/wireless/ath/ath11k/hal_rx.h   |  17 ++
 drivers/net/wireless/ath/ath11k/hw.h       |   1 +
 10 files changed, 645 insertions(+), 4 deletions(-)

-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
