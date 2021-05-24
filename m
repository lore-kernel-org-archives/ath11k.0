Return-Path: <SRS0=yLF1=KT=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D29D7C04FF3
	for <ath11k@archiver.kernel.org>; Mon, 24 May 2021 16:42:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B24E60FDA
	for <ath11k@archiver.kernel.org>; Mon, 24 May 2021 16:42:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B24E60FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i2+r/6SUP74/wbbz5YMoYMfEeDhBL5d698caEc/7Jx8=; b=ESe/bhl/Kp5DRQ
	gGomGORdHZ4A6K768oT0QtEp3G8bmx7gmEjLimefk6qoGCHvc7lGA0VpYgldOqGPPdpJYUrlrpOo2
	nto1tVFep9rHYmr8IPGpEUTBvC/yaKsPJEu403HpalPcTHvXnImyK/9ZbGWvPgLAS9Y2ypvWr/HzW
	QguTTIW5l7xdpNmOH2zk4at0Tfuh+UP0lEsn1uv7SjYNfTJSHPH37B87BS8kkrzAs8DOj+fajXBi7
	Ce4eGeZUMJBvUIQEnXVzzouevn/9WVfQTKpc254B6ipPm6Lf4rHxZfP2fMsqJoloByIXC+FeCh8v8
	FHDPRrDHGcHD7pU4lulw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llDeR-00196M-3b; Mon, 24 May 2021 16:41:59 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ll2g8-000gwG-IR
 for ath11k@lists.infradead.org; Mon, 24 May 2021 04:59:01 +0000
Received: by mail-pf1-x429.google.com with SMTP id x188so19845238pfd.7
 for <ath11k@lists.infradead.org>; Sun, 23 May 2021 21:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=IAKmLQlo5yIdWFUbaREDZ8KxE5immhhtLzqjh0rXTzU=;
 b=H5h59/wSyUEhLnaxOLf44Zjv9gy+xDh48y2q4T/os8Y8uxva6P8+92uyMOv+sWLFbK
 JuF/KQtRv5FjWZQwkwwrkOdW0PSXCmjd76fkNmdcab/1klMOdj4g6t30ECwXWYuD6DJP
 Cqtd41QwDuk9WYBYUuKSQ4r9YOxAUtDQek7VWfJd6qASaKuOBU/FmrFre2awHaHZRW53
 7DPlTgaybhl7HlnG20B1a0crNXPQdPNkNDS075IO9sGjXZghcwuqerKIENVgeuvUmVYU
 irXoN3/Zz6AVWFqn6bhp3HUmt3/6FnN8lAOIh5I172hPN8WU+UCzAFBN7O2FOm5ZXUoW
 ZDqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IAKmLQlo5yIdWFUbaREDZ8KxE5immhhtLzqjh0rXTzU=;
 b=ax8V0Uhl8LQeBi1cHtTvtjJlF0PZ0Wvq4uK9WvEGiupECDBk6a/j4ATiRzg5Y4v0YZ
 YLuVfZPJ/FcbXAXKdRxL0K2qoL2tKOwY9Gs/e/URnvqJ6XjOfwEkiSlQG6LKTMWclHVz
 DsbH8H/UtI63L5MQOBN3smB5tgEa8mKf/8t2fBAS/gCWRBXyKZCzM9pqJL7Y6XwzFv/K
 nQdGojdl4q40G8g2IltPeK0XVIwywXxIEVRdtT4nTAmjjMtS+Xsc3l4xSqGqqPxdBIQU
 vQghf+6yWEgIwEecfa2nWXtntyn5oCRWIAWgzJNyw7RlqMfkaWbOiesq+MAwuRMDIinQ
 b3TA==
X-Gm-Message-State: AOAM532p7VPjmw69zwfCwGbUN1qOpZATNaVwQ3R18j9N9aT4VITBUz4T
 T7nT9+Umjf9JlyqyamB0gYvg
X-Google-Smtp-Source: ABdhPJwdpF2fWwKYkGCy+MvDtZC8h+uirh0J8BSq/MBac0zgzhRyoIqggx05touQCKqS4xEMPxiGQw==
X-Received: by 2002:a65:4608:: with SMTP id v8mr11564805pgq.435.1621832339503; 
 Sun, 23 May 2021 21:58:59 -0700 (PDT)
