Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FAA5D0BB56
	for <ath11k@archiver.kernel.org>; Fri, 25 Oct 2024 15:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZLxMD3LYpw0aYM0hbqBZVGj7CYv7DfIj6AfWn1gCd9U=; b=Le8hY/8Ahl9wd4iGYH0Xmqf9Bq
	9tTNMnQf+Fp/CkuEgs3N4E/jKx1/kUcesEsuV1Df0k2Ye+1j97jTGXAj1MkUKqa+WdUHrmB/xJYw7
	OWoCIyuLVtvcuqq+sbh8nubwWnpj6ZETY2F6ePzAVsqF1xQcyxKiI4JZhf6fpAgLlzlB2TknQaF6M
	DCcW4qALRM6LLT6OFBI7t686takg6SA7EAbcgBeufg/+8/odyOskMjo7R5k/6WQnjcVrha7pj7Wz4
	x68+vfNNgtCYH/uaHnADEN8AOdAKwHub3GzSdYf2u0kD2kr9QeGFNTuaLBXrMmu6bdTD0E892WMhP
	uY+M5DRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4MS7-00000004I4I-1CkC;
	Fri, 25 Oct 2024 15:42:15 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4ME0-00000004FC2-1TSg
	for ath11k@lists.infradead.org;
	Fri, 25 Oct 2024 15:27:42 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2fb498a92f6so22566311fa.1
        for <ath11k@lists.infradead.org>; Fri, 25 Oct 2024 08:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729870057; x=1730474857; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZLxMD3LYpw0aYM0hbqBZVGj7CYv7DfIj6AfWn1gCd9U=;
        b=I9B7PnSWpSz7iswem7sON9gRqAx2VWb5gDzlnkujaHV5JNhqeEuJlpMr24MdB9oPG7
         JSmFdyE28hvKe4hYI/ZGvHJjJoy7cJ69WmwntP+X/BZsDdDaWU0oussHyl9B3lMvmSAN
         F5xgMpyNwVSNxj4Ee5cG3Tv3VOKM+fxASvQ5b6cP0JlOAtBoxwV4InQW5PbO15aEKLmQ
         E+KIFQgW2PsRaWsd6xFn0zWoqB1NflKyY0bpypMui1xiGMVwkjvfvkCVgEq31+CxW/Dk
         An2xPzlgthDTrlemQPSUBAbtO91bjWVm59lz5FzCuuuH1PuksElWupwwrDL0IQ4FSI6B
         sc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729870057; x=1730474857;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLxMD3LYpw0aYM0hbqBZVGj7CYv7DfIj6AfWn1gCd9U=;
        b=No1ixow3sab48SwozSOd97OzQWHjTVdyBRzXvj0HGkaD6mwg9lt8d/9kTMzw074HVe
         2eU7PK9tgGIZq7rH072q+Xk4+/cGprwxVAnLDJOPuFIqap2Ik7c8bVcWe0XeZkabBGwK
         rkAyMul4Dz3M0YIBWUJ6TEQCapUiX4IZV1CMcHJRKaTzw3AbeU4AKGH1R34+pCtt8Mkv
         97c1wsWt5xws4Tz9OwzYE/PRLTWpoTPSgK6dXXJLtzZBLUOhT2hJSnWGOqyNwCfDMf2A
         iY99/di3ckA1Hr+iCbCjPboa9iqAYBVAzO3jFdgag5WuDekFTzV3qE0RQZYES5ND6RN1
         8S1A==
X-Forwarded-Encrypted: i=1; AJvYcCV8ZAseBc0LdQUHmZ1pLyBPi09IFCqjSF2GKsXr9e6bL7vsWfGreH61pV6KSGgRIzU9JzfGlsI=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywnf9VyJfm0u+5AVI5C4ncEC9tPRCn7FN9g0e6RJVRwvZxlDqF0
	8HH87H77hRbHCMxmfe5GQ/iAxH2vw6jL7Oszij3YtDVwll83YYm+rJyzsbpKHijjYhwNDqfO+Fu
	L
X-Google-Smtp-Source: AGHT+IHymibtLZvbqHExD9TlPcDKRRIDD1wUReJVGtgRQre4wReQTIklKIuoBWC9W7yPTptEs0wKaw==
X-Received: by 2002:a2e:8507:0:b0:2fb:51e0:91b with SMTP id 38308e7fff4ca-2fca828d9ebmr33654021fa.43.1729870056799;
        Fri, 25 Oct 2024 08:27:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb4519adfsm2236771fa.41.2024.10.25.08.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 08:27:35 -0700 (PDT)
Date: Fri, 25 Oct 2024 18:27:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: kvalo@kernel.org, quic_jjohnson@quicinc.com, 
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/2] wifi: ath11k: support board-specific firmware
 overrides
