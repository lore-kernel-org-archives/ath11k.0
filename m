Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA51ED33982
	for <ath11k@archiver.kernel.org>; Mon, 28 Oct 2024 13:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WO0RokSzStMyH39P9sh2ZF0TdhIRX16l/eJa/RyOWMM=; b=Q5xPax6Rpg/G8ZQFRtCLDvSZFi
	HEtRiXNsXsCvYRjQjcGebFEuXDpG/fZ+02W/K4uafBbmcNtzjM+cVvLpU1ml5jp1+vp531WwcFkVp
	YyVQ4oEySUfLJ1pNHeX4Or1+JAsalwpSNZp8/cjnobuWkbfdnBFNLBW7QDp83roBugtnT5ksikgqK
	6bmzRDb4/r/3E7CBmwhqOt2vS/TpxZMUewwu/HFG0L+Tl2Ocl2EV2onUtzgYM16DpCmrpfym7sifX
	6tBkHxMLg42j60/03I1cymD1UfcpvtYm79oLxJaTsKN0eflSjlnLvp7epIoelcSe6TwBcSinkEbuV
	JuUvRVHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5QCE-0000000B0JK-1IlN;
	Mon, 28 Oct 2024 13:54:14 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Q3j-0000000AyrC-2b6i
	for ath11k@lists.infradead.org;
	Mon, 28 Oct 2024 13:45:29 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-539fbe22ac0so4295655e87.2
        for <ath11k@lists.infradead.org>; Mon, 28 Oct 2024 06:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730123125; x=1730727925; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WO0RokSzStMyH39P9sh2ZF0TdhIRX16l/eJa/RyOWMM=;
        b=XBD7LyXf53wUGgKdbyG+raWw8K/Q2jNTqvnf6KrVROl9vNfqevG1+5OWp7qTUar500
         MvqeaE+e560G/KXpOZHDkIlVcHpvPuQf3CQZsKZbV+9pLchUuXvtOm60XELgnBgUXmZg
         SdfM60PvBfjmCqTlw308MNUnL/S0+8QOCoqAHdUjQA19/p4aDTb3W90N4Nq03S9At3Yb
         Th1zJz5AvM8aQc2K7E0chl5qogEWeFTlQMo9UyJ54fFDSudaIDxv31whIJmA54uHmTY2
         mw2JjQuKArMr1hwkrTnc+Uyn8XGrE39QJYFOjbztTyS87tF8bAEQAVQc0HuBKMMOXbvq
         p3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730123125; x=1730727925;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WO0RokSzStMyH39P9sh2ZF0TdhIRX16l/eJa/RyOWMM=;
        b=nbBdKWFINIM7iTWboTtWeYo2JPoEAn6pkuos95ir5C+oyoFof9IeqKalrxp9v/yHii
         VF+Qe78AjsOgepMB47mEam4Y7FzZHaPP3mx9h6a5sM+xT7yLihAIAa21lIlvpgI7bqBp
         /FkvxLM6SfGl0/i2ZDt988kxGVw7NeKGjUavSdm4PwPs1STYlukytlIox5gV4DLWQQzc
         bMLR+5ISMl5Kw//P9pGWMEsBSst0d9wdZ6dRRMmoRkbLCf0AoJSmBURQ2nI2DUVsYtNB
         4+d5Om3A/FUWCgvPIJLfb3+dLa3ItWCq36K/ATaf3PV5lGT2jdV272hD1Gv8V0aN4fWH
         3HXw==
X-Forwarded-Encrypted: i=1; AJvYcCVjEVqB2N4U0hH7iBqiuYFSgoZhbwU9jrDWWS2Bx9E4DekZF7BZm2qRi/Z2lqhmIgNBU7LtF5M=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7iNGiNUk9ScZBie81He3HPH1i7ozKzxb1Qjp3Ow/y4mm7NZQw
	Fvz8hsJJQsuNJPxf+g6pJ4WI7YvcyZWxVgPIjPdNcH2iPvXM/CVyekV0cRrySdU=
