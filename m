Return-Path: <SRS0=7XD4=FX=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E1FC4361B
	for <ath11k@archiver.kernel.org>; Sat, 19 Dec 2020 21:46:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9F7723426
	for <ath11k@archiver.kernel.org>; Sat, 19 Dec 2020 21:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9F7723426
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=technolu.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/W3w5pCPsxCy9wvQjzCSfho10po19F9GunM/XxaUsTM=; b=aGGx+3EFne9H2s+I2pyU3+AtJ
	qWfX7aOvDHnPfHt49RZ+KiIP47B1ELb1qVJv+ltnv42p1KSec9NIaMOxCqlunBSzaFCBM33LqkG6w
	4BrLM549CdSTLqXfOheM7dJMIYuDPi9s7rkciKAYrIkDeq65vGjkELvl7tXMc5MrMIVDrs3ld9sCy
	7wQV2y1DlqfSI/AluBksgsDqwl7WSZiDnXvlJK2tv55h7nL8Wx3b+JJAMuzrqj06tXSdTCUuBYLu2
	1UobxiIpmp3JSXKGDaWOI/DgGeArkmZ4Tk3hxPlt+L1Q2+oy1dgYVw6/DfG6HSAKf/4HYb9I4169Q
	Qdupi+FFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqk3q-0000qa-8y; Sat, 19 Dec 2020 21:46:46 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqk3o-0000ps-Gy
 for ath11k@merlin.infradead.org; Sat, 19 Dec 2020 21:46:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+boP44OHMhhAID6N47EnoAujRTMgjEBwyDBmFk2Bn1U=; b=nBQtGZEI6NHeLsKQ6H3HbLWshd
 o766X6qMsWrEP8JVWhAkmFkMp/KPway4c4OBOORPlV99JPdG6jcAWOf0Bn9zUaYgoBrhzYYumurS+
 qnIE5RZhdLZT+9eHopzr40vPwcGmLtfm3jmctNtwyPinw2+LclqPa24uoxJGHUTLWAF9En7k0bvqg
 IwaYlVeUvAxH+Fvg/W8WDSmE9sz602mANdzfpYL36++Q+JajY+VvL21zbusLrBn3T6+om45lanRvE
 M+LLZAEHouYJd9ioJPixop6eWCAoZetaW1z32FO3h2d3aPCgRe+C30sX6EAittgqqJJvZQruXFRu5
 wokbiEug==;
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqjt6-0006Wr-9A
 for ath11k@lists.infradead.org; Sat, 19 Dec 2020 21:35:43 +0000
Received: by mail-ed1-x52f.google.com with SMTP id b2so6004453edm.3
 for <ath11k@lists.infradead.org>; Sat, 19 Dec 2020 13:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=technolu-st.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+boP44OHMhhAID6N47EnoAujRTMgjEBwyDBmFk2Bn1U=;
 b=AvvuRLttlHw8QqSSp9PjZijNk/0n0w51CiUhgJyzn3qTEXdQqaLQDJcGWYDLbvXtBp
 yzIpLIVX8SjdjnOMXFfOB8WVtpjMxls+vS4tCc1XDEBM7Hkurs1d+jZIHuaAJw78dwdA
 zRA7FG97JicVN5bEiKqwIN5qu3Lae0nztYJ6GkUz2EjDZTKyo4MUNqsUfZ8mByCjoSaw
 FN6Jyay/Ob0NCb62Fd7WF+420hItKPxTsbbUQtXIv3jMfthM8um3SCVTkIlKduP4yxYN
 PUfza6tgCD+fqhKH5SWrwgq8rVlS7ObTQYmrnrDRsVO1Zh1tobxbr3RrHEAKm8zypMEE
 JSNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+boP44OHMhhAID6N47EnoAujRTMgjEBwyDBmFk2Bn1U=;
 b=ROxqYcxZyzvZa6N+WWWNHbWSea7kFshE8pLw3ZvJFioB0YOS9/HkqAGo260J0shw+I
 CxhiAg+OKKfGl+7Nn17o7hIkzwYJhaS1Vk4O0lTBpEe6Y1YVVl0X7dERk2/aMiICCgx2
 X+/wPXH8pJfWPsS49YPBCGk//2iND6SpSzNHRp8Ru4jhJJixGR4Lhm9ifDgj759VMWaO
 FZZGrn/qeDgrNcEpN9BMhYl9/Y0aKQL9uI4FTq2ESYta+bAKmwSmf/xAhXhxdJkoAnhn
 OMb1MQ8k5bbUMT9MVh/se9ldp9ONE1UfJUmPY41aJWlxtXqShLxB/pomOQDkzZuxZtgQ
 bdEw==
