Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE9CBD0C601
	for <ath11k@archiver.kernel.org>; Fri, 25 Oct 2024 12:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LxzRE0N2s/7zXVtfiA+xvApQOBfYughP6DuudM8VCDI=; b=hYcov418nZbcNHDsnCGhysXYHz
	jcQRagef1ylZR6hfWTwkhq43uWEHG8bG+PE74OPqQnwcFZ9qJald/PiOGoy8jDh6UaffnoUfY33I0
	vUlNaMKltnsRdEFpP7GsSLaNe6sva2xH2Ua1M0+XmJya4NjSgdx0LgEbUZ5v1tSL2+2h56IOPMQdL
	sO3wM6SAvuOkFDfklJFupZXTOzBisjGqItsQ4TJeEWWoir3FzPFgvoFlZ3pC2H36g2SvcvrhouPjJ
	OYfe7rz4FzpUDU3vPMfa/nuFOICBbW2btRLn2dMDkyChTj/RRZ5ibHwFB3aOAH3QMWrZBAYaEWOUE
	qUxMpnWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4JKX-00000003dUS-0gcv;
	Fri, 25 Oct 2024 12:22:13 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4JKU-00000003dTn-0Zfm
	for ath11k@lists.infradead.org;
	Fri, 25 Oct 2024 12:22:11 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-e28fd83b5bbso2198109276.0
        for <ath11k@lists.infradead.org>; Fri, 25 Oct 2024 05:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729858929; x=1730463729; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LxzRE0N2s/7zXVtfiA+xvApQOBfYughP6DuudM8VCDI=;
        b=FSejuUDpGzOiu9Enb2XYr+sJIiYwtsCrdV90KeMZxLzXV7O0ZMgr4Y5RS5crE3zJ5j
         NUabPFXJDahGBZZnDD9B4sDYo60ADhN0U/5rlSWD4zezkdeN2YRkVZabPRlUrG17vrt6
         Gyj3elb66yF6BUxxkvpi5G9A4kffUV4ZTQSBx59UFJtr4gJie59jt/SvCJtflDB+e4wI
         UwHI1ZW+o0L60LtidENkF44x4UwOzuSpMHiEy2+YE8v7MJ426Hw6eMO/UHNUw2ije/ec
         hDMTdtnvsg8qB+kiN+l8G4wj5aE3ZAQolkwlvkTzjE/SbggxXCZ+OQQbv4v2SjoeCkUQ
         la/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729858929; x=1730463729;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LxzRE0N2s/7zXVtfiA+xvApQOBfYughP6DuudM8VCDI=;
        b=Mm7PYLyNZM7NzlKAG/kU4oMm5Otflv2U/ZCwR/SgEzHTv7QiYPGcxj8wE+NkhpOZBa
         TPSdVGLxJX6Qo1/HwQ6Rd7RoVDJmLNEEinXDqNUitYn42mVme37/g5Rxi5eM4YcE0C1D
         0T5VucscFkG9DvT6zB7E8PDqn8YBt2/LwY8yUxva7imYufnlQmc9jfKlzCOybRafYpus
         u+094iI4FTzUjsmq/5LZlp1+zN/6tnC8It1+lUf90F1oL9tvwGfNGV0xLGyapxBQWpmW
         xizLrR2J0AA/jm//SQ9rhc7Fb7Gvt8YLG3ZdKMcUy07YG6u9fUK2NgD+fCF3HhgToHBZ
         fv4w==
X-Forwarded-Encrypted: i=1; AJvYcCVytB7xSRBV3yOPvHMAqlJLp5o2la//vmEZ/GOduD6LqYQ2Gd1ArRxrwRsR3gkkLNK4pV/7gFs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzLAqg7sv7oqB07ykLnFeiWKyRAn1p9qpGBR213MOL+DYtXWyYM
	ZhsFB4Q5dPP5hxh73z/EdGYTxCJPyxpkz0162+2xTUurjdandaobqWEcJ2i9lA3lnbTAZnuQAqE
	YNwEwXOfzyiskaKW/pF8enDtL3GEClZB8x7HNlQ==
