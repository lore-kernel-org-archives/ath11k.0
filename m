Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5726CD3CCB0
	for <ath11k@archiver.kernel.org>; Thu, 15 Jan 2026 04:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FyJ1nwAoXFB46LdRdtLwHzhq+4ZJYtwrTRcf5CIjovw=; b=xx7/TDUP2UO7Yuk1yRwsWtIpqP
	bNLIbOyDQeLb7YrqUbRiJGQ6Sab2MGMu8PMkS3v7AGC7eecRL8+xkEykAhn9L+xH+tz2auVJY9FL1
	i5uymzrHS+D8mGtuDSXyLkr3sMr2vm34dx4cPyaeMPGomMujam2NcH84Z4kfJH56FaxtIRkgSz462
	dj3w2tMsB3pYlPZ+VmSk535E2m/QFqwFN8M1GwOwIWb5tM7rjcFUq5MBEohcOoahBm03IzgY1VBTb
	++iAz2R+ikLLjMaluErFvYBDJxxhLaCENoDBYu5b9LGblcI/8MDijBwuSy0iSG/f7vbMXiBGK3D2K
	IhTUQnkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgFDI-0000000BmdX-20hn;
	Thu, 15 Jan 2026 04:44:04 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgFDF-0000000Bmd2-2cy3
	for ath11k@lists.infradead.org;
	Thu, 15 Jan 2026 04:44:03 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-40438e0cba6so82224fac.1
        for <ath11k@lists.infradead.org>; Wed, 14 Jan 2026 20:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768452240; x=1769057040; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FyJ1nwAoXFB46LdRdtLwHzhq+4ZJYtwrTRcf5CIjovw=;
        b=nNWmvsZv6+U2Rt9jvEjhDUq3PU9v3KzABYE5MLwsvISHnjm77padoWrzxG/6NaEdme
         7kVcyU0KareM9AmEOLBvP8IfD0engaw/9kbsfCv8vHTphcrQnFi2x83Paw4vIOYnEazE
         yVG1cPf1CvF1kM/YFlsxKVVALMRCdab0BVvT3JlHY7mmGtoCp7BfAXjiBhV/GDu50v7X
         L6jZ1W1e88tebOmhCakab+gUheKk/bd9nL9eHeLkU7D4VdxkaISuxgttKA4YDQiCIACH
         kvcNcJX/ALvMY7I9+4yIIaU0OP5tdPUXiGDEjgmHYJM57XB5B7qK7gszPcwhiZ0jKH2u
         IqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768452240; x=1769057040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FyJ1nwAoXFB46LdRdtLwHzhq+4ZJYtwrTRcf5CIjovw=;
        b=RdqSqMvBmO3GRhcjUxt8+V/Q4bvTbhfa8GeV5lQLe9f4dHDuw61dfN+oP1qjgFLB0C
         VgulcCaPWAcKVQUoS9AQ9H7FN2EcENv6/MM0ek71PBicYHBbD2uq57lWFqIluY6aFcQC
         WuqA+tJ2CVPsL2AOyPcr9Op8sWaQoXcpfoYTe9Qlcf2kxX53DRw6cVsDpOBVbt77DStK
         vgdGBh4iBcufgkkR7RgMs57/eQfPgLTdvEDyWZAg7FOx/smkZ8J+54q1//62ASbGKTBO
         q/GLo5ULiiKRB4qzbGlWvAQ902FCoHuzUBPvT3aU9EjSDS1eS9k7jU0YEMFilnlB194b
         aQ8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXdnZiri+LgL7O1YINJS4fDD25DLRuG6YhO0eB1kGXJQVEkMadcDPbAB7WH65zTprur8iq3nfw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyG8ukzr9reGBzuZfxM/aGPMAONAV3/YVQHeQwWNV9W7gz4ySGa
	udHFESvBngZZT8WUqCqzMm98XseeWngzZkQqJP+VcuC1rt3qkRZhCuaH