X-Gm-Message-State: AOAM533dIMelSCED2uuGEuMgrSMiGhD109fLSLIXwprpyBAwdQmm/MX/
 rIqSypV6QhOcBp7WBBiGVXrR9NrfnoPdYm0eiKZ5PQ==
X-Google-Smtp-Source: ABdhPJxjhgkSXI7Lf1aGUA45r6xtayEFdBSk/6t0JPzVRYbNk3B8Iz9lvjnAkRljJGDsdyyF7slwX5Oy6wSPnYXsHNo=
X-Received: by 2002:a50:ed04:: with SMTP id j4mr10484633eds.84.1608413674408; 
 Sat, 19 Dec 2020 13:34:34 -0800 (PST)
MIME-Version: 1.0
References: <87pn3axhm1.fsf@codeaurora.org> <20201217095302.GA4640@work>
In-Reply-To: <20201217095302.GA4640@work>
From: wi nk <wink@technolu.st>
Date: Sat, 19 Dec 2020 22:34:23 +0100
Message-ID: <CAHUdJJX2fW0KigSgMT03PkCQKQyya4ZiRHrO4iopOS2GzT6NWA@mail.gmail.com>
Subject: Re: ath11k: crashes with 1 MSI vector, workaround disable MHI M2 state
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201219_213540_462455_07B82969 
X-CRM114-Status: GOOD (  22.89  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: Stephen Liang <stephenliang7@gmail.com>,
 Jeffrey Hugo <jhugo@codeaurora.org>, Carl Huang <cjhuang@codeaurora.org>,
 Bhaumik Bhatt <bbhatt@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Hemant Kumar <hemantk@codeaurora.org>, ath11k@lists.infradead.org,
 Kalle Valo <kvalo@codeaurora.org>, Mitchell Nordine <mail@mitchellnordine.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Thu, Dec 17, 2020 at 10:53 AM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> Hi Kalle,
>
> On Wed, Dec 16, 2020 at 10:47:18AM +0200, Kalle Valo wrote:
> > Hi MHI devs,
> >
>
> [...]
>
> > After extensive debugging from wink he found out that disabling M2 state
> > makes the all problems go away:
> >
> > --- a/drivers/bus/mhi/core/pm.c
> > +++ b/drivers/bus/mhi/core/pm.c
> > @@ -55,12 +55,12 @@ static struct mhi_pm_transitions const dev_state_transitions[] = {
> >         },
> >         {
> >                 MHI_PM_M0,
> > -               MHI_PM_M0 | MHI_PM_M2 | MHI_PM_M3_ENTER |
> > +               MHI_PM_M0 | MHI_PM_M3_ENTER |
> >                 MHI_PM_SYS_ERR_DETECT | MHI_PM_SHUTDOWN_PROCESS |
> >                 MHI_PM_LD_ERR_FATAL_DETECT | MHI_PM_FW_DL_ERR
> >         },
> >         {
> > -               MHI_PM_M2,
> > +               MHI_PM_M0,
> >                 MHI_PM_M0 | MHI_PM_SYS_ERR_DETECT | MHI_PM_SHUTDOWN_PROCESS |
> >                 MHI_PM_LD_ERR_FATAL_DETECT
> >         },
> >
> > And indeed now we have numerous people reporting that with this
> > workaround ath11k is stable on their Dell XPS 13 9310 laptops. What on
> > earth could cause these kernel crashes/interrupt storms? And why is it
> > visible only on Dell laptops? Why does disabling M2 state fix it?
> >
>
> This is related to the ASPM state of the PCIe bus. In the meantime, I'd
> suggest to turn off ASPM using "pcie_aspm=off" in the kernel command
> line so that the MHI bus stays in M0.
>
> For debugging this issue, can someone enable debug logs for MHI and share
> the dmesg output (with ASPM enabled ofc)?
>
> Thanks,
> Mani

Hi Mani,

  Thanks for the information and ideas.  I tried to disable ASPM with
the kernel parameter you mentioned, that didn't seem to work, so I
removed ASPM support from my kernel altogether.  I still see the
adapter in the M1 state, which with my patch would've gone to M2 had
it not been disabled.  Is ASPM the only thing that will trigger the M*
transitions?  Would it require a transition to M2 regardless of
settings (maybe that's why it tried)?  The MHI dmesg output is pretty
consistent when it fails, it looks like this:
https://i.imgur.com/0XExack.jpg .  You can also see it in the mp4's
I've placed here:
https://drive.google.com/drive/folders/1wvxZI5XtwPSrm0-6-Ov50cUfqBXSXeNz?usp=sharing
.  Also note that the failure isn't deterministic, sometimes the
transition to M2 will succeed and everything works.

Thanks!

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
