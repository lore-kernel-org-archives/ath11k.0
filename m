Return-Path: <SRS0=pS/N=KQ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B41A4C433B4
	for <ath11k@archiver.kernel.org>; Fri, 21 May 2021 12:45:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34E07613CC
	for <ath11k@archiver.kernel.org>; Fri, 21 May 2021 12:45:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34E07613CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L2aAsnnl7EzBgZqiaq6uYipmqpJDKR2qOrWxjDJgOuY=; b=U44ASpzMSFRxHE6TKQCjhIqg4m
	nPShZwYJ/2Pyq25kUUfij/Km64nF8lxWCWsW4DJb7uni4ifQglOuPoccskYsKMqk3YSzZkBMjcGNS
	VFjzaCJiJCf8tmng3qTB9KPtKhAkqivukkaxf8LB4hKgNA4aOT4P3M5Hlp2j82xH6NvepXU5zyVcv
	SopWJoomvXoSQsKw7SimHfDdYLWTDXxd85rZwXNxeRbmRhA6Nu6s0fqip7e+o07MIGWmadD/q33rq
	KnMTX6V588dY2shxmT8nTlCPg2XQ5/YxAVbnU7kzum2+x4yCwWaoomI2wIcvbsLRryho1vCmMFpwF
	NcNzMn5Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk4X8-005MEf-W3; Fri, 21 May 2021 12:45:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk4X6-005ME5-QK
 for ath11k@desiato.infradead.org; Fri, 21 May 2021 12:45:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=adz+BahtvnOcpRpaKyMBiUOouPHM6c849PhFGMVWqkg=; b=htcwkvbewHe+sS7250Jz5zBXiE
 oWLNF+NMILP3QxRParKanAoYpFxAHLeaz9+fmZtvuM58ViXYAQPJSkyLFJr2SoTgN17/RfVsgq+Yf
 43LSTSE+EZJ2YESjXSitfJPLCRFR6N7F2TnonNlecd9/5r1mIk/yN18d9UJu5XrlgamJFtaI0mIIn
 P8pwV+n8X6YBmNGsLfUFhbvAME5x95uV+3n/km+A3ogGV1drcNrD6oHEI0kbTZDy+T3vde8N9TeU3
 ObsVtVpnXMq+5h9ZbN6bIcLUfCUr0Id2Rsz3+d8EesOc6EgeWD3NL2U3Hxki9183BANyp5p2XplST
 97nmkvQg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk4X4-00H6as-4R
 for ath11k@lists.infradead.org; Fri, 21 May 2021 12:45:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CB6EB613AC;
 Fri, 21 May 2021 12:45:34 +0000 (UTC)
Date: Fri, 21 May 2021 18:15:30 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Baochen Qiang <bqiang@codeaurora.org>
Cc: hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath11k@lists.infradead.org
Subject: Re: [PATCH] mhi: add MHI_STATE_M2 to resume success criteria
Message-ID: <20210521124530.GF70095@thinkpad>
References: <20210420035339.282963-1-bqiang@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210420035339.282963-1-bqiang@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_054538_233477_D766404D 
X-CRM114-Status: GOOD (  24.29  )
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

Hi,

The patch subject should be,

"bus: mhi: Wait for M2 state during system resume"

We follow "bus: mhi:" prefix for all MHI patches. Also, the subject should
clearly portray what the patch is intend to do.

On Tue, Apr 20, 2021 at 11:53:39AM +0800, Baochen Qiang wrote:
> During system resume, mhi driver triggers M3->M0 transition and then waits

s/mhi driver/MHI host

> for target device to enter M0 state. Once done, the device queues a state
> change event into ctrl event ring and notify mhi dirver by raising an

s/notify/notifies and s/mhi dirver/MHI host. MHI driver is somewhat confusing
since we have the MHI device driver (QRTR etc...) as well. So just use MHI host
everywhere.

> interrupt, where a tasklet is scheduled to process this event. In most cases,
> the taklet is served timely and wait operation succeeds.
> 

s/taklet/tasklet

> However, there are cases where CPU is busy and can not serve this tasklet

a/can not/cannot

> for some time. Once delay goes long enough, the device moves itself to M1
> state and also interrupts mhi driver after inserting a new state change
> event to ctrl ring. Later CPU finally has time to process the ring, however
> there are two events in it now:
> 	1. for M3->M0 event, which is processed first as queued first,
> 	   tasklet handler updates device state to M0 and wakes up the task,
> 	   i.e., the mhi driver.
> 	2. for M0->M1 event, which is processed later, tasklet handler
> 	   triggers M1->M2 transition and updates device state to M2 directly,
> 	   then wakes up the mhi driver(if still sleeping on this wait queue).
> Note that although mhi driver has been woken up while processing the first
> event, it may still has no chance to run before the second event is processed.
> In other words, mhi driver has to keep waiting till timeout cause the M0 state
> has been missed.
> 
> kernel log here:
> ...
> Apr 15 01:45:14 test-NUC8i7HVK kernel: [ 4247.911251] mhi 0000:06:00.0: Entered with PM state: M3, MHI state: M3
> Apr 15 01:45:14 test-NUC8i7HVK kernel: [ 4247.917762] mhi 0000:06:00.0: State change event to state: M0
> Apr 15 01:45:14 test-NUC8i7HVK kernel: [ 4247.917767] mhi 0000:06:00.0: State change event to state: M1
> Apr 15 01:45:14 test-NUC8i7HVK kernel: [ 4338.788231] mhi 0000:06:00.0: Did not enter M0 state, MHI state: M2, PM state: M2
> ...
> 
> Fix this issue by simply adding M2 as a valid state for resume.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>

Could you please add a fixes tag as well? And this patch should be backported to
stable kernels also, so please CC stable@vger.kernel.org.

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/pm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index ce73cfa63cb3..ca5f2feed9d5 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -900,6 +900,7 @@ int mhi_pm_resume(struct mhi_controller *mhi_cntrl)
>  
>  	ret = wait_event_timeout(mhi_cntrl->state_event,
>  				 mhi_cntrl->dev_state == MHI_STATE_M0 ||
> +				 mhi_cntrl->dev_state == MHI_STATE_M2 ||
>  				 MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state),
>  				 msecs_to_jiffies(mhi_cntrl->timeout_ms));
>  
> -- 
> 2.25.1
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
