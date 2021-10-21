Return-Path: <SRS0=+Nw2=PJ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 208CCC433F5
	for <ath11k@archiver.kernel.org>; Thu, 21 Oct 2021 10:01:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF47D6108E
	for <ath11k@archiver.kernel.org>; Thu, 21 Oct 2021 10:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BF47D6108E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u25OB5oH9ZlmtrCe0cK6BdLsuuervP9YMPNjL26Cdzw=; b=TNDyXXPkb+4hy8
	C/H+Y4BfPPZxfb1cdIyqrP8LYA5Oh1m+oLjCNxK/1SD9xlNmDCK0KTzl7AekUgXpkGmWtpodxn3dy
	UeBf8B11xNn+x3GOZC38VdMySJcUYu0FejMuzu55AsyigvjTCIDNhtcGx0V3P0RnIQxx8oqj9uCG/
	GF1opEF6lpHUh8RmTiLgZCExwT8OWUi4X+rWEzJlYZphRhToQ7XpuvWXQ5A69E1wrPB+AqozgPhd2
	FOhXepKS2IQtdKpZhOCz8989oYBWwvrrdM2F8Sg89gdm9iejHBxrLWUxeNUmvAw0c0TQB7XAJy26t
	UhbfpUuVtOFOplYMs9aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdUsy-0078aT-TS; Thu, 21 Oct 2021 10:01:20 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdUsw-0078Yx-2X
 for ath11k@lists.infradead.org; Thu, 21 Oct 2021 10:01:19 +0000
Received: by mail-pf1-x433.google.com with SMTP id d9so164320pfl.6
 for <ath11k@lists.infradead.org>; Thu, 21 Oct 2021 03:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=1hGQyf5rPoZMxlQ1aLuePLA0bIy/CXC3D2eGNLyDxIQ=;
 b=LgD+MFA0VgMp3D2jgO6wM+Zvee6Bsy+fpa54RY3R+QTDElX3sL3drNdQaakSXKc0g+
 vyuI4i7RveFDa2CMPCgq8ox9Ca5KQO2Puj/sVGvKvQGs+w9mEt5BYNE7pzTHFn/twwNq
 14QKhEyH0i4NPyRZynrQwhL7XmOppkIrob0lU90iPvqbJLtc8jD2Bm/NVMNOQgcNTP+V
 asxAKCTgpN+Qm7OikuEY7SOYzkDu9RKeLjGNfVTwpSvw0dYL9nbGlm91NTnFk+/096+C
 dEQZ6wcFnjqCS67TA/FTq/Pf8Tnnq2rbBCDJSr0rGh9hfqSKYGNNTVC/JanqrScK8jbv
 ierA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1hGQyf5rPoZMxlQ1aLuePLA0bIy/CXC3D2eGNLyDxIQ=;
 b=dK1kaYJd6WozHVFgWr+CPtjL7JnavbGb8TnxXLss3dItj1LzNoSRNRDSr+AQzG/Cr9
 +NYvEwEz5ba7aRY4r206ly1d32dKt4fe2XCeXmybSrjeFhScEFO1x0afpPtZ4Suqj8tg
 /EAVoB7IOXSt7gulV1S5DTzqeAjDuQ+Gr2GuxnHfsf8ywhY4uL4oL5b9ZbSYl9H64TzX
 FCEK6w2ynnaupCgWtErL02eF5v5cG85439vLqHxekYYU4SXZ/DbTP0MLWfN0zOHDHco+
 VTHDPjrPW4/09qvaHMyIXvSXFVWzWyV1EJIXFTA6tdEuy5LF2BFN9+4mRVKu6RsdOLzr
 T+tw==
X-Gm-Message-State: AOAM530nU6AQp+nTQpnmG2z6TfDLTKlCTAiGZDkmCgl/UjDkeb9NEwAa
 ykzPP47h++FM4OYxsY0nqM9q
