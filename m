Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89EA3C54798
	for <ath11k@archiver.kernel.org>; Tue, 27 Feb 2024 07:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QxFTuOsrpMcuyCu0Hy+lb4Bd4RUL02qdG86Qt+qw8gE=; b=o7kyoV+hGv9An20b7dItuSUlqA
	+Aj9NaQrEclwoBJ2oYTgVfZOK8JwQsVBd4ID8ZGHAAWYsIpSlriNJrfBtQ2rzgWsPpy0aDxY4OjJn
	qBQacrPgtQg8BW1BFvQopdQ2luf3EqjU29B1ZwUQZAXXppWB3M/x8BrtMcJyStRggTjwcwiJmD4uB
	NrTy7RUwKXLuGtwRKrqochEOVwmX+dkKyDZz6i5VrrUk+3oZX1ewswEAVxY25WIcMgpYx8GgJCrWk
	0/wxXRWB677O2gMs3V7FMr1JNoQs1WQjVOWd+u72/YrU9Eq4Wj52/vcjKoHmdRSGw4pnSDVM9Px3Z
	hjPzvztg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rerkN-000000046SV-0et2;
	Tue, 27 Feb 2024 07:19:27 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rerkJ-000000046Pm-3mXV
	for ath11k@lists.infradead.org;
	Tue, 27 Feb 2024 07:19:25 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6e544942455so863741b3a.3
        for <ath11k@lists.infradead.org>; Mon, 26 Feb 2024 23:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709018362; x=1709623162; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QxFTuOsrpMcuyCu0Hy+lb4Bd4RUL02qdG86Qt+qw8gE=;
        b=nLbApi9F3gIB2uUKHDQYAl//lQ5a4x3IfhBs0yIHLG5qGL6fW+ZnyanTMsxUhiSij+
         qBoSnauyhAYuXWtTk4PjtN+3WNDRGilq1cTD9MBfpIoleirlFI52kQ5ZVwGhMKKNtDjb
         gu3qAQiD0jiUDSnbE3NuZz/lWe2asCh//QpBvK7M4dCIt7v9aYKG6Ar2y7+6u4jvzQZJ
         YHZ6e+JU+TRUiScW0GruQcgYF5jLuyJ85x2pNQosp0EQx54LWX8HhcK1nByCBmE3b9ji
         bf95HdrNpmq0ocVQcA6JSPqHyCxsuk5pCQzHK3/Axoy71h8k56C3NVpIRuFiVHip0z26
         y2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709018362; x=1709623162;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QxFTuOsrpMcuyCu0Hy+lb4Bd4RUL02qdG86Qt+qw8gE=;
        b=Ifq5KtpLEkOpfRl/UR/a5cbUW67vTYFtlnChH4McddiHD4ibTb172TiWNBZixzRFAg
         IEUrfWBN9807SEoxzgNYMunLLpUJRqu8v1aBj4xytNP0W2LSIOnv9MwZJw4DKap6HI6h
         BgUoOwlG5Fn1ilPJzqGqZxOytit19z46c5QcsuPeHIdjoPiZjTgcXfEEIHaueaCRAhrg
         W2dCbQKDX8l8r72j6v8C7/1N08CNtxSfEdYaPJyHi9bFalNkKO5ic4XbSgUqvMoLvG3B
         LvzkP1uCz2zSyiRLUyKDHylErzTfs+2toa0YHGOziDlUxdwEIZW2/gxRolc8LvAEmLEJ
         V2Iw==
X-Forwarded-Encrypted: i=1; AJvYcCWMjodtwlyDTk29ty3qZS40MvUSzdJLYkYOk6PnQW1MNsORgz+dOA/PPxVJTj8xIxPF/cd64FZ24OpXbwt5OmMHE8gb2WgpPfzXaw==
X-Gm-Message-State: AOJu0YxiH6/IG7irwjhcMMdSSzA75ziZtSFPPLuZMsoDZ0ZWasN6j6gr
	VOLvWPAhMHn0JILdDUHDRkqM5CjqesHOTRMiiHoCKBaEwg6MF2VHlNoFakUITQ==
X-Google-Smtp-Source: AGHT+IF1LF7zhEOVHEOb+Wy1qkWAaN21CKUVcJcNJZUjgL5YGc8K+RirkDo2jbJKuMOoL83r7N2YfA==
X-Received: by 2002:a05:6a20:e605:b0:1a1:e83:8eb4 with SMTP id my5-20020a056a20e60500b001a10e838eb4mr801517pzb.9.1709018361960;
        Mon, 26 Feb 2024 23:19:21 -0800 (PST)
Received: from thinkpad ([117.213.97.177])
        by smtp.gmail.com with ESMTPSA id kr12-20020a170903080c00b001dca813b07csm839619plb.62.2024.02.26.23.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 23:19:21 -0800 (PST)
Date: Tue, 27 Feb 2024 12:49:15 +0530
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
Message-ID: <20240227071915.GE2587@thinkpad>
References: <96481a45-3547-4d23-ad34-3a8f1d90c1cd@suse.cz>
 <0994ae16-8174-4a04-b454-1974b16bc106@quicinc.com>
 <20240222054739.GG3374@thinkpad>
 <38c36d16-9cc1-4f03-b758-4a3ba90f8aa4@suse.cz>
 <abc0c24f-2137-41eb-bb99-80aea8dacdb2@quicinc.com>
 <a36b35a9-fb37-4afe-a718-a47dfe658cb5@suse.cz>
 <34123ee0-26c9-4240-8d58-aba02f7c66b9@quicinc.com>
 <20240226114307.GA8422@thinkpad>
 <c4b7ec62-7d2d-438b-904d-d935e09e517c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c4b7ec62-7d2d-438b-904d-d935e09e517c@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_231924_021132_A41DE96C 
