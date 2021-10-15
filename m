Return-Path: <SRS0=wjaP=PD=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E0BC433FE
	for <ath11k@archiver.kernel.org>; Fri, 15 Oct 2021 03:55:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07B32611C2
	for <ath11k@archiver.kernel.org>; Fri, 15 Oct 2021 03:55:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 07B32611C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uXajX/rYNASHAbRnR0f7y0gnw5GLAX+JoGlP9MRgPw4=; b=UedqBmmqQ946Ip
	uzo27WSn6jI0am3gU4yMPd74A2csGCj86yOTTQeTDW6EjUxluvdVQYsXlL8S3iSyMwvFWIZLNtRyk
	sZNqviyhWwBFKzt3NAbDRVv9x3FOsov2yCPn07xzEHBx4YBURrOO+0oV6su85E3WfNCYQUyr9ANHx
	VpuDRKzxywDOkEuowGiQYDYXrsX6/Y79opnFebL5US0/CjXwbio1MVg8hdxCFKA2BKFo0jFJ2NTQV
	CKioWKLgCMwnw9ffE5pknXzbPBu8FRKQoL/HRQ/HqSrOxxc9lTlsxxr8tqnOS/rXHLci7AJBbIEGd
	HtKyp5XPs1IT98kTbtGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbEJZ-005MBl-W5; Fri, 15 Oct 2021 03:55:26 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbEJW-005MAG-0b
 for ath11k@lists.infradead.org; Fri, 15 Oct 2021 03:55:24 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634270123; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=PqZ6qTJznNJhvuHlYwRdlrFeqJiXau1Qh7HXyhbQVcY=;
 b=ROIttnhc9yRbu9C08IqGhYMHU17WWK8RuZJxfffNamnv4cKpKMmr2nY6HKFKC7jeL5i+B87M
 vOaUNw/9n257QYp7/j35K7EZ5M2NE4wPMSSp0Bg2t5miajLomurDD12Un2Szqq2NGHFPqntU
 sYSIIrZL+dazckVDQPTAH3lFye0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6168fba2446c6db0cb346036 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 15 Oct 2021 03:55:14
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3CBDBC43460; Fri, 15 Oct 2021 03:55:13 +0000 (UTC)
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (unknown
 [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 07AB9C4338F;
 Fri, 15 Oct 2021 03:55:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 07AB9C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	wgong@codeaurora.org
Subject: [PATCH v3 0/3] ath11k: add feature for device recovery
Date: Thu, 14 Oct 2021 23:54:56 -0400
Message-Id: <20211015035459.14190-1-wgong@codeaurora.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_205523_393233_C4D0E25F 
X-CRM114-Status: UNSURE (   9.58  )
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

From: Wen Gong <quic_wgong@quicinc.com>

v3: remove time_left set but not used in
    "ath11k: add synchronization operation between reconfigure of mac80211 and ath11k_base"

v2: s/initilized/initialized in commit log of patch
    "ath11k: add synchronization operation between reconfigure of mac80211 and ath11k_base"

Add support for device recovery.

Wen Gong (3):
  ath11k: add ath11k_qmi_free_resource() for recovery
  ath11k: add support for device recovery for QCA6390
  ath11k: add synchronization operation between reconfigure of mac80211
    and ath11k_base

 drivers/net/wireless/ath/ath11k/core.c | 119 +++++++++++++++++++++++--
 drivers/net/wireless/ath/ath11k/core.h |  18 ++++
 drivers/net/wireless/ath/ath11k/mac.c  |  40 +++++++++
 drivers/net/wireless/ath/ath11k/mhi.c  |  33 +++++++
 drivers/net/wireless/ath/ath11k/pci.c  |   3 +
 drivers/net/wireless/ath/ath11k/qmi.c  |   5 ++
 drivers/net/wireless/ath/ath11k/qmi.h  |   1 +
 7 files changed, 211 insertions(+), 8 deletions(-)

-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