X-Google-Smtp-Source: ABdhPJwqwkiwpdpKBroxr8/GXh49GuysRlvA6YUSvh3qNewJDOS678tfSRj3DNxO+EWI4uKU91UUdg==
X-Received: by 2002:aa7:811a:0:b0:44c:b9ef:f618 with SMTP id
 b26-20020aa7811a000000b0044cb9eff618mr4446153pfi.9.1634810475933; 
 Thu, 21 Oct 2021 03:01:15 -0700 (PDT)
Received: from workstation ([202.21.43.20])
 by smtp.gmail.com with ESMTPSA id t14sm4618518pga.62.2021.10.21.03.01.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 21 Oct 2021 03:01:15 -0700 (PDT)
Date: Thu, 21 Oct 2021 15:31:11 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Carl Huang <cjhuang@codeaurora.org>,
 Loic Poulain <loic.poulain@linaro.org>, ath11k@lists.infradead.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-wireless@vger.kernel.org, regressions@lists.linux.dev,
 mhi <mhi@lists.linux.dev>
Subject: Re: [regression] mhi: ath11k resume fails on some devices
Message-ID: <20211021100111.GC7580@workstation>
References: <20210916111218.GA12918@thinkpad>
 <CAMZdPi94607mZorp+Zmkw3seWXak6p9Jr05CQ5hhfgKQoG8n7Q@mail.gmail.com>
 <20210916163529.GA9027@thinkpad> <87k0jgxyjp.fsf@codeaurora.org>
 <20210916171927.GB9027@thinkpad>
 <b7c0906041dcafb43be215bd4f55326a@codeaurora.org>
 <20210923085926.GD6083@thinkpad> <8735putk82.fsf@codeaurora.org>
 <20210924095755.GB19050@workstation>
 <874k9t9n13.fsf@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <874k9t9n13.fsf@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_030118_201736_D22349FB 
X-CRM114-Status: GOOD (  25.26  )
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

On Thu, Oct 07, 2021 at 12:55:52PM +0300, Kalle Valo wrote:
> (adding also mhi list)
> 
> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:
> 
> > On Fri, Sep 24, 2021 at 12:07:41PM +0300, Kalle Valo wrote:
> >> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:
> >> 
> >> > For aid debugging, please see the state the device is in during mhi_pm_resume().
> >> > You can use below diff:
> >> >
> >> > diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> >> > index fb99e3727155..482d55dd209e 100644
> >> > --- a/drivers/bus/mhi/core/pm.c
> >> > +++ b/drivers/bus/mhi/core/pm.c
> >> > @@ -898,6 +898,9 @@ int mhi_pm_resume(struct mhi_controller *mhi_cntrl)
> >> >         if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state))
> >> >                 return -EIO;
> >> >  
> >> > +       dev_info(dev, "Device state: %s\n",
> >> > +                TO_MHI_STATE_STR(mhi_get_mhi_state(mhi_cntrl)));
> >> > +
> >> >         if (mhi_get_mhi_state(mhi_cntrl) != MHI_STATE_M3)
> >> >                 return -EINVAL;
> >> 
> >> This is what I get with my NUC testbox:
> >> 
> >> [  970.488202] ACPI: EC: event unblocked
> >> [  970.492484] hpet: Lost 1587 RTC interrupts
> >> [  970.492749] mhi mhi0: Device state: RESET
> >
> > Looks like the MHI device went into RESET state! It also looks to be a
> > firmware thing. But let's nail this down before adding any workaround in
> > the MHI stack.
> >
> > Can you also rebuild the kernel with MHI debug enabled and capture the
> > logs in faliure case?
> 
> So what I should exactly do to enable debug messages?
> 
> I have this in my Kconfig:
> 
> CONFIG_MHI_BUS=m
> # CONFIG_MHI_BUS_DEBUG is not set
> # CONFIG_MHI_BUS_PCI_GENERIC is not set
> 
> And AFAICS CONFIG_MHI_BUS_DEBUG only enables the debugfs interface, I
> doubt you meant that.
> 

No. You should enable the dev_dbg messages in MHI core by adding the -DDEBUG
flag to the Makefile or by CONFIG_DYNAMIC_DEBUG.

Thanks,
Mani

> -- 
> https://patchwork.kernel.org/project/linux-wireless/list/
> 
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
