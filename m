Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4005C433EF
	for <ath11k@archiver.kernel.org>; Wed, 30 Mar 2022 22:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qq8nQ+sZXypbWRAIIiFZoaINgknVSPeySDtcYKkeDKY=; b=sWlnKRDQVbF7OU
	xmd7y7QdBz3lskP2F5mX+smI8KjD901sTosttaV77D4R0tRnb0aFA7vPwDndi5eaDA1LXe+j8iitP
	hBbq48kZa95kAkR4XZP2NAJpq5rXEeL5pJscQX+ebd6n6zZV0U3SLRsvVx0aXsSN/ZszAUq4DafKe
	J9P6VpDA7KuOXb9K+YguCiKGx/bKYUexa8dqqTj7tHV+Jyp+710sHXucsr+movMO+VtE6M54HO3Vp
	TBUAZoKbYrv4PGx27A4gB/14CjUK9SkXPrs7AWsJBmgAlOuWKSSAXjE/t6zN26kt9nDlLLBDaNzFv
	O942whL7vUBCfVSdletA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZgPf-00HZjJ-Sj; Wed, 30 Mar 2022 22:03:35 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZgPc-00HZiw-MT
 for ath11k@lists.infradead.org; Wed, 30 Mar 2022 22:03:34 +0000
Received: by mail-qt1-x82f.google.com with SMTP id j21so19661056qta.0
 for <ath11k@lists.infradead.org>; Wed, 30 Mar 2022 15:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lpHmMAFIU1gIcYBXZEJkbXnQwgepvxP142exobUt52A=;
 b=Fw6gdTDCOHv0IXSa5CzUVCTVuWAWIkcnIWfZwkn9ug8ky8Ryj8lvSHFxYDyjBFoNuC
 91JHy/wel4KCSuc6A+h+YAM9jjUDFscVt6DDQq5Cc1CLBdkvn5/yQ4Oje8SoQ4IglmHm
 SpxEdrxWk/9gQvdvQliyM6iMDVFFcrgqJF8ho8H29eEJbsi/eeZ/TFooQWMOAClMB3JS
 p106XXzf/vz7JT3i383NiYGpHSGkr6bhAr7XoBy9tjgsvpO3xGtPMfkpiiXwJJluoGq+
 2iAsZjAx1sIHGM3S32XEwah88DFIJsWuCoEwDHonwZh32wlftb9HkpSIbVRyafZIGPYl
 AaWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lpHmMAFIU1gIcYBXZEJkbXnQwgepvxP142exobUt52A=;
 b=UbW1ciMyDDbA7a5pgti8HHiM3c/SlAPLaAOLvj8YtIT4GI08axrTjs297TFwRFFCE1
 eMUPRRGiGi0gjqe4ria+tyNYSv235GO9y2XmJjlRLCh2uN6NJwZrltQGPYh+5iVMg7+x
 Bm/qjQR0IsQFMG63wBW1J7p1cQeHDBxejSgIUIsTBTdq+FTTCCDv4aGbfZ5geRQBsfap
 ZeGBxRAWZL8jsS+A1hhhSOr9ytz6I4NnrXVN8/EW0/f2XsmfYY7k54pw+eFj6YoGpGmh
 LCKjYLZl3nGmQRsvHvnAaHLdqWZ8njkucyFOn6ssYa3uhmmSBooaBtn0HJtx1FKdqd8S
 Swyw==
X-Gm-Message-State: AOAM531xJXlBGD2ZlRPmzMM1T0IAVa1E+fAey0xj7YP2QuvBQ9DdHqBi
 1B+mRNP75IbJwULZ6xF6xnkzAR33l+YQSD4iSVFEB5xO8KU=
X-Google-Smtp-Source: ABdhPJwPW/vZMI4Pd9siQitPSlnsgIjoEi6gL2O4lEM6EjBGo/eUi5omPbHNxFF0+XeLcwKy7jb+u41qeZjD9m/ZLrg=
X-Received: by 2002:ac8:5702:0:b0:2e1:ec8a:917a with SMTP id
 2-20020ac85702000000b002e1ec8a917amr1615048qtw.682.1648677811639; Wed, 30 Mar
 2022 15:03:31 -0700 (PDT)
MIME-Version: 1.0
References: <00ece2e5-7bcb-0b2b-23d2-e25cf4c9d13e@linaro.org>
 <CAA8EJppG0FXj_n-CdGbX6b+sGrTb0_FG_tCZ0GeSEsCcz0mR3A@mail.gmail.com>
 <875ynvwm22.fsf@kernel.org>
In-Reply-To: <875ynvwm22.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 31 Mar 2022 01:03:20 +0300
Message-ID: <CAA8EJpoXWQLzC_GOU1CtSB7yBVLU_4=HVs5+38cJov2eYkkUhQ@mail.gmail.com>
Subject: Re: ath11k-firmware: QCA6390 hw2.0: add RB5-specific BDF
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org, Bjorn Andersson <bjorn.andersson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_150332_839187_3FBF27B3 
X-CRM114-Status: GOOD (  16.49  )
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

Hi,


On Wed, 30 Mar 2022 at 17:29, Kalle Valo <kvalo@kernel.org> wrote:
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
> > On Fri, 18 Feb 2022 at 08:15, Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> >> We'd like to ask for inclusion for the board file for Qualcomm Robotics
> >> RB5 Development Kit.
> >>
> >> Following the questions from the ath10k wiki page:
> >
> > A gracious question. I have followed the procedure described in the
> > ath10k wiki, receiving no response in the past month.
>
> The board file updates are slow, it can take a long time before I manage
> too process them.

Ack. Then please excuse my impatience.

>
> > Is something wrong with the request?
>
> After a quick look I didn't see anything wrong.
>
> > We'd also like to submit several other board files:
> >  - for the RB3 board (WCN3990, hw 1.0)
> >  - for the Dragonboard 820c (QCA6174, hw 3.0)
> >
> > Do they stand a chance to be accepted?
>
> Please do submit them.

Will send them asap, thank you.

-- 
With best wishes
Dmitry

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
