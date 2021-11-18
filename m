Return-Path: <SRS0=Pndp=QF=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE121C433EF
	for <ath11k@archiver.kernel.org>; Thu, 18 Nov 2021 17:41:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F93E615E3
	for <ath11k@archiver.kernel.org>; Thu, 18 Nov 2021 17:41:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8F93E615E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NJ90clie78SNgOsXbHc1WZME15ACciDNTTJoD1mvkrE=; b=mQA6DHozUCny2h
	4KolGid4DYGhZD9jqElVxrGASXsMr4PzdMjJ6hGeW6uMM74mu7EfmxEI2/IbLFyV+WT4yLXhuw/jy
	L+Ffqn9a8idPlnTvjCH8RH9HMaymE17xTs5hNAUBGv9io6JLNLdBHwKON2B/QAtTM6PTSGhTxmekA
	85Qz5/ua4eKbbqmUKYQ8gQkzcIp+IMO8uJpvyPEIiU89Uj66z+ISoFI8s29bvvhYQgnmXGr/7zoh9
	tAaTvO/VPUmeC3EbzS9Faer+WCUM8Aj1Q1/tzbJf1/7xYL/cArDDqfGekIDbPvGCtYrr4QZ7MGT3o
	lFZpBWDoi51bTWMnwfMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnlQ2-008TMd-Ub; Thu, 18 Nov 2021 17:41:54 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnlQ0-008TL9-0F
 for ath11k@lists.infradead.org; Thu, 18 Nov 2021 17:41:53 +0000
Received: by mail-pj1-x1031.google.com with SMTP id gt5so5720341pjb.1
 for <ath11k@lists.infradead.org>; Thu, 18 Nov 2021 09:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8ciIRwy+yxvWn2LwEQWDIz+C3VSCgM6erWfnwc1pCQE=;
 b=Po2980MK3nArAg5kgUQyTvOoghzp/so1mpxQqFmgkHfEuiVm8w/dsmqAfsmBEK0PsS
 t8cSYt5UI3z/+ZqDacYoUWritLHHkVDbZ9H8o9dp/O9FE2zwEefIwO2aYxWPBOIDi0K+
 Q6hRyiEXWNyugSaBdzEw/qLSH/sOZJ2SYBgfg+OKWsSQamHGH9lENraxerysU0vcMk+Q
 gndcskSMDwvdRTBfqcZ/DzJsMtzISsqSBCwYI5CaincTsqedpUpjUlPSNAVWCz32JR6l
 sapZEjrhakrT/HOKweuJvuRS6yVR6zqLJ7XwBGb7SQS30043DmQ13cwyhGCRWf9lL4m9
 Y6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8ciIRwy+yxvWn2LwEQWDIz+C3VSCgM6erWfnwc1pCQE=;
 b=iKTiCpRo3CqUJ0U5UvJfdwhE3YZBhhm6S7+nZKiBIlkORfOEkf9ZnkvFIoza7pUM2P
 olXxOsTirgp4DhBFZfYMOyJz1Ehik0aG3UV1r2A8CefZGfXVPwwF9l/LvhHQ3VigLMtk
 DBcbLLSc0PUc6eGKUohCSyjgnr58acKyDTFbOIgk+D8TnRUZb3jWMOAeVH130/o2OFGR
 z5SsJ3B+1CzroEqXY5Gf9Nkxz/eNXaXFfujHuauppX9Yyh1bxth1ueUqvWM0xJB/bJEL
 IBgVg0x1RI4JeseyluDEEY1eeou7puhA/jrbNKTeOphe2mu3bwV2PPT4ivSAWeYKAlJ0
 0GXQ==
X-Gm-Message-State: AOAM530iAKTJZ8YtGdC9JfwQ/B1XkxN2Pw+Y3T5vgaG626fYv5uY4OhK
 VJCznFMKiNgX4XyopdkSInVolWIUcOud
X-Google-Smtp-Source: ABdhPJz4ckUHzppPNRFH93bqoC4QHvF8HTUl6iWPtRcLKk0HfikDz9RyuU6wf05bW3QmHIX+Gogc6A==
X-Received: by 2002:a17:90a:a396:: with SMTP id
 x22mr12624056pjp.14.1637257310302; 
 Thu, 18 Nov 2021 09:41:50 -0800 (PST)
