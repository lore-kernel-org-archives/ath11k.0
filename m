Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19580C369C2
	for <ath11k@archiver.kernel.org>; Fri, 25 Apr 2025 09:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QI7dIhq4gpO8qmw+kHNvoSNDB7nG2z7FjzlKM42EHH4=; b=lK8jGJzVojSKd6OeW3UwFG5dqD
	qudKFDfyIjgyrHf0kF+lxiHYpOu1mj+ddewpAGb0pe1RJ2VY5fRQLnm9A0Ocn6ID1qd68XRSdlIly
	mxwH50R10Fu2k3bE7sNYRqE0WHtqFWG4c6Qk/xhh37t91eljtKGt8BW4V0jwAM15APLpE2Q2WCYby
	EY0eZxfEqZtqhMCNWoY/C6ZF0PBZY73mZ9Fcde0TSym2PpXj6hXESKnOxxTTHSmHOVQLWWU0D4GgT
	2Dg8hTJEwMNEQUO5m9l0kRHLbL7wzxnOdj84u7IwLBKKY+lo5YsqbpYowWPkJzmeJO3DcF0jkyS/O
	9Is5+F0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8FWR-0000000GZrz-0quH;
	Fri, 25 Apr 2025 09:39:03 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Euc-0000000GSE2-3F09
	for ath11k@lists.infradead.org;
	Fri, 25 Apr 2025 09:00:00 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-736c062b1f5so1710463b3a.0
        for <ath11k@lists.infradead.org>; Fri, 25 Apr 2025 01:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745571598; x=1746176398; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QI7dIhq4gpO8qmw+kHNvoSNDB7nG2z7FjzlKM42EHH4=;
        b=DDAKG6huyJjbaMbZURLRp4+xYCrB14W4NwfY6ODrG6UeFYpUC4K5AWhhMtTDrLnio0
         3EW9XcawEgOc5jcqd5RQJLeC+40GmBWPgYKKPPVvKwEgOqlUn0UtpVKjsk9RqOOAA883
         GjxIJJ5ucbKRbW14xVPs43tXPxlKQcaEm5QBpLYj5vE0rgE1TtPqce9sbc1pfKi+Q0J0
         rmlahB5ujBxAxTnG2hKuS6nLxKTl88gqaNNkJRGEpvHSqEW+9T/6IdUckLtUazoTeIGV
         BmexLX9Ty683cJaZStEVTy1RAZJlO370m0KLvbdW7Q8dsfZt4rkBjZHqri4dA1kHYy7B
         4a1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745571598; x=1746176398;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QI7dIhq4gpO8qmw+kHNvoSNDB7nG2z7FjzlKM42EHH4=;
        b=SNw3AOfBYm6vNIa42249N/PtywtEiBcWRpf+AcUxtiObUNNzpIWJ3AvKzYdPPhlrsz
         fwEAsf5h6OOYu+kM1MF52025rMBl8zDF3w2t2T9NnnFzEIymOXKwu2YLBld9Zzq7HYxl
         u5rwTZBv75PwyhkY3TMzdgt2QRxvYOjiBA0CP6nlUS9PhbngVg7emvOlfJBt1j7mthf7
         I1U1PYfgUR4JV33Ovh8kuuZQDb2TZCsbZdXbaYM//bl/crQ9HFmYJwGq2PgUIK/ssLI8
         NhRLQN5q5v68f4gkDHmq/CQ61evFyfU6iYt3IV/2xecAmYpclJXaMYCNMR1gRNhPMoCV
         gmqw==
X-Forwarded-Encrypted: i=1; AJvYcCU2HnxX0Iq2P5Ed9m1QK6P0m43dP6PiBzMv4k2Fb3V+XATo+a5Wt1raT6yxJnlI6tgUBlgDR6w=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7R6h9L6pI3lUpfy3z6gHmBqKuNOz/nMEvVrKqpB5yPUHJqRvq
	+Vv9rKWx1U6RsTzWq+opye5fPt2lJpN4EJEHxeOAZlnRHYgpYkQxLAUBJoaGgg==
X-Gm-Gg: ASbGncu7Mzv90VfkDlzPxbQxjT0NwqUZzK+F+JAhh9xoy4bDU1iIz+ZnGXa7/UCdY3f
	aitTiv4VyY76kjYaHmKG50Z+8MeFHzUC03HMFZ6d16j2xzZKdJmL4pnpzVoWNEUygHzjqT/TYxr
	g5Kgvn+/QLoofnR4eI/NuAKZWTolQs5uEwXVjQUEY9Zq+S8XaSvkcgwuDA5PzKxqvV0E7eLfHMt
	lzMRDKbOVCQ2uLenZdQ8ssIPSFADWkX+xEbgpbubJriOLmxMT3zsiFcSx4I2dhtlaLhlKeAcqAK
	ptBekEyYaphuKO7Uuilf0zsYXTUg6bhtjGrr3WruwBQyTfRA96AmhjUUm8zo2w==
X-Google-Smtp-Source: AGHT+IFkKSjUiJTYpCxdE0/nSPU4m+TRaoZshePJKHL8MiFoZ1AglBgvtTwnzJQU1uuNvqEmm4Tfww==
X-Received: by 2002:a05:6a00:21c6:b0:73e:359:acf4 with SMTP id d2e1a72fcca58-73fc7866454mr2183157b3a.0.1745571597887;
        Fri, 25 Apr 2025 01:59:57 -0700 (PDT)
