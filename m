Return-Path: <SRS0=hMZx=IQ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B6CC433E0
	for <ath11k@archiver.kernel.org>; Thu, 18 Mar 2021 22:10:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E49C64F53
	for <ath11k@archiver.kernel.org>; Thu, 18 Mar 2021 22:10:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E49C64F53
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RgabvqMErnjtaH4KpxfPvpAsI5ME3ahsJz55Q/l60iw=; b=c+jRMZezS93quV+wL3AgyOjaHd
	LIV94s/geL/+MbTS5aZqj9DdZJGG6vkM0JKBI50no7xEgEnsqA2Mbrru1sBduqZxejGVSVzs1oBg2
	utXMweRCKAuSo3JBJxcaU+5kPVQFzlb/dAz95QuNXqtitdCmvaZGItrZ9SatObl6FKtq16+sHc1yW
	tfszxzHwOUIOg7n3P1tN3ZiZ/YCTNp957c3IlKVRYBx3lLv51t/lVrLqcv9lYDFy98rebTYS4zqxZ
	m/jgGvFuyI0NtKnrzWNTWMcq8G41bbtGl2rNm6nyv1AgVaIkHNBBNthlv6AIGMSOnlCWl2WAWF845
	a56cFupw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lN0qX-0066Zk-0E; Thu, 18 Mar 2021 22:10:25 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lN0qO-0066Y4-T7
 for ath11k@lists.infradead.org; Thu, 18 Mar 2021 22:10:23 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1616105418; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=2e94WWpuQhIStbt/98uujAvCr6h9iC0w2H8LAevzWQQ=;
 b=jmYlISQZ5ehVm1l227iHs+kBCnqfqIJyIgTx7v9MAJ4kF5CXwRKXmhcxZmlnSfLYHM+U26Fg
 TwtXFFjyXoWGYV+ZyY6yLVOQvIPXNgiyOb3uRJ5/oKe1Wy1DGaiC+y/U3SYcdsBgI8HbXxGn
 Iw6lNrRfoGBiMcvijApGNaXUQYg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 6053cfbee3fca7d0a6e67293 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 18 Mar 2021 22:10:06
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1319DC43461; Thu, 18 Mar 2021 22:10:06 +0000 (UTC)
Received: from pradeepc-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: pradeepc)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 77A9BC433C6;
 Thu, 18 Mar 2021 22:10:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 77A9BC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=pradeepc@codeaurora.org
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
 Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Subject: [PATCH V8 0/3] ath11k: add HE radiotap header support
Date: Thu, 18 Mar 2021 15:09:54 -0700
Message-Id: <1616105397-1482-1-git-send-email-pradeepc@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_221021_652991_AFF30DE0 
X-CRM114-Status: UNSURE (   7.99  )
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

This series address review comments from previous revision:
https://patchwork.kernel.org/project/linux-wireless/list/?series=328291&state=%2A&archive=both

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01725-QCAHKSWPL_SILICONZ-1

changes in v8:
 - move ieee80211_tx_status_ext out of spin lock

changes in v7:
 - use generic radiotap HE fields from
	include/net/ieee80211_radiotap.h
 - fix converting gi and ltf enums to match nl80211 enums when
	updating radiotap headers.
 - fix sparse warnings

Pradeep Kumar Chitrapu (3):
  ath11k: switch to using ieee80211_tx_status_ext()
  ath11k: decode HE status tlv
  ath11k: translate HE status to radiotap format

 drivers/net/wireless/ath/ath11k/dp_rx.c    | 114 ++++-
 drivers/net/wireless/ath/ath11k/dp_tx.c    |  25 +-
 drivers/net/wireless/ath/ath11k/hal_desc.h |   1 +
 drivers/net/wireless/ath/ath11k/hal_rx.c   | 470 ++++++++++++++++++---
 drivers/net/wireless/ath/ath11k/hal_rx.h   | 135 +++++-
 5 files changed, 663 insertions(+), 82 deletions(-)

-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
