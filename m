Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F35ECAAD5
	for <ath11k@archiver.kernel.org>; Fri,  2 Sep 2022 13:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=htBEtZ3ODJKCceMt0peETWMHj5507uURFfLm+XsXCgs=; b=C90RyOcVBxwGXW
	xboScF71QeZA25YF50TVo6BsOsI718TruwnH5kWpy3Uy6+35CtkPggdGsZf7qYf0pNFuR19Fo1j79
	kx2CynlihSJRevQiBwq9+8nBsuaxLPOMnvcEB6V/hmFHyW5NVJ49/KzYfUzmwwnZEmGdytSNl0+q0
	EXLUaUha/3ZhzJa3F2w/SNU35fcswEJOa8/K7B0QQkvGUtzVbZGP2X2R5O0k5mNsy5yJk23wnWq4r
	kIUQAqkaXTZ2RmQXR3A9wJepzGdoAAHBrjGIRErcNiAbOMhxcNeWAdXJnQscZDMna9voNTJ9GAANw
	vNf87Ue4PmePlF33NDfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU6ax-00521I-T7; Fri, 02 Sep 2022 13:20:27 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU6av-0051z9-IL
	for ath11k@lists.infradead.org; Fri, 02 Sep 2022 13:20:27 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-11eb44f520dso4585073fac.10
        for <ath11k@lists.infradead.org>; Fri, 02 Sep 2022 06:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=MlPQ6RuyQwzcf964BU43ZE1DMT0sZsqlhs/qizrhu04=;
        b=z+IkFe7d/IeTbgkSgmjVb1Qv9BgoxcrrGhvsC4LsYAWYwc8waUmTtyW8PD2LhtfAAS
         EbvKnrT2PtjTQosdKdEVYkVfcr2HnYW/xN4QRc8WwzHnog3B/8ro4LBKpKUq1pFclorR
         FkwHghDFT5KKVFzAn13pNuOyGk9TGYsQpgJHZi4smX7DK+SNBCc8VeLDPLo65dOA1sf8
         w3ZzRRoquXYwysEp3cri2EdikMGgZGMndTb8BR6rS/sav8MhG6zKs4o4PEoHCN0YtNRz
         E/6mbGfcbuzg0739Wox+lokafBG6a0kR8nwVFFOoZD3G7o/GAhqgidaSgb/gAu0F/Ggu
         i11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=MlPQ6RuyQwzcf964BU43ZE1DMT0sZsqlhs/qizrhu04=;
        b=bgVmoiOSxx2CkSZupi6gJ8WfBfdhW+WJMZTmNNdaO/MehmIckWjupRxiGWedzjt/L/
         wxjcCBL561IqYTjcKfzHr5B9U7MWMr1bnkrg8r4xyFDZbG9RddfBEyKynhf5ES+9otD8
         88p6VmfQIOLP7C1YMMqcDssO34mok7xtmDZR/lKcndKYBwMvlHP/z27yhcaKuv4cw2Mb
         ARrUSStuqJ2oSjorQMNX//rX6naKmRyU8nCK2IYoFYu5cjVcRCA2AZX/dZYY/ucaSgh3
         yijl3jtlPQ8OlzR0baL6NVH9LwsAS9j4e5St3Kv7FlMSLEztJfRdw38JqI9Y4E5+bv4X
         GyFA==
X-Gm-Message-State: ACgBeo1u2LVrSmxaXN16Gg+o/JzomNiERBoZkctzOfXp/Vfeov1rOKKQ
	PkHXyjOIQya7dP0XWXzg050PtgU/giSs/vOM/RKxjg==
X-Google-Smtp-Source: AA6agR7IckvwEiaXtrETYANK2S0/xbjVTZDUh5ZiJkhvriahodKcVl5t1ETL7bWEmu9vxrbTlTq67j7lmaefw2FuB+s=
X-Received: by 2002:a05:6870:3398:b0:113:7f43:d0e9 with SMTP id
 w24-20020a056870339800b001137f43d0e9mr2052975oae.33.1662124822012; Fri, 02
 Sep 2022 06:20:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220720135113.15755-1-quic_mpubbise@quicinc.com>
 <20220720135113.15755-2-quic_mpubbise@quicinc.com> <87czceaqng.fsf@kernel.org>
 <dcc14883-51c9-c1bb-bbea-1b309eccedf2@quicinc.com>
