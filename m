Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED1CD0C614
	for <ath11k@archiver.kernel.org>; Fri, 25 Oct 2024 14:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Nfudw1Ijx/8Xpt/Kv9XtTdHSXkroBGWJBG4jEUcsrk=; b=u3hHTuy5Ha+KtBmP6vu6USJxtk
	jw1b/JCVfqJSiwNozkecWPDYPSx0/lbp6NxAY9eM7Nk1yRaaBTbRu2jdsL9XIa3U9U6TWs3hcZ4Re
	WDdV3LtWdX9D7G+oMn7V0nLhx6fbvv/WlBdGSCcef+S1K01OdecpVkXCnOD4cd+Nm9ibz/cQVNu8T
	UEFWSOHGmIvDimBuQqmnzQJIbtQ8zcmvjZ81uAX1Xt3tckCvc5jkCvgxfsyJ5xvJ7Is9+msO/GUWg
	Ox6Bxi7PtUwD+/yZlM1wmeLpPSWY60GS5h8ThTpB1lCysAg/e6cAjbOvmn7Sp9lZwTvBlSuhAJ/4w
	zuw16J/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4L2C-00000003wte-2wsq;
	Fri, 25 Oct 2024 14:11:24 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4KtC-00000003v3I-4AcL
	for ath11k@lists.infradead.org;
	Fri, 25 Oct 2024 14:02:11 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-539ebb5a20aso2187089e87.2
        for <ath11k@lists.infradead.org>; Fri, 25 Oct 2024 07:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729864925; x=1730469725; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2Nfudw1Ijx/8Xpt/Kv9XtTdHSXkroBGWJBG4jEUcsrk=;
        b=xlU19xvZWi83rehW3DZs+FnlUrESgDKv+NxICFiVlVxW4wDnHGMSn/3TgLaVsS16bD
         7vCy8qxpC+jc4gTlizLxTbjIJ4HuilBgWj4pu3xotX56o+IDM9UESC+vxl39v7TW91pE
         EMtGgWuzsjfnxDr8tKV6MpNTQXrDVa6AyR8e2ztB7RIbBbEfOdCrZe/kAce/d1xz8lXW
         TSCv1gsFTIRikQ4g267FxGhn4qZO4BgdYrFoi46kCe+1+emo3JFfMkrOEmVU/b+uY0a4
         Rp9+oPNLQkdc2ekwHt38JwcArT+vEswL4lXewo7wvVo+LgjTn+svQdkge9EfW2SZaTG+
         4gzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729864925; x=1730469725;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Nfudw1Ijx/8Xpt/Kv9XtTdHSXkroBGWJBG4jEUcsrk=;
        b=Ct90QlmEzLBPeoJUnCgPHTwBt5Ylul1nlbNyYkYOKMhryT92gDX4SVNTWCzUYX/V2M
         ffCh7fsNnEJbUeaRIuuhl7p1K5bIkZKAT8QNxDJixrteFnDH9rHjb/e8RLTpj3Uukhhv
         ouE3RrFMVguAiMHPn61p2iS8MTlgciT7QBSEqYkw4m78efTGIyuUtWZfvBFwz5tcw9ci
         +tBm5lKTpVOxZrP4NCle7UhyWFH4Y2QPln3wXDpiMosG2UPekKy/9fbw66dsmlMPTN2E
         dY3Jb9feu+etMGIpN0jzQHWFBaTxcJaPxgXOQlC+2iq4AUpwwx+8wrX8L3r/dEOJXdki
         VtWA==
X-Forwarded-Encrypted: i=1; AJvYcCUBNmWgQ9LAbswWzzQQBYKhaRK9AHOjyD5lZML3szYL/Qn3cqkKO/rU2AD9ftGZUAtxmsRwUio=@lists.infradead.org
X-Gm-Message-State: AOJu0YyPwV1VVBZ3Pe1cU24MddORtD1CaSg2vbA2D6p9LmlOaVkz/UCA
	WruglZoM1FzhzmDlAhlXPsv1OHrVyNPsRjdXoYDTtXz/gs8b7G8XzUz2Gc+41yc=
X-Google-Smtp-Source: AGHT+IGlgIINW/NRGGW5OX/pYH3iCgOXQYfEGayutQYaIB2YYqfQv9lQrWULX7nLw4cDcYMWY/7HOQ==
X-Received: by 2002:a05:6512:114f:b0:539:88f7:d3c4 with SMTP id 2adb3069b0e04-53b1a328277mr6219477e87.29.1729864923455;
        Fri, 25 Oct 2024 07:02:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e140dbfsm193662e87.113.2024.10.25.07.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 07:02:02 -0700 (PDT)
