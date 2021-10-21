Return-Path: <SRS0=+Nw2=PJ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6F64C433EF
	for <ath11k@archiver.kernel.org>; Thu, 21 Oct 2021 10:03:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E88B610D0
	for <ath11k@archiver.kernel.org>; Thu, 21 Oct 2021 10:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9E88B610D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4T2ApnoZ+JdyZwzWh77n/9PRC9feB+ieAOcjJW3oS+4=; b=m1fpM+SJisp1ZE
	MdGz+4NjPRippqB2VYoDdH7BIy2DwhyJwGJQb7IrqsbCeO7Vz+/P8F1jQziGlN14GwZFd92zvLKnI
	mg6Maap6wvHkhZgnJqZehY0BjNAa2Izz4rip4iylPgyeR8qej6ilb3K8jfyf7PYJ7nPQNbBomfXJa
	fOzYbc/ik7CLyin2lkZEKZDQJjrKRjzer4VQPe8BScXKNZZ+ZhmzT9prGmIZQuEnjWJfF2q+hRwdr
	7Y5vWo7t1UiICg740BEjyjXry5HXUi3UDgwFWHPORuxVW+c9mZFlfxAubZNo2zH/69QIOuR71WhMY
	Wfq85lKvhLejhSip/xKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdUun-0078nz-Eg; Thu, 21 Oct 2021 10:03:13 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdUuj-0078md-Qd
 for ath11k@lists.infradead.org; Thu, 21 Oct 2021 10:03:11 +0000
Received: by mail-pl1-x635.google.com with SMTP id y4so85393plb.0
 for <ath11k@lists.infradead.org>; Thu, 21 Oct 2021 03:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=dyIzNS94yVFn26I1+Vs+X45Vc6HJjjNBIVAQhUczpSM=;
 b=VWDF7tT1/ERaiy+hd0f6TMm9xFOihJIvjzaya/s3ODTaGnjpSPJdbYprA4nNTrVcbD
 bGlCes4+wktbJ3qFkdxKX+pF3DSJZ3pwm1T+rFQES8zBRpNnOrXkgKXHJ2bue3r3p4G+
 H69wUbUsY4TqDGOuFqhQvBvO6pAo8G6ZO6CEnUPDxxUOz6DdGTmalk5Q68ba/STSUsLs
 cds7OJH3l3frdAhraIIVaAAqHEX+fjg63+fTS/Iv2xbAF5DLtfQp8/2JJG6vSVgCrzCp
 biMIQFzCz+kKkNEb+g8wP/QnInQP1CRNTU7ldpMMsO8ZEgAaQcc58to35Vlx9L2XWw8h
 b6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dyIzNS94yVFn26I1+Vs+X45Vc6HJjjNBIVAQhUczpSM=;
 b=rwl6sIxGhq+0h8CjGAbd9JpGK912dra5apGBjDIq/a8iitqZFSh1xgJLvw8evxyAFe
 RNY+yP3iAt5YZP6F1hPRazCamhFF+pwq+URgrzSPSa1D7vpEHWZMByRxWRf4lUeqzLt3
 7Tm/+ywNafXC3K8RqFqSsdtyjP9Vcq/nxT/u/dkHzCZQJOYQ12KFAMN6JcK7RPULVYo5
 0hWbDAYjyFIlxVgJ1ae0Vv8SoxIsjEp0bK1u+EW0SmyT9WyXfzK0+IY2Yd5aJRWBZ2u9
 gUVCiSA8QFNCPEXY6O52EwxuTHgDAyWmwIM8r18o6OLi8fUlvsb6+oXDQDPo0GKurpwY
 PE+Q==
X-Gm-Message-State: AOAM530jvncYf5cSMR0H3HPMpkMt6Uw+tM9a/U0JSFB42LTD/riSTgYL
 Ckd4IuTYz90ZxvlzRnC00635
