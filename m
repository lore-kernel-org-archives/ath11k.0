Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCC3C55173
	for <ath11k@archiver.kernel.org>; Sat,  1 Aug 2026 11:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p+f2gJFRKiSHuvZrOCKoONo8EmCeMk/bZVo3Md0qG7E=; b=IUUh30jmYsF30/rOlF6lJZ72xb
	kz3rFK8U+tbTridxFHiCgzlYKVxECo6yYJLu6FOrd/AzPB2xITlQmaLgHMqmmra0VqeHnGZoWknBg
	4KUxOCyh/RkGSBSseYoUIZcobZit1bg5EPy5ef/DVAJhKJVnaymvVsNGrAcPevSVFinGk5Hc48aTB
	XP+tKMlzInzmXnlyLw7aoWU6d0AL8dzxn+Ktl2ybYeft68r6CfivsrMdRtquVVEjrs7rj+5NytD+X
	T5N7iRb/qbQEIYz+WLcqR55huWZHkY+vd1nvo4IFpKjLf47e5RZEsJWmwRCsWkDFyh267S8xPtUGa
	NU75OVrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq83F-0000000EHdx-2DaO;
	Sat, 01 Aug 2026 11:38:49 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq83B-0000000EHdW-2xAZ
	for ath11k@lists.infradead.org;
	Sat, 01 Aug 2026 11:38:47 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-383cb94f742so1869346a91.3
        for <ath11k@lists.infradead.org>; Sat, 01 Aug 2026 04:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cse-iitm-ac-in.20251104.gappssmtp.com; s=20251104; t=1785584324; x=1786189124; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p+f2gJFRKiSHuvZrOCKoONo8EmCeMk/bZVo3Md0qG7E=;
        b=SbqXUsqfsxmzSd0vYXK77AqBs0Tr64g2/k8GIc2k7RHpV+lr6gRlS8JqMN0MWyIv/r
         sSLL+fyGWHZCs1vbbavtZR70M8xOHvVecAwbhTOKrFBaIIr24DDYkuezvBFGti7++Lq0
         FNU/eAPvCM2TTXkFKrhpFYydjxhDCTOCTW9lpFLupoJgSGmPSxCO03iwo0stCl09RzoJ
         gmh7q4F5F2JLPBwwkDQSeL+xfh585o5He4Q5sGQvGecxOsRltqad91VurpUOuHCAhQJq
         VJ5e+cD3xmJ7k1STgQiwXxaKTASGWAYp7fpnnyZTeuEL2TEfw2wv1dFron/EoJtSyThS
         rK9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785584324; x=1786189124;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p+f2gJFRKiSHuvZrOCKoONo8EmCeMk/bZVo3Md0qG7E=;
        b=I+Ugv4Dd9QHyGb73Ta3kk1UGXAXB4MiJ02mHmD9i930M0dtCmddA36uIWMk2x2VWue
         SUt4Euv0D6QgRyeZE4VIu3+MwqXsFXBS1hwhwZHdiK6/wUID24p3EB6Czy4kf67WRyDt
         IU/93tBIRvl7c/SV7SaX/gIY70h2J9VvtnB10JshUCSo90iY/2YwJ4veqhfWnhEYDREC
         GB5g8r/cpd2E1lES1ARTguxDrKwOvX01UiA1hN+4rhkj9qDEzQ3iRNVyrGgdFyhqDva7
         myuS/5aEsLZwWO87bsoiuLTSrkuAUIUkdf/js7nbwKKBDXygXWHrF5g6r/c2D9U4bmTr
         oF7w==
X-Forwarded-Encrypted: i=1; AHgh+RpJX3O3y+z71nL/6vAQAIZthH+f8Resy3owrZ9VTvbR4xCL8/7pKxPUhXbpBpmVM6bDKFfp5WY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyLch7okZvNid09RqYt5YypPPsfrLWzxt4x8osE0SRzyu1Or3FR
	uiw8y4pAPHT7n1Ccv7gUcW/saMFG9HFBE8MoSaLJ+UEv013qUFVsMVspUc1Vs7Uj7jc=
