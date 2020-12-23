Return-Path: <SRS0=zJ/X=F3=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F30DC433E9
	for <ath11k@archiver.kernel.org>; Wed, 23 Dec 2020 03:03:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65B1D206D6
	for <ath11k@archiver.kernel.org>; Wed, 23 Dec 2020 03:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65B1D206D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tovRroCvdoy4ECOy1jaQzKUfYNWsuuviDJfnPbzBgQs=; b=cC0TETto2p0K5gyjDin/x/PexP
	KH1nPllc9rAGWTXwySp3kFIkSawSrxMIewHaTcl5guyETNLfY+AwvPAbqKK8w48lQV1zTl5qGhQAp
	aYbWbG0AHlwhPM5HlbQce6Q7Y1uoc8i7ZYHuR4HZI3AB1O34pzD+XDnIt3iJKai4mEUqdrf8L08Nr
	L0tIY7nQoE3Gl8QemEEyslp4x7CJf4lBSAv4S+estyq357punD69cyEHrNrbkKdU7QIHrUUlwj3Tt
	h3aWaxNCZNjXSNl6LGmQCVaPRo8Z1MwS6yNlgZcMQ4ECcyIDQUvo9pLSLtWzvQwcZfUhIznrtooPw
	29VRxiyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kruQX-0007RY-7b; Wed, 23 Dec 2020 03:03:01 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kruQU-0007QU-Vn
 for ath11k@lists.infradead.org; Wed, 23 Dec 2020 03:02:59 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608692579; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=hFxlRqc3Z8RzSFW+LMfGZdI3yBx375LII+pbIEEeRvI=;
 b=pVvD+9Zcq+lVQigpvZJrk0TOSaanqAm/fzAbm4Gntr8Ek47yJNGsWyd0h/Zi3SKE4sTboAyM
 +xEEc/K5QB9WyBuEWFqCtMhS9LfxViYqv+w/k3Ck96kozbNTYOEUcbXVT3dyRJBQDFj/OJrN
 U7X/lWY2xB2jruwPpA12KXfmIas=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-west-2.postgun.com with SMTP id
 5fe2b34acfe5dd67db33a25f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 23 Dec 2020 03:02:34
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8E091C43461; Wed, 23 Dec 2020 03:02:33 +0000 (UTC)
Received: from cjhuang-Inspiron-7590.qca.qualcomm.com (unknown [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: cjhuang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7176CC433C6;
 Wed, 23 Dec 2020 03:02:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7176CC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=cjhuang@codeaurora.org
From: Carl Huang <cjhuang@codeaurora.org>
To: ath11k@lists.infradead.org
Subject: [PATCH 0/6] ath11k: support one MSI vector
Date: Tue, 22 Dec 2020 22:02:19 -0500
Message-Id: <20201223030225.2345-1-cjhuang@codeaurora.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_220259_419784_DB06BE02 
X-CRM114-Status: GOOD (  10.17  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: linux-wireless@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

This patch set is to support one MSI vector for QCA6390.

Carl Huang (6):
  ath11k: get msi_data again after request_irq is called
  ath11k: add ce and ext irq flag to indicate irq_handler
  ath11k: use ATH11K_PCI_IRQ_DP_OFFSET for dp irqx
  ath11k: refactor mulitple msi vector implementation
  ath11k: supports one MSI vector
  ath11k: do not restore ASPM in case of single MSI vector

 drivers/net/wireless/ath/ath11k/core.h |   2 +
 drivers/net/wireless/ath/ath11k/mhi.c  |  13 ++-
 drivers/net/wireless/ath/ath11k/pci.c  | 200 +++++++++++++++++++++++++++------
 drivers/net/wireless/ath/ath11k/pci.h  |   8 ++
 4 files changed, 189 insertions(+), 34 deletions(-)

-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
