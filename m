Return-Path: <SRS0=ZjKK=FV=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E029C4361B
	for <ath11k@archiver.kernel.org>; Thu, 17 Dec 2020 19:02:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEB3D235FD
	for <ath11k@archiver.kernel.org>; Thu, 17 Dec 2020 19:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEB3D235FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=61P8VxqfvaXd+E4r80ePukID1TUyN8+Ls653MEQ3ZBo=; b=SDlqGgBy+TC5F1L91Rzklc4JC
	1pocNHAiW7rC91+1IOjQLYFF90vNRcRk2cxFs00cGzIjHx0S4EBWhdfa/wRuNz7+PKJJO3qpJXK4F
	qluQGpxW27XsGHWo6rmKrIClAumbFhZptezvQ7tdtak5UKCIC1nGwfWgChpTe3xwPkPGKjUKqdeaA
	B5/0F1iQWThEK2nV5s9SRKZ7kzgFC9og8r/KJjKlfNWytT1/Ejc6+pnBPoWDflMD5YjFpbhiD/f7I
	loxA22BiOMM2IzQiVi4gGsAeRtEZ98PruCsxRRg1UkcGlTrZQ4eL6JVNROFBpWuL6U8mhrRumCrnU
	e5Z9lsyag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpyXD-0003Zn-Hl; Thu, 17 Dec 2020 19:01:55 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpyXA-0003Z8-LP
 for ath11k@lists.infradead.org; Thu, 17 Dec 2020 19:01:53 +0000
Received: by mail-pj1-x102b.google.com with SMTP id b5so4646924pjk.2
 for <ath11k@lists.infradead.org>; Thu, 17 Dec 2020 11:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0cya1P2+MjncFX22oeLCIXtfBHxHCHssHyheawScKGA=;
 b=AFEabYhTkPGwh+IenBCxE/nE62W1tcxs6TZKAIAL3KD6QZro0faxQ4EwQCBf7uQ/t0
 Iz88su4lvAu2NtsYrArA1hpKoNNoCGOG9k4Dqt1At0D5sae+FahuXPVUVWY6fSpB6L47
 sKxcNurCjpCRMmFNXCCbp9xt6X3GF6Q9J7V1mw6IW3DJv0YsTQNuxJGzRpS5LCADuu1X
 siFoqX/jElgCdNeaC4Z3+GyVlUcUi/U1/zsBxzyFmVkvJZsswNNHT8hoP8oV4Sj4Etu7
 2BnQstaX7kKVaB4MTqkwikYGIMZjMtJS8AM0X/yw5Am01s216DnxcQuOJjffDUiw37KA
 AjpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0cya1P2+MjncFX22oeLCIXtfBHxHCHssHyheawScKGA=;
 b=maoVK0mc4pKlgDs+I5vevZlHphAF4CjW4UAQ1/juFtoYgjLV9HCybbFnjNvVDVaxK2
 qqGBBqt87KYmUBmeQs/lw7ThZD0RMVemZtixRdQhW1jimHyHGCNbTD2gRUzq0KOI0yXb
 w8CjuGzgtPIF7hbJ5iH/ZdBeweIfIVKXhZ5YKuuRvNXwbXgO4NUPO/057pKjyCikVPmQ
 dgV3gBrFCYA3waRXectFX683/b0UpXJH6eVmK9UqVBS6Al9pz4SS+IYJLN7ojVab9mh7
 J9JlW2BOXQwtM/P0GGJAWdS45dituWofVS7Z54UYjRE40IKQkU4jIy5hYuiVzbMqpoI7
 89Xg==
X-Gm-Message-State: AOAM532UQ/JUeP7AwAEs/o3KyaR7I9oVeoGewQi7V2jgBH8YARWE+Boh
 4SNXPDygjlW7oQzh044x/OMb65F4YKt6zIVhGG7v3+dB0wM=
