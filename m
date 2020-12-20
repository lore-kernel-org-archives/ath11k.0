Return-Path: <SRS0=Vwcb=FY=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32985C4361B
	for <ath11k@archiver.kernel.org>; Sun, 20 Dec 2020 15:05:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BECD72250F
	for <ath11k@archiver.kernel.org>; Sun, 20 Dec 2020 15:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BECD72250F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FeBhp/Nsn1fmJ3wVQ8mgmFMlFQZMwvf8+ICywfQrJzk=; b=d1HW8B2XL12MDjhqjw0ICZVJd
	6p6cYisemGemhBQzU0AF3dzwIDM9cQ4694G4E7ioGkHfF6aGKXe+9NFpEE5L+XKPMgEWDHVvEgN1y
	2aGceQzwPNmCNNn6bJFwenX3LyIHkuLmC60H6OsJSvVhINIcH26hnmPnggwBjIx4FDaLq1YUk1knN
	KfcBMYgyXwcJ91gBbhI1MP0rznoOTxXtbd6bWrImr8FbICUNFtZuQSKCt+/KXLEqXANSYSFoVatC/
	yes5tz6lI+jQWeA/yOkjHlGCZaOqnRhS8UWG6NA7pQP3dDNVL10o+GPEFaAEvgU1qOmnwqZ6/SlXN
	7e4Pq6geg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kr0Gx-00035G-BS; Sun, 20 Dec 2020 15:05:23 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kr0Gu-00034f-Jb
 for ath11k@lists.infradead.org; Sun, 20 Dec 2020 15:05:22 +0000
Received: by mail-pl1-x62f.google.com with SMTP id x18so4278739pln.6
 for <ath11k@lists.infradead.org>; Sun, 20 Dec 2020 07:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=87CYmu7Dd6w6zFFyMA/vWJRFqqigMRKxGW45sug7ItA=;
 b=tHG97UoY9V9UkYAEaKo1boiKBgucpx3lCd5a4T4le5bNoUJE1hL7Q5bQnua2mxoqsI
 09REcmNZrwfGVLrM3bxN2ajv47YnFF+bOo8yRZKy23an/sgxJFoqngG8E0S0zUaAK20b
 5ozrqEPmlc6ATDcmbUjEVZxEswXzOkJ/gZvfFSkuSSSU0mTXhlszrVf8l7ft8NGzW4mJ
 kGgxb+/Fvv2wopzRV1VBvsxvOhyfcivEy1hCnsI8olJmsn9n93u6zPiD0lYky3I+Jp9d
 LZXhxdUgOA/pIOfi8E1h4RUmQ/Dv7CN3sUn6v6dyIrNPwHziOySmfGdnjq3Mgx1z8Sqq
 DPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=87CYmu7Dd6w6zFFyMA/vWJRFqqigMRKxGW45sug7ItA=;
 b=EL9gRrfUz4rJ9UMdwU0ylQ/XDoFS01Nm/nbJx0EUiyUDCnDjSFZF4AS+iuSvTGTaAE
 CcAoubbrSoIhKJfQegYjX6uEzC9/xVACdpzbFIs1J8tns+SblG4jCE0GdX7y78SfEvDg
 oL29BaFaDs6oEu/jJb7/FpLaOl3gnTAf+LYTV6xpXGdOrSb3Czwq0HX9m4/mDpV/3KqM
 YozWb+7+Y2pbAJk9lMOA2I4Z9XHBaZgGvxdRmlA7GofhYvH+AXTTtffgIkf74wFiRN6K
 tmXHt0hUwpi8cXAnMGkz0fhmJlTCY0qIuAjskjZQapDSyVOcBhoiVZ/vvGTBQ3+H+BeK
 bJ8Q==
X-Gm-Message-State: AOAM5322XBUol5lytmhbfJRHBYJ6FCRqQ8CaEhXROxgS5/gMKyRlrlkK
 sXaMbGuSBOxKnWL0EiV1iMls
X-Google-Smtp-Source: ABdhPJzRQfC5zk01KRbn3pxcxEZyPUWEIM4sDnRZxkK7cnKFe5BrOMouX9noIfDQdiX4MMSf8XW6+Q==
X-Received: by 2002:a17:902:ac90:b029:da:fd0c:53ba with SMTP id
 h16-20020a170902ac90b02900dafd0c53bamr12527476plr.23.1608476716746; 
 Sun, 20 Dec 2020 07:05:16 -0800 (PST)
Received: from thinkpad ([2409:4072:6d81:d22:7144:b62f:60c1:2524])
 by smtp.gmail.com with ESMTPSA id m26sm14340500pfo.123.2020.12.20.07.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Dec 2020 07:05:15 -0800 (PST)
Date: Sun, 20 Dec 2020 20:35:03 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: wi nk <wink@technolu.st>
Subject: Re: ath11k: crashes with 1 MSI vector, workaround disable MHI M2 state
Message-ID: <20201220150503.GA4283@thinkpad>
References: <87pn3axhm1.fsf@codeaurora.org> <20201217095302.GA4640@work>
 <CAHUdJJX2fW0KigSgMT03PkCQKQyya4ZiRHrO4iopOS2GzT6NWA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHUdJJX2fW0KigSgMT03PkCQKQyya4ZiRHrO4iopOS2GzT6NWA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201220_100520_983027_4CFD04D6 
