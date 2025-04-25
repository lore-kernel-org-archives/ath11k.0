Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B186BC369D1
	for <ath11k@archiver.kernel.org>; Fri, 25 Apr 2025 07:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xJc0VC1OPnf8MGBGBVEvJ1rm1gHV5SYp4RtZ7UBjMoI=; b=pzrG2wdXNdgCojyBlfVRkhlXBx
	DiV3AuFfbC0c+kt3HVBZnVPJffeNYMNXAekU9xcrybBYb7Zgi4hojbXvViSelmne0KHhD0/lGCaOb
	fBOPhzniM9jqudY1DoPClZdbYHzxptXqlcpVnvphoFIDCACHuz7ncz0EHyafMrU8ByXwHallcHDjj
	mdMo1Bx64gWi2S06S2dGoernGld9cFy6W7W0w0/CW+xuV4g6av3z9aQYvZZ4VmIshdd2RegHMeQ6Z
	2bVRSeGJ8QBIiIB9/JrO7VzHEYX58iLCBwV3yH35eA8eE5M2u0OdyrYCl2HhVPKEoP4zp0opDuiIu
	MsRhHFQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8DYS-0000000GCTL-39UM;
	Fri, 25 Apr 2025 07:33:00 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8DYQ-0000000GCSj-1bOG
	for ath11k@lists.infradead.org;
	Fri, 25 Apr 2025 07:32:59 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-22c3407a87aso30399675ad.3
        for <ath11k@lists.infradead.org>; Fri, 25 Apr 2025 00:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745566377; x=1746171177; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xJc0VC1OPnf8MGBGBVEvJ1rm1gHV5SYp4RtZ7UBjMoI=;
        b=OI+ccHBrsVMvHNB3WOsi+oe4D3D+fM71SpSVtxPkzV9bM34eRYFsDMEljQfFp4NPK0
         AkTfBNeWHthdv3oLQD2KEckGJ6kDtjXttNsuKtV0bDJstWxyxPBt8Ri6/gbWuBG6iI4t
         NiZVrUv3iNdwBwhVhgqFNzoakjQtcr3/oiz5dEshFcTRvPE294tomgiMNgAaijzLm1Z1
         NHOySI6O2F5njoH9HUjA5y7eqcF+ToGyjWqQ6XheecXI0T/RT0kiOfJ4fNFdhdGH03yb
         qGpvko5ONPJtKJw9YgLDSlrY9Tn1u87kMD0HJ5/Gwjld2sBh3Ho6BToDaQ8aWemPwzBP
         f37g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745566377; x=1746171177;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xJc0VC1OPnf8MGBGBVEvJ1rm1gHV5SYp4RtZ7UBjMoI=;
        b=xFsTSCyBO8eumIVHo9lx+tmiEdEOahbkLyzZK+C6iInrwSfJULi4iHWv4TIMhngdmJ
         ZwqZY2d3xjp3OC0M7Xw9fm3sjdKe5kpsNofdTZWqyDN3yO2S69L3MtQwJhDVxh90pQ8H
         SC4wx9YN/r1gGOD0NYUYm4aoHpq7aVemo36kGE0nY27djY0nE+iEFV23ENeAhR7+XkY0
         UfoeVo0JChhO7PtCrkXBBJz8B71YTgbziEa2CYxYjHxMALSuC2nBCI99sLHrIiA31qwg
         h2R7OMcsdYr0zX/ObMU5RxMZ0LdSrq00pv97VA/YuVQ2kc4R+5OcAenHKhWUTTw1Q1nz
         aThw==
X-Forwarded-Encrypted: i=1; AJvYcCUUEBxKqjHtibFxx+E3WMB2Q8oh0qbBHmgZtQFl3+Yf4wcr7oPVsWnnb3L7jumYcIVeA2dzPpw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyWrrkqbh4sTm8SmDCmZAYJAYzmH998qDGmb5fgs9TTkXHbOBnD
	cX7cKemGouV0VSNI62R9SvYlIKEba+IBAoHklNsm+kCk3aC/SZzUQ0HLUIVo8A==