Date: Fri, 25 Oct 2024 17:01:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: kvalo@kernel.org, quic_jjohnson@quicinc.com, 
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/2] wifi: ath11k: support board-specific firmware
 overrides
Message-ID: <xp5j6kkpggfhxvzuozqcvs2ugon5xexjgzl24zjlen7kggdaju@vd3okew4vcsy>
References: <20241024002514.92290-1-quic_miaoqing@quicinc.com>
 <20241024002514.92290-3-quic_miaoqing@quicinc.com>
 <pdjhyrjoreiykv2tquvufjw3rkti5sxrjvpmkjhvkfasq7zbo4@xxntxdmhhyg5>
 <bc3c06eb-1cb2-4cbb-aaad-95c09223f0cc@quicinc.com>
 <ig3m3sgmnkgfmwrlglundhqif6rygzl7uh7rzoemrz3yxgvfpc@35a323mw2wbt>
 <46de0bfe-ebdd-4b37-a957-3c64e30a1376@quicinc.com>
 <CAA8EJpr4zgV4Sa4sPdCToQWs+CFJu6Xz6CPcPyHDhDczmuzj=g@mail.gmail.com>
 <06ff37ef-dfda-470f-80f7-0f54bae25686@quicinc.com>
 <CAA8EJppFCXeUAZax+jv42JrKYgLmaPQNpXhn-06q_K_uB9JZLQ@mail.gmail.com>
 <46b18b39-9e88-42f8-aa88-5b527fc92a9f@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46b18b39-9e88-42f8-aa88-5b527fc92a9f@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_070207_266522_50188EBA 
X-CRM114-Status: GOOD (  55.72  )
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

