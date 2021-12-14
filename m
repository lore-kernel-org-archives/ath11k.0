Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0F7C433EF
	for <ath11k@archiver.kernel.org>; Tue, 14 Dec 2021 17:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dr6uRRilfVplO9PbGNpfyM6GTwcPtN2yO8dWvy6UBPI=; b=ARJqqIj4BbBzh5
	dcsoDOovRwb/fKIvskzokYZWTNAY1WoNofRqIhnI7LvtoOhC1soP3lazUEyFgfsGsQUC11IQMO3iy
	iwRMWRsebw0M8sxlvkHNRgyQUEfu71THI114YMFfOAtxYD8zkKHwDgHJrorCtMb7rd3DWS4ugjmCS
	pX2GZDcpQs3KgadE8gEj+vnwKvhOjw1ia+ehv0CpBiJFCe2C6f/DDfzaSG1zODHEMKZK2LHX7drHN
	13AB4xxmUdDCHiwwORf7nm892goRP3sRlmH2QEpd0RH34eGg1c7vUAB9nrOqTuDbHxoSBwDAG53QQ
	TrCMEOo8Ef+Gdwe+/Uqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxBFF-00F2O8-Nd; Tue, 14 Dec 2021 17:05:41 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxBFD-00F2NC-Ce
 for ath11k@lists.infradead.org; Tue, 14 Dec 2021 17:05:40 +0000
Received: by mail-pj1-x1035.google.com with SMTP id np3so14823208pjb.4
 for <ath11k@lists.infradead.org>; Tue, 14 Dec 2021 09:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=A6836gc0s76HSfL2ZiuDjKE+np84sI4oL8Iom/KwxZU=;
 b=Il8Xs0i7yKcGaPdWUSDd/OkT3CZc4f7Sh+8OtZOHt5cw/LrudBWuKIHPYCZV3FTrUk
 ZCxzlJ6YFhcdIDnKAZH3Iqz22CWaTY2lG178hVvPcNC1hDfdjqi6tv0VEcfafKKWKB8K
 dnyvY9pIEtiiYdtB0dnO0Lz00on3mBZZYm2BQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=A6836gc0s76HSfL2ZiuDjKE+np84sI4oL8Iom/KwxZU=;
 b=7lO0TX0uzOgZJr8u42K353+aZc8Va4X+R7EKUDxPHB5bTnaYAN8hjcjWN29Li5cOc4
 J2SHcjFzGamDYQDYzvV9h1zv86r0Fi7PveeF722DtrFnKGiww/0eR6oxVBnK8e51CyVV
 /vjxlfqpj3XyoIlRXdDH7x+fGsPF5fQ1PKtJ/EKwpZJSxbKkaNikXIuaeIY7wm4XX80e
 prTj6MYJQ3UEV9GfS2lvbU4h39Csc0557RN9WjMYu0FnEbPM9gL4w/dNM7qrpD1w+I3b
 YUo80ovALd5MH78+bLC2U0CJgwkJh41h4lDgzU1V7ykCZheFUH8q3NzfVaGBDJTEPvMo
 3bDw==
X-Gm-Message-State: AOAM532jjI6eScNHRNdPVOLbXJUwKFdl+srXvGegjvb3sKDUVf4wNa8F
 FXoBeMg8sB2W2++3+Lo895WmDQ==
X-Google-Smtp-Source: ABdhPJyid4WvM6SF/FMb0ie7qooR8i+hL7xAAAtPkfmxyGyhk6umYMIjfNB8BB80oKo2BZX9lXr/IQ==
X-Received: by 2002:a17:90b:19d4:: with SMTP id
 nm20mr2745434pjb.106.1639501538563; 
 Tue, 14 Dec 2021 09:05:38 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id l6sm436804pfc.30.2021.12.14.09.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 09:05:38 -0800 (PST)
Date: Tue, 14 Dec 2021 09:05:37 -0800
From: Kees Cook <keescook@chromium.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: linux-hardening@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/17] ath11k: Use memset_startat() for clearing queue
 descriptors
Message-ID: <202112140904.2D64E570@keescook>
References: <20211213223331.135412-1-keescook@chromium.org>
 <20211213223331.135412-9-keescook@chromium.org>
 <87v8zriv1c.fsf@codeaurora.org> <877dc7i3zc.fsf@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <877dc7i3zc.fsf@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_090539_482441_A4083333 
X-CRM114-Status: GOOD (  14.60  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Tue, Dec 14, 2021 at 05:46:31PM +0200, Kalle Valo wrote:
> Kalle Valo <kvalo@kernel.org> writes:
> 
> > Kees Cook <keescook@chromium.org> writes:
> >
> >> In preparation for FORTIFY_SOURCE performing compile-time and run-time
> >> field bounds checking for memset(), avoid intentionally writing across
> >> neighboring fields.
> >>
> >> Use memset_startat() so memset() doesn't get confused about writing
> >> beyond the destination member that is intended to be the starting point
> >> of zeroing through the end of the struct. Additionally split up a later
> >> field-spanning memset() so that memset() can reason about the size.
> >>
> >> Cc: Kalle Valo <kvalo@codeaurora.org>
> >> Cc: "David S. Miller" <davem@davemloft.net>
> >> Cc: Jakub Kicinski <kuba@kernel.org>
> >> Cc: ath11k@lists.infradead.org
> >> Cc: linux-wireless@vger.kernel.org
> >> Cc: netdev@vger.kernel.org
> >> Signed-off-by: Kees Cook <keescook@chromium.org>
> >
> > What's the plan for this patch? I would like to take this via my ath
> > tree to avoid conflicts.
> 
> Actually this has been already applied:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=ath-next&id=d5549e9a6b86
> 
> Why are you submitting the same patch twice?

These are all part of a topic branch, and the cover letter mentioned
that a set of them have already been taken but haven't appeared in -next
(which was delayed).

Sorry for the confusion!

-- 
Kees Cook

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