Received: from thinkpad ([117.202.188.63])
 by smtp.gmail.com with ESMTPSA id h6sm271494pfh.82.2021.11.18.09.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 09:41:49 -0800 (PST)
Date: Thu, 18 Nov 2021 23:11:45 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Loic Poulain <loic.poulain@linaro.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 regressions@lists.linux.dev, mhi <mhi@lists.linux.dev>
Subject: Re: [regression] mhi: ath11k resume fails on some devices
Message-ID: <20211118174145.GA31300@thinkpad>
References: <871r5p0x2u.fsf@codeaurora.org>
 <CAMZdPi8UJLvBFQd8-nf-iHAQh8cEuihq97PUFfZ7Q=rxRQoPsg@mail.gmail.com>
 <877df6tlnq.fsf@codeaurora.org>
 <CAMZdPi8P7YZPhPir+WfS3cY_a7He1m2Pq2uqBhczPdEeoNRb0Q@mail.gmail.com>
 <87a6jl9ndo.fsf@codeaurora.org> <87ee8hgqni.fsf@codeaurora.org>
 <20211021100305.GD7580@workstation>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211021100305.GD7580@workstation>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_094152_130998_6659B471 
X-CRM114-Status: GOOD (  31.11  )
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

On Thu, Oct 21, 2021 at 03:33:05PM +0530, Manivannan Sadhasivam wrote:
> On Tue, Oct 19, 2021 at 03:12:01PM +0300, Kalle Valo wrote:
> > Kalle Valo <kvalo@codeaurora.org> writes:
> > 
> > > (adding the new mhi list, yay)
> > >
> > > Hi Loic,
> > >
> > > Loic Poulain <loic.poulain@linaro.org> writes:
> > >
> > >>> Loic Poulain <loic.poulain@linaro.org> writes:
> > >>>
> > >>> > On Thu, 16 Sept 2021 at 10:00, Kalle Valo <kvalo@codeaurora.org> wrote:
> > >>>
> > >>> >> At the moment I'm running my tests with commit 020d3b26c07a reverted and
> > >>> >> everything works without problems. Is there a simple way to fix this? Or
> > >>> >> maybe we should just revert the commit? Commit log and kernel logs from
> > >>> >> a failing case below.
> > >>> >
> > >>> > Do you have log of success case?
> > >>>
> > >>> A log from a successful case in the end of email, using v5.15-rc1 plus
> > >>> revert of commit 020d3b26c07abe27.
> > >>>
> > >>> > To me, the device loses power, that is why MHI resuming is failing.
> > >>> > Normally the device should be properly recovered/reinitialized. Before
> > >>> > that patch the power loss was simply not detected (or handled at
> > >>> > higher stack level).
> > >>>
> > >>> Currently in ath11k we always keep the firmware running when in suspend,
> > >>> this is a workaround due to problems between mac80211 and MHI stack.
> > >>> IIRC the problem was something related MHI creating struct device during
> > >>> resume or something like that.
> > >>
> > >> Could you give a try with the attached patch? It should solve your
> > >> issue without breaking modem support.
> > >
> > > Sorry for taking so long, but I now tested your patch on top of
> > > v5.15-rc3 and, as expected, everything works as before with QCA6390 on
> > > NUC x86 testbox.
> > >
> > > Tested-by: Kalle Valo <kvalo@codeaurora.org>
> > 
> > I doubt we will find enough time to fully debug this mhi issue anytime
> > soon. Can we commit Loic's patch so that this regression is resolved?
> > 
> 
> Sorry no :( Eventhough Loic's patch is working, I want to understand the
> issue properly so that we could add a proper fix or patch the firmware
> if possible.
> 
> Let's try to get the debug logs as I requested.
> 

I'm able to reproduce the issue on my NUC. I'm still investigating on how to
properly fix this issue. Expect a patch soon.

Thanks,
Mani 

> Thanks,
> Mani
> 
> > At the moment I'm doing all my regression testing with commit
> > 020d3b26c07abe27 reverted. That's a risk, I would prefer to do my
> > testing without any hacks.
> > 
> > -- 
> > https://patchwork.kernel.org/project/linux-wireless/list/
> > 
> > https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