Message-ID: <ksyukz7oouw2ilxxpx5nhnshu3zmnd5rtgeloea2vykzzn6ii5@unvpx26neirt>
References: <pdjhyrjoreiykv2tquvufjw3rkti5sxrjvpmkjhvkfasq7zbo4@xxntxdmhhyg5>
 <bc3c06eb-1cb2-4cbb-aaad-95c09223f0cc@quicinc.com>
 <ig3m3sgmnkgfmwrlglundhqif6rygzl7uh7rzoemrz3yxgvfpc@35a323mw2wbt>
 <46de0bfe-ebdd-4b37-a957-3c64e30a1376@quicinc.com>
 <CAA8EJpr4zgV4Sa4sPdCToQWs+CFJu6Xz6CPcPyHDhDczmuzj=g@mail.gmail.com>
 <06ff37ef-dfda-470f-80f7-0f54bae25686@quicinc.com>
 <CAA8EJppFCXeUAZax+jv42JrKYgLmaPQNpXhn-06q_K_uB9JZLQ@mail.gmail.com>
 <46b18b39-9e88-42f8-aa88-5b527fc92a9f@quicinc.com>
 <xp5j6kkpggfhxvzuozqcvs2ugon5xexjgzl24zjlen7kggdaju@vd3okew4vcsy>
 <49313be4-b0e2-4ec4-8663-bd4daf20f78a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49313be4-b0e2-4ec4-8663-bd4daf20f78a@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_082740_448244_BA30650C 
X-CRM114-Status: GOOD (  55.76  )
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

