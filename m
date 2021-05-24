Return-Path: <SRS0=yLF1=KT=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FAA3C2B9F7
	for <ath11k@archiver.kernel.org>; Mon, 24 May 2021 23:52:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FF40613E6
	for <ath11k@archiver.kernel.org>; Mon, 24 May 2021 23:52:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FF40613E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zSCn9GHi7e5gyGbljwmj8/qqUOe4Mtcc6WGs1p7YPZc=; b=h/kLtxgTjoYmzx
	xffqPR7/oCiC9ru8N49DgebvXBzWWynPO3aju9aue9ws4Kd5kGig0hS6jWoEO/T1Nf/N6jVQIkma/
	0W3HypoycNZF6txR+CVdb5ylst6KfJS/42fyeia472eXrhePYRA7XuLzvT1cBCP6VxKpkf2D3d+dx
	u75hXIPtlK/WHVNIqj/PDMQ68lEa33qncciPXMTpomszE7FvWIXp2tnrrgioG8EaC1VrSFj0Lis5G
	kHpsw/2NflFmwm/qnfzy+Llk5IwF3u7AG2iHFi+mUwozaKVpfrumzgS1w0PhZwWB3HUpAGAdlJaKl
	A/JJKoZ0nQT3M5u9Q/CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llKMf-002Q9r-NI; Mon, 24 May 2021 23:52:05 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ll1zt-000gJ2-F0
 for ath11k@lists.infradead.org; Mon, 24 May 2021 04:15:23 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 o17-20020a17090a9f91b029015cef5b3c50so10494786pjp.4
 for <ath11k@lists.infradead.org>; Sun, 23 May 2021 21:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Eezjw8yRl9t4j5CG1frK88Lj1GkBd9KqYmSVYOlCqa4=;
 b=rzLabbN8TrKREtGyH2vtpMIivmu6I60328i33ywZVhJQ+qiHYiAmTtb5GZ7TG/R34p
 TgMXSqTYC9k6GmcSIWdYD/kkn4Z/pGtzmJzwSwCRu+BjOQQ4DbPmsiMKT4jEdUVfuCJ1
 neYbrsLyTnfmrZgyxudKi6wjJgvtrDWDBlO+MbKtyIZMj0mTpDS1MxBnKCShUPK8Ox4d
 ziUZdjSuZ7IkuZNKJQXIwc6g61rB3SwrfhyloTNlgRTRq4y2ZpflFOJdBxagjDP+kQ7d
 8ekbnDQE9zv/u3XEhVpHcLKfZtK6YeftiUlCoMaEXcDyb1eOJP06eZeFdRV9ISNGxR/r
 j0Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Eezjw8yRl9t4j5CG1frK88Lj1GkBd9KqYmSVYOlCqa4=;
 b=RwTy9NKFpJrbr4YN/xVHPakAMoIGVWD7GwAIyHPb0a6SfI4bbV9pEquATxCx2cNsFF
 MT4ZfBlD+cruxXirOteSUI6DlTzEuhs9gZT7A7sfglXhn2X8bPHXGjmIKGI26nCAm4Hl
 N/wwhHQE1IomY2rQU4lJDZrN2Yw4QX9uSzqQM7SR96R01tBtiOBABNYEmOvuBOYlgWn/
 kJDYRPyoH4dZcTgIbvnI6Zwn/DyJjSkkdUapnhZ81WhAL/qUgPqR3ZB9CAUOmLt2veIM
 s1x71Uy2OzGC7U+wiONUcwvKhRFWBZrEyw9ZUvckx29B2hzfm0Mbt4+r8FESTxNqd5Mm
 kfnA==
X-Gm-Message-State: AOAM533X2/SoQetTijOIU22w5XyofrGZa7jRqzExn94PKpzmLyLKb54C
 WraQY0jKC3gPpbnNNZXcImCO
X-Google-Smtp-Source: ABdhPJxqTMgsZhyrFK01HCUBrNMOGuQWzXtF8G6CsiZideyCJfZq0UTfqtAWwla+zChPdS/Qb+81hg==
X-Received: by 2002:a17:90b:30cb:: with SMTP id
 hi11mr22675705pjb.204.1621829719378; 
 Sun, 23 May 2021 21:15:19 -0700 (PDT)
Received: from work ([120.138.12.48])
 by smtp.gmail.com with ESMTPSA id k7sm13431909pjj.46.2021.05.23.21.15.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 23 May 2021 21:15:18 -0700 (PDT)
Date: Mon, 24 May 2021 09:45:14 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Baochen Qiang <bqiang@codeaurora.org>
Cc: hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v2] bus: mhi: Wait for M2 state during system resume
Message-ID: <20210524041514.GA8823@work>
References: <20210524040312.14409-1-bqiang@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210524040312.14409-1-bqiang@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210523_211521_534567_2E743A9B 
X-CRM114-Status: GOOD (  24.76  )
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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

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
