Return-Path: <SRS0=yLF1=KT=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 512EEC04FF3
	for <ath11k@archiver.kernel.org>; Mon, 24 May 2021 16:29:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 092FA613CC
	for <ath11k@archiver.kernel.org>; Mon, 24 May 2021 16:29:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 092FA613CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RXGkTHBCRS+Zr6ZjGvxeJ5RKaLwyZKnruAbbu9aiYPI=; b=IPxJv4/X5f3lvJ9DTo2d/RZJX
	9bvcNdoKBSQoBggWVXc2TB4oqGCTOmKywIvTb8OIsxhqT0ygUx23IaQgNVAfWa7rfHyYybfFfl3iG
	/Gzo2QtC5qz2+mtWd9/DZ+9zuHrOdsI2fKsYn8ZLs3N1vSE/YXYNU8McOavARvBIsnTuEvfiFR+G9
	QDX3VW6Zk8K08c4bnDd5Xj0/uoG3AGrqp1nVms3YAAZ6ykLUMb0MNO4yPMRG4mAGBauwLU0pBuKzZ
	PJq8VsLyMXksT1u72fU2eIXavAPqQrg+sX7gRYKX1V4+VCwCvKPOs5vdRmeZecOAcvttPPxVPFff6
	R8wJVnHhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llDSW-0016zc-5Z; Mon, 24 May 2021 16:29:40 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ll13W-000fFC-Hz
 for ath11k@lists.infradead.org; Mon, 24 May 2021 03:15:04 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1621826101; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=uqzfuHPJmT1rryM1vxLF4VofXMmwpMUZC0+VLumh7UY=;
 b=SMsBv0Eg2n/PMU6rlbyGtnH/KuCZ9CCvA6HJpZfIjm7ptCBTX08jrGqofbcs/3rUAdsE3taV
 HvAm9oRpWIFzxH5j8lS1olFexX8uCXJXVOyptyQz4vuPl7XyZcOJXe/EVL7Rb6bVibsPXG2a
 1ZWlDTjzhKa6yVNxghM4Eoijk00=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60ab1a342bff04e53b710f9e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 24 May 2021 03:15:00
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4D588C433F1; Mon, 24 May 2021 03:15:00 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: bqiang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C0071C4338A;
 Mon, 24 May 2021 03:14:58 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 24 May 2021 11:14:58 +0800
From: bqiang@codeaurora.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath11k@lists.infradead.org
Subject: Re: [PATCH] mhi: add MHI_STATE_M2 to resume success criteria
In-Reply-To: <20210521124530.GF70095@thinkpad>
References: <20210420035339.282963-1-bqiang@codeaurora.org>
 <20210521124530.GF70095@thinkpad>
Message-ID: <480583c9b392c315c30795c54afd69f8@codeaurora.org>
X-Sender: bqiang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210523_201502_678425_D85EF511 
X-CRM114-Status: GOOD (  27.53  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 2021-05-21 20:45, Manivannan Sadhasivam wrote:
> Hi,
> 
> The patch subject should be,
> 
> "bus: mhi: Wait for M2 state during system resume"
> 
> We follow "bus: mhi:" prefix for all MHI patches. Also, the subject 
> should
> clearly portray what the patch is intend to do.
> 
> On Tue, Apr 20, 2021 at 11:53:39AM +0800, Baochen Qiang wrote:
>> During system resume, mhi driver triggers M3->M0 transition and then 
>> waits
> 
> s/mhi driver/MHI host
> 
>> for target device to enter M0 state. Once done, the device queues a 
>> state
>> change event into ctrl event ring and notify mhi dirver by raising an
> 
> s/notify/notifies and s/mhi dirver/MHI host. MHI driver is somewhat 
> confusing
> since we have the MHI device driver (QRTR etc...) as well. So just use 
> MHI host
> everywhere.
> 
>> interrupt, where a tasklet is scheduled to process this event. In most 
>> cases,
>> the taklet is served timely and wait operation succeeds.
>> 
> 
> s/taklet/tasklet
> 
>> However, there are cases where CPU is busy and can not serve this 
>> tasklet
> 
> a/can not/cannot
> 
>> for some time. Once delay goes long enough, the device moves itself to 
>> M1
>> state and also interrupts mhi driver after inserting a new state 
>> change
>> event to ctrl ring. Later CPU finally has time to process the ring, 
>> however
>> there are two events in it now:
>> 	1. for M3->M0 event, which is processed first as queued first,
>> 	   tasklet handler updates device state to M0 and wakes up the task,
>> 	   i.e., the mhi driver.
>> 	2. for M0->M1 event, which is processed later, tasklet handler
>> 	   triggers M1->M2 transition and updates device state to M2 
>> directly,
>> 	   then wakes up the mhi driver(if still sleeping on this wait 
>> queue).
>> Note that although mhi driver has been woken up while processing the 
>> first
>> event, it may still has no chance to run before the second event is 
>> processed.
>> In other words, mhi driver has to keep waiting till timeout cause the 
>> M0 state
>> has been missed.
>> 
>> kernel log here:
>> ...
>> Apr 15 01:45:14 test-NUC8i7HVK kernel: [ 4247.911251] mhi 
>> 0000:06:00.0: Entered with PM state: M3, MHI state: M3
>> Apr 15 01:45:14 test-NUC8i7HVK kernel: [ 4247.917762] mhi 
>> 0000:06:00.0: State change event to state: M0
>> Apr 15 01:45:14 test-NUC8i7HVK kernel: [ 4247.917767] mhi 
>> 0000:06:00.0: State change event to state: M1
>> Apr 15 01:45:14 test-NUC8i7HVK kernel: [ 4338.788231] mhi 
>> 0000:06:00.0: Did not enter M0 state, MHI state: M2, PM state: M2
>> ...
>> 
>> Fix this issue by simply adding M2 as a valid state for resume.
>> 
>> Tested-on: WCN6855 hw2.0 PCI 
>> WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>> 
>> Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
> 
> Could you please add a fixes tag as well? And this patch should be 
> backported to
> stable kernels also, so please CC stable@vger.kernel.org.
> 
> Thanks,
> Mani
> 

Thanks Mani.
Will address them and send as V2.

>> ---
>>  drivers/bus/mhi/core/pm.c | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
>> index ce73cfa63cb3..ca5f2feed9d5 100644
>> --- a/drivers/bus/mhi/core/pm.c
>> +++ b/drivers/bus/mhi/core/pm.c
>> @@ -900,6 +900,7 @@ int mhi_pm_resume(struct mhi_controller 
>> *mhi_cntrl)
>> 
>>  	ret = wait_event_timeout(mhi_cntrl->state_event,
>>  				 mhi_cntrl->dev_state == MHI_STATE_M0 ||
>> +				 mhi_cntrl->dev_state == MHI_STATE_M2 ||
>>  				 MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state),
>>  				 msecs_to_jiffies(mhi_cntrl->timeout_ms));
>> 
>> --
>> 2.25.1
>> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