X-CRM114-Status: GOOD (  40.62  )
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

On Tue, Feb 27, 2024 at 10:43:22AM +0800, Baochen Qiang wrote:
> 
> 
> On 2/26/2024 7:43 PM, Manivannan Sadhasivam wrote:
> > On Mon, Feb 26, 2024 at 05:11:17PM +0800, Baochen Qiang wrote:
> > > 
> > > 
> > > On 2/26/2024 4:45 PM, Vlastimil Babka wrote:
> > > > On 2/26/24 03:09, Baochen Qiang wrote:
> > > > > 
> > > > > 
> > > > > On 2/23/2024 11:28 PM, Vlastimil Babka wrote:
> > > > > > On 2/22/24 06:47, Manivannan Sadhasivam wrote:
> > > > > > > On Wed, Feb 21, 2024 at 08:34:23AM -0800, Jeff Johnson wrote:
> > > > > > > > On 2/21/2024 6:39 AM, Vlastimil Babka wrote:
> > > > > > > > > Hi,
> > > > > > > > > 
> > > > > > > > > starting with 6.8 rc series, I'm experiencing problems on resume from s2idle
> > > > > > > > > on my laptop, which is Lenovo T14s Gen3:
> > > > > > > > > 
> > > > > > > > > LENOVO 21CRS0K63K/21CRS0K63K, BIOS R22ET65W (1.35 )
> > > > > > > > > ath11k_pci 0000:01:00.0: wcn6855 hw2.1
> > > > > > > > > ath11k_pci 0000:01:00.0: chip_id 0x12 chip_family 0xb board_id 0xff soc_id 0x400c1211
> > > > > > > > > ath11k_pci 0000:01:00.0: fw_version 0x1106196e fw_build_timestamp 2024-01-12 11:30 fw_build_id WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37
> > > > > > > > > 
> > > > > > > > > The problem is an allocation failure happening on resume from s2idle. After
> > > > > > > > > that the wifi stops working and even a reboot won't fix it, only a
> > > > > > > > > poweroff/poweron cycle of the laptop.
> > > > > > > > > 
> > > > > > > 
> > > > > > > Looks like WLAN is powered down during s2idle, which doesn't make sense. I hope
> > > > > > > Jeff will figure out what's going on.
> > > > > > 
> > > > > > You mean the firmware is supposed to power it down/up transparently without
> > > > > > kernel involvement? Because it should be powered down to save the power, no?
> > > > > Let me clarify: from backtrace info, seems you are using a kernel with
> > > > > the hibernation-support patches [1] applied, which are not accepted yet
> > > > > to mainline kernel or even
> > > > > git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git.
> > > > 
> > > > Oh, you're right. Sorry for confusing you all. The rc kernel builds we have
> > > > for openSUSE have nearly no non-upstream patches so it didn't really occur
> > > > to me to double check if there might be in the area.
> > > > 
> > > > Seems Takashi (Cc'd) added them indeed to make hibernation work:
> > > > https://bugzilla.suse.com/show_bug.cgi?id=1207948#c51
> > > > 
> > > > But then, why do they affect also s2idle, is it intentional? And why I only
> > > Yes, it's intentional. When suspend/resume, ath11k does the same for either
> > > a s2idle suspend or a deep one.
> > > 
> > 
> > That's a terrible idea for usecases like Android IMO. s2idle happens very often
> > on Android platforms (screen lock) and do you want to powerdown the WLAN device
> > all the time?
> I am not familiar with Android case. Is WoWLAN enabled in that case? I am
> asking this because if WoWLAN is enabled ath11k goes another path and only
> calls mhi_pm_suspend()/resume() instead of mhi_power_down()/up().
> 

I don't work on Android platform, no idea about WoWLAN. But I just raised a
possible issue. Please check with the Qcom internal Android teams about this. If
it is not going to be an issue (different code path as you said above), then
feel free to ignore my comment.

- Mani

> > 
> > Even though it offers power saving, I'm worried about the latency and possible
> > teardown of the chipset. Later is only valid if the chipset undergoes complete
> > power cycle though.
> > 
> > - Mani
> > 
> > > > started seeing the problems in 6.8, the patches are there since August.
> > > > 
> > > > > So this is why you see WLAN firmware is powered down during suspend.
> > > > > 
> > > > > [1]
> > > > > https://patchwork.kernel.org/project/linux-wireless/cover/20231127162022.518834-1-kvalo@kernel.org/
> > > > > 
> > > > > > 
> > > > > > But I just found out that when I build my own kernel using the distro config
> > > > > > as base but reduced by make localmodconfig, the "mhi mhi0: Requested to
> > > > > > power ON" and related messages don't occur anymore, so there's something
> > > > > > weird going on.
> > > > > Here your own kernel doesn't include the hibernation-support patches, right?
> > > > 
> > > > Right.
> > > > 
> > > > 
> > > > 
> > 

-- 
மணிவண்ணன் சதாசிவம்

