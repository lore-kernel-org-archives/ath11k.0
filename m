Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C5BC48BEB
	for <ath11k@archiver.kernel.org>; Thu, 22 Feb 2024 05:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wSWmeGU/PHEWXrJBkyrdMCv0vQ2HmKobzP0FHV/IZQY=; b=qjJ4e2xs4yP0+hLdQtbtJEItVp
	pvpJn/tRFdnsBQ/0JTqbHfFN3VSRkU6TQl2K7KTBM3kqlG4+KssrypRiTqDly3SJithe0ZIEpuxC1
	lbWAWvjKCNzIr8KHUjfvEjWR1u3Lj7WGiU76nUWZjImJw7tuTkQkcH+jwy/u5IV2hIGH5LvBjqEe9
	p4T/qTy7338RnTu/QoW2dfdkTbf2IKE4zm3QR0R7/aMxCNDTQkHrkO/JS5lQZphd0hasc8ysfbol9
	1rpMwkB/9hXw8GNDaNOi4qFmTd9DdZULFjSdxnBYEv3UX8RgUaLQg8DnKYzLMr5RbXcurL1U24s8P
	JYrGHpOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd1vz-00000003dam-3wUm;
	Thu, 22 Feb 2024 05:47:51 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd1vw-00000003da6-3nae
	for ath11k@lists.infradead.org;
	Thu, 22 Feb 2024 05:47:50 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6e457fab0e2so342118b3a.0
        for <ath11k@lists.infradead.org>; Wed, 21 Feb 2024 21:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708580866; x=1709185666; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wSWmeGU/PHEWXrJBkyrdMCv0vQ2HmKobzP0FHV/IZQY=;
        b=eHLoJMydhQZjEex47Ac0kkYkRmlgVD+7HJ3bgE2VcRjqpVBBRbAIRFqYSyl1LjVm7+
         PpNCUO3KtoPMwfAAHkazHZqO37hmbG1/ec2WlqIvVbRfiMv13aSSxxxjUI3WMV3Ox2wt
         ys41bJ/RcLIfUyTwTBh36dmit636SLUU7ra3oxM9EsuB9Sj+RJGxiOgoufrSIbp59edj
         9G3HbnqUIcCm7UgCQkRzOy7jWlFOLW6VAuYVIDd79ijxDErIbkdG5jwJZOL0n3gyyT1A
         qGZFg5Y7Z3zURSzVuxxyPKBup7N7cVnnoGBdma6SvJIlgV2hAms3/E+KTxQMe8b6XPt0
         aSKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708580866; x=1709185666;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wSWmeGU/PHEWXrJBkyrdMCv0vQ2HmKobzP0FHV/IZQY=;
        b=YXPq42+lusz6ow0TP+cnknegmpZKD7cD3aFubM2qcl7jThylsChD7M0+IOBw7VK1Vf
         pP0gSv/IM9f3hauy6qdQx7qTdWZi17xtZkXBmxo7IORuNwr/ccHeOf5Y1/Sw7xwHm8/K
         32HPe4kZyf8EBvpx95Vfyc1Hl1PUn0qCGXCo/cfWRf4MJFs/Pd+9kh7BLhKGhJEebmnm
         jcjHX/FudTPnahQ/xvF8kpq/Qekr8gAcqGA2FsFp7JGlZjj1GnMgx7z/J6JTpvOZIj8z
         vjYp6lCqGVu8E/hZivfL1dGFTlCGjyFZIKAVhysm/YuwbT+EYQ1/ncWkswltFwyyaHWj
         yQUw==
X-Forwarded-Encrypted: i=1; AJvYcCWxa8Kp6MuHLHfNhMHzU2JuPyn6kMqSmqSx7ZczUeLnX+LdKJOQeB3uTSdeMJBlqMcuhwucBvb0WGIxKg67q/3EAhwCryfxghBnCA==
X-Gm-Message-State: AOJu0Yywsm6saq1+C8itKf5QirmbqBWSJc2YmFUIsbXl07BLQ4FNj0Wf
	QiBs3aYUmC77JfbeRPGd6De4phRrba/iuF46MgEak1l4QegfJ8LRLq+upMFcpg==
