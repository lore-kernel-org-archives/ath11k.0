Return-Path: <SRS0=2HMb=HY=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E1BC433E0
	for <ath11k@archiver.kernel.org>; Mon, 22 Feb 2021 10:10:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A71B64E31
	for <ath11k@archiver.kernel.org>; Mon, 22 Feb 2021 10:10:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A71B64E31
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OE8n8IgFD7mVfoUy45khul2P66qlJlzJT1bq4+YwIAs=; b=zdsA1K6hOHW5gEQTedN2srqJqf
	i6rfj2dwU2Ve/oNYLcJWT89hhuYD6hsrdMX/s81IlP0Sq7mnWnSpuFzPAg1T/scCYx9TyV7XVumCg
	mhNQFUUF1uCdpS4RcQyi9HgbOnanG2/NxisidtUhrnFA8Ov+p/0TIA/852evQh9G0Eg4SLUEaAGHY
	+WlXa2ekCUNEaVxVEjAHNN15BsRSCl3VDHGphWEsyz4tJKxg5IiCNVbqL8876DMtZGfPeoMQ7RzQv
	fkjPemmGvsFLbkJQEyHV/GvcAaLCcVYFvx4lsyjvK9U5bnuohw/FWEYiH2DBhYP4K9XLIOPELobas
	cQu9YC7w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lE8AE-0005DU-FF; Mon, 22 Feb 2021 10:10:02 +0000
Received: from z11.mailgun.us ([104.130.96.11])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lE8A9-0005Ag-GH
 for ath11k@lists.infradead.org; Mon, 22 Feb 2021 10:10:00 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1613988598; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=yDIzdElTQMDQaGuKf3UnNkG2zxFqND/v2VlwPd+vaWE=;
 b=U0Ho2M6zzWXdp72YLKwhXOwjsY3ZZMIa7URW3Nc0O5UUS1NXw8Oqad4EhNtpeFrCLp93mrO+
 CvvmQN2EGpSkvLKyzg6XF7ePj4JBCmKKTZrO0zChJeBzKVGGNNCaSUvQC+i3nU7Yo3ZheNXW
 AY6nZA9LIMDCyKZngIvB8OmoXN8=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 603382e699466438590c5280 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 22 Feb 2021 10:09:42
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 46320C43462; Mon, 22 Feb 2021 10:09:41 +0000 (UTC)
Received: from ssreeela-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: mkenna)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9E74CC433CA;
 Mon, 22 Feb 2021 10:09:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9E74CC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=mkenna@codeaurora.org
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
To: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH 0/3] Add support to configure beacon tx mode
Date: Mon, 22 Feb 2021 15:39:30 +0530
Message-Id: <1613988573-10839-1-git-send-email-mkenna@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_050958_907385_C891460C 
X-CRM114-Status: GOOD (  10.15  )
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
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Add support to configure the beacon tx mode as
STAGGERED or BURST mode via hostapd configuration
during the AP bring-up or via wpa_suppplicant
configuration during MESH bring-up.

Maharaja Kennadyrajan (3):
  nl80211: Add support for beacon tx mode
  mac80211: Add support for beacon tx mode
  ath11k: Add support for beacon tx mode

 drivers/net/wireless/ath/ath11k/mac.c | 10 +++++++---
 include/net/cfg80211.h                |  4 ++++
 include/net/mac80211.h                |  2 ++
 include/uapi/linux/nl80211.h          | 15 +++++++++++++++
 net/mac80211/cfg.c                    |  2 ++
 net/wireless/nl80211.c                |  9 +++++++++
 6 files changed, 39 insertions(+), 3 deletions(-)

-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
