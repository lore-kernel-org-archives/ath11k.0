Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E3DBC433F5
	for <ath11k@archiver.kernel.org>; Tue,  7 Dec 2021 12:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HhSb2kxPRxD9EmpQpr6SIsClBwpChxP8uzBiZHLYmr8=; b=CB3uYSQKj99T4M
	8b9zGjfpORRalFWygdwypO2uNykPAWg2GOObLUpMv4yynRVTS+kjVUSoaa4jHZJL2et0JjbpdhouL
	BmxmUY0vsc/Llk9/m6ZFspdVpUBFpkdQwZ2rN1AkbFI3ki2ckIn1QRo0sPzh15Jmq3INTpi1YeomD
	uarF0QmVFvACJgVyZxDgDddSXyjx4yJSYhFi/O7Ip/VYqTS/rfp2u81g1zY/nrr3l9nbZuwZrqSQn
	ip+1WoyL/fTydd6zwqIxeKK2vQ29c9x1BVqwZpomrjPuEcoRKGfRGDEOVFvtQ1tc+IgzwgwQjxKqr
	JSbDo000DQHlbeLU95XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mua0b-008ZD4-7D; Tue, 07 Dec 2021 12:55:49 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muZzx-008Yyo-DX
 for ath11k@lists.infradead.org; Tue, 07 Dec 2021 12:55:11 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1638881708; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=b8/RwZjviMMUO+cE3eeI3pEdALkuCYSADWKbX+CD3n4=;
 b=XP1MVLRpVJhMpGCSi76L4AivnFMCegHRRlCon0R+mXg+8iFXSvvToFH92f0sVHTbR1AAhCzo
 /KY7uSaPmyAfOuS7AkW9Pwsw5N52tVPEg/BAqcmmdO+Oj+QZCVhTdU/ENTksGEv/Uh8hYh4b
 QozdnihTIreKX24J8I0o21h+8Ac=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 61af59ab903341b2e49a8ee7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 07 Dec 2021 12:55:07
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0ED97C4338F; Tue,  7 Dec 2021 12:55:07 +0000 (UTC)
Received: from akolli-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akolli)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4B726C43616;
 Tue,  7 Dec 2021 12:55:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 4B726C43616
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Anilkumar Kolli <akolli@codeaurora.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH v2 0/3] ath11k: add full monitor mode support for QCN9074
Date: Tue,  7 Dec 2021 18:24:52 +0530
Message-Id: <1638881695-22155-1-git-send-email-akolli@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_045509_562334_CAA7BA77 
X-CRM114-Status: UNSURE (   9.79  )
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

QCN9074 HW supports full monitor mode. The advantage with
full monitor mode is HW has status buffers available for
all the MPDUs in mon_dst_ring.

HTT_H2T_MSG_TYPE_RX_FULL_MONITOR_MODE cmd is sent to FW
to enable the full monitor mode.

A new hw_param full_monitor_mode is added to enable full
monitor support for QCN9074.

In full monitor mode, monitor destination ring is read in
software monitor ring descriptor format instead of
reo_entrance_ring format. Add new sw_mon_ring descriptor.

In full monitor mode, monitor destination ring is read before
monitor status ring. mon_dst_ring has ppdu id, reap till the
end of ppdu. Add all the MPDUs to a list. Start processing the
status ring, if PPDU id in status ring is lagging behind, reap
the status ring, once the PPDU ID matches, deliver the msdu to
upper layer. If status PPDU id leading, reap the mon_dst_ring.

Anilkumar Kolli (3):
  ath11k: Add htt cmd to enable full monitor mode
  ath11k: add software monitor ring descriptor for full monitor
  ath11k: Process full monitor mode rx support

---
V2:
 - Rebased on ToT
 - Update commit log (kalle)
 - Tested on qca6390

 drivers/net/wireless/ath/ath11k/core.c     |   5 +
 drivers/net/wireless/ath/ath11k/dp.c       |   1 +
 drivers/net/wireless/ath/ath11k/dp.h       |  54 +++-
 drivers/net/wireless/ath/ath11k/dp_rx.c    | 409 ++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/dp_tx.c    |  48 ++++
 drivers/net/wireless/ath/ath11k/dp_tx.h    |   2 +
 drivers/net/wireless/ath/ath11k/hal_desc.h |  19 ++
 drivers/net/wireless/ath/ath11k/hal_rx.c   |  44 ++++
 drivers/net/wireless/ath/ath11k/hal_rx.h   |  17 ++
 drivers/net/wireless/ath/ath11k/hw.h       |   1 +
 10 files changed, 597 insertions(+), 3 deletions(-)

-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
