Return-Path: <SRS0=DvlF=NM=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65289C4338F
	for <ath11k@archiver.kernel.org>; Sat, 21 Aug 2021 10:17:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BE7B61051
	for <ath11k@archiver.kernel.org>; Sat, 21 Aug 2021 10:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0BE7B61051
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8PB82U8188mhLbyWMJf4UHIq2pPmCGrjXqGnPMNY2a0=; b=WBkzPDFELwMEzO
	LNL64Nv7xwa89WCJfBzuGuBQ5CT3xESgo2Az7WMRZZbOkCmZMPQLY4kIohPr3mM4Vc2TmLR5aa6qs
	VP+wLLqC/t7wCiBnkFCTt7PeOSeMDhCxsuu4mYe9L5UXT0V31gcSEzrGBy/YFtWUek2T0PtW3CQcw
	FqzyPXdTCtRx/xHHWup3kx+yGBI7FvuW4aFwJtX4If7tevHkspWiuog69YnZlPAZXm+QVVp4nvpzT
	ci+f2ZTJRRGmAqtPnXdAA+LWmCuP0PpMJSL7xv1XMj/I2T+p3zK5sRC3C496VlHFfg4gGTVZ2N9EG
	YdRO3qEYDA8eaaLvwboQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mHO4V-00ChtW-P1; Sat, 21 Aug 2021 10:17:51 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mHO4R-00ChtB-Hs
 for ath11k@lists.infradead.org; Sat, 21 Aug 2021 10:17:51 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1629541066; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=UpM1DyTEkig259V+pL57ps65feNkTSUqUFyxt1prq3Y=;
 b=d8oBoIusj2ATrBfdsK4gdZ2TyQD1+GTuxeeR1G5BJtv+mT7MDblUI6q2N+uftPhj9IuTo8X3
 MhAtjc0duJfYP2kL7eurS0mKy/Qr5Q2sh6mgkPy5oczXnKJA40wpFyDNJ9RxjpR68izjSjwm
 wEFPOppHxDArZCoarBCb+ZHnceE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6120d2c989fbdf3ffed16f89 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 21 Aug 2021 10:17:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2CDD8C43616; Sat, 21 Aug 2021 10:17:45 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1ED37C4338F;
 Sat, 21 Aug 2021 10:17:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 1ED37C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Kees Cook <keescook@chromium.org>
Cc: linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, dri-devel@lists.freedesktop.org,
 linux-staging@lists.linux.dev, linux-block@vger.kernel.org,
 linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 45/63] ath11k: Use memset_startat() for clearing queue
 descriptors
References: <20210818060533.3569517-1-keescook@chromium.org>
 <20210818060533.3569517-46-keescook@chromium.org>
 <87eeapbmhi.fsf@tynnyri.adurom.net> <202108190923.30FD4FC6E@keescook>
Date: Sat, 21 Aug 2021 13:17:36 +0300
In-Reply-To: <202108190923.30FD4FC6E@keescook> (Kees Cook's message of "Thu,
 19 Aug 2021 09:25:01 -0700")
Message-ID: <87pmu7t83j.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210821_031747_687166_F31933B5 
X-CRM114-Status: GOOD (  17.10  )
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

Kees Cook <keescook@chromium.org> writes:

> On Thu, Aug 19, 2021 at 04:19:37PM +0300, Kalle Valo wrote:
>> Kees Cook <keescook@chromium.org> writes:
>> 
>> > In preparation for FORTIFY_SOURCE performing compile-time and run-time
>> > field bounds checking for memset(), avoid intentionally writing across
>> > neighboring fields.
>> >
>> > Use memset_startat() so memset() doesn't get confused about writing
>> > beyond the destination member that is intended to be the starting point
>> > of zeroing through the end of the struct. Additionally split up a later
>> > field-spanning memset() so that memset() can reason about the size.
>> >
>> > Cc: Kalle Valo <kvalo@codeaurora.org>
>> > Cc: "David S. Miller" <davem@davemloft.net>
>> > Cc: Jakub Kicinski <kuba@kernel.org>
>> > Cc: ath11k@lists.infradead.org
>> > Cc: linux-wireless@vger.kernel.org
>> > Cc: netdev@vger.kernel.org
>> > Signed-off-by: Kees Cook <keescook@chromium.org>
>> 
>> To avoid conflicts I prefer taking this via my ath tree.
>
> The memset helpers are introduced as part of this series, so that makes
> things more difficult. Do you want me to create a branch with the
> helpers that you can merge?

Is this patch really worth the extra complexity? Why can't I apply this
ath11k patch after the helpers have landed Linus' tree? That would be
very simple.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