X-Google-Smtp-Source: AGHT+IGS4vPQ+Q6HiVFBj075lT+rkxLvIyaDKK0RAmKN97y0BbJzsIWNX9GwRVdo1Fa3VJgpemPDtg==
X-Received: by 2002:a05:6512:1324:b0:539:f807:ada1 with SMTP id 2adb3069b0e04-53b34c463c1mr2702355e87.58.1730123125322;
        Mon, 28 Oct 2024 06:45:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1f317bsm1091035e87.286.2024.10.28.06.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 06:45:24 -0700 (PDT)
Date: Mon, 28 Oct 2024 15:45:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: kvalo@kernel.org, quic_jjohnson@quicinc.com, 
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	quic_zhichen@quicinc.com
Subject: Re: [PATCH v2 2/2] wifi: ath11k: support board-specific firmware
 overrides
Message-ID: <csqlwll36viejkp7k57r3jdejpt2kkttmzawq6y6q7i7qs25ht@n3mazu6owblv>
References: <46de0bfe-ebdd-4b37-a957-3c64e30a1376@quicinc.com>
 <CAA8EJpr4zgV4Sa4sPdCToQWs+CFJu6Xz6CPcPyHDhDczmuzj=g@mail.gmail.com>
 <06ff37ef-dfda-470f-80f7-0f54bae25686@quicinc.com>
 <CAA8EJppFCXeUAZax+jv42JrKYgLmaPQNpXhn-06q_K_uB9JZLQ@mail.gmail.com>
 <46b18b39-9e88-42f8-aa88-5b527fc92a9f@quicinc.com>
 <xp5j6kkpggfhxvzuozqcvs2ugon5xexjgzl24zjlen7kggdaju@vd3okew4vcsy>
 <49313be4-b0e2-4ec4-8663-bd4daf20f78a@quicinc.com>
 <ksyukz7oouw2ilxxpx5nhnshu3zmnd5rtgeloea2vykzzn6ii5@unvpx26neirt>
 <590b729b-a921-4ed7-af2d-326cf596ae1f@quicinc.com>
 <73916bc3-f3c8-4ef9-ab8b-d1497f228d13@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <73916bc3-f3c8-4ef9-ab8b-d1497f228d13@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_064527_690580_A87B09C5 