On Fri, Oct 25, 2024 at 10:23:45PM +0800, Miaoqing Pan wrote:
> 
> 
> On 10/25/2024 10:01 PM, Dmitry Baryshkov wrote:
> > On Fri, Oct 25, 2024 at 09:43:04PM +0800, Miaoqing Pan wrote:
> > > 
> > > 
> > > On 10/25/2024 8:21 PM, Dmitry Baryshkov wrote:
> > > > On Fri, 25 Oct 2024 at 15:03, Miaoqing Pan <quic_miaoqing@quicinc.com> wrote:
> > > > > 
> > > > > 
> > > > > 
> > > > > On 10/25/2024 6:20 PM, Dmitry Baryshkov wrote:
> > > > > > On Fri, 25 Oct 2024 at 10:23, Miaoqing Pan <quic_miaoqing@quicinc.com> wrote:
> > > > > > > 
> > > > > > > 
> > > > > > > 
> > > > > > > On 10/25/2024 2:01 PM, Dmitry Baryshkov wrote:
> > > > > > > > On Fri, Oct 25, 2024 at 10:56:02AM +0800, Miaoqing Pan wrote:
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > On 10/25/2024 3:39 AM, Dmitry Baryshkov wrote:
> > > > > > > > > > On Thu, Oct 24, 2024 at 08:25:14AM +0800, Miaoqing Pan wrote:
> > > > > > > > > > > QCA6698AQ IP core is the same as WCN6855 hw2.1, but it has different RF,
> > > > > > > > > > > IPA, thermal, RAM size and etc, so new firmware files used. This change
> > > > > > > > > > > allows board DT files to override the subdir of the firmware directory
> > > > > > > > > > > used to lookup the amss.bin and m3.bin.
> > > > > > > > > > 
> > > > > > > > > > I have slight concerns regarding the _board_ DT files overriding the
> > > > > > > > > > subdir. This opens a can of worms, allowing per-board firmware sets,
> > > > > > > > > > which (as far as I understand) is far from being what driver maintainers
> > > > > > > > > > would like to see. This was required for ath10k-snoc devices, since
> > > > > > > > > > firmware for those platforms is signed by the vendor keys and it is
> > > > > > > > > > limited to a particular SoC or SoC family. For ath11k-pci there is no
> > > > > > > > > > such limitation.
> > > > > > > > > > 
> > > > > > > > > > Would it be possible to use PCI subvendor / subdev to identify affected
> > > > > > > > > > cards? PCI Revision? Any other way to identify the device?  Please
> > > > > > > > > > provide lspci -nnvv for the affected device kind. Is there a way to
> > > > > > > > > > identify the RF part somehow?
> > > > > > > > > 
> > > > > > > > > It's rather difficult, for WCN685x, there are multiple evolved subseries for
> > > > > > > > > customized products. e.g.
> > > > > > > > > 
> > > > > > > > > QCA6698AQ/hw2.1
> > > > > > > > > QCA2066/hw2.1
> > > > > > > > > WCN6855/hw2.0/hw2.1
> > > > > > > > > WCN6856/hw2.1
> > > > > > > > > 
> > > > > > > > > They have the same PCIe ID (17cb:1103), the commit 5dc9d1a55e95 ("wifi:
> > > > > > > > > ath11k: add support for QCA2066") reads TCSR_SOC_HW_SUB_VER to enumerate all
> > > > > > > > > QCA2066 cards, it lacks of flexibility, as the list will become longer and
> > > > > > > > > longer. But it's the only choice for QCA2066, as it's customized for X86
> > > > > > > > > platform which without DT files.
> > > > > > > > 
> > > > > > > > I guess, this is closer to Kalle's expectations: being able to detect
> > > > > > > > the hardware instead of adding DT properties.
> > > > > > > > 
> > > > > > > > > So for MSM those have DT file platforms, like SA8775P-RIDE/QCS8300-RIDE both
> > > > > > > > > attached to QCA6698AQ, we can specify the correct firmware to
> > > > > > > > > 'ath11k/WCN6855/hw2.1/qca6698aq', so it's not per-board firmware, it depends
> > > > > > > > > on the type of the products(x86 windows, IoT products or AUTO).
> > > > > > > > 
> > > > > > > > No-no-no and no. The firmware used must not be specific to the product
> > > > > > > > type.  This is what everybody here is trying to avoid. Please try
> > > > > > > > following the QCA2066 approach instead. And note that it could use new
> > > > > > > > TLD as it perfectly shows itself as a different hardware kind.
> > > > > > > 
> > > > > > > Actually, TCSR_SOC_HW_SUB_VER is not SOC register, it's a TLMM hw
> > > > > > > revision register in BAR0 space, it's hard to maintain the list.
> > > > > > 
> > > > > > How is it so?
> > > > > 
> > > > > I think QCA2066 approach is just a workaround. Different batches of chip
> > > > > manufacture has different value in TCSR_SOC_HW_SUB_VER.
> > > > 
> > > > Ok. So, subvendor / subdevice?
> > > 
> > > The 'subvendor' is fixed to 0x17cb, so it's useless. And I don't have enough
> > > samples to decide to use 'subdevice', it's a risk for existing devices.
> > 
> > What kind of risk? If subvendor is fixed, then it's Qualcomm who
> > enumerates subdevices.
> 
> It's risk for there is not enough sample card to verify. Subdevice is never
> used by ath1xk drivers.

Oh, so it's just about development. I'd say, please discuss such risks
with your management, unless Kalle or Jeff disagree with using the
subdevice for identification.

> 
> > 
> > I'm really reluctant to bringing more DT usage into the PCIe space.
> > Especially if the user is able to swap cards.
> 
> Understand your concern, automatic adaptation is always the best choice. But
> it may not work for MSM boards, the PCIe card (non m.2) is customized, which
> has special PMU control. User can't swap cards. And that's why power
> sequencing module was introduced.

I know. Still, it's better to have less unnecessary data there for
autodiscoverable devices.

> 
> > 
> > > > > > And if it is hard, can we please get to the _normal_ way how vendors
> > > > > > handle PCI hardware differences: the subvendor and subdevice? This is
> > > > > > a usual way to describe that the PCIe device is the same, but the
> > > > > > analog / tuner / RF / etc parts are different.
> > > > > 
> > > > > 
> > > > > > 
> > > > > > > We're going to have another problem to enable NFA765 m.2 card for IoT
> > > > > > > platforms, which has different feature sets with X86 platform, so also
> > > > > > > new firmware should be used. In this case, QCA2066 approach not works.
> > > > > > > Seems DT approach is only choice.
> > > > > > > 
> > > > > > > Could you advice ?
> > > > > > 
> > > > > > Hmm, The first question is _why_ does it have different feature sets?
> > > > > > What exactly is different?
> > > > > 
> > > > > Yeah, for IoT device will support SAP/TWT/UL-OFDMA/BSS color and etc new
> > > > > features, and the existing x86 firmware mainly for STA mode.
> > > > > 
> > > > > What if the user plugs a normal (laptop)
> > > > > > M.2 card into their IoT device?
> > > > > 
> > > > > If there is no DT file to specify the firmware, IoT device will load the
> > > > > default firmware, it will affect SAP and WiFi-6 advanced features.
> > > > 
> > > > Can we get all those nice features into x86 world instead?
> > > 
> > > It's out of our scope, we will not touch the existing stable firmware
> > > version, also it's not allowed.
> > 
> > If it's not allowed for laptop cards, why is it allowed for IoT M.2
> > cards (which then can be perfectly installed into the laptop)?
> > 
> 
> Only specific IoT M.2 cards.

But they are (or are going to be available) for purchase? And more
importantly, what prevents the user of a normal card to use "featureful"
firmware with the laptop card?

-- 
With best wishes
Dmitry

