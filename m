Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38612C433F5
	for <ath11k@archiver.kernel.org>; Fri, 29 Apr 2022 06:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l8kzEmOSLsHjYkY9jtw3EFSV6Yvb9YzP6Hnj2M+ONKo=; b=dNe7cY6VBSXalc
	j8jv1m7D5jPabinu6ClevKCSfHDbdW+vl0CU3jzGhfOzZNc5iLNSLCwCzvLph66QojDSlApbDp0nf
	pRdYB3Q1p25ZhmChsWlaj4hlEuJPwkZw5hrsd1SCXU5X1AEDKRs6aoMVC/2KpDnak6k6KrR0J/3oD
	/ZeitvTiPa5kErTOF42uV50crDrfOG4T0zAlBp9Q5mFANTuanb6mjZ51p9Q5kbyI2cuAoJ2b4xA8P
	tv8oLQm9V1sgOW1n4Ssad57d/CGALVemdRFxqjlfASRpQBPjH9D3P7Ikn9z7bQ29LZd4srDC/E4cA
	dhFuBmtMLWqfZm7tg9VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkJs0-009hXk-RG; Fri, 29 Apr 2022 06:12:48 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkJry-009hVm-4S
 for ath11k@lists.infradead.org; Fri, 29 Apr 2022 06:12:47 +0000
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2ebf4b91212so75156927b3.8
 for <ath11k@lists.infradead.org>; Thu, 28 Apr 2022 23:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JnXNRi3fgLseToL8emPAro3wD9fV8AutKcOTldnUHZg=;
 b=hlwtoZX5S8WE5hujcH3ZqSI1F6JaTPn+asutbPJcQCC2bbL5Kfg3Kg6RR0129B5hGJ
 0s0RPL0CYx/63UTzOvYhq6RBlIHCPY6i0WBpSXW6Y5CMbZAf0GkRCWsJFKgHUYb098et
 TZetDO80SdCHicgzkOGFwZecll7xmToAqGL1wJ+sLVf15/mMApvnCoR9qol0ahu36Iij
 IgHog0xdtRcxjG5RIu/lCjhIIggH2lzrKqsH+KQ67RF8nR9cSV8ZJ7JpkWod6jHGyJIl
 1Q2tHzNgW0wVgUJL8ydgUrWE+zASpoKSuyhmU6rilGsVZuyGCIEtpDXbuyDuEwYiwquW
 7/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JnXNRi3fgLseToL8emPAro3wD9fV8AutKcOTldnUHZg=;
 b=wzaN+3bVAp6P6ejq5kgoOI7XjnMklhE0pZ9Z50rb8Qc7UFDj8CUCmU0xxmSKcI0thy
 a+IwVDvFbGZkIJoq9PG5+jziF2s1IysPWdWrj38hPEsKNboxnSedFPYZFp9hD6bcZ8Ss
 5c6hfmKmRyZJHOrDV+J8fyPHO+oJgyK8uRt9b/8MRf2w/kR76Y9v0hp7RZudUNsVUZ7D
 XfOcvXaaqPPIjy5Ar9kNg4aOUHKVbuNnK6SStOabd9M94GZOdI4STwbfwupD8zpIxfPW
 qorUoUt+pwAtOcA6zejqF41aqzVq/4FGUg+OMwWHhKaPFE5dNaOue5jzFd/sW6tNwWmI
 qNqQ==
X-Gm-Message-State: AOAM531TLtjoJD56R4+S8u2JRv8WmaGR0BUQbTZ0TgDDcNJXfmArsulN
 QS4enDi+S3W31IYls/uU/x5cJC99vaNw90+S5INH3g==
X-Google-Smtp-Source: ABdhPJydCw7QruBmFPtNS1LGkkCjRGaFOawi7x7UIiIhGh/L6he7e8pCGYsHIflNa7QBcza34vr14ezR92EiO4/ypPo=
X-Received: by 2002:a81:492:0:b0:2f7:ce87:c324 with SMTP id
 140-20020a810492000000b002f7ce87c324mr28911207ywe.359.1651212760038; Thu, 28
 Apr 2022 23:12:40 -0700 (PDT)
MIME-Version: 1.0
References: <BYAPR02MB4567E377F14F272DFF48907A92FA9@BYAPR02MB4567.namprd02.prod.outlook.com>
 <332e62e5-b04d-3a6a-38fe-924d056bf0f8@linaro.org> <87k0b8fnpj.fsf@kernel.org>
In-Reply-To: <87k0b8fnpj.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Apr 2022 09:12:28 +0300
Message-ID: <CAA8EJpr3Uxa-Tif5TyHfXL03j1--vrAb+DgT=0DY8KDpvHPjeQ@mail.gmail.com>
Subject: Re: [PULL linux-firmware] ath10k & ath11k firmware 20220423
To: Kalle Valo <kvalo@kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
 "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, 
 "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_231246_216489_C8AC1C19 
X-CRM114-Status: GOOD (  16.21  )
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

On Fri, 29 Apr 2022 at 08:44, Kalle Valo <kvalo@kernel.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
> > Hi Kalle,
> >
> > On 27/04/2022 11:32, Kalle Valo wrote:
> >> Add support for QCN9074 and WCN6750 ath11k hardware families. Also
> >> there are several updates to existing firmwares and board files for both ath10k
> >> and ath11k.
> >>
> >> Please let me know if there are any problems.
> >
> > I noticed that this pull request doesn't include the board file for
> > WCN3990. Is there any issue with it that we can solve on our side?
>
> Oh, sorry about that. I guess this is just a bug in my scripts, I'll
> include the wcn3990 board file in the next pull request.

Thank you! No problem, it was more of a question if we missed something.

> Linux firmware maintainers, please pull this anyway. I'll submit a
> follow up pull request later.


-- 
With best wishes
Dmitry

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
