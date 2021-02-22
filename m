Return-Path: <SRS0=2HMb=HY=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68AABC433E0
	for <ath11k@archiver.kernel.org>; Mon, 22 Feb 2021 19:27:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B3BF64E12
	for <ath11k@archiver.kernel.org>; Mon, 22 Feb 2021 19:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B3BF64E12
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1y3vqG29NxUB1WmvVJSmyWRKHtGZkB5CdzZZR1lVuyg=; b=lDsz7Z0neXK1l4OAJoDLQAm1ra
	jD5+2W/+hky4IT1gmSoOwQwQTMzmY8XOYnDoRSWHz0PWH4adl4nEmSTLYTx6RkTfPLafpIaeVdzXJ
	/aaEae775sBcfA95WZLc/JQSwqFCL2Qa69jm7pYowGP4AoI9cPiMw7ofSTtAv5BQoHJG3gF10Jzzb
	XaRhjiiQ69b/F/1R1S8m9KxmysuJZbZlJ4Uz09iTv0bVXtTiDnXBp2p0+8ENcJRlopoYVv3JjwVdR
	lDSYpWkmBArctCeLCzaDaui8e7n9OgqMNFm+O8qzCyfV4BfTGojlBPWsJUKmp5oQ2mvfDS2pv4dZV
	Mbd2MlwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEGrI-0001IM-K8; Mon, 22 Feb 2021 19:27:04 +0000
Received: from z11.mailgun.us ([104.130.96.11])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEGrG-0001Hs-1y
 for ath11k@lists.infradead.org; Mon, 22 Feb 2021 19:27:02 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1614022021; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=r5K63Go6dNwm808NunS14UEUj0MvExkwJGR/rs0kO7M=;
 b=lplxpbjbXIejpVixPFc6qif70pw28NULdzrvJPTKqhc0uuNl/m+hdt0Fut6XK092bp59lc3q
 a26OLgQVVbifdF46rGX6WCxhLRrEQU+iso8WdXbOaq4myPMwVUNQVcXGNDQ5FCfe5UypQdpB
 xi67g9gjsCGQVYVxSCXxuRVtXSw=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 603405843bd0a42cc991325f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 22 Feb 2021 19:27:00
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DC9BDC433ED; Mon, 22 Feb 2021 19:26:59 +0000 (UTC)
Received: from alokad-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: alokad)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3B515C433CA;
 Mon, 22 Feb 2021 19:26:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3B515C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=alokad@codeaurora.org
From: Aloka Dixit <alokad@codeaurora.org>
To: kvalo@codeaurora.org
Subject: [PATCH V5 0/2] WMI and debugfs calls for TWT dialogs
Date: Mon, 22 Feb 2021 11:26:49 -0800
Message-Id: <20210222192651.1782-1-alokad@codeaurora.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_142702_182425_8F1E4866 
X-CRM114-Status: UNSURE (   8.03  )
X-CRM114-Notice: Please train this message.
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
Cc: Aloka Dixit <alokad@codeaurora.org>, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

This patchset adds support for TWT dialogs using debugfs.
Individual patch files show changes in V5.

John Crispin (2):
  ath11k: add WMI calls to manually add/del/pause/resume TWT dialogs
  ath11k: add debugfs for TWT debug calls

 drivers/net/wireless/ath/ath11k/core.h  |   4 +
 drivers/net/wireless/ath/ath11k/debug.c | 224 ++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/debug.h |  13 ++
 drivers/net/wireless/ath/ath11k/mac.c   |   3 +
 drivers/net/wireless/ath/ath11k/wmi.c   | 218 ++++++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/wmi.h   | 114 ++++++++++++
 6 files changed, 572 insertions(+), 4 deletions(-)


base-commit: f5242d42da02730c67d517a7402015c13f59deee
-- 
2.25.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