X-Gm-Gg: AR+sD131IqrEEl3CCw4zZ312Wx3G/gTGSrJsEYuUm/wR+QA4oVBz4ddwbBBFEyoX3cS
	8V71LBMcP9G+tq4Er6Igo9PsuZYsmqXfWLoC0y1DV16htYXgPp4bdegXmWbH0NpGRHf0V2/gmTw
	VZstZ9NC2ydF6dcMCBqndJawlMkS0KPhosdH1qJ1Cu6ZKu305srUtp9g4k36mIx+zsNLzOur3nn
	K4xBZeiyfxNSXcPPUqNOwlBJBEMIBQOUepM4dNvLgN+sk8QSkmo4jJE3CpvwIhgD+SjIUWrVAdL
	Rty5Cb85HZCHJLYy/jW6Ru3fyyidRDiTK+lRoJXbJ1CBNREZCxLszGfBSFJv+VHZ9qntEKMzfU8
	o5ujMPeZHG4yZc7X3TkUU+i6Vv+Zxq1Du4iopivEjY6bojg/jPltStkRcKYPqk3fjjDiWqWGeB1
	z21TKPZ95TAWMQMxjjHLA8P7iqLoSQL404/1A15dDEnw5mE2RCj1CGqHtho2dfKt1TGtNEFWcx5
	82DjtA+9DDgZtXOrbVBSzLUShrRP8QkzZlOXFEGQRsmjuPFteI6GHsVJ0dlJeRLgqa0m8lKDZWy
X-Received: by 2002:a17:90b:4a11:b0:37d:f983:7b5 with SMTP id 98e67ed59e1d1-38fbc3f9a96mr2804697a91.9.1785584324474;
        Sat, 01 Aug 2026 04:38:44 -0700 (PDT)
Received: from Metius ([103.158.43.43])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4fdb80sm11588402c88.15.2026.08.01.04.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 04:38:44 -0700 (PDT)
Date: Sat, 1 Aug 2026 17:08:38 +0530
From: Abdun Nihaal <nihaal@cse.iitm.ac.in>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: jjohnson@kernel.org, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] wifi: ath11k: Fix possible memory leak in
 ath11k_dp_srng_setup()
Message-ID: <l2m3df76j6tzdshgoecqx2fn3b2kzjsytqsxq6mpououga2wjn@zjxksj4z6iov>
References: <20260727105532.118164-1-nihaal@cse.iitm.ac.in>
 <041f72ea-7dfc-4d50-ac0d-e0556f037a27@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <041f72ea-7dfc-4d50-ac0d-e0556f037a27@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_043845_768753_2E404844 
X-CRM114-Status: GOOD (  15.31  )
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

On Fri, Jul 31, 2026 at 02:40:37PM -0700, Jeff Johnson wrote:
> On 7/27/2026 3:55 AM, Abdun Nihaal wrote:
> > In ath11k_dp_srng_setup(), the memory allocated for
> > ring->vaddr_unaligned is not freed when ath11k_hal_srng_setup() fails.
> > Fix that by calling ath11k_dp_srng_cleanup() in that error path.
> 
> Did you find this on your own? Just want to make sure you are aware of:
> https://docs.kernel.org/process/coding-assistants.html

I used a prototype static analysis tool that I'm building using the LLVM
compiler infrastructure, to detect this memory leak issue.
Didn't use LLMs, that's why didn't include the Assisted-by tag.

> FWIW my coding agent says this patch is correct but incomplete. There is a 2nd
> leak, at the switch (type) default: case which returns -EINVAL without cleanup.
> 
> Care to incorporate a fix for that in a v2?
> For that part you can add Assisted-by: Claude:claude-sonnet-4-6

I didn't find any calls to ath11k_dp_srng_setup() that passes any
hal_ring_type other than the handled ones. That's why I left the default
case as infeasible. But anyways, to be safe, I'll add a free in the
default case as well, and send a v2.

Regards,
Nihaal