Received: from work ([120.138.12.48])
 by smtp.gmail.com with ESMTPSA id b2sm13529363pji.28.2021.05.23.21.58.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 23 May 2021 21:58:58 -0700 (PDT)
Date: Mon, 24 May 2021 10:28:55 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Baochen Qiang <bqiang@codeaurora.org>
Cc: hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v2] bus: mhi: Wait for M2 state during system resume
Message-ID: <20210524045855.GF8823@work>
References: <20210524040312.14409-1-bqiang@codeaurora.org>
 <20210524043740.GC8823@work>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210524043740.GC8823@work>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210523_215900_638198_D96B0B96 
X-CRM114-Status: GOOD (  29.37  )
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

On Mon, May 24, 2021 at 10:07:40AM +0530, Manivannan Sadhasivam wrote:
> On Mon, May 24, 2021 at 12:03:12PM +0800, Baochen Qiang wrote:
> > During system resume, MHI host triggers M3->M0 transition and then waits
> > for target device to enter M0 state. Once done, the device queues a state
> > change event into ctrl event ring and notifies MHI host by raising an
> > interrupt, where a tasklet is scheduled to process this event. In most cases,
> > the tasklet is served timely and wait operation succeeds.
> > 
> > However, there are cases where CPU is busy and cannot serve this tasklet
> > for some time. Once delay goes long enough, the device moves itself to M1
> > state and also interrupts MHI host after inserting a new state change
> > event to ctrl ring. Later CPU finally has time to process the ring, however
> > there are two events in it now:
> > 	1. for M3->M0 event, which is processed first as queued first,
> > 	   tasklet handler updates device state to M0 and wakes up the task,
> > 	   i.e., the MHI host.
> > 	2. for M0->M1 event, which is processed later, tasklet handler
> > 	   triggers M1->M2 transition and updates device state to M2 directly,
> > 	   then wakes up the MHI host(if still sleeping on this wait queue).
> > Note that although MHI host has been woken up while processing the first
> > event, it may still has no chance to run before the second event is processed.
> > In other words, MHI host has to keep waiting till timeout cause the M0 state
> > has been missed.
> > 
> > kernel log here:
> > ...
> > Apr 15 01:45:14 test-NUC8i7HVK kernel: [ 4247.911251] mhi 0000:06:00.0: Entered with PM state: M3, MHI state: M3
> > Apr 15 01:45:14 test-NUC8i7HVK kernel: [ 4247.917762] mhi 0000:06:00.0: State change event to state: M0
> > Apr 15 01:45:14 test-NUC8i7HVK kernel: [ 4247.917767] mhi 0000:06:00.0: State change event to state: M1
> > Apr 15 01:45:14 test-NUC8i7HVK kernel: [ 4338.788231] mhi 0000:06:00.0: Did not enter M0 state, MHI state: M2, PM state: M2
> > ...
> > 
> > Fix this issue by simply adding M2 as a valid state for resume.
> > 
> > Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> > 
> > Fixes: 0c6b20a1d720 ("bus: mhi: core: Add support for MHI suspend and resume")
> > Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
> > Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
> 
> Applied to mhi-fixes!
> 

Sorry this has been applied to mhi-next!

Thanks,
Mani

> Thanks,
> Mani
> 
> > ---
> >  drivers/bus/mhi/core/pm.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> > index e2e59a341fef..59b009a3ee9b 100644
> > --- a/drivers/bus/mhi/core/pm.c
> > +++ b/drivers/bus/mhi/core/pm.c
> > @@ -934,6 +934,7 @@ int mhi_pm_resume(struct mhi_controller *mhi_cntrl)
> >  
> >  	ret = wait_event_timeout(mhi_cntrl->state_event,
> >  				 mhi_cntrl->dev_state == MHI_STATE_M0 ||
> > +				 mhi_cntrl->dev_state == MHI_STATE_M2 ||
> >  				 MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state),
> >  				 msecs_to_jiffies(mhi_cntrl->timeout_ms));
> >  
> > -- 
> > 2.25.1
> > 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