On Fri, Oct 25, 2024 at 09:43:04PM +0800, Miaoqing Pan wrote:
> 
> 
> On 10/25/2024 8:21 PM, Dmitry Baryshkov wrote:
> > On Fri, 25 Oct 2024 at 15:03, Miaoqing Pan <quic_miaoqing@quicinc.com> wrote:
> > > 
> > > 
> > > 
> > > On 10/25/2024 6:20 PM, Dmitry Baryshkov wrote:
> > > > On Fri, 25 Oct 2024 at 10:23, Miaoqing Pan <quic_miaoqing@quicinc.com> wrote:
> > > > > 
> > > > > 
> > > > > 
> > > > > On 10/25/2024 2:01 PM, Dmitry Baryshkov wrote:
> > > > > > On Fri, Oct 25, 2024 at 10:56:02AM +0800, Miaoqing Pan wrote:
> > > > > > > 
> > > > > > > 
> > > > > > > On 10/25/2024 3:39 AM, Dmitry Baryshkov wrote:
> > > > > > > > On Thu, Oct 24, 2024 at 08:25:14AM +0800, Miaoqing Pan wrote:
> > > > > > > > > QCA6698AQ IP core is the same as WCN6855 hw2.1, but it has different RF,
> > > > > > > > > IPA, thermal, RAM size and etc, so new firmware files used. This change
> > > > > > > > > allows board DT files to override the subdir of the firmware directory
> > > > > > > > > used to lookup the amss.bin and m3.bin.
> > > > > > > > 
> > > > > > > > I have slight concerns regarding the _board_ DT files overriding the
> > > > > > > > subdir. This opens a can of worms, allowing per-board firmware sets,
> > > > > > > > which (as far as I understand) is far from being what driver maintainers
> > > > > > > > would like to see. This was required for ath10k-snoc devices, since
> > > > > > > > firmware for those platforms is signed by the vendor keys and it is
> > > > > > > > limited to a particular SoC or SoC family. For ath11k-pci there is no
> > > > > > > > such limitation.
> > > > > > > > 
> > > > > > > > Would it be possible to use PCI subvendor / subdev to identify affected
> > > > > > > > cards? PCI Revision? Any other way to identify the device?  Please
> > > > > > > > provide lspci -nnvv for the affected device kind. Is there a way to
> > > > > > > > identify the RF part somehow?
> > > > > > > 
> > > > > > > It's rather difficult, for WCN685x, there are multiple evolved subseries for
> > > > > > > customized products. e.g.
> > > > > > > 
> > > > > > > QCA6698AQ/hw2.1
> > > > > > > QCA2066/hw2.1
> > > > > > > WCN6855/hw2.0/hw2.1
> > > > > > > WCN6856/hw2.1
> > > > > > > 
> > > > > > > They have the same PCIe ID (17cb:1103), the commit 5dc9d1a55e95 ("wifi:
> > > > > > > ath11k: add support for QCA2066") reads TCSR_SOC_HW_SUB_VER to enumerate all
> > > > > > > QCA2066 cards, it lacks of flexibility, as the list will become longer and
> > > > > > > longer. But it's the only choice for QCA2066, as it's customized for X86
> > > > > > > platform which without DT files.
> > > > > > 
> > > > > > I guess, this is closer to Kalle's expectations: being able to detect
> > > > > > the hardware instead of adding DT properties.
> > > > > > 
> > > > > > > So for MSM those have DT file platforms, like SA8775P-RIDE/QCS8300-RIDE both
> > > > > > > attached to QCA6698AQ, we can specify the correct firmware to
> > > > > > > 'ath11k/WCN6855/hw2.1/qca6698aq', so it's not per-board firmware, it depends
> > > > > > > on the type of the products(x86 windows, IoT products or AUTO).
> > > > > > 
> > > > > > No-no-no and no. The firmware used must not be specific to the product
> > > > > > type.  This is what everybody here is trying to avoid. Please try
> > > > > > following the QCA2066 approach instead. And note that it could use new
> > > > > > TLD as it perfectly shows itself as a different hardware kind.
> > > > > 
> > > > > Actually, TCSR_SOC_HW_SUB_VER is not SOC register, it's a TLMM hw
> > > > > revision register in BAR0 space, it's hard to maintain the list.
> > > > 
> > > > How is it so?
> > > 
> > > I think QCA2066 approach is just a workaround. Different batches of chip
> > > manufacture has different value in TCSR_SOC_HW_SUB_VER.
> > 
> > Ok. So, subvendor / subdevice?
> 
> The 'subvendor' is fixed to 0x17cb, so it's useless. And I don't have enough
> samples to decide to use 'subdevice', it's a risk for existing devices.

What kind of risk? If subvendor is fixed, then it's Qualcomm who
enumerates subdevices.

I'm really reluctant to bringing more DT usage into the PCIe space.
Especially if the user is able to swap cards.

> > > > And if it is hard, can we please get to the _normal_ way how vendors
> > > > handle PCI hardware differences: the subvendor and subdevice? This is
> > > > a usual way to describe that the PCIe device is the same, but the
> > > > analog / tuner / RF / etc parts are different.
> > > 
> > > 
> > > > 
> > > > > We're going to have another problem to enable NFA765 m.2 card for IoT
> > > > > platforms, which has different feature sets with X86 platform, so also
> > > > > new firmware should be used. In this case, QCA2066 approach not works.
> > > > > Seems DT approach is only choice.
> > > > > 
> > > > > Could you advice ?
> > > > 
> > > > Hmm, The first question is _why_ does it have different feature sets?
> > > > What exactly is different?
> > > 
> > > Yeah, for IoT device will support SAP/TWT/UL-OFDMA/BSS color and etc new
> > > features, and the existing x86 firmware mainly for STA mode.
> > > 
> > > What if the user plugs a normal (laptop)
> > > > M.2 card into their IoT device?
> > > 
> > > If there is no DT file to specify the firmware, IoT device will load the
> > > default firmware, it will affect SAP and WiFi-6 advanced features.
> > 
> > Can we get all those nice features into x86 world instead?
> 
> It's out of our scope, we will not touch the existing stable firmware
> version, also it's not allowed.

If it's not allowed for laptop cards, why is it allowed for IoT M.2
cards (which then can be perfectly installed into the laptop)?

> > > > > > > 0000:01:00.0 Network controller [0280]: Qualcomm QCNFA765 Wireless Network
> > > > > > > Adapter [17cb:1103] (rev 01)
> > > > > > >        Subsystem: Qualcomm QCNFA765 Wireless Network Adapter [17cb:0108]
> > > > > > >        Device tree node: /sys/firmware/devicetree/base/pci@1c00000/pcie@0/wifi@0
> > > > > > > 
> > > > > > > 
> > > > > > > > 
> > > > > > > > Could you possibly clarify, how this situation is handled in Windows
> > > > > > > > world?
> > > > > > > 
> > > > > > > X86 platforms use standard m.2 PCIe card, and it will only use the default
> > > > > > > main firmware files, as they without DT files.
> > > > > > 
> > > > > > So QCA6698AQ cannot appear on an M.2 PCIe card?
> > > > > 
> > > > > No, but no m.2 PCIe card so far. It depends on power sequencing module
> > > > > to do power up.
> > > > 
> > > > You are describing software (power sequencing module), while I was
> > > > talking about the hardware. Nothing prevents OEM from adding fixed
> > > > regulators to drive necessary voltages from the PCIe slot.

-- 
With best wishes
Dmitry

