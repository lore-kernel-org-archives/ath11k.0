Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845D9C433F5
	for <ath11k@archiver.kernel.org>; Wed,  8 Dec 2021 08:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ljW3+XHs3jS3BX0b8Otzj9rs5QdAG6Uq1jBDWLc67kw=; b=iTUY5xLIg2s0Qh
	RctUdVjLejNkhwFJhLC4T9C/Rs90GI7hjEX/3+tahoEGP58xEVaZKAV+hISfU5smrQe/6TL3+d3dm
	aqVa+71SfdK82ZMUpW0WlLhCTgLowG5tkpwb+bXxchxqD62RdF0RG3q4V+iJUDiJv7lWthqhVzCZt
	QpU1DD+lXa6cEDTK9AHoSPPa5BVYSG/lHZzxz5Vx35YiVKCnLSZ1nkggqDFAwrLSe0+vJz1G5CEb3
	nlm9gdnkQDnDJNlz3jaLTx94/0uyP6e0U2/pji13NRzNUApZ4+73Ur6oJFbTbAW6RA5OZ6fmw0L4G
	6cDtjqbtqSsK78pV1u0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1musLi-00Bhe9-Kk; Wed, 08 Dec 2021 08:30:50 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1musLg-00BhdT-Cj
 for ath11k@lists.infradead.org; Wed, 08 Dec 2021 08:30:50 +0000
Received: by mail-pg1-x535.google.com with SMTP id r138so1415043pgr.13
 for <ath11k@lists.infradead.org>; Wed, 08 Dec 2021 00:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RRzI4Iei17Ahggjstaqb1wov493fOuSguTH2Wc+bkwI=;
 b=ZlrqYumsXJ26Tvh0dTMnaSXivpjkDZvaj8K4es5g8PFBhjcf2pkZlVXbThCYAHMYYC
 7RLoLdhOwvUfYhlBz1G8UAR0hw2PN/hACdXrH8Nmcw9ZpvUhons9s9mA8jE3crhs75Fm
 /wcNAZ27E9xS/UXTiCeNQU7zq/5wDyZexd0kUoHpBeIy7tqdxGtuCdPzhkDTTwUnis6R
 se8Tanwa/vMQhFUrN+gpQRIM6zEWKTcyE19eNULgZb/000Y4GhCulAe9rBfskrk2pTdq
 Pp1NrDl5o6c2uCpfLk1++rDpJNB6NdRNw+D56AJbKnOx/rsxrSEE2v3J1sV/ZJHkX4gC
 69VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RRzI4Iei17Ahggjstaqb1wov493fOuSguTH2Wc+bkwI=;
 b=Zxp7SYqnJaqVd7Ik02g/eZhKBl1wWUrB3IKTpeZG278SEqhqSJ7vH3GTMJS13loYde
 Y5fJ8im7jFlyUIj9s2LWY2HKukgmJUQb4UpbQiKwF8Sqty5/kEz85tqelC2gY7WqLF3Y
 wUlx2CWevKEzKg/Ka5TKy+ss7e7Hcsaauhc9nLyVQszvjjcBMXwJuj/0z1v0BTi7hXss
 7U0upiMPQEkxSuL+Rp0jiz9w1/awSVUbz50S9nyC5Pq2DynJFP3hVyotP4STA8pA5sss
 7/Bdbp2HGw0ohz8RJ1gF+z8iqG/LXAviwoOkRG1qctc39v35eBJ0TcrOmCySWmnYA5zT
 AnlA==
X-Gm-Message-State: AOAM5313FpuZzxRwli2rgpmoree07t4WlIzEiF5F7c3zmBpp4xS7K5sU
 QJBQDUN4bLeG4gE41J3dXW2L
X-Google-Smtp-Source: ABdhPJxGzy9Z2ZMkn1bf7beooiLm6AWWW1bSqP0UhkmlyfZ2EcXB2dbbvnFb/xvteJJ/lcrb/FdDHw==
X-Received: by 2002:a63:5b24:: with SMTP id p36mr15366637pgb.258.1638952244983; 
 Wed, 08 Dec 2021 00:30:44 -0800 (PST)
Received: from thinkpad ([117.202.189.59])
 by smtp.gmail.com with ESMTPSA id s19sm2408544pfu.104.2021.12.08.00.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 00:30:44 -0800 (PST)