X-Gm-Gg: AY/fxX7iJA3jfUxNCEKy8lPSsPKyF3cxPOENnAVggPwemQ12OjkrwVuagr3vjZa4EKn
	nt9Cn1jnq3RhYUfQwdKtoZxe5GYtcBSKhH80YEa1QZb0kbBJtFfbZLxjMaAYb4zLOIA/TIR/aoy
	kpDuHAK0lJpYv1BFd/KWH2QqjxpEoYEHl4bRkL95QQl6BruexEHjcSkjGvztH/TCE//XWLTD4aa
	jXQ6fha/IregKbhtS2a1HFXYwWa/msZ5ki19c7gCV9R10Yoy88vF7HY1/YaN56JyQnAZjv9QlDo
	Qcv9qkAc8E2+tgjqsBCrssWVsEJfYQyljrq3cg/s5U1e+32UBLqt62zV4QlSjF1c05M4De3OoRK
	KcyUq5doXEy6/kcIAwGxK4+A8wShk8nDrewVCW1pfvW//x4jDNARwPCchkER2XwhQ3rX8fma90k
	3gJOtVFmibeOcDFZZcC0NjFKdIl1ZtI75CIpm+8rCw9esfPxB37qhoyDPuetGaAegKQUjW/24ik
	17WeXBDbMXHaeRzGp0R2J5OXnp21Jo=
X-Received: by 2002:a05:6870:e194:b0:3e8:9b25:2fc4 with SMTP id 586e51a60fabf-40406f33962mr3217936fac.7.1768452240100;
        Wed, 14 Jan 2026 20:44:00 -0800 (PST)
Received: from nukework.gtech (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4043b1b0116sm82362fac.12.2026.01.14.20.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 20:43:58 -0800 (PST)
From: "Alex G." <mr.nuke.me@gmail.com>
To: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
 jjohnson@kernel.org, ath11k@lists.infradead.org,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: baochen.qiang@oss.qualcomm.com, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] wifi: ath11k: move .max_tx_ring to struct ath11k_hw_hal_params
Date: Wed, 14 Jan 2026 22:43:56 -0600
Message-ID: <6267675.44csPzL39Z@nukework.gtech>
In-Reply-To: <89a61ef1-3e83-4303-ba04-cf5c5a4aae56@oss.qualcomm.com>
References: <20251228151408.2116108-1-mr.nuke.me@gmail.com>
 <5896283.e9J7NaK4W3@nukework.gtech>
 <89a61ef1-3e83-4303-ba04-cf5c5a4aae56@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_204402_611108_4F449344 
X-CRM114-Status: GOOD (  20.08  )
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

On Wednesday, January 14, 2026 3:59:09 PM CST Jeff Johnson wrote:
> On 1/14/2026 1:29 PM, Alex G. wrote:
> > On Wednesday, January 14, 2026 11:24:19 AM CST Jeff Johnson wrote:
> >> On 1/12/2026 11:00 PM, Vasanthakumar Thiagarajan wrote:
> >>> On 12/28/2025 8:44 PM, Alexandru Gagniuc wrote:
> >>>> ".max_tx_ring" is an upper bounds to indexing ".tcl2wbm_rbm_map". It
> >>>> is initialized in, core.c, a different file than the array. This
> >>>> spaghetti-like relation is fragile and not obvious. Accidentally
> >>>> setting ".max_tx_ring" too high leads to a hard to track out-of-
> >>>> bounds access and memory corruption.
> >>>> 
> >>>> There is a small ambiguity on the meaning of "max_tx_ring":
> >>>>   - The highest ring, max=3 implies there are 4 rings (0, 1, 2, 3)
> >>>>   - The highest number to use for array indexing (there are 3 rings)
> >>>> 
> >>>> Clarify this dependency by moving ".max_tx_ring" adjacent to the array
> >>>> ".tcl2wbm_rbm_map", and name it "num_tx_rings". Use ARRAY_SIZE()
> >>>> instead of #defines to initialize the length field.
> >>>> 
> >>>> The ath11k_hw_hal_params_qca6390 uses fewer num_tx_rings than its map,
> >>>> so use a constant to express the correct value. Add a static_assert()
> >>>> to fail compilation if the constant is accidentally set too high.
> >>> 
> >>> Text related to static_assert to be removed accordingly.
> > 
> > Hi Jeff,
> > 
> >> I removed the last sentence in 'pending', please check:
> >> 
> >> https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pen
> >> din g&id=26bb149b5e011b0f73f7b74421589cbd38e3304b
> > 
> > Re-reading the commit message, I think it makes sense to also remove the
> > sentence "The ath11k_hw_hal_params_qca6390 uses fewer num_tx_rings than
> > its
> > map, so use a constant to express the correct value.". Do you think it's
> > worth submitting a v4 with this minor change?
> > 
> > Alex
> 
> No need to submit a v4. I can make that change in 'pending'

Thank you!

> /jeff