X-Google-Smtp-Source: AGHT+IFwyIesELBkScq0Aizd6KHsCPs/KR8vou/Mnx8r6zG1TNlCTqPTwPa0ElcapuznuVMqbh1W4wQ2YsSD25RDf/I=
X-Received: by 2002:a05:690c:39c:b0:6e3:39ed:f029 with SMTP id
 00721157ae682-6e7f0fdc58amr111291477b3.44.1729858928907; Fri, 25 Oct 2024
 05:22:08 -0700 (PDT)
MIME-Version: 1.0
References: <20241024002514.92290-1-quic_miaoqing@quicinc.com>
 <20241024002514.92290-3-quic_miaoqing@quicinc.com> <pdjhyrjoreiykv2tquvufjw3rkti5sxrjvpmkjhvkfasq7zbo4@xxntxdmhhyg5>
 <bc3c06eb-1cb2-4cbb-aaad-95c09223f0cc@quicinc.com> <ig3m3sgmnkgfmwrlglundhqif6rygzl7uh7rzoemrz3yxgvfpc@35a323mw2wbt>
 <46de0bfe-ebdd-4b37-a957-3c64e30a1376@quicinc.com> <CAA8EJpr4zgV4Sa4sPdCToQWs+CFJu6Xz6CPcPyHDhDczmuzj=g@mail.gmail.com>
 <06ff37ef-dfda-470f-80f7-0f54bae25686@quicinc.com>
In-Reply-To: <06ff37ef-dfda-470f-80f7-0f54bae25686@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 25 Oct 2024 15:21:56 +0300
Message-ID: <CAA8EJppFCXeUAZax+jv42JrKYgLmaPQNpXhn-06q_K_uB9JZLQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] wifi: ath11k: support board-specific firmware overrides
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: kvalo@kernel.org, quic_jjohnson@quicinc.com, ath11k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_052210_206383_A27AEA92 
X-CRM114-Status: GOOD (  44.78  )
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

