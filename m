Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF17C433EF
	for <ath11k@archiver.kernel.org>; Thu, 16 Dec 2021 13:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1DD9G/7xYkZaWZbbWfpFPPl4QUJvKpIBO8mjBlN2uVo=; b=g7np29ni7PQM6S
	ej1jkMI5WVnizV8Y2e4kqZpEff8ttFJifBytuHfdNaoBm1UVc8qcbGAvsX2nEP+qdz84g/8vecSlg
	/HYXmtGDfYd9pWHlPSqbGtsa1x5SRIBW1Fas3RO4xvEUgVYpTvF8llvQHFe1wbR9HMSrH2n7eb1MT
	7+4pNxUhzexHbGHIXgED29MQbwJfjHAdCCzkCUIFzKwtaNJmsqSXTGb9W+TYzJbZnxi9Ib8K3axfu
	6R02DiCkV1ZOqersPYEP4MrxkqUxV/7W8O91g9UOw/vbnw9J0/7W8wsQlEQqv/540JGhDHtrASNzu
	z58h2TuzuL/EU+pQ9x0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxrHl-00604n-Ln; Thu, 16 Dec 2021 13:59:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxr9V-005x2a-SL
 for ath11k@lists.infradead.org; Thu, 16 Dec 2021 13:50:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6D02061DE0;
 Thu, 16 Dec 2021 13:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 714ACC36AE8;
 Thu, 16 Dec 2021 13:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639662633;
 bh=AbhvMEHMWIrh7e9CWfIY2JYFJ5gwFAB2jgOuFsthmyo=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=TKA/FRmozr/tU9ROOvxVLYg3DipKuXOctyxmMbr+Y00XEedVcaedz+AU3/dozv3sZ
 q/M2W8KveteIB15BVbsnZLQ6iMY1tlu0jZWs9oQSP5GS5wJE9aMLirA8VC7YaohsLa
 rH6wpHX2MzlsX0T1V5qucjcz0zP91IkE3JwYNgWOis9h3wBVm8qRhejoeolUgVIfDy
 PcKZ0bByGv1gqQ23Cu+HhYblN5jtReKBHx9BIKLqwRXj17EKkW5WJsaHOYmSCyQEsr
 XkXQuKDFrinrS6WR7DTFRLraLADZUOa5Prd6/wxzbNH9cYLsziwhiZA9bILnWhCl/r
 /Dz/zMWeaYFDw==
From: Kalle Valo <kvalo@kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: linux-hardening@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/17] ath11k: Use memset_startat() for clearing queue
 descriptors
References: <20211213223331.135412-1-keescook@chromium.org>
 <20211213223331.135412-9-keescook@chromium.org>
 <87v8zriv1c.fsf@codeaurora.org> <877dc7i3zc.fsf@codeaurora.org>
 <202112140904.2D64E570@keescook>
Date: Thu, 16 Dec 2021 15:50:25 +0200
In-Reply-To: <202112140904.2D64E570@keescook> (Kees Cook's message of "Tue, 14
 Dec 2021 09:05:37 -0800")
Message-ID: <875yrod5ge.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_055033_984437_47300711 
X-CRM114-Status: GOOD (  15.50  )
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

> On Tue, Dec 14, 2021 at 05:46:31PM +0200, Kalle Valo wrote:
>> Kalle Valo <kvalo@kernel.org> writes:
>> 
>> > Kees Cook <keescook@chromium.org> writes:
>> >
>> >> In preparation for FORTIFY_SOURCE performing compile-time and run-time
>> >> field bounds checking for memset(), avoid intentionally writing across
>> >> neighboring fields.
>> >>
>> >> Use memset_startat() so memset() doesn't get confused about writing
>> >> beyond the destination member that is intended to be the starting point
>> >> of zeroing through the end of the struct. Additionally split up a later
>> >> field-spanning memset() so that memset() can reason about the size.
>> >>
>> >> Cc: Kalle Valo <kvalo@codeaurora.org>
>> >> Cc: "David S. Miller" <davem@davemloft.net>
>> >> Cc: Jakub Kicinski <kuba@kernel.org>
>> >> Cc: ath11k@lists.infradead.org
>> >> Cc: linux-wireless@vger.kernel.org
>> >> Cc: netdev@vger.kernel.org
>> >> Signed-off-by: Kees Cook <keescook@chromium.org>
>> >
>> > What's the plan for this patch? I would like to take this via my ath
>> > tree to avoid conflicts.
>> 
>> Actually this has been already applied:
>> 
>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=ath-next&id=d5549e9a6b86
>> 
>> Why are you submitting the same patch twice?
>
> These are all part of a topic branch, and the cover letter mentioned
> that a set of them have already been taken but haven't appeared in -next
> (which was delayed).

Do note that some wireless drivers (at least ath, mt76 and iwlwifi) are
maintained in separate trees, so don't be surprised if it takes several
weeks before they are visible in linux-next.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
