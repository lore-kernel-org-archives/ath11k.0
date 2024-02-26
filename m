Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B289AC54E41
	for <ath11k@archiver.kernel.org>; Mon, 26 Feb 2024 14:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A0/ZCukQ/ioxMt1iZ+gVoj8e21UGTGIMIaePv4w50ls=; b=XK1fj5Pn6EsFPuGmahw7fBnQ5y
	AgsQehTiy0MXfLB+ANlN9X9IRvVwYyoTVCixFLDs0DD/k9ElHqI+NhbWPQI9p3yd0mASoI6VQbAEo
	S1zlfBS/uQPRrBOaVhdomTrQMr6tom8t5f8xtrOHHqIFNgRAw7QfcZBAY2yRUevufRRa77R3C32+N
	F8kRwz9CYG+bCN3/WlL55+y36QtMZDFRrRyVEGoSY9gKmUC/pnHpOpUv6BIKH6SZ6c6npGW+xHVPo
	eF4EB7sOFmR8gucsRx/vnKxVYsKtiijJy+mY5MalxtI9Gjfti8aU0gJesqwChuDOH9udmJBoN/qzI
	dL2FeQXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rebYE-00000000yCW-1fsy;
	Mon, 26 Feb 2024 14:01:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reZOC-00000000OvS-49VQ
	for ath11k@bombadil.infradead.org;
	Mon, 26 Feb 2024 11:43:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=A0/ZCukQ/ioxMt1iZ+gVoj8e21UGTGIMIaePv4w50ls=; b=DojO9rEDmunZv2k6aq+eiGrKSi
	wE5w9cozgtcThw0D4WU3NarKdhzcA16ZWEAH/QloD3mK6W+qkjz6t2U3ow3woBiy3GejujgCHnyJ/
	mjyvocbtCSqTu4HgRWqMZCH0pdlirhGSh1G1fefCTbzpqaIPWZkEYuHb78AMzHeAD4F7VPhuRQHYP
	t1X3l70JpMoZ7tCLucEkt2A6V8/jU9e8+DjYYN9WXW++UUtQHVTKWao2HV/MZ/pgpJc11XHM+TGSb
	pf7JOChIySbh5qmuRmnUhqmGk5TPFpSoA4QUt4im015RpnfBhFWvTCEZXQ+tNIzosbRkkTOXh6GPP
	OB995VFQ==;
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reZO9-000000019rn-0M8u
	for ath11k@lists.infradead.org;
	Mon, 26 Feb 2024 11:43:19 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-787ac650561so159936685a.3
        for <ath11k@lists.infradead.org>; Mon, 26 Feb 2024 03:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708947794; x=1709552594; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A0/ZCukQ/ioxMt1iZ+gVoj8e21UGTGIMIaePv4w50ls=;
        b=qgYqTB91Owk0j/6Ffl8Aa7FzieVMHDu+7cIX9NZHnku043Icx1jRLlwxcRYv2re3om
         Wiit/ZD7HGufDPqzUZi45y+TUfXHhjTxPZzchRR40b7LBUgvDFXM0Rl79z/dUIzXK9E/
         6B+L3KGRl5odoozW//SHUNBQNdB0fXYuIZ+UoF9ZCrb+ZPsiR4hhyp4NsN6F8Nr6lN+N
         TagiNqbHiK5mxOvBLzwSdiUP0iRKLX6Kb/72Jb4Pf0BYcDNG5vcSAtmCufitnVlkIKyA
         sQVTY3NkeueQqIvOEKy/9I/j7KiIVlF+MHxitViSU1DwYjgXhGKT0RFXI0hBnz8Og4Cz
         fStQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708947794; x=1709552594;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A0/ZCukQ/ioxMt1iZ+gVoj8e21UGTGIMIaePv4w50ls=;
        b=Ip1VclvwCONw+uCc5ytEcaKJpR9Xe/xNCOfdPh7cH0nwG6y/oxz1dZlvw3zqJWeEm5
         l285DRiEacS8sIQuCgVJ2h0c9MY7wxwJnt5v/vSjTeto3gjAR/nFrIzGntdWjnfpWcYL
         AY0PXYUngbQAeNJ1QcLmwv96U9MeBxohZfkxoQ3RflkeqS1CnMYnnqYWIKdkWBbz+spk
         7YJQ3ag9RvxN4S7xyBKj8NJEA5wXWy/PGbetlUX+LKmK36EOnKDZTV5hWZiXYWmRy0tU
         e/6KnJ5zVFL3WI41ttIIVZ2JuuIcUa7ZdYQxmG4eIsc1yt+5Y5hy3tydhkbe2DQHPoPW
         6PmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsmmLadIFcRt/bIK9C+O29uAPAdX85LeT8MdAPZSuMmU0oh0ZWwNQBs2RN0ltYECtBPOFNehP1yKzLu785jE2FfkrS6CC1YT4xMQ==
X-Gm-Message-State: AOJu0YxxuNCJx5wBsAdZzYMnXOarPGXN3XmklWv3L7tS4FH/TAEJhlnZ
	ylBE85XyWIp1PR8PMdGbT/TK1mg59o9sM2neVwwZCHFB0clpifUt7RdRS8K4XA==
X-Google-Smtp-Source: AGHT+IHNgsf5DnizKG2yBjKkWpOwY6iMjPFmpI2P1crIgzEbd9mSBKH0ULZjXVuNxKokSy0+vf8RYg==
X-Received: by 2002:ac8:5e97:0:b0:42e:74bb:5fd3 with SMTP id r23-20020ac85e97000000b0042e74bb5fd3mr5280037qtx.55.1708947793999;
        Mon, 26 Feb 2024 03:43:13 -0800 (PST)
