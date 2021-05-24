Return-Path: <SRS0=yLF1=KT=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DC45C04FF3
	for <ath11k@archiver.kernel.org>; Mon, 24 May 2021 22:05:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23C406141D
	for <ath11k@archiver.kernel.org>; Mon, 24 May 2021 22:05:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23C406141D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+SszMC5ELOELaqao5S0kwBi/4pDv1LtFXXxo/VSgdqY=; b=wj2VY9TQ3vSSwg
	vqZUpi/G1kY+65UWJs3f0Bh9TUFNzm9Pp61+XQAjDItmN/qIaJu0jhpqsOq7lv8GW143VcTowMu/p
	K+7OyLvsbog/wx5EZCyzc/k2UDQzRacG/k05aV0mYc7qD39S3MvxBKy7xAeXLRFUV0Zkn7zYl0S4N
	oZNALmcI2Ss4BFxDNap1WlNQ/VgdvCME0nOjFAiOpPtIOcHseESVg7lvKqE/wZ6nm4x43xxLNsCxz
	FqGRPYZzC5rpgSzHZ6BnDoU5fHrOpsfHqXXzKliLnsK+cXwvoKPaC6UIU/DQfk6DeM4dYCY8YFnWW
	9DCADVYMfoV5zky0ZmLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llIha-0022wC-Nx; Mon, 24 May 2021 22:05:34 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ll2La-000gcj-P6
 for ath11k@lists.infradead.org; Mon, 24 May 2021 04:37:50 +0000
Received: by mail-pj1-x1034.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso9669775pjx.1
 for <ath11k@lists.infradead.org>; Sun, 23 May 2021 21:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=MDE07gsiuD4M3r2LCEJykHaQUxtgYgyzLwjRG2xiWSo=;
 b=cMlNRaFVHxk/Vg2m4FWR7arQ/ghKts+RBvLvpeQcGyy25qofos/zvz9gUv7jDeVjza
 93RZUp5BiFbSqTrO+NUWRNsYj8cyBstCJBjhS3klDTdiKbCqN8gQYBgUNRJElP+C925B
 ozyW+qN+zvi6L7UdnFuG8PIldHGPc/9jpIwBkA1t/2/3guTMpuunG+456UxWgZ7FDSuU
 PKXM46qji8s89yr0dCU8ihrFl+w/q4zR6/zhs4tvktAHndJV9fX6fUWVzafwUBwIk7Pl
 mkBAvXkgpVAt29Iz5EdNRiU+cSC3mZFHmUm6rQPX0IhZwaUVrnJ9CF9CJU0d8yU9TVjs
 mBmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MDE07gsiuD4M3r2LCEJykHaQUxtgYgyzLwjRG2xiWSo=;
 b=EtV+4o6nplL+FXRfIBVmEJo4XMKxJiWC6gQgswby3stXc0iBOEXOSqkw06/uinSmTj
 5fOOiarYloTgTiMp7ksD9mi9zuVH22r4oe7EaZdQ7IO/DAuE9LEKjwr5oZTDLe7W1VHS
 C3SEU3dt1CFGwK3a/X8jZUgU/03EMajv2T4YS77AevbIFvXkDPcEqScwjg0qH0TfYbj7
 QjaC888AunI0NdATafZQpYjZlrtzWBLwetSPDEBU2J19JRMyW+KqA0xSEbl9YTemLObQ
 oh7HYPVo7OgR8ANSoGP1RRRoUhW8IrZ+9phzyC9hOMesPommhnYbp8tvlir1JY3vLtPC
 QLwg==
X-Gm-Message-State: AOAM5304B2cWiDM4H6pd9TnVh2v2u/AOMjwkEwdKad+qEjlUSyDeTn3B
 4TByYr+PAm2qgKcnDKL39zYX
X-Google-Smtp-Source: ABdhPJy9QPbKkRIFtXdAwMIebxG5sg01nmgnd6EX7GHXpAgjDNbW5i8bMBIDNwjkg/fabwwZYgm8qA==
X-Received: by 2002:a17:90a:b38d:: with SMTP id
 e13mr22456179pjr.222.1621831065632; 
 Sun, 23 May 2021 21:37:45 -0700 (PDT)
Received: from work ([120.138.12.48])
 by smtp.gmail.com with ESMTPSA id v14sm9680578pfi.25.2021.05.23.21.37.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 23 May 2021 21:37:44 -0700 (PDT)
Date: Mon, 24 May 2021 10:07:40 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Baochen Qiang <bqiang@codeaurora.org>
Cc: hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v2] bus: mhi: Wait for M2 state during system resume
Message-ID: <20210524043740.GC8823@work>
References: <20210524040312.14409-1-bqiang@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210524040312.14409-1-bqiang@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210523_213746_849106_0DF4FBB0 
X-CRM114-Status: GOOD (  24.93  )
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

On Mon, May 24, 2021 at 12:03:12PM +0800, Baochen Qiang wrote:
> During system resume, MHI host triggers M3->M0 transition and then waits
> for target device to enter M0 state. Once done, the device queues a state
> change event into ctrl event ring and notifies MHI host by raising an
> interrupt, where a tasklet is scheduled to process this event. In most cases,
> the tasklet is served timely and wait operation succeeds.
> 
> However, there are cases where CPU is busy and cannot serve this tasklet
> for some time. Once delay goes long enough, the device moves itself to M1
> state and also interrupts MHI host after inserting a new state change
> event to ctrl ring. Later CPU finally has time to process the ring, however
> there are two events in it now:
> 	1. for M3->M0 event, which is processed first as queued first,
> 	   tasklet handler updates device state to M0 and wakes up the task,
> 	   i.e., the MHI host.
> 	2. for M0->M1 event, which is processed later, tasklet handler
> 	   triggers M1->M2 transition and updates device state to M2 directly,
> 	   then wakes up the MHI host(if still sleeping on this wait queue).
> Note that although MHI host has been woken up while processing the first
> event, it may still has no chance to run before the second event is processed.
> In other words, MHI host has to keep waiting till timeout cause the M0 state
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
> Fixes: 0c6b20a1d720 ("bus: mhi: core: Add support for MHI suspend and resume")
> Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
> Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>

Applied to mhi-fixes!

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/pm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index e2e59a341fef..59b009a3ee9b 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -934,6 +934,7 @@ int mhi_pm_resume(struct mhi_controller *mhi_cntrl)
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
