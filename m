Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84BCECAAD5
	for <ath11k@archiver.kernel.org>; Thu,  8 Sep 2022 08:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vrizwDJlVoj27C16QLAEZ79IGyzADc81gkllVDbX/qg=; b=LP2542f7ppOFc/
	C01oTm2xpPk3vhnMBsvYPZArmxAGj3OflQPUjLh5tdujVIM7BLPksks27QUcjT3ZdUd0lz0Tf5QM+
	virZUAWw9NcoAnUgGTMqEjCq7XQTu5NB8CyRp7K3bxCJFFXxqYgcG/gwbDHH84fMmjZOPgXJuzC2d
	5ZPhgZZPimqRMO3iCdGeoVICQyP7hcHSokR5tfL0p8iXDdWP6yy+A4v4bfmSIOMAr+JTuVbk5DjDJ
	n+3DXeZ7nkEusUTWm6sSVh/UpuGfWOZP9sH9sg0jQoq26w6RPXolF0XfOONtvy3+DK4Dqy241A/Vu
	tys0v/4nuC4intBET/6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWDEK-001A4j-T8; Thu, 08 Sep 2022 08:49:48 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWDEH-001A0E-Fa
	for ath11k@lists.infradead.org; Thu, 08 Sep 2022 08:49:47 +0000
Received: by mail-pj1-x102c.google.com with SMTP id fv3so10975192pjb.0
        for <ath11k@lists.infradead.org>; Thu, 08 Sep 2022 01:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=WLlwnXfj/irDDa0dEvEsLrqy7lTcKeXB93kP8oPhx0Y=;
        b=Fzulh4AUggvpIuY5gd8Yy5z75WYtgdhYx2GB+fJ8UUnN+VsjQS79jCIl+yWOssoZx3
         2wuuWlNx1kVlyKehAKpzdt2qMeOt+SQ/LsZtJ4MNZDQ8UjpuRyQvI5XqIvmCGDxCdCRI
         O1BfCfv/qbRfIvmlDV5LzqdDSJuP5yAjS2fi/QoqF9XtqVilWYOPHy8WD7HTH+7UbygW
         ik53HJ/nk4qXc9UojxLeJynSiKXGLopvEBuN5mIsRZkRlaRqClNNApj8pGC7eptaDMKG
         VXK+5G2h2cmsR8zrsutL2Vxzc5ITa0HBLGAGiKINNO0FDRLt5nrHk5bpWKFI+/33CoZb
         Cljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=WLlwnXfj/irDDa0dEvEsLrqy7lTcKeXB93kP8oPhx0Y=;
        b=WR7dTRVAJg1TuFxtu1ZzQi5EFVQpaQGrRqDXzk+jqtIVx1IR2mEFgQo4niHD4xv2zu
         zaTIYStYdP42HhFkOGw2zXJPxvNlFvLMo8j/H7IlSIYWku0rtEsOCqKOAkqC0DifZ+TF
         unJ5tp0vpg+F5CAoCfZNTJo9A8LKSbcQdt45y2HGt4kkaBeBOXapL6A6N0ke4QLbyQ5E
         XPtpL5XT2UBaf9NnB5XKi+dmfdGx8peaoVbMKOKAZpiM5/uZFxQsNgaJvsBsucbFytiW
         PdZEGbnKRJkCXqBuxQlPEg06Ke4Gvn8knpzfjAFALFBaInTObbTzo5EEQPnIoQIp0Yxn
         mzdQ==
X-Gm-Message-State: ACgBeo2rd5eMs7RYbAHScTN/xS0fLzkYOc0yMNNgkygRer8i+vsG2hf5
	1sz1+yFOxXsfPFjfO5XUpCaUxQWVJLCxRBHgRaL+ng==
X-Google-Smtp-Source: AA6agR4Q0sktHrbxxfNqcuOlS6HqWn4EJn3dPjeUjSGRc4/W0TU5jBSJsx6N55zJ09VVfRT/YpdRaoKWRe/JhIN/NlY=
X-Received: by 2002:a17:90b:4a8e:b0:1fe:1df3:bb11 with SMTP id
 lp14-20020a17090b4a8e00b001fe1df3bb11mr2987266pjb.22.1662626981574; Thu, 08
 Sep 2022 01:49:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220720135113.15755-1-quic_mpubbise@quicinc.com>
 <20220720135113.15755-2-quic_mpubbise@quicinc.com> <87czceaqng.fsf@kernel.org>
 <dcc14883-51c9-c1bb-bbea-1b309eccedf2@quicinc.com> <CA+HBbNGEoSyfbs=FHtWyvBnG_jh9m=Q9KW=Pcfq+pDdHWEV4mw@mail.gmail.com>
 <7615c815-ca2e-c6f1-b627-6e10f1272442@quicinc.com> <CA+HBbNEm9GhYcXQ9gXEb=U4x=BZTDp4UBqF8eNH1N0uCBLdadQ@mail.gmail.com>
 <5c07bcd5-574c-b13b-44c2-ef8ed9f23cf0@quicinc.com> <878rmucqhu.fsf@kernel.org>
In-Reply-To: <878rmucqhu.fsf@kernel.org>
From: Robert Marko <robert.marko@sartura.hr>
Date: Thu, 8 Sep 2022 10:49:30 +0200
Message-ID: <CA+HBbNEAgMPKJFrAYGUT1x-XAX81tTNj4W5xgW-bYSm5j_r_4w@mail.gmail.com>
Subject: Re: [PATCH 1/3] ath11k: Enable threaded NAPI on WCN6750
To: Kalle Valo <kvalo@kernel.org>
Cc: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>, ath11k@lists.infradead.org, 
	linux-wireless@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_014946_019152_7217F1CD 
X-CRM114-Status: GOOD (  20.53  )
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

On Thu, Sep 8, 2022 at 8:46 AM Kalle Valo <kvalo@kernel.org> wrote:
>
> Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:
>
> > On 9/2/2022 7:16 PM, Robert Marko wrote:
> >> On Fri, Sep 2, 2022 at 3:42 PM Manikanta Pubbisetty
> >> <quic_mpubbise@quicinc.com> wrote:
> >>>
> >>> On 9/2/2022 6:50 PM, Robert Marko wrote:
> >>>> On Fri, Sep 2, 2022 at 3:18 PM Manikanta Pubbisetty
> >>>> <quic_mpubbise@quicinc.com> wrote:
> >>>>>
> >>>>> Regardless of the chip family, even I feel that the tput changes like
> >>>>> these should be tested on all the chipsets. Availability of the hardware
> >>>>> and time are something which are stopping me in testing the changes on
> >>>>> all supported targets.
> >>>>>
> >>>>> As I said, I had made the changes only to WCN6750 initially (using a
> >>>>> hw_param). Can we take that approach for now and enable this for other
> >>>>> targets only if required & upon thorough testing?
> >>>>
> >>>> I can tell you that on IPQ8074 threaded NAPI really improves perfromance.
> >>>>
> >>>
> >>> Great. Do you have any test results on IPQ8074?
> >>
> >> I dont have full test results, but on Poco F2 Pro as the client @80MHz AX
> >> I got ~720Mbps compared to ~550Mbps before.
> >>
> >> I can tell you that in OpenWrt, we have had it enabled for 6+ months
> >> at this point
> >> and its been really good.
> >>
> >
> > That's a significant improvement, great to hear that. We have another
> > strong reason to have this change in upstream driver.
>
> Indeed, thanks Robert. Is the code in openwrt similar as what
> Manikanta's patch does?

Hi,

It's actually identical, we are also just calling dev_set_threaded
before napi_enable.

Regards,
Robert
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches



-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