Received: from thinkpad ([117.202.184.81])
        by smtp.gmail.com with ESMTPSA id r5-20020ac84245000000b0042e61ef71dfsm2347580qtm.33.2024.02.26.03.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 03:43:13 -0800 (PST)
Date: Mon, 26 Feb 2024 17:13:07 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Vlastimil Babka <vbabka@suse.cz>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Takashi Iwai <tiwai@suse.de>, Jiri Slaby <jirislaby@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	Linux Wireless <linux-wireless@vger.kernel.org>,
	ath11k@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: ath11k allocation failure on resume breaking wifi until power
 cycle
Message-ID: <20240226114307.GA8422@thinkpad>
References: <96481a45-3547-4d23-ad34-3a8f1d90c1cd@suse.cz>
 <0994ae16-8174-4a04-b454-1974b16bc106@quicinc.com>
 <20240222054739.GG3374@thinkpad>
 <38c36d16-9cc1-4f03-b758-4a3ba90f8aa4@suse.cz>
 <abc0c24f-2137-41eb-bb99-80aea8dacdb2@quicinc.com>
 <a36b35a9-fb37-4afe-a718-a47dfe658cb5@suse.cz>
 <34123ee0-26c9-4240-8d58-aba02f7c66b9@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <34123ee0-26c9-4240-8d58-aba02f7c66b9@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_114317_284251_06F25019 
X-CRM114-Status: GOOD (  33.03  )
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

On Mon, Feb 26, 2024 at 05:11:17PM +0800, Baochen Qiang wrote:
> 
> 
> On 2/26/2024 4:45 PM, Vlastimil Babka wrote:
> > On 2/26/24 03:09, Baochen Qiang wrote:
> > > 
> > > 
> > > On 2/23/2024 11:28 PM, Vlastimil Babka wrote:
> > > > On 2/22/24 06:47, Manivannan Sadhasivam wrote:
> > > > > On Wed, Feb 21, 2024 at 08:34:23AM -0800, Jeff Johnson wrote:
> > > > > > On 2/21/2024 6:39 AM, Vlastimil Babka wrote:
> > > > > > > Hi,
> > > > > > > 
> > > > > > > starting with 6.8 rc series, I'm experiencing problems on resume from s2idle
> > > > > > > on my laptop, which is Lenovo T14s Gen3:
> > > > > > > 
> > > > > > > LENOVO 21CRS0K63K/21CRS0K63K, BIOS R22ET65W (1.35 )
> > > > > > > ath11k_pci 0000:01:00.0: wcn6855 hw2.1
> > > > > > > ath11k_pci 0000:01:00.0: chip_id 0x12 chip_family 0xb board_id 0xff soc_id 0x400c1211
> > > > > > > ath11k_pci 0000:01:00.0: fw_version 0x1106196e fw_build_timestamp 2024-01-12 11:30 fw_build_id WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37
> > > > > > > 
> > > > > > > The problem is an allocation failure happening on resume from s2idle. After
> > > > > > > that the wifi stops working and even a reboot won't fix it, only a
> > > > > > > poweroff/poweron cycle of the laptop.
> > > > > > > 
> > > > > 
> > > > > Looks like WLAN is powered down during s2idle, which doesn't make sense. I hope
> > > > > Jeff will figure out what's going on.
> > > > 
> > > > You mean the firmware is supposed to power it down/up transparently without
> > > > kernel involvement? Because it should be powered down to save the power, no?
> > > Let me clarify: from backtrace info, seems you are using a kernel with
> > > the hibernation-support patches [1] applied, which are not accepted yet
> > > to mainline kernel or even
> > > git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git.
> > 
> > Oh, you're right. Sorry for confusing you all. The rc kernel builds we have
> > for openSUSE have nearly no non-upstream patches so it didn't really occur
> > to me to double check if there might be in the area.
> > 
> > Seems Takashi (Cc'd) added them indeed to make hibernation work:
> > https://bugzilla.suse.com/show_bug.cgi?id=1207948#c51
> > 
> > But then, why do they affect also s2idle, is it intentional? And why I only
> Yes, it's intentional. When suspend/resume, ath11k does the same for either
> a s2idle suspend or a deep one.
> 

That's a terrible idea for usecases like Android IMO. s2idle happens very often
on Android platforms (screen lock) and do you want to powerdown the WLAN device
all the time?

Even though it offers power saving, I'm worried about the latency and possible
teardown of the chipset. Later is only valid if the chipset undergoes complete
power cycle though.

- Mani

> > started seeing the problems in 6.8, the patches are there since August.
> > 
> > > So this is why you see WLAN firmware is powered down during suspend.
> > > 
> > > [1]
> > > https://patchwork.kernel.org/project/linux-wireless/cover/20231127162022.518834-1-kvalo@kernel.org/
> > > 
> > > > 
> > > > But I just found out that when I build my own kernel using the distro config
> > > > as base but reduced by make localmodconfig, the "mhi mhi0: Requested to
> > > > power ON" and related messages don't occur anymore, so there's something
> > > > weird going on.
> > > Here your own kernel doesn't include the hibernation-support patches, right?
> > 
> > Right.
> > 
> > 
> > 

-- 
மணிவண்ணன் சதாசிவம்