X-Google-Smtp-Source: AGHT+IHcAZ7rWFCCCCrNCo/vjZ7VNYn7nL2POZRFMS+2IBVvi+pUx8xK0KHdEmv6esp16oSwmLVbuA==
X-Received: by 2002:a05:6a00:2d0f:b0:6e0:4a19:8da6 with SMTP id fa15-20020a056a002d0f00b006e04a198da6mr2882834pfb.3.1708580866081;
        Wed, 21 Feb 2024 21:47:46 -0800 (PST)
Received: from thinkpad ([117.193.212.166])
        by smtp.gmail.com with ESMTPSA id fn16-20020a056a002fd000b006e3dfb2ef4esm8623980pfb.95.2024.02.21.21.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 21:47:45 -0800 (PST)
Date: Thu, 22 Feb 2024 11:17:39 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, Kalle Valo <kvalo@kernel.org>,
	Linux Wireless <linux-wireless@vger.kernel.org>,
	ath11k@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: ath11k allocation failure on resume breaking wifi until power
 cycle
Message-ID: <20240222054739.GG3374@thinkpad>
References: <96481a45-3547-4d23-ad34-3a8f1d90c1cd@suse.cz>
 <0994ae16-8174-4a04-b454-1974b16bc106@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0994ae16-8174-4a04-b454-1974b16bc106@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_214749_128266_237FD346 
X-CRM114-Status: GOOD (  21.31  )
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

On Wed, Feb 21, 2024 at 08:34:23AM -0800, Jeff Johnson wrote:
> On 2/21/2024 6:39 AM, Vlastimil Babka wrote:
> > Hi,
> > 
> > starting with 6.8 rc series, I'm experiencing problems on resume from s2idle
> > on my laptop, which is Lenovo T14s Gen3:
> > 
> > LENOVO 21CRS0K63K/21CRS0K63K, BIOS R22ET65W (1.35 )
> > ath11k_pci 0000:01:00.0: wcn6855 hw2.1
> > ath11k_pci 0000:01:00.0: chip_id 0x12 chip_family 0xb board_id 0xff soc_id 0x400c1211
> > ath11k_pci 0000:01:00.0: fw_version 0x1106196e fw_build_timestamp 2024-01-12 11:30 fw_build_id WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37
> > 
> > The problem is an allocation failure happening on resume from s2idle. After
> > that the wifi stops working and even a reboot won't fix it, only a
> > poweroff/poweron cycle of the laptop.
> > 

Looks like WLAN is powered down during s2idle, which doesn't make sense. I hope
Jeff will figure out what's going on.

But if you can share the dmesg after enabling the debug prints of both ath11k
and MHI, it will help a lot.

- Mani

> > This is order 4 (costly order), GFP_NOIO (maybe it's originally GFP_KERNEL
> > but we restrict to GFP_NOIO during resume) allocation, thus it's impossible
> > to do memory compaction and the page allocator gives up. Such high-order
> > allocations should have a fallback using smaller pages, or maybe it could at
> > least retry once the restricted GFP_NOIO context is gone.
> > 
> > I don't know why it never happened before 6.8, didn't spot anything obvious
> > and it happens too unreliably to go bisect. Any idea?
> 
> I've asked the development team to look at this, but in the interim can
> you apply the two hibernation patchsets to see if those cleanups also
> fix your problem:
> 
> [PATCH 0/5] wifi: ath11k: prepare for hibernation support
> https://lore.kernel.org/linux-wireless/20240221024725.10057-1-quic_bqiang@quicinc.com
> 
> [PATCH 0/3] wifi: ath11k: hibernation support
> https://lore.kernel.org/linux-wireless/20240221030026.10553-1-quic_bqiang@quicinc.com

-- 
மணிவண்ணன் சதாசிவம்

