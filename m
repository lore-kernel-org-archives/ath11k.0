Return-Path: <SRS0=H079=MN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 703EBC636C9
	for <ath11k@archiver.kernel.org>; Wed, 21 Jul 2021 18:08:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3867C6113C
	for <ath11k@archiver.kernel.org>; Wed, 21 Jul 2021 18:08:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3867C6113C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=92TR9wpgB8MgLoGWsTBbSGJ09Z/i+FHB3r64GiWwnjA=; b=dtLqPHvfpcRFjT
	wimTeDS7B4zrXwEMGi4HewUIjvJY6HKRNLxVKIJMK7QOsefANgqG0CQ+D5vCXdZnmLu5lZ92VoN+x
	3yCkH6SxMtx+QkmM50Ikurumq/Dmzk3dB+F0Rys2969OmwQYLlkXUAkh45k6YtjRbehg78dqJEM4N
	GE0h1WGQarP8npM6ahwxDWFDQLe/Sqa+WfF5uj9tyNl9sak3Of5Jpz5b/Uz0vqD6O5xcspZiE9dQ0
	3gxYf4MlQtzbS1WEC6fZNwlCXABwy6fBBHueRd6JfJcAykFnhWHGvk8/46lpav8NHeG6UKVuuOKde
	RlC6Zi7hpYGWOa7JVfVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6Ge2-00Gnl9-VK; Wed, 21 Jul 2021 18:08:34 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6Gdu-00GnkF-05
 for ath11k@lists.infradead.org; Wed, 21 Jul 2021 18:08:28 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1626890906; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=79qxDlEJwFygye60+Akm4By0+mwEEl8ruCbAsr0jVRY=;
 b=gA2WfGbdXoPFrk5bOFXWkpd4X7Hbrf5meZL7cUrMRj5+X3+BYVCLS1plpLSmupmZ/3O4wIx3
 x1sHwv1hHxgsuINtHUYzaWDLx4icDnfh2jGmc9Ah0SPjYS09ZJM9DyJ4Rftd/J3OkHJxTKtx
 7sPpX02DmP1LVZdoG07VYs8D5sU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60f8629796a66e66b24b2773 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Jul 2021 18:08:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D7C9AC43460; Wed, 21 Jul 2021 18:08:22 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-67-217-nat.elisa-mobile.fi
 [85.76.67.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2C0C5C433F1;
 Wed, 21 Jul 2021 18:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2C0C5C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Karthikeyan Periyasamy <periyasa@codeaurora.org>
Subject: [PATCH 0/4] ath11k: Add spectral scan support for QCN9074
Date: Wed, 21 Jul 2021 21:08:05 +0300
Message-Id: <20210721180809.90960-1-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_110826_827285_B3D50FAE 
X-CRM114-Status: GOOD (  10.41  )
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

From: Karthikeyan Periyasamy <periyasa@codeaurora.org>

The following spectral parameters are different across platforms:

========================================================================
				IPQ8074	|	IPQ6018	|	QCN9074
========================================================================
FFT bin size			2	|	4	|	2		
FFT pad size			2	|	0	|	0
Maximum FFT bin count		512	|	512	|	1024
Summary report pad size		0	|	0	|	16
FFT report header length	16	|	16	|	24
========================================================================

To support the spectral scan on QCN9074, segregate these parameter as
configurable values under the hw params.

Karthikeyan Periyasamy (4):
  ath11k: Refactor spectral FFT bin size
  ath11k: Introduce spectral hw configurable param
  ath11k: Fix the spectral minimum FFT bin count
  ath11k: Add spectral scan support for QCN9074

 drivers/net/wireless/ath/ath11k/core.c     | 46 ++++++++++++++++++++++++------
 drivers/net/wireless/ath/ath11k/hw.h       |  9 +++++-
 drivers/net/wireless/ath/ath11k/spectral.c | 38 ++++++++++++------------
 drivers/net/wireless/ath/spectral_common.h |  1 -
 4 files changed, 65 insertions(+), 29 deletions(-)

-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
