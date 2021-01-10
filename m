Return-Path: <SRS0=HVO4=GN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9221C433E0
	for <ath11k@archiver.kernel.org>; Sun, 10 Jan 2021 20:57:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CBD1229C4
	for <ath11k@archiver.kernel.org>; Sun, 10 Jan 2021 20:57:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CBD1229C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P3HQZFRCyguMS/wAnyhNTFDJpq+vXI/EHaIObFaOftc=; b=YgeDPO7idBqXDoX/Lb7aCmL98
	bgyROYncRomKKPiTmSjnchAj4vChkiUYJvDxW/Fq13rOzA7pLVk8WnoxXg+Lc9iJYkZgxPi0j5AVD
	sw4rOzKi2xUEI5pJpBz80U5q2qz8weV6mUATkhPNkNQW88fkfZz+dSeQRasLFGRBsZt9KEZCw+X7P
	GbOIUjAkP5FFTbKJZD1BOZTyvCpu922fMs7NfZa8q54f2H81MHshjrO+PW1xhVO25aMJMRaBoEqQM
	DSax57KhQmPbH4vWkldKuI60Zzy3vpHBgvMiXpIVkiCfTd2ym/gj7TYJJg2MpfU0hzypcyFM+74fx
	5pW2hmdIQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyhmG-00044Q-Iq; Sun, 10 Jan 2021 20:57:32 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyhmD-000431-KI
 for ath11k@lists.infradead.org; Sun, 10 Jan 2021 20:57:30 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id u7so8641404vsg.11
 for <ath11k@lists.infradead.org>; Sun, 10 Jan 2021 12:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bI1dyqszMvncQd81wZke0E6VLoCiKKnOGwF/VN5SClY=;
 b=UBkappg2aa+dBt4O7h/ywUpC8ll8u0HTPqS3uQ9zlBuyMrWzd0OjXEiYTtNnafVVW9
 gj/fx1PUfsH9p4nZnk0XE3deh54XN5ZsyxEnqD5NEIAQz7zhVS67/lo2mgQNdWqny8Dx
 3D6XwFd+U+QYa2BvP25p4jxm2WMT5Yv9ATLejs8/ITnZYueayqTT8x3HFPJ6PDdh7SDO
 3lABPHpLbaTTsc5kTG7GX/hzIIQDFjAs3nSqfBJ/Hh58Oc7t9FF0qg+wUcFSrVpOanPo
 vCirC7Lcjz2jafpyDaF+bg4IDAfh7pSsnfUpHXvrzefvg557167HLKrtP9hrlszqol4V
 WOBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bI1dyqszMvncQd81wZke0E6VLoCiKKnOGwF/VN5SClY=;
 b=EBy0rBG3vdaWHtPiM1DenIe1IxJv3blGF7ypJpZZbbqEgQhG3k4jHKluG9Jx096z6i
 NJIvELamQvr/YLvO8cwnuYyAsJKFGeT8Yo5/xmJV9YwYzMlJqRzVUM1LvSMi8l4D4VWm
 x+zWK3AR0JOF5aOHh1c6bk81gImsZnjZ8TiiN95+LCPnI0wE2xkncrsb4lpWe/qyUEVg
 bCJwk6d3MFQ2AqEFTtQt8/7+WRK4kcKblw3zXNKfSDWsadNdAprsxckS7mSjeUeVhYDk
 q2a30MPhHWLN+ZcB8eifWi7eeNRl38V6ZO5wMreayosxn4IJrnGCJBCxi8POUY1lEkaU
 s8eA==
X-Gm-Message-State: AOAM5319g5Yx+gOXo9UOn74ajhh2RUQnXniWCbZzNh2mEGaAyzzeI/us
 PwC0QOZzmos56DVJ5bSFacpm+NqXmV7u+F92xX8=
X-Google-Smtp-Source: ABdhPJy2Hdpoct9cPuou6NfVpk4UVoEXbQXro4s4Pv0+OqMFpiH6KHKwqNm5bbqG6pZjVrHmgFxo5sQRkeDkRPTKAZU=
X-Received: by 2002:a67:32c5:: with SMTP id y188mr10333337vsy.4.1610312246029; 
 Sun, 10 Jan 2021 12:57:26 -0800 (PST)
MIME-Version: 1.0
References: <CAM+r-RhxY4TA4zPm6e6ah9RWdBY67J=5oRS3+=+EQMomKa10QQ@mail.gmail.com>
 <CA+icZUWcuka-6j139+89pSV5Z-r1fYVriz+wJE0gma4RO_PL9Q@mail.gmail.com>
 <CAM+r-Rj3y6DGonMPQ_V7qCwWH7v1bgh5x7YmAzMh5-cY68jJiw@mail.gmail.com>
 <CA+icZUXkwN=WT+hOop2WjwdVOp8UB93XKd07KB_EdCP5U_znsg@mail.gmail.com>
 <CAM+r-RgHsVSOjH8+2jaw6xJAm=ykcJa8Mw65jOma=w_yDyt5hA@mail.gmail.com>
In-Reply-To: <CAM+r-RgHsVSOjH8+2jaw6xJAm=ykcJa8Mw65jOma=w_yDyt5hA@mail.gmail.com>
From: Luca Versari <veluca93@gmail.com>
Date: Sun, 10 Jan 2021 21:57:00 +0100
Message-ID: <CAM+r-Rh-YmJhbDNEPGDa+=Fntp1ruEf3B6OxUWECXudsi8z04w@mail.gmail.com>
Subject: Re: [BUG] Stacktrace in ath11k_pci
To: sedat.dilek@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210110_155729_716789_C7CC070E 
X-CRM114-Status: GOOD (  10.33  )
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
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

FYI, the same problem is still happening with linux 5.10.6 and latest firmware.

On Sun, 3 Jan 2021 at 02:31, Luca Versari <veluca93@gmail.com> wrote:
>
> I can confirm I have the latest firmware installed (same sha256sum).
>
> On Sun, 3 Jan 2021 at 01:34, Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > On Sun, Jan 3, 2021 at 1:18 AM Luca Versari <veluca93@gmail.com> wrote:
> > >
> > > Thanks for the quick reply!
> > > Unfortunately, this didn't seem to work - I'm still getting the same
> > > stack trace:
> > >
> >
> > Latest ath11k firmware?
> >
> > - Sedat -
> >
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/ath11k

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
