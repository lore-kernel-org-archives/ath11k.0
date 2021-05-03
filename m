Return-Path: <SRS0=wPjJ=J6=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C008C433ED
	for <ath11k@archiver.kernel.org>; Mon,  3 May 2021 23:56:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F8B061177
	for <ath11k@archiver.kernel.org>; Mon,  3 May 2021 23:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F8B061177
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yI5sZUeQEDDoKW/6I5mtNuCsQK4VmeaoTFFgtHmzdW0=; b=eI6An/xyMhTZbzjJoysYs+sR6
	GEx96KajWYATpr+zD5zZ0fZn5ayTMJkMYZEINCZjfSll3oHdrQdzhoC+APkklde1iEvoC1xgQJ4RE
	ggGsgLs6t/Ka/c+kfmI5DzTgW4tEC2ckq154LT1oxaZ4ACN/iMd1LQGRMcU1Q0oZvrB4532Ohj36t
	glneiO+4nINKZ3zh8w3Qtk7TSh1G/GARFsIq2yuZb0RcoTPCgj/UtGRMiafs9Vca9kB1DDBL9C6Fc
	hGRbP6uF6oHrWSWyJkMsubrYXdqwR0OyDJhi+TNpuE9vx8dNBPeieA7gRY1bnu0eeuyah7S3Dhdcr
	lW1gXRkIA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldiQ7-00F4K6-6X; Mon, 03 May 2021 23:56:11 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldiQ5-00F4Ju-6c
 for ath11k@desiato.infradead.org; Mon, 03 May 2021 23:56:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=piSiT9kDksxiHfZ76iqY3kE19gY3ObsqvOI9b3fVh1w=; b=j62vPtyWpgDK/+hi1k4efXHfUV
 7jfvESE6aXZ+Crv2600cvmc2hkCziNtP5JJAdNPD/CEpHOnNISmMC8n+LxZpdyReCNIwTcAqoYp9Q
 AFxrUDxKRNFIAV3F9RpKbHFBtzNhoWZ2yhAq1tSRKcPmOR37oy4ED3XnC/ixlCFZr0KQwHKCsBIZN
 Ar6xyzkn3YVdE2w5LD4QPEDE+MAAu87IzZtrlVoGOAfpB4tgsnfWXmZVUJGoSORIeR60Lbv3Ooflo
 KfsDeC4bF5HD5hegnsjkaJphDwZMxv4SCiASdsV53woyIImYYep5Faq8Y6uEUbZEsGlfd+cOuD0zs
 92q7fvRA==;
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldiQ1-003Z0A-AR
 for ath11k@lists.infradead.org; Mon, 03 May 2021 23:56:07 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1620086166; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=piSiT9kDksxiHfZ76iqY3kE19gY3ObsqvOI9b3fVh1w=;
 b=iVmYNXeKPTUvlQyeqVocjDUaeWfiDaQ2616mJ2Lu5qMa+5WsmQu0GpIUFGBuO3pIB2fvgudd
 rb0/23euq30VjqLutmQGhdFYzkMX12z6F97knRLaHMrZQbbw+FjKXcW7TRH0rXwu8kHohGW/
 6eCHfMr5vh0Z0saRjCMnP68iGjo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60908d91c39407c32798b096 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 03 May 2021 23:56:01
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8BAFDC433D3; Mon,  3 May 2021 23:56:00 +0000 (UTC)
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: hemantk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 78341C433F1;
 Mon,  3 May 2021 23:55:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 78341C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH] mhi: add MHI_STATE_M2 to resume success criteria
To: Baochen Qiang <bqiang@codeaurora.org>, manivannan.sadhasivam@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 ath11k@lists.infradead.org
References: <20210420035339.282963-1-bqiang@codeaurora.org>
From: Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <11a51914-141d-24b6-cffa-4eb093aaea7f@codeaurora.org>
Date: Mon, 3 May 2021 16:55:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210420035339.282963-1-bqiang@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_165606_559018_A97CF8CE 
X-CRM114-Status: GOOD (  22.87  )
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



On 4/19/21 8:53 PM, Baochen Qiang wrote:
> During system resume, mhi driver triggers M3->M0 transition and then waits
> for target device to enter M0 state. Once done, the device queues a state
> change event into ctrl event ring and notify mhi dirver by raising an
> interrupt, where a tasklet is scheduled to process this event. In most cases,
> the taklet is served timely and wait operation succeeds.
> 
> However, there are cases where CPU is busy and can not serve this tasklet
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

nice explanation of the issue!

Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
