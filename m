Return-Path: <SRS0=rto1=NR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B409EC4320A
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 15:25:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7876F6102A
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 15:25:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7876F6102A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f2IDtpMRJIQl8jMU5l5N+eBKJTo4sOqze9ozHGfohS8=; b=TYxUi8hhcY0+hz
	xphw2ExpoBQgaRcc0wRxKF4XUQos3wTgSOM8rAM9btlZ8LE1mWCOhSAQvqyChC/qiZm8Q5C1EqgCe
	ddCX8S/uCnNDwRCcPijq0zcMs/t22X469b0Rzn5+zun0uK+51UxqgCcMDIJPnL0/LatyyU8CMbKx7
	EOJIJlkf1CGTgTyL2HvDgNaMVMfz2cdhtnS2hMc7WOHWpi7vzh19ZfgGPcF9S3rw8lj58GV8WScxM
	jnZvx6BPC2BbO3SvmtFzwHce7tj9pfqHA5+U7R10Wd21pdSqmVJ/OP/9bRgfhWpVGkEchZUee1Xrr
	HgcEwjtAvJ9aGAeUTO6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJHFn-00ATiy-AC; Thu, 26 Aug 2021 15:25:19 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJHFi-00AThS-KB
 for ath11k@lists.infradead.org; Thu, 26 Aug 2021 15:25:18 +0000
Received: by mail-wr1-x432.google.com with SMTP id h13so5729772wrp.1
 for <ath11k@lists.infradead.org>; Thu, 26 Aug 2021 08:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=U0QqVHJil6l5G4MYVgLkmExnYXL2IJoOnCLaNmNVQZ4=;
 b=YrLaZGkZomL/VSUIB7k1uAoRcfuyNKijVQMEVfIkyLwLKsJ7OoEgXUUwhmAdOsGocG
 mGmJx3NbIIXqCrQGRljw64436tbdrUm4rvu0CoFFen5jpgl7EpofhsO63PJ/wlPptUwN
 +mp8oWVWvtOD69snQtOHyVJVqWQk0v2M9GklYJXZ4Rhbkj97WCDNEPNhOHBNdbrfc1IQ
 LYOroLdqo+nwZlDg9axMJuehHk7g2604sMuvagEjPp23LyQwAmBjKQ4sisW36t7B1stI
 Qm4npQuOBOptI1rXsPhWCW0QLJzDgFnRSrXKsf32dqgzcz+BPFq5Bzr0acXB/TMjr/Ad
 LCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=U0QqVHJil6l5G4MYVgLkmExnYXL2IJoOnCLaNmNVQZ4=;
 b=hBFyQAgO0v7rF0zdOK5NQKK6llssuQ6r0F7MGRTOb+IEdyPJVMXo/QpJXPx25mVvUd
 FpkqCxgFnCra3zlTstWZMTJdHEDVqlfqbAFFyESu/AW/HkAII9Qjmv4W7GsLAavzK+hn
 uoPm56feDHi4x4fKzpvWYgymljVSi4nf1UXz6f5SnHpA03qeofBbDu6lDTgLtMk+iXfr
 WdrRjuZoUyXI6IMd/x2iMpimB9XH0NV+C4NEpF13jmB3HmopJ3n9rQxvgwG3RXjFzJJB
 l1We2FJzdfafLQZjEy+RrmKahyIIjkFkW0mC/no9KYxHR6ybsuBbyD9wZnEMPXPjENMN
 9GdA==
X-Gm-Message-State: AOAM530nL9PHoI1szMZk5TYT2t8Dt9LwvDsQyKVZiSi6cl/wMinkCoQd
 SWkfokqmkmGC/3iWy80ivkTbl5JJC0+y6g==
X-Google-Smtp-Source: ABdhPJxbcNVgTFbEH3zqK0G/4/3/NvKSyvGjZ8B8oCpY+KSha7d1SV7BGFVW/u/w2JGU8AjtzDZMFA==
X-Received: by 2002:adf:dc0b:: with SMTP id t11mr4550735wri.259.1629991512717; 
 Thu, 26 Aug 2021 08:25:12 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:edf4:979b:2385:1df8])
 by smtp.gmail.com with ESMTPSA id
 t11sm3263949wmi.23.2021.08.26.08.25.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 26 Aug 2021 08:25:12 -0700 (PDT)
From: Loic Poulain <loic.poulain@linaro.org>
To: kuba@kernel.org,
	kvalo@codeaurora.org,
	davem@davemloft.net
Cc: netdev@vger.kernel.org, ath11k@lists.infradead.org,
 regressions@lists.linux.dev, hemantk@codeaurora.org, nschichan@freebox.fr,
 manivannan.sadhasivam@linaro.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] qrtr: mhi: Fix duplicate channel start
Date: Thu, 26 Aug 2021 17:36:03 +0200
Message-Id: <1629992163-6252-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_082514_707521_2F5E5365 
X-CRM114-Status: UNSURE (   8.98  )
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

commit ce78ffa3ef16 ("net: really fix the build...") handling a merge
conflict causes the mhi_prepare_for_transfer() function to be called
twice (with different flags), leading to QRTR probing issues.

Fixes: ce78ffa3ef16 ("net: really fix the build...")
Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 net/qrtr/mhi.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
index 1dc955c..deb8b03 100644
--- a/net/qrtr/mhi.c
+++ b/net/qrtr/mhi.c
@@ -83,11 +83,6 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
 	struct qrtr_mhi_dev *qdev;
 	int rc;
 
-	/* start channels */
-	rc = mhi_prepare_for_transfer(mhi_dev, 0);
-	if (rc)
-		return rc;
-
 	qdev = devm_kzalloc(&mhi_dev->dev, sizeof(*qdev), GFP_KERNEL);
 	if (!qdev)
 		return -ENOMEM;
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