X-CRM114-Status: GOOD (  34.24  )
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

Hi,

On Sat, Dec 19, 2020 at 10:34:23PM +0100, wi nk wrote:
> On Thu, Dec 17, 2020 at 10:53 AM Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > Hi Kalle,
> >
> > On Wed, Dec 16, 2020 at 10:47:18AM +0200, Kalle Valo wrote:
> > > Hi MHI devs,
> > >
> >
> > [...]
> >
> > > After extensive debugging from wink he found out that disabling M2 state
> > > makes the all problems go away:
> > >
> > > --- a/drivers/bus/mhi/core/pm.c
> > > +++ b/drivers/bus/mhi/core/pm.c
> > > @@ -55,12 +55,12 @@ static struct mhi_pm_transitions const dev_state_transitions[] = {
> > >         },
> > >         {
> > >                 MHI_PM_M0,
> > > -               MHI_PM_M0 | MHI_PM_M2 | MHI_PM_M3_ENTER |
> > > +               MHI_PM_M0 | MHI_PM_M3_ENTER |
> > >                 MHI_PM_SYS_ERR_DETECT | MHI_PM_SHUTDOWN_PROCESS |
> > >                 MHI_PM_LD_ERR_FATAL_DETECT | MHI_PM_FW_DL_ERR
> > >         },
> > >         {
> > > -               MHI_PM_M2,
> > > +               MHI_PM_M0,
> > >                 MHI_PM_M0 | MHI_PM_SYS_ERR_DETECT | MHI_PM_SHUTDOWN_PROCESS |
> > >                 MHI_PM_LD_ERR_FATAL_DETECT
> > >         },
> > >
> > > And indeed now we have numerous people reporting that with this
> > > workaround ath11k is stable on their Dell XPS 13 9310 laptops. What on
> > > earth could cause these kernel crashes/interrupt storms? And why is it
> > > visible only on Dell laptops? Why does disabling M2 state fix it?
> > >
> >
> > This is related to the ASPM state of the PCIe bus. In the meantime, I'd
> > suggest to turn off ASPM using "pcie_aspm=off" in the kernel command
> > line so that the MHI bus stays in M0.
> >
> > For debugging this issue, can someone enable debug logs for MHI and share
> > the dmesg output (with ASPM enabled ofc)?
> >
> > Thanks,
> > Mani
> 
> Hi Mani,
> 
>   Thanks for the information and ideas.  I tried to disable ASPM with
> the kernel parameter you mentioned, that didn't seem to work, so I
> removed ASPM support from my kernel altogether.  I still see the
> adapter in the M1 state, which with my patch would've gone to M2 had
> it not been disabled.  Is ASPM the only thing that will trigger the M*
> transitions?  Would it require a transition to M2 regardless of
> settings (maybe that's why it tried)?  

That's what I suspected but looks like the QCA6390 enters M1 state (which will
inturn cause host MHI to transition to M2) when it detects the link inactivity
using a timer. But with my NUC, I can't get QCA6390 to enter M1 state
regardless of the ASPM support in BIOS. In both conditions (with/without ASPM)
device just stays in M0. My hard is guess is that the device depends on the WAKE
sideband signal to go low for entering the M1 state even when it detects link
inactivity in the PCIe bus. And this signal might be low on Dell laptops. But I
need Hemant/Bhaumik to confirm this!

Inspite of that, I got a plenty of below messages in dmesg log when MHI
debugging is enabled:

local ee:AMSS device ee:AMSS dev_state:M0
local ee:AMSS device ee:AMSS dev_state:M0
local ee:AMSS device ee:AMSS dev_state:M0
local ee:AMSS device ee:AMSS dev_state:M0
local ee:AMSS device ee:AMSS dev_state:M0

And this only happens when one MSI vector is used and shared by all IRQs. This
is because for shared IRQs, the kernel calls all of the registered ISRs of the
interrupt line when an interrupt occurs. So I cooked up a patch which checks for
the device state before proceeding through the ISR:

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 2cff5ddff225..520948f3051d 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -386,6 +386,13 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
        state = mhi_get_mhi_state(mhi_cntrl);
        ee = mhi_cntrl->ee;
        mhi_cntrl->ee = mhi_get_exec_env(mhi_cntrl);
+
+       /* Only proceed if the device state is different */
+       if (mhi_cntrl->dev_state == state) {
+               write_unlock_irq(&mhi_cntrl->pm_lock);
+               goto exit_intvec;
+       }
+
        dev_dbg(dev, "local ee:%s device ee:%s dev_state:%s\n",
                TO_MHI_EXEC_STR(mhi_cntrl->ee), TO_MHI_EXEC_STR(ee),
                TO_MHI_STATE_STR(state));

This prevents the spike of the debug messages but not sure if the issue you're
seeing is related to this. Can you give this patch a try on your setup?

Thanks,
Mani

> The MHI dmesg output is pretty
> consistent when it fails, it looks like this:
> https://i.imgur.com/0XExack.jpg .  You can also see it in the mp4's
> I've placed here:
> https://drive.google.com/drive/folders/1wvxZI5XtwPSrm0-6-Ov50cUfqBXSXeNz?usp=sharing
> .  Also note that the failure isn't deterministic, sometimes the
> transition to M2 will succeed and everything works.
> 
> Thanks!

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