In-Reply-To: <dcc14883-51c9-c1bb-bbea-1b309eccedf2@quicinc.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Fri, 2 Sep 2022 15:20:11 +0200
Message-ID: <CA+HBbNGEoSyfbs=FHtWyvBnG_jh9m=Q9KW=Pcfq+pDdHWEV4mw@mail.gmail.com>
Subject: Re: [PATCH 1/3] ath11k: Enable threaded NAPI on WCN6750
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath11k@lists.infradead.org, 
	linux-wireless@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_062025_635112_07571853 
X-CRM114-Status: GOOD (  35.97  )
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

On Fri, Sep 2, 2022 at 3:18 PM Manikanta Pubbisetty
<quic_mpubbise@quicinc.com> wrote:
>
> On 9/2/2022 6:18 PM, Kalle Valo wrote:
> > Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:
> >
> >> Enable threaded NAPI on WCN6750. Unlike traditional NAPI poll which
> >> runs in softirq context and on the core which scheduled the NAPI,
> >> threaded NAPI makes use of kernel threads which are under direct
> >> control of the scheduler and helps in balancing the NAPI processing
> >> load across multiple CPUs thereby improving throughput.
> >>
> >> In the case of WCN6750, enabling threaded NAPI has improved
> >> 160 MHz RX throughput by nearly 400 Mbps. This should give similar
> >> gains for other ath11k devices as well, therefore enable threaded
> >> NAPI on all other devices.
> >>
> >> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
> >>
> >> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> >> ---
> >>   drivers/net/wireless/ath/ath11k/ahb.c  | 1 +
> >>   drivers/net/wireless/ath/ath11k/pcic.c | 1 +
> >>   2 files changed, 2 insertions(+)
> >>
> >> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
> >> index d7d33d5cdfc5..e44e2f29a88f 100644
> >> --- a/drivers/net/wireless/ath/ath11k/ahb.c
> >> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
> >> @@ -314,6 +314,7 @@ static void ath11k_ahb_ext_irq_enable(struct ath11k_base *ab)
> >>              struct ath11k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
> >>
> >>              if (!irq_grp->napi_enabled) {
> >> +                    dev_set_threaded(&irq_grp->napi_ndev, true);
> >>                      napi_enable(&irq_grp->napi);
> >>                      irq_grp->napi_enabled = true;
> >>              }
> >> diff --git a/drivers/net/wireless/ath/ath11k/pcic.c b/drivers/net/wireless/ath/ath11k/pcic.c
> >> index cf12b98c480d..c703db19de51 100644
> >> --- a/drivers/net/wireless/ath/ath11k/pcic.c
> >> +++ b/drivers/net/wireless/ath/ath11k/pcic.c
> >> @@ -440,6 +440,7 @@ void ath11k_pcic_ext_irq_enable(struct ath11k_base *ab)
> >>              struct ath11k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
> >>
> >>              if (!irq_grp->napi_enabled) {
> >> +                    dev_set_threaded(&irq_grp->napi_ndev, true);
> >>                      napi_enable(&irq_grp->napi);
> >>                      irq_grp->napi_enabled = true;
> >>              }
> >
> > The commit log claims that this enabled _only_ on WCN6750 but aren't we
> > enabling it on all ath11k hardware, or am I missing something? I admit I
> > didn't check this very carefully.
> >
> > (reads the commit log one more time)
> >
> > Ah, in the last sentence you mention that it's enabled on all hardware.
> > That's quite easy to miss and the commit log is quite misleading, please
> > emphasise already in the title and the first sentence that this is for
> > all hardware.
>
> My Bad, yes you right. The patch was made initially only for WCN6750 and
> was enabled later for all devices.
>
> >
> > Also more testing would be nice. Enabling something like this with
> > testing only on one hardware family (WCN7850) can be risky. I always get
> > warm fuzzy feelings if a patch is tested with all three hardware
> > families we currently support:
> >
> > * IPQ8074 etc
> > * QCA6390 etc
> > * WCN7850
> >
>
> WCN7850 should be an ath12k device If I'm correct.
>
> Regardless of the chip family, even I feel that the tput changes like
> these should be tested on all the chipsets. Availability of the hardware
> and time are something which are stopping me in testing the changes on
> all supported targets.
>
> As I said, I had made the changes only to WCN6750 initially (using a
> hw_param). Can we take that approach for now and enable this for other
> targets only if required & upon thorough testing?

I can tell you that on IPQ8074 threaded NAPI really improves perfromance.

Regards,
Robert
>
> Thanks,
> Manikanta
>
> --
> ath11k mailing list
> ath11k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath11k



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
