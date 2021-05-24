Return-Path: <SRS0=yLF1=KT=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 068BEC04FF3
	for <ath11k@archiver.kernel.org>; Mon, 24 May 2021 17:08:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C09A56140E
	for <ath11k@archiver.kernel.org>; Mon, 24 May 2021 17:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C09A56140E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iVUImuB1yNmXMpnQYW3U3TP9c4xAt8gx9GrQWB71LDI=; b=THRdgBioKnQbBd
	cW1R9Dl4IAMu7fFP0+j8M6tP2kP2VvTmOIfXDdJ0HRU7UPblMBZEQgSDEUN+fThctfKjPhO17w/39
	d/E4JEs6qdmN+3jQ7d6/YeJOV3KMsPPWvj0pQ7fzFBUI3ez3Pcd2M1juFP+pGXEYtqb2xfte9DT2B
	WhzOOky463MIyn6AfSOecBJQq65BjSzT4Njzzt3BSghwrJVVIFRyT8XcyBtOVM7TBRmM8EImDgz9z
	X84oyVCEXkuhPes8qtJs+6v8ZDUIbISKgVfst1m4lVCjaRvFylLsSg1BrGLbZGIoc2UeZ/1KFlurf
	UQh40ohL17a4MqD5Dgww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llE4P-001DiX-23; Mon, 24 May 2021 17:08:49 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ll1oH-000fuz-Te
 for ath11k@lists.infradead.org; Mon, 24 May 2021 04:03:23 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1621829001; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=qJyT7ZMqzWN/xyhBNw4dAHIGfNS/+50PSHAczgqPi3c=;
 b=VvWCmBYk1vfKGJg09V0sCigtTc0/11Zfx3rrfKiv56S7rDLe59dubdwWSfuQ6QIEdSHbvF/h
 5iqadWmNgKQxZjfoZmCr2nppNUVgklHW40fM2OfzO8rSdXlRuBaC6pTeiz1PYVlSEKSBr1AR
 fsu06srDZIUFpEQS/C/rnHqZAq0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60ab2588063320cd139355e3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 24 May 2021 04:03:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7F2CFC4338A; Mon, 24 May 2021 04:03:19 +0000 (UTC)
Received: from bqiang-Celadon-RN.qca.qualcomm.com (unknown [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: bqiang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4486CC433D3;
 Mon, 24 May 2021 04:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4486CC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=bqiang@codeaurora.org
From: Baochen Qiang <bqiang@codeaurora.org>
To: manivannan.sadhasivam@linaro.org
Cc: hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
 stable@vger.kernel.org
Subject: [PATCH v2] bus: mhi: Wait for M2 state during system resume
Date: Mon, 24 May 2021 12:03:12 +0800
Message-Id: <20210524040312.14409-1-bqiang@codeaurora.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210523_210322_050179_19CFEE61 
X-CRM114-Status: GOOD (  13.53  )
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

During system resume, MHI host triggers M3->M0 transition and then waits
for target device to enter M0 state. Once done, the device queues a state
change event into ctrl event ring and notifies MHI host by raising an
interrupt, where a tasklet is scheduled to process this event. In most cases,
the tasklet is served timely and wait operation succeeds.

However, there are cases where CPU is busy and cannot serve this tasklet
for some time. Once delay goes long enough, the device moves itself to M1
state and also interrupts MHI host after inserting a new state change
event to ctrl ring. Later CPU finally has time to process the ring, however
there are two events in it now:
	1. for M3->M0 event, which is processed first as queued first,
	   tasklet handler updates device state to M0 and wakes up the task,
	   i.e., the MHI host.
	2. for M0->M1 event, which is processed later, tasklet handler
	   triggers M1->M2 transition and updates device state to M2 directly,
	   then wakes up the MHI host(if still sleeping on this wait queue).
Note that although MHI host has been woken up while processing the first
event, it may still has no chance to run before the second event is processed.
In other words, MHI host has to keep waiting till timeout cause the M0 state
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

Fixes: 0c6b20a1d720 ("bus: mhi: core: Add support for MHI suspend and resume")
Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
---
 drivers/bus/mhi/core/pm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index e2e59a341fef..59b009a3ee9b 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -934,6 +934,7 @@ int mhi_pm_resume(struct mhi_controller *mhi_cntrl)
 
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
