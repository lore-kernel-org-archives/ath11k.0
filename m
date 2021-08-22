Return-Path: <SRS0=LqZK=NN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E32FC432BE
	for <ath11k@archiver.kernel.org>; Sun, 22 Aug 2021 08:11:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F1C660EB3
	for <ath11k@archiver.kernel.org>; Sun, 22 Aug 2021 08:11:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5F1C660EB3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jY6Q3ael6si29jxFzgMZjsSCiA7R+gQYa6LXPSD1bqA=; b=DVzIkniqLYPv7m
	1vgUIwpJEvwZ7OVSPVmHQmd+79ux7IXUp9SImjVwa30qxKpPF2PW3ZZJ2PDRtpJ/yPJttGP67vKPR
	ZcHIumAem8G0rhTzwQDJ7xcaBKJaXZmrnlmuBGjUNSb4Yj4Al7VWO2SWfrXYp3HtPvs8ecFhG9ZMW
	e4ald6AjToDGtQLVQ9OyUwcFRFDIUdFfRXcmSGVsjzoVjBXPTkSvtrj96yRv4ibhXFmoVQAxdd1kt
	iXSZDiny1H/F/b+YXMNRAX6dGINi9p+YQyJ+yCTrvu+BG8nwKyQL1x0Vl7dliJ4L+NvaT6WFxW4n3
	76dK6JV7ZzcHUj85IbbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mHiZy-00DhKs-9U; Sun, 22 Aug 2021 08:11:42 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mHiZs-00DhJY-55
 for ath11k@lists.infradead.org; Sun, 22 Aug 2021 08:11:40 +0000
Received: by mail-pj1-x102b.google.com with SMTP id j1so9997393pjv.3
 for <ath11k@lists.infradead.org>; Sun, 22 Aug 2021 01:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zWkjWEvskowDV9RuOm1icxTsINafWKFQlH8OIXXrrz4=;
 b=RQdXywP6yts45USpiw/5k2ZmYqVHMSbk9lus7YCqnHd8h/dka/Mtc/dvJ9OXe5Otvy
 Sqan4jaX0EaO6pSp84INK0mTwB48SVVmVb4c2YqbHrlCvd6ldJuCPTsbKqBjRTW6P8oo
 9Ux/xZOvOXbIQtNK3Akl22kbAtyj0C7ROjsaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zWkjWEvskowDV9RuOm1icxTsINafWKFQlH8OIXXrrz4=;
 b=dWFWUtUxhX744NZp2gJRic4rrm9qqr8oWKkft/+Xjm5N6OKqmtPnAsZnKGTtJ5cQj6
 AtzUmzbZ784tAI+sLYAGU+RWnK66PuhMPjjfnROkjswAU4a5KQlQ+nfTR61qS3MzfPrz
 zskZj/wjlu2WrPc2o7JA1RIWlN9MRnD5+1bHwznyIznvIYDnQOe8DfylvJhjl94rWVF5
 ILnkg7yj2Fx5gxo3P57Q76gknJM1SOJupaChpFklXNy30KH1tT9k+ZEpKyxW1gHin2Yh
 fKXbQXTBWQWQh6K7gTkkfAXQD4VmjgdReDN0+YinZUpZJK4jvK5iNeprkycfwGImOlzg
 j4qg==
X-Gm-Message-State: AOAM530nXhrpPyG5KN6LOjx9gJcoM++KPVaTjYMtBD0WpsK1oJEYz1ZU
 Dhbo+bbxtWU3uHwGSH93FdKDFA==
X-Google-Smtp-Source: ABdhPJwd1ju8xuF6lspQHjJq0552r+HoTrwzTs5HEFbQVZzpc/fLKP3ldMoQP6w86dYwBror2p+DQQ==
X-Received: by 2002:a17:902:c643:b0:130:eab4:bd22 with SMTP id
 s3-20020a170902c64300b00130eab4bd22mr9764805pls.13.1629619894669; 
 Sun, 22 Aug 2021 01:11:34 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id 186sm12621542pfg.11.2021.08.22.01.11.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Aug 2021 01:11:33 -0700 (PDT)
Date: Sun, 22 Aug 2021 01:11:32 -0700
From: Kees Cook <keescook@chromium.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 dri-devel@lists.freedesktop.org, linux-staging@lists.linux.dev,
 linux-block@vger.kernel.org, linux-kbuild@vger.kernel.org,
 clang-built-linux@googlegroups.com,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 45/63] ath11k: Use memset_startat() for clearing queue
 descriptors
Message-ID: <202108220107.3E26FE6C9C@keescook>
References: <20210818060533.3569517-1-keescook@chromium.org>
 <20210818060533.3569517-46-keescook@chromium.org>
 <87eeapbmhi.fsf@tynnyri.adurom.net>
 <202108190923.30FD4FC6E@keescook> <87pmu7t83j.fsf@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87pmu7t83j.fsf@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210822_011136_259075_893851D3 
X-CRM114-Status: GOOD (  21.26  )
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

On Sat, Aug 21, 2021 at 01:17:36PM +0300, Kalle Valo wrote:
> Kees Cook <keescook@chromium.org> writes:
> 
> > On Thu, Aug 19, 2021 at 04:19:37PM +0300, Kalle Valo wrote:
> >> Kees Cook <keescook@chromium.org> writes:
> >> 
> >> > In preparation for FORTIFY_SOURCE performing compile-time and run-time
> >> > field bounds checking for memset(), avoid intentionally writing across
> >> > neighboring fields.
> >> >
> >> > Use memset_startat() so memset() doesn't get confused about writing
> >> > beyond the destination member that is intended to be the starting point
> >> > of zeroing through the end of the struct. Additionally split up a later
> >> > field-spanning memset() so that memset() can reason about the size.
> >> >
> >> > Cc: Kalle Valo <kvalo@codeaurora.org>
> >> > Cc: "David S. Miller" <davem@davemloft.net>
> >> > Cc: Jakub Kicinski <kuba@kernel.org>
> >> > Cc: ath11k@lists.infradead.org
> >> > Cc: linux-wireless@vger.kernel.org
> >> > Cc: netdev@vger.kernel.org
> >> > Signed-off-by: Kees Cook <keescook@chromium.org>
> >> 
> >> To avoid conflicts I prefer taking this via my ath tree.
> >
> > The memset helpers are introduced as part of this series, so that makes
> > things more difficult. Do you want me to create a branch with the
> > helpers that you can merge?
> 
> Is this patch really worth the extra complexity? Why can't I apply this
> ath11k patch after the helpers have landed Linus' tree? That would be
> very simple.

Not singularly, no. But I have a bit of a catch-22 in that I can't turn
on greater FORTIFY strictness without first fixing the false positives,
and I can't fix the false positives in "other" trees without those trees
first having the helpers that get introduced by the FORTIFY series. :)

Anyway, since we're close to the merge window anyway, the FORTIFY series
won't land in 1 release at this point regardless, so I'll just get
the helpers landed and we can do the individual pieces once the merge
window closes.

Wheee :)

-- 
Kees Cook

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
