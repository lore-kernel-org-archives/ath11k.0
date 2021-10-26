Return-Path: <SRS0=4fK3=PO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98195C433EF
	for <ath11k@archiver.kernel.org>; Tue, 26 Oct 2021 04:16:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BD3C60EDF
	for <ath11k@archiver.kernel.org>; Tue, 26 Oct 2021 04:16:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5BD3C60EDF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K0t5NvrEylgfOwJmcL13MCsJujAGYGDqKcwBwkn+g+Y=; b=OGSxRPnGwiiOYK
	TomBT7Gqpf0KolsLWWExA4HNlQDAAjAyHZYyg3RLvMcffOl42sN5jshmuT4tysW9ClNFNBgsH3eBN
	Ud2upRq+qQ6CvCT0DYBwatNZp+XX7UO6D4uMmD7gjp8uKhee58D+VT2NgfB2vA+pieFNrjXiVJjDe
	5ELPtlhWMEe4noBTht/7YpVcYrDyCpeqlRmv9egcdUr6Ob3EQsqUQhz/51Zvyea0kqgwqt/zeQqT9
	VtwVUK3frc+lA5DUrR+fRMaAskaZjQf3RP7zxQQ873wyOJUEM6vPRWGDzgmKAHvIAOWP34PoH2tEW
	miA46QLQCd5+UWAS6MdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfDtO-000ZNn-Ee; Tue, 26 Oct 2021 04:16:54 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfDtF-000ZL0-Pq
 for ath11k@lists.infradead.org; Tue, 26 Oct 2021 04:16:52 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1635221807; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=pG7GbOM48JCa3FPG5h4IkjmU+DyMJAn5xzgQw7KY/nw=;
 b=ghleMc0PGqyH6rWDNbVggAfjkDBuW06LmmzItM8lWjbyeQPuQgRpINnYqENtY4D+B/gTYOHl
 pkGwP9gV/anJ20aEhkpaIlGyRRvef8hDW+lSp5fuhnMYvdu+dU4AxWzdprz74Boolty6RYfu
 K1fzY7OdVRVDIHaarq0UGzzi56k=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 6177811f59612e010027478d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 26 Oct 2021 04:16:31
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2C850C4360C; Tue, 26 Oct 2021 04:16:31 +0000 (UTC)
Received: from bqiang-Celadon-RN.qca.qualcomm.com (unknown [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: bqiang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2E697C4338F;
 Tue, 26 Oct 2021 04:16:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 2E697C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Baochen Qiang <bqiang@codeaurora.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 0/7] ath11k: support one MSI vector
Date: Tue, 26 Oct 2021 12:16:16 +0800
Message-Id: <20211026041616.4956-1-bqiang@codeaurora.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_211647_677321_4D731963 
X-CRM114-Status: UNSURE (   8.25  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

This patch set is to support one MSI vector for QCA6390.

Depends-On:
  1. ath11k: Fix crash caused by uninitialized TX ring
  https://patchwork.kernel.org/project/linux-wireless/patch/20211026011605.58615-1-quic_bqiang@quicinc.com/

Baochen Qiang (1):
  ath11k: Set IRQ affinity to CPU0 in case of one MSI vector

Carl Huang (6):
  ath11k: get msi_data again after request_irq is called
  ath11k: add CE and ext IRQ flag to indicate irq_handler
  ath11k: use ATH11K_PCI_IRQ_DP_OFFSET for DP IRQ
  ath11k: refactor multiple MSI vector implementation
  ath11k: supports one MSI vector
  ath11k: do not restore ASPM in case of single MSI vector

 drivers/net/wireless/ath/ath11k/core.h |   2 +
 drivers/net/wireless/ath/ath11k/mhi.c  |  14 +-
 drivers/net/wireless/ath/ath11k/pci.c  | 181 +++++++++++++++++++++----
 drivers/net/wireless/ath/ath11k/pci.h  |   3 +
 4 files changed, 173 insertions(+), 27 deletions(-)

-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