Date: Wed, 8 Dec 2021 14:00:37 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Hemant Kumar <hemantk@codeaurora.org>
Cc: mhi@lists.linux.dev, bbhatt@codeaurora.org, loic.poulain@linaro.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 kvalo@codeaurora.org, stable@vger.kernel.org,
 Pengyu Ma <mapengyu@gmail.com>
Subject: Re: [PATCH] bus: mhi: core: Add support for forced PM resume
Message-ID: <20211208083037.GD70121@thinkpad>
References: <20211206161059.107007-1-manivannan.sadhasivam@linaro.org>
 <7eb05d7c-ddda-5ec1-73a0-e696d2b5a236@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7eb05d7c-ddda-5ec1-73a0-e696d2b5a236@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_003048_525680_2640452F 
X-CRM114-Status: GOOD (  30.10  )
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

On Tue, Dec 07, 2021 at 03:41:42PM -0800, Hemant Kumar wrote:
> Hi Mani,
> 
> On 12/6/2021 8:10 AM, Manivannan Sadhasivam wrote:
> > From: Loic Poulain <loic.poulain@linaro.org>
> > 
> > For whatever reason, some devices like QCA6390, WCN6855 using ath11k
> > are not in M3 state during PM resume, but still functional. The
> > mhi_pm_resume should then not fail in those cases, and let the higher
> > level device specific stack continue resuming process.
> > 
> > Add a new parameter to mhi_pm_resume, to force resuming, whatever the
> > current MHI state is. This fixes a regression with non functional
> > ath11k WiFi after suspend/resume cycle on some machines.
> > 
> > Bug report: https://bugzilla.kernel.org/show_bug.cgi?id=214179
> > 
> > Cc: stable@vger.kernel.org #5.13
> > Fixes: 020d3b26c07a ("bus: mhi: Early MHI resume failure in non M3 state")
> > Reported-by: Kalle Valo <kvalo@codeaurora.org>
> > Reported-by: Pengyu Ma <mapengyu@gmail.com>
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > [mani: Added comment, bug report, added reported-by tags and CCed stable]
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >   drivers/bus/mhi/core/pm.c             | 10 +++++++---
> >   drivers/bus/mhi/pci_generic.c         |  2 +-
> >   drivers/net/wireless/ath/ath11k/mhi.c |  6 +++++-
> >   include/linux/mhi.h                   |  3 ++-
> >   4 files changed, 15 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> > index 7464f5d09973..4ddd266e042e 100644
> > --- a/drivers/bus/mhi/core/pm.c
> > +++ b/drivers/bus/mhi/core/pm.c
> > @@ -881,7 +881,7 @@ int mhi_pm_suspend(struct mhi_controller *mhi_cntrl)
> >   }
> >   EXPORT_SYMBOL_GPL(mhi_pm_suspend);
> > -int mhi_pm_resume(struct mhi_controller *mhi_cntrl)
> > +int mhi_pm_resume(struct mhi_controller *mhi_cntrl, bool force)
> >   {
> >   	struct mhi_chan *itr, *tmp;
> >   	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> > @@ -898,8 +898,12 @@ int mhi_pm_resume(struct mhi_controller *mhi_cntrl)
> >   	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state))
> >   		return -EIO;
> > -	if (mhi_get_mhi_state(mhi_cntrl) != MHI_STATE_M3)
> > -		return -EINVAL;
> > +	if (mhi_get_mhi_state(mhi_cntrl) != MHI_STATE_M3) {
> 	in case if mhi_get_mhi_state(mhi_cntrl) returns SYS_ERR (assuming while
> doing this check SYS_ERR is set) do we still want to continue pm resume when
> force is true? Just want to make sure SYS_ERR handling with and without this
> change remains the same or atleast does not cause any regression with this
> change. or if we need to continue pm resume only for MHI_STATE_RESET when
> MHI_STATE_M3 is not set?

SYS_ERR state is a valid case while resuming from suspend. The "force" flag is
supposed to be used by controllers that goes to a weird state like RESET. If we
just add check for RESET, then we might get another scenario in future. That's
why the "force" flag made sense to me.

If we want to handle SYS_ERR then we need to check for that before M3 and that
can be done in a separate patch. But since we didn't hit this scenario till now,
let's handle it later if needed.

Thanks,
Mani

> > +		dev_warn(dev, "Resuming from non M3 state (%s)\n",
> > +			 TO_MHI_STATE_STR(mhi_get_mhi_state(mhi_cntrl)));
> > +		if (!force)
> > +			return -EINVAL;
> > +	}
> [..]
> 
> Thanks,
> Hemant
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a
> Linux Foundation Collaborative Project

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
