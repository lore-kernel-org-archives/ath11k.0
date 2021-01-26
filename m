Return-Path: <SRS0=Wntk=G5=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 155F9C433DB
	for <ath11k@archiver.kernel.org>; Tue, 26 Jan 2021 15:43:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD96F206A5
	for <ath11k@archiver.kernel.org>; Tue, 26 Jan 2021 15:42:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD96F206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6u5wVzAxYpPQe/3L+mOspxX5gLY9oB8Bn6Rq/lfd0Bo=; b=xHCe/QU8wKPBW9Yy8DnBNYYB3
	mObyMMGzB0nfJ/LNoHXhHVPlYM84g6Igex3MPoPrAj/ducSVYOxEX2Tq9WUM4OzD2yI2Vzjw4vTL9
	k+rRxNw2l5RSkPsVSwqkA/iYrjHnja8fyI5r5r8THmdb6cXvOoZF1OnM1FR51V4tufCMnKoo9B0oF
	2P2cmtiqdjaV7ut6h3EUaC8nl0CtmeYkfWjcRxhisIIKhRHuC0i12N44PijjO2IIbc/KPzRmOKOuh
	zlP/XZXbnfx89hOLvehPg8T1YTM2M35jKgy8Euxmd0OxIzIxIcFJnNa1au1+tJCoF7zSlfOMAkkDc
	mw/zsOYBA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4QUa-0004w8-MX; Tue, 26 Jan 2021 15:42:56 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4QUW-0004uA-W2
 for ath11k@lists.infradead.org; Tue, 26 Jan 2021 15:42:54 +0000
Received: by mail-pg1-x52e.google.com with SMTP id n25so11688715pgb.0
 for <ath11k@lists.infradead.org>; Tue, 26 Jan 2021 07:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ncmDJ68LDAWGkThxmEqJx8RH/Iz+CIH9uZm9OmJVrJA=;
 b=DiYM45UvYl57ZNe9Tn+LfR8CPVxag36gJh8uxi3TK4FMrwm9MkOrVk+4xerXzw2Nve
 pHI6NXyUjF0BnwFohfWjBkvjdsAhEfSr3tghQV+cwY+kDQFUkH/Ru8cpmv/rjDY2qXaG
 epAlr4IAMkNUGSFuwQvWWUbOPA1XdvW1hZwGGdX8A0DjvhGFN9JZgoW2/NJQVcgzhLRC
 ItTKCAsYL78FCDCZFLAX0C1CRg9B2xTCBmOWD6D80mplm4cV5WasNlpogdejVCVxNU/L
 E61r0HyD1Ipqn23Xp5pI3qUA4wJNAjQkAyh+zyUGC/uc/fqsxqbvWcgDrExqEnxM4uFE
 NUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ncmDJ68LDAWGkThxmEqJx8RH/Iz+CIH9uZm9OmJVrJA=;
 b=FkqTpgpxxgd90MxRrN+4HC86a4S47IhEywS0sFn+TprxXAGTkqjo1qHP6jg4BF4ni1
 bobgJoxIvu538bEvBUXbegbPez0ygpU36EQyABcBMsIsG9L02asH7irewGpGmP5bkW2L
 D2BFBPCuimPOny7RmpBI45GV8+GEratDJ/YP9IhXW0j3C4nEadZu9Xan4OWGTezdaabO
 HBWq+Bu3ZBt2MjSRwTGTi3r3+0EE7WbtUo/+DNV17//HtGIjq6T8yODoswT0FVpt/q6+
 u2zf2iBrgOotNX1MQjbenjzVjNoitaCt4sQ9C8vriO1/ePxPn2QPn251Me4tb7wJsWfD
 foIw==
X-Gm-Message-State: AOAM53364AEw4dgDJ/IcvEHEb5/OvSTNeiHsBbxC9hOKwo5ABOBNcy8r
 I0LeSfbV7reOSVjdm0dZjRSV
X-Google-Smtp-Source: ABdhPJzHK/ein4ssvfyWWKrPolLlt2P/WTA6QFF9GDoPKbSBKsC+AG5ViuVclI03U436RiufrvbD+w==
X-Received: by 2002:a63:e049:: with SMTP id n9mr6191385pgj.339.1611675770575; 
 Tue, 26 Jan 2021 07:42:50 -0800 (PST)
Received: from thinkpad ([2409:4072:6d84:5293:c96f:fa31:6124:85e6])
 by smtp.gmail.com with ESMTPSA id n12sm18353963pff.29.2021.01.26.07.42.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 07:42:49 -0800 (PST)
Date: Tue, 26 Jan 2021 21:12:42 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v3] mhi: use irq_flags if controller driver configures it
Message-ID: <20210126154242.GA29751@thinkpad>
References: <20210104101128.8217-1-cjhuang@codeaurora.org>
 <20210104170359.GE2256@work> <87o8hti8t8.fsf@codeaurora.org>
 <20210121075242.GB30041@thinkpad> <87k0s0atub.fsf@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87k0s0atub.fsf@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_104253_397784_168B18D8 
X-CRM114-Status: GOOD (  17.19  )
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
Cc: hemantk@codeaurora.org, Carl Huang <cjhuang@codeaurora.org>,
 ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Tue, Jan 26, 2021 at 12:14:04PM +0200, Kalle Valo wrote:
> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:
> 
> > On Wed, Jan 13, 2021 at 09:40:19AM +0200, Kalle Valo wrote:
> >> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:
> >> 

[...]

> >> > Applied to mhi-next!
> >> 
> >> Would it be possible again to have an immutable branch for this commit?
> >> We need it for implementing one MHI support to ath11k[1] required by
> >> Dell XPS 13 9310 laptops, which a lot of people are waiting. Otherwise I
> >> can only apply the feature for v5.13, which will be released on July.
> >> 
> >
> > Dropped this patch from mhi-next and applied to mhi-ath11k-immutable branch:
> > https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git/log/?h=mhi-ath11k-immutable
> >
> > This branch will also be merged into mhi-next.
> 
> Thanks a lot!
> 
> And Greg will also pull this directly so that commit ids won't change?
> Just trying to avoid conflicts between ath and mhi trees as much as
> possible.
> 

Yes, I'm gonna send a PR to Greg this time also!

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