On Fri, 25 Oct 2024 at 15:03, Miaoqing Pan <quic_miaoqing@quicinc.com> wrote:
>
>
>
> On 10/25/2024 6:20 PM, Dmitry Baryshkov wrote:
> > On Fri, 25 Oct 2024 at 10:23, Miaoqing Pan <quic_miaoqing@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 10/25/2024 2:01 PM, Dmitry Baryshkov wrote:
> >>> On Fri, Oct 25, 2024 at 10:56:02AM +0800, Miaoqing Pan wrote:
> >>>>
> >>>>
> >>>> On 10/25/2024 3:39 AM, Dmitry Baryshkov wrote:
> >>>>> On Thu, Oct 24, 2024 at 08:25:14AM +0800, Miaoqing Pan wrote:
> >>>>>> QCA6698AQ IP core is the same as WCN6855 hw2.1, but it has different RF,
> >>>>>> IPA, thermal, RAM size and etc, so new firmware files used. This change
> >>>>>> allows board DT files to override the subdir of the firmware directory
> >>>>>> used to lookup the amss.bin and m3.bin.
> >>>>>
> >>>>> I have slight concerns regarding the _board_ DT files overriding the
> >>>>> subdir. This opens a can of worms, allowing per-board firmware sets,
> >>>>> which (as far as I understand) is far from being what driver maintainers
> >>>>> would like to see. This was required for ath10k-snoc devices, since
> >>>>> firmware for those platforms is signed by the vendor keys and it is
> >>>>> limited to a particular SoC or SoC family. For ath11k-pci there is no
> >>>>> such limitation.
> >>>>>
> >>>>> Would it be possible to use PCI subvendor / subdev to identify affected
> >>>>> cards? PCI Revision? Any other way to identify the device?  Please
> >>>>> provide lspci -nnvv for the affected device kind. Is there a way to
> >>>>> identify the RF part somehow?
> >>>>
> >>>> It's rather difficult, for WCN685x, there are multiple evolved subseries for
> >>>> customized products. e.g.
> >>>>
> >>>> QCA6698AQ/hw2.1
> >>>> QCA2066/hw2.1
> >>>> WCN6855/hw2.0/hw2.1
> >>>> WCN6856/hw2.1
> >>>>
> >>>> They have the same PCIe ID (17cb:1103), the commit 5dc9d1a55e95 ("wifi:
> >>>> ath11k: add support for QCA2066") reads TCSR_SOC_HW_SUB_VER to enumerate all
> >>>> QCA2066 cards, it lacks of flexibility, as the list will become longer and
> >>>> longer. But it's the only choice for QCA2066, as it's customized for X86
> >>>> platform which without DT files.
> >>>
> >>> I guess, this is closer to Kalle's expectations: being able to detect
> >>> the hardware instead of adding DT properties.
> >>>
> >>>> So for MSM those have DT file platforms, like SA8775P-RIDE/QCS8300-RIDE both
> >>>> attached to QCA6698AQ, we can specify the correct firmware to
> >>>> 'ath11k/WCN6855/hw2.1/qca6698aq', so it's not per-board firmware, it depends
> >>>> on the type of the products(x86 windows, IoT products or AUTO).
> >>>
> >>> No-no-no and no. The firmware used must not be specific to the product
> >>> type.  This is what everybody here is trying to avoid. Please try
> >>> following the QCA2066 approach instead. And note that it could use new
> >>> TLD as it perfectly shows itself as a different hardware kind.
> >>
> >> Actually, TCSR_SOC_HW_SUB_VER is not SOC register, it's a TLMM hw
> >> revision register in BAR0 space, it's hard to maintain the list.
> >
> > How is it so?
>
> I think QCA2066 approach is just a workaround. Different batches of chip
> manufacture has different value in TCSR_SOC_HW_SUB_VER.

Ok. So, subvendor / subdevice?

>
> >
> > And if it is hard, can we please get to the _normal_ way how vendors
> > handle PCI hardware differences: the subvendor and subdevice? This is
> > a usual way to describe that the PCIe device is the same, but the
> > analog / tuner / RF / etc parts are different.
>
>
> >
> >> We're going to have another problem to enable NFA765 m.2 card for IoT
> >> platforms, which has different feature sets with X86 platform, so also
> >> new firmware should be used. In this case, QCA2066 approach not works.
> >> Seems DT approach is only choice.
> >>
> >> Could you advice ?
> >
> > Hmm, The first question is _why_ does it have different feature sets?
> > What exactly is different?
>
> Yeah, for IoT device will support SAP/TWT/UL-OFDMA/BSS color and etc new
> features, and the existing x86 firmware mainly for STA mode.
>
> What if the user plugs a normal (laptop)
> > M.2 card into their IoT device?
>
> If there is no DT file to specify the firmware, IoT device will load the
> default firmware, it will affect SAP and WiFi-6 advanced features.

Can we get all those nice features into x86 world instead?

>
>
> >
> >>>
> >>>> 0000:01:00.0 Network controller [0280]: Qualcomm QCNFA765 Wireless Network
> >>>> Adapter [17cb:1103] (rev 01)
> >>>>       Subsystem: Qualcomm QCNFA765 Wireless Network Adapter [17cb:0108]
> >>>>       Device tree node: /sys/firmware/devicetree/base/pci@1c00000/pcie@0/wifi@0
> >>>>
> >>>>
> >>>>>
> >>>>> Could you possibly clarify, how this situation is handled in Windows
> >>>>> world?
> >>>>
> >>>> X86 platforms use standard m.2 PCIe card, and it will only use the default
> >>>> main firmware files, as they without DT files.
> >>>
> >>> So QCA6698AQ cannot appear on an M.2 PCIe card?
> >>
> >> No, but no m.2 PCIe card so far. It depends on power sequencing module
> >> to do power up.
> >
> > You are describing software (power sequencing module), while I was
> > talking about the hardware. Nothing prevents OEM from adding fixed
> > regulators to drive necessary voltages from the PCIe slot.
> >
>


-- 
With best wishes
Dmitry

