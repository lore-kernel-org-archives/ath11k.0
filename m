Return-Path: <SRS0=/Moy=NK=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 406BCC4338F
	for <ath11k@archiver.kernel.org>; Thu, 19 Aug 2021 16:25:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13740608FE
	for <ath11k@archiver.kernel.org>; Thu, 19 Aug 2021 16:25:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 13740608FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c0tTdoRiljPlm47D5ErE9zQGhmH9xme2H8lF6tNZFSA=; b=Ffu07u0/bdkIMl
	ZS6MXCkrO5d7tsdCDFoTCvHiPYZOEo1ak2DFbAeB7gXcZdQbvT98YuIP0WVN/a4SvLW3fbQmKUknC
	NB+p0eC/NCe/ei/VPMrcr7Ql5uB5TKZpvnb2Zzt8gUUtwaga6G8zJZKO7rKMRUMz8fA4BI/7wqyRR
	UOwCreEE0ssD1hh2gddy36RehJT53vcEhLUsfBTpO1CyZL5AdZsLAbIv00Der92SmU9kIzWBucVFp
	cOX3Qt/7D2y8fsnUbvVO7JSbRPRg8gg0WatUu4VLm9lXhIeXgDvXc4EPFgaj2P02tfNnj0o5+U9ew
	iH2tgOk1e4ZZzgPOwoxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGkqt-008wno-PH; Thu, 19 Aug 2021 16:25:11 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGkqn-008wkI-O6
 for ath11k@lists.infradead.org; Thu, 19 Aug 2021 16:25:09 +0000
Received: by mail-pl1-x633.google.com with SMTP id d17so4185227plr.12
 for <ath11k@lists.infradead.org>; Thu, 19 Aug 2021 09:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=UyAqbe771W+Lff6kTHtxqnAb6wyR4jVkJwEdQgLmwXM=;
 b=RCXKCYv9ln5LbhRxVsZkAgrsxHMHPqdffVncbCoP8zHTR2s05PTRSMgK+hG8fnm1xI
 VE6KocOflCQf5XUe9L88OiJ4Gd0AvGpF0XcmTinZR6J2WFjWLqXyGYbTjTqdNZrTLIee
 af/RfWFTDj7DmtJmZJTbT1bZunbQVpzZBc1ts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UyAqbe771W+Lff6kTHtxqnAb6wyR4jVkJwEdQgLmwXM=;
 b=RKQBJq2sCmkRdNBEDi4fE8raOWy+FO6uFfwa/gz7ckFG4++fu7aAAUOTeBA6NIwy40
 NriIlwIxyPUaqV7Wg1BX5/0Zj0z7qpwzfKjR6JvGRw+nstk0NKVIZuzxY526go4NF0WU
 UpvOaMVTZ/AteyIhE2qS0YJWgOOWFK+5nnhnAavzsZZx6fSMDrFTj4/uf48J4hAcN43U
 7wSXhQ5d5BtKfUvhLQfB1RSs01H3H2pIkpCjnmvEIOozFT9rCyC4XgY1HMXX+JzzT5gY
 rFcY/m/RGVNuhYswa5orREHcSODpYJpM7vo0ntLGsNZJqzOa9MeT7isObREepOShTSgN
 w4Fw==
X-Gm-Message-State: AOAM533XM9YWXsOoHxfNJvgnr2Ci4/xO3gfA7dCtWKKoQg/2d2Iu1xH4
 1Zjs9gZP4F72DW1uEBdMfC6Qbs73Qqeuag==
X-Google-Smtp-Source: ABdhPJyq4LOVatvfadz65o72x/gkprpZlPk/8y+Qcd235dkYfx++eKkOf6dJ+KUNEdEavgccQRbFxg==
X-Received: by 2002:a17:90a:4894:: with SMTP id
 b20mr16180176pjh.13.1629390302929; 
 Thu, 19 Aug 2021 09:25:02 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id nn18sm8165841pjb.21.2021.08.19.09.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 09:25:02 -0700 (PDT)
Date: Thu, 19 Aug 2021 09:25:01 -0700
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
Message-ID: <202108190923.30FD4FC6E@keescook>
References: <20210818060533.3569517-1-keescook@chromium.org>
 <20210818060533.3569517-46-keescook@chromium.org>
 <87eeapbmhi.fsf@tynnyri.adurom.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87eeapbmhi.fsf@tynnyri.adurom.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_092505_838637_C0B84414 
X-CRM114-Status: GOOD (  13.08  )
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

On Thu, Aug 19, 2021 at 04:19:37PM +0300, Kalle Valo wrote:
> Kees Cook <keescook@chromium.org> writes:
> 
> > In preparation for FORTIFY_SOURCE performing compile-time and run-time
> > field bounds checking for memset(), avoid intentionally writing across
> > neighboring fields.
> >
> > Use memset_startat() so memset() doesn't get confused about writing
> > beyond the destination member that is intended to be the starting point
> > of zeroing through the end of the struct. Additionally split up a later
> > field-spanning memset() so that memset() can reason about the size.
> >
> > Cc: Kalle Valo <kvalo@codeaurora.org>
> > Cc: "David S. Miller" <davem@davemloft.net>
> > Cc: Jakub Kicinski <kuba@kernel.org>
> > Cc: ath11k@lists.infradead.org
> > Cc: linux-wireless@vger.kernel.org
> > Cc: netdev@vger.kernel.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> To avoid conflicts I prefer taking this via my ath tree.

The memset helpers are introduced as part of this series, so that makes
things more difficult. Do you want me to create a branch with the
helpers that you can merge?

-Kees

-- 
Kees Cook

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
