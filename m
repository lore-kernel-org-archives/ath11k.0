Return-Path: <SRS0=Vwcb=FY=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF04BC4361B
	for <ath11k@archiver.kernel.org>; Sun, 20 Dec 2020 15:39:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92A1223124
	for <ath11k@archiver.kernel.org>; Sun, 20 Dec 2020 15:39:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92A1223124
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=technolu.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7ZBYsR9SxH1xKUw8Hp8ioJiqrHAQFvi192GAZqixbdA=; b=B4rPOGfmf1CdFvhS6lvRkjZAr
	WTZfzyaryV47z2y9iyHo+r5MWSvvAt33peqjZ4doCvBjHvIqfTbGEAq+Im0OGX4/itwl0nQ49uS+u
	8/TCoUZpmi1GZQtHCAw09xrZkNDt1QGJOyUxdDjmmQvSFTms1iTc7eMU25UXJID7tlWrdS/5Z/+2p
	FsfCKSPaSofzcQB/BQE54hkxkJq5EariAMF/kmx1hmv8Ws23Ab/+yM8CdEz0IbgTn/KbKRCuZVZWy
	OTaJI8uN/ZIdP0r589V0d0gq7DePymf5F1twDfFqabljfuKFRouXMNWN4pt2NKWoUuJ6njLqTYHBX
	59TqRHX8A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kr0ns-0004Sf-1j; Sun, 20 Dec 2020 15:39:24 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kr0no-0004RB-Iy
 for ath11k@lists.infradead.org; Sun, 20 Dec 2020 15:39:22 +0000
Received: by mail-ej1-x62c.google.com with SMTP id ga15so10108169ejb.4
 for <ath11k@lists.infradead.org>; Sun, 20 Dec 2020 07:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=technolu-st.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9q5CVkrD9+T9LbBEhYuCJnZrhRURd1rmElgebFtk00o=;
 b=BrpojAesNByNNYTHhoByKSHlbdMBBrv7VF5YtXIrhNq2M+Hk3R/ZoIYAbXeFKqvxmd
 gcuVRhNpwAmNsT8oipj7lbSWHWyaTKY7+xUT4EOAXkkaKMeL8ToXtKLHPF4fNrqFYh0r
 j3/ZvZReu769b6C/dQx7X0bbVsmfuC0Rj4lukTd2OsIIfr8iWbM0qhxTWRJ7LA/HA9zd
 i2rW0sxOv3lW8shC2fehMFJl8PiXmMJrExpgDRVvE9bIzAUDsjkQQLiUWvJWieaFhRMw
 mOltjOG21eAkKRg6TnBcc0oTXUJKcoxWDgIA6cYroaJLP0ufjt5WMU+3XC7xN6nbkf20
 u8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9q5CVkrD9+T9LbBEhYuCJnZrhRURd1rmElgebFtk00o=;
 b=PenWzaF/6dwFIAv40CeVUAeVAkYGATJIzCT5vlZyT3Y4JsVsmBMrSU7gXBuA3NvDNk
 CBfdvUhzgomZAjZJ1WFg22erH03QRBryHX2//7bC3sbk4v+5GUOZXNya/0QbZh2BKdd1
 jywTUGkTCPWOIxYiVg8JVSvRkcYqs3FrOxjkHDu+hMQ/NnWL3Ak7eGyF0Gq2vCMue7Aa
 v05WDIuesuCQMMmQBAJpwWfRPI8O60f0agR147UQVi6Z6y4WNdQWfCFkrzuotph8eceY
 1WGwGcGdboBua+H4La+JEvJgpFM1XuZGwgajwRuMF4smEQMoNSu+KerRx41YCDxio91I
 ieiQ==
X-Gm-Message-State: AOAM530W8NTr2rdECR90cyuLbUDByh16xNpumzBkF9TWI8SCkqOlo58/
 GOwkMSJzF7rOrjVUfPPuYICgI4ZDiZlN0ra8FeJl4Q==
X-Google-Smtp-Source: ABdhPJz/VfVE/gsoc4yUxbnWJe3EF//9vUZc19h7V1tM24Mlm+RDSh4HC+wXHE/aYUGi1k/ANX4bEgpS7MKpIf0jNgc=
X-Received: by 2002:a17:906:ce3c:: with SMTP id
 sd28mr12102964ejb.485.1608478757560; 
 Sun, 20 Dec 2020 07:39:17 -0800 (PST)
MIME-Version: 1.0
References: <87pn3axhm1.fsf@codeaurora.org> <20201217095302.GA4640@work>
 <CAHUdJJX2fW0KigSgMT03PkCQKQyya4ZiRHrO4iopOS2GzT6NWA@mail.gmail.com>
 <20201220150503.GA4283@thinkpad>
In-Reply-To: <20201220150503.GA4283@thinkpad>
From: wi nk <wink@technolu.st>
Date: Sun, 20 Dec 2020 16:39:06 +0100
Message-ID: <CAHUdJJUmW8LZGGn+982gfYUyejiv8kvW9Ho=jXr=6WTW1W3uww@mail.gmail.com>
Subject: Re: ath11k: crashes with 1 MSI vector, workaround disable MHI M2 state
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201220_103920_778994_4C2B496E 
X-CRM114-Status: GOOD (  40.18  )
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

