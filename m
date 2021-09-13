Return-Path: <SRS0=KMo3=OD=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49F5BC433F5
	for <ath11k@archiver.kernel.org>; Mon, 13 Sep 2021 18:09:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17ECE60EE9
	for <ath11k@archiver.kernel.org>; Mon, 13 Sep 2021 18:09:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 17ECE60EE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QgXKDJg/iLlvaf/ekkRDdeO9TDtU5CtXrW01gr324Wc=; b=ren1OZ+5knZ/kA
	Mm15+Z9PdIMWIU0rhT5LqHOwyC+Qebuk5E30+s9rv0QdaUCXf7fvMtVuQ9JZ1Hnp3mKr5gprmpcdj
	tbl9eEu41jI+yn7dneh/1yZwmmIhhNgtIC1ViP78tasIPMn23nqFxLX7kSVPgxPtfglWkT2F7pRnp
	c5UvwcnVuEGQzggNhqpU5W49hu0HcRbL2N6Fdjb0N3AF5TVHZ5IFyUxsiK7DmMpQx35VDK/ZEGTQo
	d7whU979TdBX5sDiQghPz7eWB5/w7YwqLmkcTdbLoTmVwglq4u2COTOmZzex9aV5VRgwi9GvhpLMR
	95MHx5/R+TCz6hf1k1wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPqOO-002tYB-RN; Mon, 13 Sep 2021 18:09:20 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPqOM-002tXs-G3
 for ath11k@lists.infradead.org; Mon, 13 Sep 2021 18:09:19 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631556558; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=kzM0pH05T/zXkE+vY1cg5uezgXBShFgu2/vn4EDvk6c=;
 b=rHbMpTkhe9u9R3bKXewbmfvJ665MmvwBQuaySe/kC2WFQgj6dOaczr3E6KF/IkRBbtPNuHv+
 ygOkxtCngM5FldV1tsw5qvvqUK/NEJYsDjx5yQjarlUU1iM6LVwYn+YHrRS04UfkPXE86VMP
 E7KYzUfyJQPrbzewYZC5GsaAvJ0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 613f93cdec62f57c9a322229 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 13 Sep 2021 18:09:17
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5623DC43616; Mon, 13 Sep 2021 18:09:16 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-72-211-nat.elisa-mobile.fi
 [85.76.72.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 836B6C4338F;
 Mon, 13 Sep 2021 18:09:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 836B6C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Baochen Qiang <bqiang@codeaurora.org>
Subject: [PATCH 0/3] ath11k: Add support for sram dump
Date: Mon, 13 Sep 2021 21:08:59 +0300
Message-Id: <20210913180902.193874-1-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_110918_647470_91758477 
X-CRM114-Status: GOOD (  10.52  )
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

From: Baochen Qiang <bqiang@codeaurora.org>

On-board sram contains valuable infomation for debug, this patch adds
a new interface named "sram" in debugfs with which we can dump sram
content using following cmd:

        cat /sys/kernel/ath11k/<pdev name>/sram > sram.dump

Baochen Qiang (3):
  ath11k: Split PCI write/read functions
  ath11k: Move pdev debugfs creation ahead
  ath11k: Implement sram dump interface

 drivers/net/wireless/ath/ath11k/core.c    | 31 +++++---
 drivers/net/wireless/ath/ath11k/debugfs.c | 85 +++++++++++++++++++--
 drivers/net/wireless/ath/ath11k/debugfs.h | 14 ++++
 drivers/net/wireless/ath/ath11k/hif.h     | 10 +++
 drivers/net/wireless/ath/ath11k/hw.c      | 10 +++
 drivers/net/wireless/ath/ath11k/hw.h      |  8 ++
 drivers/net/wireless/ath/ath11k/pci.c     | 91 ++++++++++++++++++-----
 7 files changed, 214 insertions(+), 35 deletions(-)

-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