X-Gm-Gg: ASbGncv+NwqeZCmqaBxzeny6ecsQGctd3h7TzFOuW6Vv1QQqrwtNEMqwB5m4Oe4wBGH
	XRZSyKpCo025loU4yr8hDC/CcJjSvWKeSzejQU+njoL2NkGENbZiZK8Rhgj+rCDJ3IfeaoXGB4O
	TVkZBKketNUUEkvEkBtuLk+aYOL3ZSuDHsPt65mIU86NV6qGuhPT0LKlcW3L6u0mqli/EpjktEv
	Yo8Gsx+K1eqzN5ruJrf4c0V8QYgfBFEWWEl3E9YxhVlcNw6l7nB2V5Bxa8fyfy+ZIHD0PZ+vKjk
	iLZsvsZXYHqJTEPF5I1VwhaZYdw4t2YboZtF4QiLy25X7zpr0o4=
X-Google-Smtp-Source: AGHT+IEaSjf7mjPyqkb9SLHl28S3KtutHrHtesFq5IWR5am6CHVSmDDpdOQGUAksLd+HiuHc9w/Ahw==
X-Received: by 2002:a17:902:f541:b0:224:a96:e39 with SMTP id d9443c01a7336-22dbf5d89bfmr18972215ad.9.1745566377452;
        Fri, 25 Apr 2025 00:32:57 -0700 (PDT)
Received: from thinkpad ([120.60.77.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4db97b3sm25701435ad.55.2025.04.25.00.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 00:32:56 -0700 (PDT)
Date: Fri, 25 Apr 2025 13:02:51 +0530
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
Message-ID: <cfb3sntvqhupyhm2m5tevpsl77r6mzl2aqzr3wtxvr22bezmp3@qjh7ftr2kdjy>
References: <20250410145704.207969-1-usama.anjum@collabora.com>
 <h2wv7drxntokziiwbzjw5xjzbctbomp6cfcba7ppfbih6o7so7@p6dazv32xfx4>
 <1136c7cb-1c7b-410b-93d2-c74aec939196@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1136c7cb-1c7b-410b-93d2-c74aec939196@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_003258_431684_262AC4F3 
X-CRM114-Status: GOOD (  26.65  )
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

On Fri, Apr 25, 2025 at 12:14:39PM +0500, Muhammad Usama Anjum wrote:
> On 4/25/25 12:04 PM, Manivannan Sadhasivam wrote:
> > On Thu, Apr 10, 2025 at 07:56:54PM +0500, Muhammad Usama Anjum wrote:
> >> Fix dma_direct_alloc() failure at resume time during bhie_table
> >> allocation. There is a crash report where at resume time, the memory
> >> from the dma doesn't get allocated and MHI fails to re-initialize.
> >> There may be fragmentation of some kind which fails the allocation
> >> call.
> >>
> > 
> > If dma_direct_alloc() fails, then it is a platform limitation/issue. We cannot
> > workaround that in the device drivers. What is the guarantee that other drivers
> > will also continue to work? Will you go ahead and patch all of them which
> > release memory during suspend?
> > 
> > Please investigate why the allocation fails. Even this is not a device issue, so
> > we cannot add quirks :/
> This isn't a platform specific quirk. We are only hitting it because
> there is high memory pressure during suspend/resume. This dma allocation
> failure can happen with memory pressure on any device.
> 

Yes.

> The purpose of this patch is just to make driver more robust to memory
> pressure during resume.
> 
> I'm not sure about MHI. But other drivers already have such patches as
> dma_direct_alloc() is susceptible to failures when memory pressure is
> high. This patch was motivated from ath12k [1] and ath11k [2].
> 

Even if we patch the MHI driver, the issue is going to trip some other driver.
How does the DMA memory goes low during resume? So some other driver is
consuming more than it did during probe()?

> [1]
> https://lore.kernel.org/all/20240419034034.2842-1-quic_bqiang@quicinc.com/
> [2]
> https://lore.kernel.org/all/20220506141448.10340-1-quic_akolli@quicinc.com/
> 
> What do you think can be the way forward for this patch?
> 

Let's try first to analyze why the memory pressure happens during suspend. As I
can see, even if we fix the MHI driver, you are likely to hit this issue
somewhere else.

- Mani

> > 

[...]

> > Did you intend to leak this information? If not, please remove it from
> > stacktrace.
> The device isn't private. Its fine.
> 

Okay.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

