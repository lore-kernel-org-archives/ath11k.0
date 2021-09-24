Return-Path: <SRS0=d2dB=OO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBAF7C433F5
	for <ath11k@archiver.kernel.org>; Fri, 24 Sep 2021 10:00:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B16EC60E54
	for <ath11k@archiver.kernel.org>; Fri, 24 Sep 2021 10:00:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B16EC60E54
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P6xQeMogM5cB99RQPOupDnb1MtH5CYEvHL/A5fy5rK8=; b=A3reh+HUibAbke
	D45jQDXWKs+KM5E/VCLpiGCxBeNaMX6M87iLzIviwT2v0uLeoYMXIHMfQ/qx09i+lPeKTZrYYxH74
	iMKthxS2sEW/OtTwwcNXA/E2nfAfs4UxpiQkhr9U4o4S2kW5Vtls1DSyeE/jxdhpItKg8SeeJsDUF
	6W5FjPYvA5FVIjlcnL5Ah3uI2xQzjPUizeUWH2m2yHC7gxyvHTZU2ra3Qpf0YInFSpWe+MN+7kv14
	ZNO03f+hHfdp0xb1SL5Q1zz0TbKfS3+6I4wXACmmezItR+AONSNbJave2x9LNn1TdvWO/aePq06YU
	i+SajBMVkIUy41JIFW/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTi0Y-00E1X8-L1; Fri, 24 Sep 2021 10:00:42 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTi0V-00E1Vm-Tx
 for ath11k@lists.infradead.org; Fri, 24 Sep 2021 10:00:41 +0000
Received: by mail-pg1-x52a.google.com with SMTP id h3so9385336pgb.7
 for <ath11k@lists.infradead.org>; Fri, 24 Sep 2021 03:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4vMQMisBtZM7XcTiorQkl1JxcgLI/TRL5gZOHXdOV3E=;
 b=qwydP1VOrJxnox75F1D8NMnpDrI8ksfDG0NgGcSOEDnix9AeVUWkcNqI/P1xHLHJqm
 A3L3ZJEAL8hLM6RT6jq0O1LQrlUSKPr8qpQJhHJo+p6teiulFYwv2AEj7E8dOJeNvuXW
 UVL0mbY/xitJd8g5epDHcI4GZXBMAgBKZdXQBZUUOBCm8J1S+ACZ5AWWAAGJvpT/kkL/
 nkxzXhsKbshQlRe5QjvxZ6F8XYpFh/ivjtOQAvAPEVtiPlurfMXMSxaXYnLnXooR2W2w
 H0lVDyhkXtQHBca4+9uU9D3WidYSQoOwuw7lzeVLENHJdzd8BVzfS1HsRl/cvtRnohLc
 p6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4vMQMisBtZM7XcTiorQkl1JxcgLI/TRL5gZOHXdOV3E=;
 b=1z2xh21FVIhl51mQ+ykC/0uxe72vCt6+1EUs+hfJQzv4yk5qxrYJmeJlYb70qOhg+h
 jvJjVX+9yIDVtm1Yh9+m3MCGXXKDOgxgQbSvuiZBRVBW+Mm1IQzl8PZ7Pr355L7yVmVs
 VMJ32C7MFDM1TsmJQMia5gvuR8YuHL9MaeVQXw6INfb1XuUFakzYRSXufckdw95JpayC
 dWLH2LPbKmcgFv0ohpqxsT/VUP/YJCuhcpTysCvxmms7r4tp2uTqUqF+5xU2E/brJwhI
 XC2ELB1xvR8lrnz19Ea60L0clAnxwnrjVT17YGWeHHLmzOWpy/JJkUzMyTBwxYRHbO2y
 wytQ==
X-Gm-Message-State: AOAM5335GfTqjpzvCe6oMTuaZ9/srEsVbYBl2gK5j5y6Ah+vx2oeBOMk
 ekdMZcFU7ZM3YsCoQc/Fs/yN