Received: from thinkpad ([120.60.77.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25962f61sm2688128b3a.74.2025.04.25.01.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:59:57 -0700 (PDT)
Date: Fri, 25 Apr 2025 14:29:50 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, 
	Jeff Johnson <jjohnson@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	Yan Zhen <yanzhen@vivo.com>, Youssef Samir <quic_yabdulra@quicinc.com>, 
	Qiang Yu <quic_qianyu@quicinc.com>, Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kunwu Chan <chentao@kylinos.cn>, kernel@collabora.com, 
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Subject: Re: [PATCH v2] bus: mhi: host: don't free bhie tables during
 suspend/hibernation
Message-ID: <y5odcxzms6mwpz5bdxhbjxo7p6whsdgwm772usmmzqobhf6nam@p4ul7vn7d3an>
References: <20250410145704.207969-1-usama.anjum@collabora.com>
 <h2wv7drxntokziiwbzjw5xjzbctbomp6cfcba7ppfbih6o7so7@p6dazv32xfx4>
 <1136c7cb-1c7b-410b-93d2-c74aec939196@collabora.com>
 <cfb3sntvqhupyhm2m5tevpsl77r6mzl2aqzr3wtxvr22bezmp3@qjh7ftr2kdjy>
 <4d87ef88-3533-4255-adc6-6c268818fe25@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d87ef88-3533-4255-adc6-6c268818fe25@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_015958_813187_9A546351 
X-CRM114-Status: GOOD (  35.75  )
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

On Fri, Apr 25, 2025 at 12:42:38PM +0500, Muhammad Usama Anjum wrote:
> On 4/25/25 12:32 PM, Manivannan Sadhasivam wrote:
> > On Fri, Apr 25, 2025 at 12:14:39PM +0500, Muhammad Usama Anjum wrote:
> >> On 4/25/25 12:04 PM, Manivannan Sadhasivam wrote:
> >>> On Thu, Apr 10, 2025 at 07:56:54PM +0500, Muhammad Usama Anjum wrote:
> >>>> Fix dma_direct_alloc() failure at resume time during bhie_table
> >>>> allocation. There is a crash report where at resume time, the memory
> >>>> from the dma doesn't get allocated and MHI fails to re-initialize.
> >>>> There may be fragmentation of some kind which fails the allocation
> >>>> call.
> >>>>
> >>>
> >>> If dma_direct_alloc() fails, then it is a platform limitation/issue. We cannot
> >>> workaround that in the device drivers. What is the guarantee that other drivers
> >>> will also continue to work? Will you go ahead and patch all of them which
> >>> release memory during suspend?
> >>>
> >>> Please investigate why the allocation fails. Even this is not a device issue, so
> >>> we cannot add quirks :/
> >> This isn't a platform specific quirk. We are only hitting it because
> >> there is high memory pressure during suspend/resume. This dma allocation
> >> failure can happen with memory pressure on any device.
> >>
> > 
> > Yes.
> Thanks for understanding.
> 
> > 
> >> The purpose of this patch is just to make driver more robust to memory
> >> pressure during resume.
> >>
> >> I'm not sure about MHI. But other drivers already have such patches as
> >> dma_direct_alloc() is susceptible to failures when memory pressure is
> >> high. This patch was motivated from ath12k [1] and ath11k [2].
> >>
> > 
> > Even if we patch the MHI driver, the issue is going to trip some other driver.
> > How does the DMA memory goes low during resume? So some other driver is
> > consuming more than it did during probe()?
> Think it like this. The first probe happens just after boot. Most of the
> RAM was empty. Then let's say user launches applications which not only
> consume entire RAM but also the Swap. The DMA memory area is the first
> ~4GB on x86_64 (if I'm not mistaken). Now at resume time when we want to
> allocate memory from dma, it may not be available entirely or because of
> fragmentation we cannot allocate that much contiguous memory.
> 

Looks like you have a workload that consumes the limited DMA coherent memory.
Most likely the GPU applications I think.

> In our testing and real world cases, right now only wifi driver is
> misbehaving. Wifi is also very important. So we are hoping to make wifi
> driver robust.
> 

Sounds fair. If you want to move forward, please modify the exisiting
mhi_power_down_keep_dev() to include this partial unprepare as well:

mhi_power_down_unprepare_keep_dev()

Since both APIs are anyway going to be used together, I don't see a need to
introduce yet another API.

- Mani

> > 
> >> [1]
> >> https://lore.kernel.org/all/20240419034034.2842-1-quic_bqiang@quicinc.com/
> >> [2]
> >> https://lore.kernel.org/all/20220506141448.10340-1-quic_akolli@quicinc.com/
> >>
> >> What do you think can be the way forward for this patch?
> >>
> > 
> > Let's try first to analyze why the memory pressure happens during suspend. As I
> > can see, even if we fix the MHI driver, you are likely to hit this issue
> > somewhere else.>
> > - Mani
> > 
> >>>
> > 
> > [...]
> > 
> >>> Did you intend to leak this information? If not, please remove it from
> >>> stacktrace.
> >> The device isn't private. Its fine.
> >>
> > 
> > Okay.
> > 
> > - Mani
> > 
> 
> 
> -- 
> Regards,
> Usama

-- 
மணிவண்ணன் சதாசிவம்

