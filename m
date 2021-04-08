Return-Path: <SRS0=LKqF=JF=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B51BC433B4
	for <ath11k@archiver.kernel.org>; Thu,  8 Apr 2021 01:12:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFBCE61168
	for <ath11k@archiver.kernel.org>; Thu,  8 Apr 2021 01:12:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFBCE61168
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EJElL9PCOHneh2Rt2+qC8a50+NH8q5TZkWAK1sQxzwo=; b=Z4vvHi7lJHvufyLg+QFjjXCaY7
	TWKXwLqBY2v8CElGs3kWW9omy10UwXWCRDugG4LaJvVk5N9JxSRFg2RUv5negi6S24jw7fo+Z1cK4
	K/wvQ5mOdYm/1FffCMKlGk1SLKam2ndx5DgXdySZudAhEvtAZTkB9NRkiByWyfDzuTuZ0LrNNrcHj
	biS8bIM2MQ/3yUMe3I/qT0709NLMRUqZjwY7/MvqDckcJ+v+7MQYD9wAm6JpnzLalpylMypSaRNKM
	BqCEOOslTwRzWWLGy5AP6TRHrB7pqdG1h8jNCF11QndlrsvjLJsXTVZNGBfLoysHlg0Ch2Ef167s0
	F8JDuyDg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUJDy-006RnR-FO; Thu, 08 Apr 2021 01:12:46 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUJDr-006RlT-7A
 for ath11k@lists.infradead.org; Thu, 08 Apr 2021 01:12:42 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1617844357; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=/ryLYc5AIShsRk8hMrIqltLYag4JM6pSKotZcptS1wI=;
 b=qhPRvYaaAz683wJiz9X7aY1WgZa+0g6jbYjntJ0dYbScIFRooOS4YlRl8E5wQNat5jhUjDIe
 xQIacevhWB7Y2vOqnj7E1z+MGM0br1T4sUYpPn1rejdHPkRH35Cjv8z5oxA8/V/6HELi+ZjV
 ce5EIiT95I/zRx0vnFvvy2e75zs=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 606e588003cfff345299e2c5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 08 Apr 2021 01:12:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id ED823C43461; Thu,  8 Apr 2021 01:12:31 +0000 (UTC)
Received: from alokad-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: alokad)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 46578C433C6;
 Thu,  8 Apr 2021 01:12:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 46578C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=alokad@codeaurora.org
From: Aloka Dixit <alokad@codeaurora.org>
To: kvalo@codeaurora.org
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 Aloka Dixit <alokad@codeaurora.org>
Subject: [PATCH V6 0/2] WMI and debugfs calls for TWT dialogs
Date: Wed,  7 Apr 2021 18:12:23 -0700
Message-Id: <20210408011225.1989-1-alokad@codeaurora.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_021239_566539_D339EAA2 
X-CRM114-Status: UNSURE (   6.78  )
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

This patchset adds support for TWT dialogs using debugfs.
Patch files show changes in V6 compared to V5.

John Crispin (2):
  ath11k: add WMI calls to manually add/del/pause/resume TWT dialogs
  ath11k: add debugfs for TWT debug calls

 drivers/net/wireless/ath/ath11k/core.h    |   4 +
 drivers/net/wireless/ath/ath11k/debugfs.c | 222 +++++++++++++++++++
 drivers/net/wireless/ath/ath11k/debugfs.h |  14 +-
 drivers/net/wireless/ath/ath11k/mac.c     |   6 +
 drivers/net/wireless/ath/ath11k/wmi.c     | 247 +++++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/wmi.h     | 114 ++++++++++
 6 files changed, 602 insertions(+), 5 deletions(-)


base-commit: 1924a31a1d7c49a87dad0c6df7a3bff3d68cc462
-- 
2.25.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