X-Google-Smtp-Source: ABdhPJwhSmGRcYlTGqj1+MU++RDDBntBGaII2yLpDeqa1IaBUCnpQs290DoxEcaPsYRdSIkCDfHREw==
X-Received: by 2002:a63:5252:: with SMTP id s18mr3048353pgl.94.1632477637829; 
 Fri, 24 Sep 2021 03:00:37 -0700 (PDT)
Received: from workstation ([120.138.12.62])
 by smtp.gmail.com with ESMTPSA id f144sm8399311pfa.24.2021.09.24.03.00.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 Sep 2021 03:00:37 -0700 (PDT)
Date: Fri, 24 Sep 2021 15:30:34 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Loic Poulain <loic.poulain@linaro.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, regressions@lists.linux.dev
Subject: Re: [regression] mhi: ath11k resume fails on some devices
Message-ID: <20210924100034.GC19050@workstation>
References: <871r5p0x2u.fsf@codeaurora.org>
 <CAMZdPi8UJLvBFQd8-nf-iHAQh8cEuihq97PUFfZ7Q=rxRQoPsg@mail.gmail.com>
 <877df6tlnq.fsf@codeaurora.org>
 <CAMZdPi8P7YZPhPir+WfS3cY_a7He1m2Pq2uqBhczPdEeoNRb0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMZdPi8P7YZPhPir+WfS3cY_a7He1m2Pq2uqBhczPdEeoNRb0Q@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_030039_997016_7EEE0A7A 
X-CRM114-Status: GOOD (  32.89  )
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

On Fri, Sep 24, 2021 at 11:43:55AM +0200, Loic Poulain wrote:
> Hi Kalle,
> 
> On Fri, 24 Sept 2021 at 10:36, Kalle Valo <kvalo@codeaurora.org> wrote:
> >
> > Loic Poulain <loic.poulain@linaro.org> writes:
> >
> > > Hi Kalle,
> > >
> > > On Thu, 16 Sept 2021 at 10:00, Kalle Valo <kvalo@codeaurora.org> wrote:
> > >>
> > >> Hi Loic and Mani,
> > >>
> > >> I hate to be the bearer of bad news again :)
> > >>
> > >> I noticed already a while ago that commit 020d3b26c07a ("bus: mhi: Early
> > >> MHI resume failure in non M3 state"), introduced in v5.13-rc1, broke
> > >> ath11k resume on my NUC x86 testbox using QCA6390. Interestingly enough
> > >> Dell XPS 13 9310 laptop (with QCA6390 as well) does not have this
> > >> problem, I only see the problem on the NUC. I do not know what's causing
> > >> this difference.
> > >
> > > I suppose the NUC is current PCI-Express power during suspend while
> > > the laptop maintains PCIe/M2 power.
> >
> > Sorry, I'm not able to parse that sentence. Can you elaborate more?
> 
> Ouch, yes, I wanted to say that the NUC does not maintain the power of
> PCI express during suspend (leading to PCI D3cold state), whereas the
> laptop maintains the power of the M2 card... well, not sure now I see
> your logs.
> 
> >
> > >> At the moment I'm running my tests with commit 020d3b26c07a reverted and
> > >> everything works without problems. Is there a simple way to fix this? Or
> > >> maybe we should just revert the commit? Commit log and kernel logs from
> > >> a failing case below.
> > >
> > > Do you have log of success case?
> >
> > A log from a successful case in the end of email, using v5.15-rc1 plus
> > revert of commit 020d3b26c07abe27.
> >
> > > To me, the device loses power, that is why MHI resuming is failing.
> > > Normally the device should be properly recovered/reinitialized. Before
> > > that patch the power loss was simply not detected (or handled at
> > > higher stack level).
> >
> > Currently in ath11k we always keep the firmware running when in suspend,
> > this is a workaround due to problems between mac80211 and MHI stack.
> > IIRC the problem was something related MHI creating struct device during
> > resume or something like that.
> 
> Could you give a try with the attached patch? It should solve your
> issue without breaking modem support.
> 

It will... But we should first try to see what is causing the device to
be in MHI RESET state. We can't add a force resume case without knowing
the rootcause.

And for workaround, we can proceed resume if device is in RESET state
adding a comment on why. But let's first get the MHI debug logs.

> Regards,
> Loic



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
