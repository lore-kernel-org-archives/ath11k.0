Return-Path: <SRS0=0MIV=NB=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F1BBC4338F
	for <ath11k@archiver.kernel.org>; Tue, 10 Aug 2021 08:56:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E4DE60E9B
	for <ath11k@archiver.kernel.org>; Tue, 10 Aug 2021 08:56:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0E4DE60E9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sogOb4skhctBW6uMvFOTlSwHH/Q1CC6jzYA2et6gfZM=; b=0kRBXj0pUAIOX4
	afcAa3P+O7I5WjphQtWpAo0/R+yQYex/4i5faSFoePlPQodegbPz+ng+DW61ssgQ/iMFnB4IcawQs
	Tll/2huIHXW7YmuN8K9F/qIUyA+1HpZCWDc1Xrx6VPURaPRyOuhiRiaM4zCQ+JUoV7y7l4TsabPwK
	qCbtRDw5IyPJpPyARPVGg7b0AYODJVlsoEDzvOviZOlL0yPZvdaaYYHS/zdpJqjFxN8wVDDQYqQZW
	XuStQKFNmei7eSQv1sn/ADlUqVa61My91zHtKZnuTU//DA7C8OC5Jzmboi0sJgxhdN5m7wtUlv67s
	S4tqjfqLO9rJsVJns9pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDNYr-003BWX-9p; Tue, 10 Aug 2021 08:56:37 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDNYl-003BU9-PR
 for ath11k@lists.infradead.org; Tue, 10 Aug 2021 08:56:35 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1628585791; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=bDhmj8HOl+jHQkiuraV3jXyEErZkA8xz/WZyOnK0yw4=;
 b=pXVISYhvbYYXjb+YdjjNuxvoAFay1WOv8gQfXTG1k/1e74lybb9duymbTZ4ebS96x77DoGiG
 ZX/Pgw7IW4gcs8JHo6IS0+0RW1Nwl0pS9EOpbjoWips9+VN5vNgSPK2cW3NcEBLjFvAyg2qf
 pgxEEZIsR1dUsqVXuMiPTwv2U5Q=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 61123f3df746c298d907228f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 10 Aug 2021 08:56:29
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7C855C433D3; Tue, 10 Aug 2021 08:56:29 +0000 (UTC)
Received: from ppranees-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: mkenna)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BE7EDC4338A;
 Tue, 10 Aug 2021 08:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BE7EDC4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=mkenna@codeaurora.org
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
To: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH v5 0/3] Add support to configure beacon tx mode
Date: Tue, 10 Aug 2021 14:26:20 +0530
Message-Id: <1628585783-21139-1-git-send-email-mkenna@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_015631_903545_CD7366C8 
X-CRM114-Status: UNSURE (   8.07  )
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

Add support to configure the beacon tx mode as STAGGERED
or BURST mode via hostapd configuration during the AP
bring-up or via wpa_suppplicant configuration during MESH
bring-up.

Beacons can be sent out in burst(continuously in a single shot
one after another) or staggered (equally spread out over beacon
interval) mode.

V5: Addressed Johannes's and Felix's comment on v4.

V4: Rebased on latest ath.git TOT.

V3: Addressed Johnson's comment on v2 patch.

V2: Addressed Johannes's comment on v1 patch.

Maharaja Kennadyrajan (3):
  nl80211: Add support for beacon tx mode
  mac80211: Add support for beacon tx mode
  ath11k: Add support for beacon tx mode

 drivers/net/wireless/ath/ath11k/mac.c | 10 +++++++---
 include/net/cfg80211.h                |  4 ++++
 include/net/mac80211.h                |  2 ++
 include/uapi/linux/nl80211.h          | 20 ++++++++++++++++++++
 net/mac80211/cfg.c                    |  2 ++
 net/wireless/nl80211.c                | 11 +++++++++++
 6 files changed, 46 insertions(+), 3 deletions(-)

-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