X-Google-Smtp-Source: ABdhPJzzDD1MByFwNyBzIySK4PYWZmbpJVSVMenRc0Dxbbe1gHD8Vc4vuRM4kZ/i3/h7/Lf0nSzXIA==
X-Received: by 2002:a17:90b:1196:: with SMTP id
 gk22mr5654164pjb.126.1634810589002; 
 Thu, 21 Oct 2021 03:03:09 -0700 (PDT)
Received: from workstation ([202.21.43.20])
 by smtp.gmail.com with ESMTPSA id f33sm8717545pjk.42.2021.10.21.03.03.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 21 Oct 2021 03:03:08 -0700 (PDT)
Date: Thu, 21 Oct 2021 15:33:05 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Loic Poulain <loic.poulain@linaro.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 regressions@lists.linux.dev, mhi <mhi@lists.linux.dev>
Subject: Re: [regression] mhi: ath11k resume fails on some devices
Message-ID: <20211021100305.GD7580@workstation>
References: <871r5p0x2u.fsf@codeaurora.org>
 <CAMZdPi8UJLvBFQd8-nf-iHAQh8cEuihq97PUFfZ7Q=rxRQoPsg@mail.gmail.com>
 <877df6tlnq.fsf@codeaurora.org>
 <CAMZdPi8P7YZPhPir+WfS3cY_a7He1m2Pq2uqBhczPdEeoNRb0Q@mail.gmail.com>
 <87a6jl9ndo.fsf@codeaurora.org> <87ee8hgqni.fsf@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87ee8hgqni.fsf@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_030309_895467_8BF9747E 
X-CRM114-Status: GOOD (  24.43  )
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

On Tue, Oct 19, 2021 at 03:12:01PM +0300, Kalle Valo wrote:
> Kalle Valo <kvalo@codeaurora.org> writes:
> 
> > (adding the new mhi list, yay)
> >
> > Hi Loic,
> >
> > Loic Poulain <loic.poulain@linaro.org> writes:
> >
> >>> Loic Poulain <loic.poulain@linaro.org> writes:
> >>>
> >>> > On Thu, 16 Sept 2021 at 10:00, Kalle Valo <kvalo@codeaurora.org> wrote:
> >>>
> >>> >> At the moment I'm running my tests with commit 020d3b26c07a reverted and
> >>> >> everything works without problems. Is there a simple way to fix this? Or
> >>> >> maybe we should just revert the commit? Commit log and kernel logs from
> >>> >> a failing case below.
> >>> >
> >>> > Do you have log of success case?
> >>>
> >>> A log from a successful case in the end of email, using v5.15-rc1 plus
> >>> revert of commit 020d3b26c07abe27.
> >>>
> >>> > To me, the device loses power, that is why MHI resuming is failing.
> >>> > Normally the device should be properly recovered/reinitialized. Before
> >>> > that patch the power loss was simply not detected (or handled at
> >>> > higher stack level).
> >>>
> >>> Currently in ath11k we always keep the firmware running when in suspend,
> >>> this is a workaround due to problems between mac80211 and MHI stack.
> >>> IIRC the problem was something related MHI creating struct device during
> >>> resume or something like that.
> >>
> >> Could you give a try with the attached patch? It should solve your
> >> issue without breaking modem support.
> >
> > Sorry for taking so long, but I now tested your patch on top of
> > v5.15-rc3 and, as expected, everything works as before with QCA6390 on
> > NUC x86 testbox.
> >
> > Tested-by: Kalle Valo <kvalo@codeaurora.org>
> 
> I doubt we will find enough time to fully debug this mhi issue anytime
> soon. Can we commit Loic's patch so that this regression is resolved?
> 

Sorry no :( Eventhough Loic's patch is working, I want to understand the
issue properly so that we could add a proper fix or patch the firmware
if possible.

Let's try to get the debug logs as I requested.

Thanks,
Mani

> At the moment I'm doing all my regression testing with commit
> 020d3b26c07abe27 reverted. That's a risk, I would prefer to do my
> testing without any hacks.
> 
> -- 
> https://patchwork.kernel.org/project/linux-wireless/list/
> 
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