X-Google-Smtp-Source: ABdhPJwWneo2q8HPJI02371jD1IElHxruQct8c8m4Y5Tbr8tMnsUnpXtlkNVIAXRJ8TZIljLbNezeQ34Tw996wLx5ak=
X-Received: by 2002:a17:90b:68b:: with SMTP id
 m11mr585908pjz.208.1608231708096; 
 Thu, 17 Dec 2020 11:01:48 -0800 (PST)
MIME-Version: 1.0
References: <87pn3axhm1.fsf@codeaurora.org> <20201217095302.GA4640@work>
In-Reply-To: <20201217095302.GA4640@work>
From: Stephen Liang <stephenliang7@gmail.com>
Date: Thu, 17 Dec 2020 11:01:37 -0800
Message-ID: <CAE+mCOHr7n1hJJ1CCzy8SM7Pn-EEz58Pcru3C8M1ZAqD0gGcQQ@mail.gmail.com>
Subject: Re: ath11k: crashes with 1 MSI vector, workaround disable MHI M2 state
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_140152_723353_D14F988A 
X-CRM114-Status: GOOD (  18.67  )
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
Cc: wi nk <wink@technolu.st>, Jeffrey Hugo <jhugo@codeaurora.org>,
 Carl Huang <cjhuang@codeaurora.org>, Bhaumik Bhatt <bbhatt@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Hemant Kumar <hemantk@codeaurora.org>, ath11k@lists.infradead.org,
 Kalle Valo <kvalo@codeaurora.org>, Mitchell Nordine <mail@mitchellnordine.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

In my last test run, the system hangs were only occasionally
reproducible during WiFi scanning (opening Gnome WiFi settings to see
a list of networks, or looking at the network list dropdown will
trigger the hang). If you do this, one of two things happens, usually
within a minute.

1. The system hangs
2. The firmware crashes

Please find below the debug MHI logs that were generated via echo -n
'module mhi +p' > /sys/kernel/debug/dynamic_debug/control

Firmware crash logs (no hang): https://pastebin.com/raw/E0y49evA
Lockup: https://i.imgur.com/0XExack.jpg

On Thu, Dec 17, 2020 at 1:53 AM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> Hi Kalle,
>
> On Wed, Dec 16, 2020 at 10:47:18AM +0200, Kalle Valo wrote:
> > Hi MHI devs,
> >
>
> [...]
>
> > After extensive debugging from wink he found out that disabling M2 state
> > makes the all problems go away:
> >
> > --- a/drivers/bus/mhi/core/pm.c
> > +++ b/drivers/bus/mhi/core/pm.c
> > @@ -55,12 +55,12 @@ static struct mhi_pm_transitions const dev_state_transitions[] = {
> >         },
> >         {
> >                 MHI_PM_M0,
> > -               MHI_PM_M0 | MHI_PM_M2 | MHI_PM_M3_ENTER |
> > +               MHI_PM_M0 | MHI_PM_M3_ENTER |
> >                 MHI_PM_SYS_ERR_DETECT | MHI_PM_SHUTDOWN_PROCESS |
> >                 MHI_PM_LD_ERR_FATAL_DETECT | MHI_PM_FW_DL_ERR
> >         },
> >         {
> > -               MHI_PM_M2,
> > +               MHI_PM_M0,
> >                 MHI_PM_M0 | MHI_PM_SYS_ERR_DETECT | MHI_PM_SHUTDOWN_PROCESS |
> >                 MHI_PM_LD_ERR_FATAL_DETECT
> >         },
> >
> > And indeed now we have numerous people reporting that with this
> > workaround ath11k is stable on their Dell XPS 13 9310 laptops. What on
> > earth could cause these kernel crashes/interrupt storms? And why is it
> > visible only on Dell laptops? Why does disabling M2 state fix it?
> >
>
> This is related to the ASPM state of the PCIe bus. In the meantime, I'd
> suggest to turn off ASPM using "pcie_aspm=off" in the kernel command
> line so that the MHI bus stays in M0.
>
> For debugging this issue, can someone enable debug logs for MHI and share
> the dmesg output (with ASPM enabled ofc)?
>
> Thanks,
> Mani

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
