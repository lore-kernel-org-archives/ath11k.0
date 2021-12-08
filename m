Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 186F7C433F5
	for <ath11k@archiver.kernel.org>; Wed,  8 Dec 2021 09:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=++qH4QOSizD29/I9rAxUspEFZMzRK0xG3nD1sRgxB7A=; b=dsQBCBaU7jtYXY
	5Rp+lfQSC587FoeQZo9oORKnoBfzBhie/QzkgFgTZxsJZHWYiT0iythoNtA2o+2SxEk0ARa5TQBkm
	1N73JhTt5D8uxHFbHvq5IGAT5QtHw1JWf8D/3RJOYkNJ/bPinNnqaDTD5P1XDuM8UbNQZHskwaHpL
	1iKxAms79V6u3wfByZ51VWuqo0oxkP4JKYE0FY0HdtJsNdacTs3fVxh1jkXjUThtM+6/vu4ccBWKh
	vjZ0pDRKlp7kBN9/3FKX9Zf6mdUGkCOoqq2HgXjW/7awe2pY7/XmvvTXYnH8vMZKT8Z5UuQJLZB3i
	nkdXJXp/c14ASNmIl6/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mutRO-00BwgZ-2z; Wed, 08 Dec 2021 09:40:46 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mutRL-00Bwfc-3I
 for ath11k@lists.infradead.org; Wed, 08 Dec 2021 09:40:44 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 j6-20020a17090a588600b001a78a5ce46aso3994527pji.0
 for <ath11k@lists.infradead.org>; Wed, 08 Dec 2021 01:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uWzgpmLO9VHXp6lkhDz4fGQuJhk+6AV1KCdyKpRVolA=;
 b=eklJrKPspZKgFntWvR8NP54NwQ8qG9W7uiXo01EKKwoa95j2iAUFx3U7hp1/NRj0Hk
 pMzMbCnYAeN6rcmH8z0OoZ9IrY3Vn8oXyN2v560dOkdSDmjglk83e3k8FXyfqczZ5CIw
 t9hQ0m3WCP3YpUyUBzvUpDZ8Z3tZvQ6z6Gh3183oI0URu+IM+mgkpJ4i94RqgMxp5Pok
 8bLc1kzZ64MmWeZr6PhCHsJ8jsnAmvYw/SMN8KPYzC8093jmt/ojLQ40sYoUjFgDSPgC
 dDSIpyYAuHq1KnX5E3AotD2yr20k/VX2GVMaHm8q6AdAsI5Ip+PBbEpi1BfNb0o2GZJB
 kEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uWzgpmLO9VHXp6lkhDz4fGQuJhk+6AV1KCdyKpRVolA=;
 b=TGpQds3fTbPGN583T06deXM0AS0MzWfibU63HxOi49lao74hnpgD9sQdHeJblEn949
 A07ACjQx36pWDxM/lyc0dwU29HsJQfAEcHdLKbIXW1plX1ziiBo2N9l53tQ284UAXj65
 9uugNhdQR+XJcKclo0NC2pL9SM//GggMoqoO0jZ3Uz9pRLS75/pHMR8C8TW0sh06+CD5
 I8oBkhXOum4SVDmLrAiGuQsoqb6BZysr51oX0G6YjqhbCRDMJkpvzooTctHfDNqAZHa5
 05wxhliTKq0/VTMfIveM/0/6Zv/9uIVbUSzT5DpRVkZYhWi1pf3cLDqpOdohY0xIQula
 CFQA==
X-Gm-Message-State: AOAM533ySJuzVpLFoeLl+Gi+pSJCPP1QyzNP4Tlm5bTxr17p0MtMSkN/
 PctdCL0S7QoMNk31IBV2Iifh
X-Google-Smtp-Source: ABdhPJwY9fZqXfhGo0Ye9iDFCgcftn45DiXQoZqA9ZqPx12EMWK3W9uiY/cX0pUiVc1nQAu2Bgj8Mg==
X-Received: by 2002:a17:90b:1d90:: with SMTP id
 pf16mr5910775pjb.93.1638956441917; 
 Wed, 08 Dec 2021 01:40:41 -0800 (PST)
Received: from thinkpad ([117.202.189.59])
 by smtp.gmail.com with ESMTPSA id 13sm2600661pfp.216.2021.12.08.01.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 01:40:41 -0800 (PST)
Date: Wed, 8 Dec 2021 15:10:35 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mhi@lists.linux.dev, hemantk@codeaurora.org, bbhatt@codeaurora.org,
 loic.poulain@linaro.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, kvalo@codeaurora.org,
 stable@vger.kernel.org, Pengyu Ma <mapengyu@gmail.com>,
 Kalle Valo <kvalo@kernel.org>
Subject: Re: [PATCH 1/1] bus: mhi: core: Add support for forced PM resume
Message-ID: <20211208094035.GF70121@thinkpad>
References: <20211208085735.196394-1-manivannan.sadhasivam@linaro.org>
 <20211208085735.196394-2-manivannan.sadhasivam@linaro.org>
 <YbB11M0FZ+AdELPa@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YbB11M0FZ+AdELPa@kroah.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_014043_174130_36EA9349 
X-CRM114-Status: GOOD (  22.38  )
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

On Wed, Dec 08, 2021 at 10:07:32AM +0100, Greg KH wrote:

[...]

> > diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> > index 723985879035..102303288cee 100644
> > --- a/include/linux/mhi.h
> > +++ b/include/linux/mhi.h
> > @@ -660,8 +660,9 @@ int mhi_pm_suspend(struct mhi_controller *mhi_cntrl);
> >  /**
> >   * mhi_pm_resume - Resume MHI from suspended state
> >   * @mhi_cntrl: MHI controller
> > + * @force: Force resuming to M0 irrespective of the device MHI state
> >   */
> > -int mhi_pm_resume(struct mhi_controller *mhi_cntrl);
> > +int mhi_pm_resume(struct mhi_controller *mhi_cntrl, bool force);
> 
> apis like this are horrid to work with over time.
> 
> Why not just have:
> 	mhi_pm_resume_force()
> which then internally can set a flag that does this?  That way the
> driver author does not have to stop every time they see this call and
> look up exactly what the true/false field means in the function call in
> their driver.
> 

Okay.

> It also lets you leave alone the existing calls to mhi_pm_suspend() that
> do not want to "force" anything.
> 
> self-documenting code is good, this is not self-documenting at all.
> 
> Also, is "force" really what you are doing here?  This is a "normal"
> resume call, which should always work.

The normal resume here is resuming with M3 state only.

> The "force" option here really
> is just "ignore the current state of suspend for the device".  So
> perhaps mhi_pm_resume_ignore_current_state() might be better?  Or
> something shorter?
> 

And we are actually forcing here. As per the MHI spec, the devices has to be in
M3 state during resume. So if we allow any device to go through resume without
being in M3, that implies we are doing a force resume.

I'll use the mhi_pm_resume_force() API as you suggested.

Thanks,
Mani

> Naming is hard, sorry.
> 
> thanks,
> 
> greg k-h

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