X-CRM114-Status: GOOD (  54.20  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Mon, Oct 28, 2024 at 06:32:58PM +0800, Miaoqing Pan wrote:
> 
> 
> On 10/26/2024 10:31 AM, Miaoqing Pan wrote:
> > 
> > 
> > On 10/25/2024 11:27 PM, Dmitry Baryshkov wrote:
> > > On Fri, Oct 25, 2024 at 10:23:45PM +0800, Miaoqing Pan wrote:
> > > > 
> > > > 
> > > > On 10/25/2024 10:01 PM, Dmitry Baryshkov wrote:
> > > > > On Fri, Oct 25, 2024 at 09:43:04PM +0800, Miaoqing Pan wrote:
> > > > > > 
> > > > > > 
> > > > > > On 10/25/2024 8:21 PM, Dmitry Baryshkov wrote:
> > > > > > > On Fri, 25 Oct 2024 at 15:03, Miaoqing Pan
> > > > > > > <quic_miaoqing@quicinc.com> wrote:
> > > > > > > > 
> > > > > > > > 
> > > > > > > > 
> > > > > > > > On 10/25/2024 6:20 PM, Dmitry Baryshkov wrote:
> > > > > > > > > On Fri, 25 Oct 2024 at 10:23, Miaoqing Pan
> > > > > > > > > <quic_miaoqing@quicinc.com> wrote:
> > > > > > > > > > 
> > > > > > > > > > 
> > > > > > > > > > 
> > > > > > > > > > On 10/25/2024 2:01 PM, Dmitry Baryshkov wrote:
> > > > > > > > > > > On Fri, Oct 25, 2024 at 10:56:02AM +0800, Miaoqing Pan wrote:
> > > > > > > > > > > > 
> > > > > > > > > > > > 
> > > > > > > > > > > > On 10/25/2024 3:39 AM, Dmitry Baryshkov wrote:
> > > > > > > > > > > > > On Thu, Oct 24, 2024 at 08:25:14AM +0800, Miaoqing Pan wrote:
> > > > > > > > > > > > > > QCA6698AQ IP core is the
> > > > > > > > > > > > > > same as WCN6855 hw2.1,
> > > > > > > > > > > > > > but it has different RF,
> > > > > > > > > > > > > > IPA, thermal, RAM size
> > > > > > > > > > > > > > and etc, so new firmware
> > > > > > > > > > > > > > files used. This change
> > > > > > > > > > > > > > allows board DT files to
> > > > > > > > > > > > > > override the subdir of
> > > > > > > > > > > > > > the firmware directory
> > > > > > > > > > > > > > used to lookup the amss.bin and m3.bin.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > I have slight concerns
> > > > > > > > > > > > > regarding the _board_ DT
> > > > > > > > > > > > > files overriding the
> > > > > > > > > > > > > subdir. This opens a can of
> > > > > > > > > > > > > worms, allowing per-board
> > > > > > > > > > > > > firmware sets,
> > > > > > > > > > > > > which (as far as I
> > > > > > > > > > > > > understand) is far from
> > > > > > > > > > > > > being what driver
> > > > > > > > > > > > > maintainers
> > > > > > > > > > > > > would like to see. This was
> > > > > > > > > > > > > required for ath10k-snoc
> > > > > > > > > > > > > devices, since
> > > > > > > > > > > > > firmware for those platforms
> > > > > > > > > > > > > is signed by the vendor keys
> > > > > > > > > > > > > and it is
> > > > > > > > > > > > > limited to a particular SoC
> > > > > > > > > > > > > or SoC family. For
> > > > > > > > > > > > > ath11k-pci there is no
> > > > > > > > > > > > > such limitation.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Would it be possible to use
> > > > > > > > > > > > > PCI subvendor / subdev to
> > > > > > > > > > > > > identify affected
> > > > > > > > > > > > > cards? PCI Revision? Any
> > > > > > > > > > > > > other way to identify the
> > > > > > > > > > > > > device?  Please
> > > > > > > > > > > > > provide lspci -nnvv for the
> > > > > > > > > > > > > affected device kind. Is
> > > > > > > > > > > > > there a way to
> > > > > > > > > > > > > identify the RF part somehow?
> > > > > > > > > > > > 
> > > > > > > > > > > > It's rather difficult, for
> > > > > > > > > > > > WCN685x, there are multiple
> > > > > > > > > > > > evolved subseries for
> > > > > > > > > > > > customized products. e.g.
> > > > > > > > > > > > 
> > > > > > > > > > > > QCA6698AQ/hw2.1
> > > > > > > > > > > > QCA2066/hw2.1
> > > > > > > > > > > > WCN6855/hw2.0/hw2.1
> > > > > > > > > > > > WCN6856/hw2.1
> > > > > > > > > > > > 
> > > > > > > > > > > > They have the same PCIe ID
> > > > > > > > > > > > (17cb:1103), the commit
> > > > > > > > > > > > 5dc9d1a55e95 ("wifi:
> > > > > > > > > > > > ath11k: add support for
> > > > > > > > > > > > QCA2066") reads
> > > > > > > > > > > > TCSR_SOC_HW_SUB_VER to enumerate
> > > > > > > > > > > > all
> > > > > > > > > > > > QCA2066 cards, it lacks of
> > > > > > > > > > > > flexibility, as the list will
> > > > > > > > > > > > become longer and
> > > > > > > > > > > > longer. But it's the only choice
> > > > > > > > > > > > for QCA2066, as it's customized
> > > > > > > > > > > > for X86
> > > > > > > > > > > > platform which without DT files.
> > > > > > > > > > > 
> > > > > > > > > > > I guess, this is closer to Kalle's
> > > > > > > > > > > expectations: being able to detect
> > > > > > > > > > > the hardware instead of adding DT properties.
> > > > > > > > > > > 
> > > > > > > > > > > > So for MSM those have DT file
> > > > > > > > > > > > platforms, like SA8775P-RIDE/
> > > > > > > > > > > > QCS8300-RIDE both
> > > > > > > > > > > > attached to QCA6698AQ, we can specify the correct firmware to
> > > > > > > > > > > > 'ath11k/WCN6855/hw2.1/qca6698aq',
> > > > > > > > > > > > so it's not per-board firmware,
> > > > > > > > > > > > it depends
> > > > > > > > > > > > on the type of the products(x86 windows, IoT products or AUTO).
> > > > > > > > > > > 
> > > > > > > > > > > No-no-no and no. The firmware used
> > > > > > > > > > > must not be specific to the product
> > > > > > > > > > > type.  This is what everybody here is trying to avoid. Please try
> > > > > > > > > > > following the QCA2066 approach
> > > > > > > > > > > instead. And note that it could use
> > > > > > > > > > > new
> > > > > > > > > > > TLD as it perfectly shows itself as a different hardware kind.
> > > > > > > > > > 
> > > > > > > > > > Actually, TCSR_SOC_HW_SUB_VER is not SOC register, it's a TLMM hw
> > > > > > > > > > revision register in BAR0 space, it's hard to maintain the list.
> > > > > > > > > 
> > > > > > > > > How is it so?
> > > > > > > > 
> > > > > > > > I think QCA2066 approach is just a workaround.
> > > > > > > > Different batches of chip
> > > > > > > > manufacture has different value in TCSR_SOC_HW_SUB_VER.
> > > > > > > 
> > > > > > > Ok. So, subvendor / subdevice?
> > > > > > 
> > > > > > The 'subvendor' is fixed to 0x17cb, so it's useless. And
> > > > > > I don't have enough
> > > > > > samples to decide to use 'subdevice', it's a risk for
> > > > > > existing devices.
> > > > > 
> > > > > What kind of risk? If subvendor is fixed, then it's Qualcomm who
> > > > > enumerates subdevices.
> > > > 
> > > > It's risk for there is not enough sample card to verify.
> > > > Subdevice is never
> > > > used by ath1xk drivers.
> > > 
> > > Oh, so it's just about development. I'd say, please discuss such risks
> > > with your management, unless Kalle or Jeff disagree with using the
> > > subdevice for identification.
> > 
> > Kalle & Jeff, any idea to introduce subdevice ?
> > 
> > 
> 
> Whether 'QCA2066 approach' or 'subdevice approach', all need to introduce
> lots of redundant code, as they share the same IP code.
> 
> 'DT approach' only needs minor change, brings great flexibility. It's only
> for Snapdragon boards, will not affect default firmware for X86 platforms.
> 
> > > 
> > > > 
> > > > > 
> > > > > I'm really reluctant to bringing more DT usage into the PCIe space.
> > > > > Especially if the user is able to swap cards.
> > > > 
> > > > Understand your concern, automatic adaptation is always the best
> > > > choice. But
> > > > it may not work for MSM boards, the PCIe card (non m.2) is
> > > > customized, which
> > > > has special PMU control. User can't swap cards. And that's why power
> > > > sequencing module was introduced.
> > > 
> > > I know. Still, it's better to have less unnecessary data there for
> > > autodiscoverable devices.
> > 
> 
> We discussed internally, we have no other choice to enable NFA765 for non
> X86 boards. Could you please approve this 'DT' approach ?

If you can't use subdevice approach for some reason, then we have no
other choice that I can imagine.

-- 
With best wishes
Dmitry