On Sun, Dec 20, 2020 at 4:05 PM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> Hi,
>
> On Sat, Dec 19, 2020 at 10:34:23PM +0100, wi nk wrote:
> > On Thu, Dec 17, 2020 at 10:53 AM Manivannan Sadhasivam
> > <manivannan.sadhasivam@linaro.org> wrote:
> > >
> > > Hi Kalle,
> > >
> > > On Wed, Dec 16, 2020 at 10:47:18AM +0200, Kalle Valo wrote:
> > > > Hi MHI devs,
> > > >
> > >
> > > [...]
> > >
> > > > After extensive debugging from wink he found out that disabling M2 state
> > > > makes the all problems go away:
> > > >
> > > > --- a/drivers/bus/mhi/core/pm.c
> > > > +++ b/drivers/bus/mhi/core/pm.c
> > > > @@ -55,12 +55,12 @@ static struct mhi_pm_transitions const dev_state_transitions[] = {
> > > >         },
> > > >         {
> > > >                 MHI_PM_M0,
> > > > -               MHI_PM_M0 | MHI_PM_M2 | MHI_PM_M3_ENTER |
> > > > +               MHI_PM_M0 | MHI_PM_M3_ENTER |
> > > >                 MHI_PM_SYS_ERR_DETECT | MHI_PM_SHUTDOWN_PROCESS |
> > > >                 MHI_PM_LD_ERR_FATAL_DETECT | MHI_PM_FW_DL_ERR
> > > >         },
> > > >         {
> > > > -               MHI_PM_M2,
> > > > +               MHI_PM_M0,
> > > >                 MHI_PM_M0 | MHI_PM_SYS_ERR_DETECT | MHI_PM_SHUTDOWN_PROCESS |
> > > >                 MHI_PM_LD_ERR_FATAL_DETECT
> > > >         },
> > > >
> > > > And indeed now we have numerous people reporting that with this
> > > > workaround ath11k is stable on their Dell XPS 13 9310 laptops. What on
> > > > earth could cause these kernel crashes/interrupt storms? And why is it
> > > > visible only on Dell laptops? Why does disabling M2 state fix it?
> > > >
> > >
> > > This is related to the ASPM state of the PCIe bus. In the meantime, I'd
> > > suggest to turn off ASPM using "pcie_aspm=off" in the kernel command
> > > line so that the MHI bus stays in M0.
> > >
> > > For debugging this issue, can someone enable debug logs for MHI and share
> > > the dmesg output (with ASPM enabled ofc)?
> > >
> > > Thanks,
> > > Mani
> >
> > Hi Mani,
> >
> >   Thanks for the information and ideas.  I tried to disable ASPM with
> > the kernel parameter you mentioned, that didn't seem to work, so I
> > removed ASPM support from my kernel altogether.  I still see the
> > adapter in the M1 state, which with my patch would've gone to M2 had
> > it not been disabled.  Is ASPM the only thing that will trigger the M*
> > transitions?  Would it require a transition to M2 regardless of
> > settings (maybe that's why it tried)?
>
> That's what I suspected but looks like the QCA6390 enters M1 state (which will
> inturn cause host MHI to transition to M2) when it detects the link inactivity
> using a timer. But with my NUC, I can't get QCA6390 to enter M1 state
> regardless of the ASPM support in BIOS. In both conditions (with/without ASPM)
> device just stays in M0. My hard is guess is that the device depends on the WAKE
> sideband signal to go low for entering the M1 state even when it detects link
> inactivity in the PCIe bus. And this signal might be low on Dell laptops. But I
> need Hemant/Bhaumik to confirm this!
>
> Inspite of that, I got a plenty of below messages in dmesg log when MHI
> debugging is enabled:
>
> local ee:AMSS device ee:AMSS dev_state:M0
> local ee:AMSS device ee:AMSS dev_state:M0
> local ee:AMSS device ee:AMSS dev_state:M0
> local ee:AMSS device ee:AMSS dev_state:M0
> local ee:AMSS device ee:AMSS dev_state:M0
>
> And this only happens when one MSI vector is used and shared by all IRQs. This
> is because for shared IRQs, the kernel calls all of the registered ISRs of the
> interrupt line when an interrupt occurs. So I cooked up a patch which checks for
> the device state before proceeding through the ISR:
>
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 2cff5ddff225..520948f3051d 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -386,6 +386,13 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
>         state = mhi_get_mhi_state(mhi_cntrl);
>         ee = mhi_cntrl->ee;
>         mhi_cntrl->ee = mhi_get_exec_env(mhi_cntrl);
> +
> +       /* Only proceed if the device state is different */
> +       if (mhi_cntrl->dev_state == state) {
> +               write_unlock_irq(&mhi_cntrl->pm_lock);
> +               goto exit_intvec;
> +       }
> +
>         dev_dbg(dev, "local ee:%s device ee:%s dev_state:%s\n",
>                 TO_MHI_EXEC_STR(mhi_cntrl->ee), TO_MHI_EXEC_STR(ee),
>                 TO_MHI_STATE_STR(state));
>
> This prevents the spike of the debug messages but not sure if the issue you're
> seeing is related to this. Can you give this patch a try on your setup?
>
> Thanks,
> Mani
>
> > The MHI dmesg output is pretty
> > consistent when it fails, it looks like this:
> > https://i.imgur.com/0XExack.jpg .  You can also see it in the mp4's
> > I've placed here:
> > https://drive.google.com/drive/folders/1wvxZI5XtwPSrm0-6-Ov50cUfqBXSXeNz?usp=sharing
> > .  Also note that the failure isn't deterministic, sometimes the
> > transition to M2 will succeed and everything works.
> >
> > Thanks!

Mani,

  I'll give the patch a try once I have a moment.  For some extra
information, I also patched the interrupt handlers so they'd bail
early if the signal wasn't for them (since there are ~20 ISRs attached
between MHI and the ath11k driver).  That didn't seem to have a large
effect on anything other than potentially changing some of the timing
of things.  Another interesting note is that the laptop only seems to
attempt the transition when it's plugged into the charger (see my mp4s
for more info).  If I boot the laptop on battery and bring up the
adapter, it never attempts the transition beyond m0 either.

Thanks!

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
