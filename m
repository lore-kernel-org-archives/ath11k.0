Return-Path: <SRS0=85K5=O7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B8D2C4332F
	for <ath11k@archiver.kernel.org>; Mon, 11 Oct 2021 11:44:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DE5460F0F
	for <ath11k@archiver.kernel.org>; Mon, 11 Oct 2021 11:44:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1DE5460F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oGYiX0efG/8kFHUMuw9HrGPqOQvwWwcd4ars7Emzl7Y=; b=htSlfPyMhhnNf/
	v2x7MOZicGucN1XjmeFE3uBiH5i0NaE2eTGyOLGsiY7CoeqYOzl1dvyKxiNZzbDqf2rYnbd6YuGyb
	/RsGv+RXyyd36lICV8hDIBdeVC5ws6W10vsvbCrdhgOk20DY6PriDLq2kY9ONc+1LMKDaAzvQwbyW
	EWBXK0ApYWIF9sCj4VdA7y8N92H36XYpNQYwHdAFsS+hhLXsB/8OI2fAH060Fnp0o27LMV74KQwG4
	ymvPTT5eZE0By0RPutC7IKOTm82seJZ27oVzRmuEdyLP4hMLUE8J2nasYnlt2ojvT3sWTk3tt/d7q
	/C1x50PNkdfQfwqu+Y1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZtj5-009AGv-Jn; Mon, 11 Oct 2021 11:44:15 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZtck-0097bO-N2
 for ath11k@lists.infradead.org; Mon, 11 Oct 2021 11:37:46 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633952265; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=c3zgyus+zv7Ybz/SfK5e4SgGrVIHH/0iWZu4JKhgAr8=;
 b=Y3QN3jlhEKwqV8SszInDz8Htftrf6K4GiXi/hI5LlIwvPbqXj6oGO3p54M8167cylhBxVJF2
 cARCDRmeShx7eVV6bpVLIu7ofMaNcJNaSQ97qKcc98i7ZHECShsE8hYOroXmHqZZTdflG2p7
 pcQqVIUEwrN4RIHpcsGASEQ0MmU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 616421f5ab9da96e6466d0fe (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 11 Oct 2021 11:37:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id ACE73C43616; Mon, 11 Oct 2021 11:37:23 +0000 (UTC)
Received: from cjhuang-Inspiron-7590.qca.qualcomm.com (unknown [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: cjhuang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9BB44C4338F;
 Mon, 11 Oct 2021 11:37:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 9BB44C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Carl Huang <cjhuang@codeaurora.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 0/6] ath11k: support WoW functionalities
Date: Mon, 11 Oct 2021 15:37:44 -0400
Message-Id: <20211011193750.4891-1-cjhuang@codeaurora.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_043745_319662_B152E8E0 
X-CRM114-Status: UNSURE (   7.15  )
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

Ath11k WoW basic funtionalities are merged from ath10k such
as magic-pattern, PNO, disconnect and patterns.

Hw data filter and pktlog purge are required for ath11k.

ARP and NS offload, GTK rekey offload are new WoW features
implemented on ath11k. 

Carl Huang (6):
  ath11k: Add basic WoW functionalities
  ath11k: Add WoW net-detect functionality
  ath11k: implement hw data filter
  ath11k: purge rx pktlog when entering WoW
  ath11k: support ARP and NS offload
  ath11k: support GTK rekey offload

 drivers/net/wireless/ath/ath11k/core.c  |  29 +-
 drivers/net/wireless/ath/ath11k/core.h  |  31 ++
 drivers/net/wireless/ath/ath11k/dp_rx.c |   4 +-
 drivers/net/wireless/ath/ath11k/dp_rx.h |   2 +-
 drivers/net/wireless/ath/ath11k/htc.c   |   6 +
 drivers/net/wireless/ath/ath11k/htc.h   |   1 +
 drivers/net/wireless/ath/ath11k/mac.c   | 217 +++++++++-
 drivers/net/wireless/ath/ath11k/mac.h   |   1 +
 drivers/net/wireless/ath/ath11k/wmi.c   | 593 +++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.h   | 343 ++++++++++++++-
 drivers/net/wireless/ath/ath11k/wow.c   | 747 ++++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/wow.h   |  36 ++
 12 files changed, 1984 insertions(+), 26 deletions(-)

-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
