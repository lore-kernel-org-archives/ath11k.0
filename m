Return-Path: <SRS0=YHSM=JR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 981FDC433ED
	for <ath11k@archiver.kernel.org>; Tue, 20 Apr 2021 03:54:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E20AC6109E
	for <ath11k@archiver.kernel.org>; Tue, 20 Apr 2021 03:54:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E20AC6109E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=41e5jVyXPwDABQrlXmyC5uD2x4nIJ7zipNbTfmR142M=; b=OfWlCRiWLtw45AuPsLrIZTNPWa
	Iulu/3vFiCn4avENxy76wS22OaskPa2BDuIyhN2uc/Xu7hnTsUJKn1jtzzsOukKg+6XC2xp7WYlJm
	ql160/R3LwJpmKvhdp9dLOJaOpcuZ43ZkK68BtamUOaIl3l81yeOhHqJIayVxVd1I9LBiktd0Ycjw
	MK5qAikpuTyeFIvSfluzmoOROmcXtQVZLOY7r3bQ9bCu+DAKASuuo+1u7kqZF195qSjKdTnwSoyyt
	BRxEAaVcQj873ECzqnJGLxek8qbEGxJ7Krq37uV0hnXu5841g4RmjfqQJqBpmaMjElzXi0PySWh2L
	Mi0b+83Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYhSe-00B8TJ-DU; Tue, 20 Apr 2021 03:54:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYhSc-00B8T6-Pe
 for ath11k@desiato.infradead.org; Tue, 20 Apr 2021 03:54:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=9PYAsr16mLZxuGI6W1iWLt3mn8BKMbEgQzzE4aMKm4Q=; b=B5PwtUuasdohZOrdf4CdI86nd8
 BwKGaIkbe1rtpLSCerc9HA5DMpKSNLTcj2fYe3TgHOJe1xDG/59XeACDtYxX5OzNwVryxibhP5848
 Z+oFfyh0MR2615hFiKXcqNpu0oMNrpVPY3BppiA10uzUQOV9GcmDZA/L8dT2R1F2Z9UQDmSxb3MQG
 hrNiPM58AaP3I9/yfz2TAPSrmoNCoVEfUosDNc/QvfQaqJ/PyTixII0cqr4Xun6i4g9EvPAiTWlKx
 Q9ePqnbOfZ6/riqXZdFL1PFlKpjb/KUWhWyuKcVEM4ChTcjmeAhcC1bYhKzGalj3a6WPY73jyF3vZ
 zdqdNoFg==;
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYhSY-00BnWw-US
 for ath11k@lists.infradead.org; Tue, 20 Apr 2021 03:54:01 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1618890838; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=9PYAsr16mLZxuGI6W1iWLt3mn8BKMbEgQzzE4aMKm4Q=;
 b=OkVue68NilqVFJAxwOnaGpQ4wm3lWPOunO1vIsw730bd0CHSDEKC3lml65NbmLunYQ4EpTzN
 lo/f/VFC/I6wPnksbmv/N0t54HKCUBNmitMDZYEWuvvjwv+e29IdK+cjunmlmHAiYmMdlL3C
 dEA5yLxtWng5UH/y53X0xeMQPQU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 607e504b853c0a2c4656a155 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 20 Apr 2021 03:53:47
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2564EC43460; Tue, 20 Apr 2021 03:53:47 +0000 (UTC)
Received: from z230.qca.qualcomm.com (unknown [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: bqiang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E5ABAC433D3;
 Tue, 20 Apr 2021 03:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E5ABAC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=bqiang@codeaurora.org
From: Baochen Qiang <bqiang@codeaurora.org>
To: manivannan.sadhasivam@linaro.org
Cc: hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath11k@lists.infradead.org
Subject: [PATCH] mhi: add MHI_STATE_M2 to resume success criteria
Date: Tue, 20 Apr 2021 11:53:39 +0800
Message-Id: <20210420035339.282963-1-bqiang@codeaurora.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_205359_086852_0E4EEF9C 
X-CRM114-Status: GOOD (  13.13  )
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

During system resume, mhi driver triggers M3->M0 transition and then waits
for target device to enter M0 state. Once done, the device queues a state
change event into ctrl event ring and notify mhi dirver by raising an
interrupt, where a tasklet is scheduled to process this event. In most cases,
the taklet is served timely and wait operation succeeds.

However, there are cases where CPU is busy and can not serve this tasklet
for some time. Once delay goes long enough, the device moves itself to M1
state and also interrupts mhi driver after inserting a new state change
event to ctrl ring. Later CPU finally has time to process the ring, however
there are two events in it now:
	1. for M3->M0 event, which is processed first as queued first,
	   tasklet handler updates device state to M0 and wakes up the task,
	   i.e., the mhi driver.
	2. for M0->M1 event, which is processed later, tasklet handler
	   triggers M1->M2 transition and updates device state to M2 directly,
	   then wakes up the mhi driver(if still sleeping on this wait queue).
Note that although mhi driver has been woken up while processing the first
event, it may still has no chance to run before the second event is processed.
In other words, mhi driver has to keep waiting till timeout cause the M0 state
has been missed.

kernel log here:
...
Apr 15 01:45:14 test-NUC8i7HVK kernel: [ 4247.911251] mhi 0000:06:00.0: Entered with PM state: M3, MHI state: M3
Apr 15 01:45:14 test-NUC8i7HVK kernel: [ 4247.917762] mhi 0000:06:00.0: State change event to state: M0
Apr 15 01:45:14 test-NUC8i7HVK kernel: [ 4247.917767] mhi 0000:06:00.0: State change event to state: M1
Apr 15 01:45:14 test-NUC8i7HVK kernel: [ 4338.788231] mhi 0000:06:00.0: Did not enter M0 state, MHI state: M2, PM state: M2
...

Fix this issue by simply adding M2 as a valid state for resume.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
---
 drivers/bus/mhi/core/pm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index ce73cfa63cb3..ca5f2feed9d5 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -900,6 +900,7 @@ int mhi_pm_resume(struct mhi_controller *mhi_cntrl)
 
 	ret = wait_event_timeout(mhi_cntrl->state_event,
 				 mhi_cntrl->dev_state == MHI_STATE_M0 ||
+				 mhi_cntrl->dev_state == MHI_STATE_M2 ||
 				 MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state),
 				 msecs_to_jiffies(mhi_cntrl->timeout_ms));
 
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
