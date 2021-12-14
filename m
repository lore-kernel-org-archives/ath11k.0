Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9B3C433EF
	for <ath11k@archiver.kernel.org>; Tue, 14 Dec 2021 15:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=76CS12cM/uYQHqCKyfDWy2rC13A8F8Bml10DpV7s32U=; b=W3qA+CsDzMSqf5
	ePAgdb6NtOTF7aV1afz+f1zUUuThgxzgxN7iXocFsib0Hs+7Sqxt2xOyGkFhN8i5GRHG2WV0IM1NR
	T4Yw0GbR46POwV5lga2nkk7HKAGEVgtReWsFvbZeN41FGoKiMY2CCIcW4O3B0RvMcIh2yyM4ikOuo
	q5fAGQUYe2LH1S9sj234N1NEwuXM1ISRfEJRZdxwSZ8K9Un2ziqVHWYI5NUba70q2Nrxrl9mPZaGu
	3oEeQR9ZkefuplLA2P0PCr70ZPTR3MFEC+3P6n3L7DbEK62KRtBiDdecWUjE65EamqNU4G9nPCYkh
	lLDdLIFmKq18vKKON6nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxA0o-00Ejuc-6Q; Tue, 14 Dec 2021 15:46:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxA0l-00Eju6-8C
 for ath11k@lists.infradead.org; Tue, 14 Dec 2021 15:46:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AF2076148D;
 Tue, 14 Dec 2021 15:46:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C84FC34606;
 Tue, 14 Dec 2021 15:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639496798;
 bh=lpMJyBaryDhU6pdFEk23SJlqLoV1mD69gh70IqL8reE=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=ruvvT96NLYiBGRmzeo6xh7E28uyoreQQvj/Z2GhwLnGcaUERCJuq7NdKw5qo4g/rY
 MpRaakxm3iRBkfb04Psdeui91kK7BAgLsZd+uUtja6HVHDqv4Aan6I3e1rROmXRLMZ
 w9g2scAyGEpu2X7NLKHdzfb4b5bwt6tLOGH4P6buaidGL/YSatjfZ5TQMKn5OGLO+X
 ka53aY+PbWRCFuYikHRVp+CqbsRJbIVzrEzwL+zkl6wMeV0aoRj4p45+2+oPKbeVRo
 RAPGspKzXPkIelQm5L+a7G1KEzxXxKckTHYw5CVtZ9n3lA1ABKbO6l20p4VO9CBOaj
 37vHLyPDq5fKw==
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
 <87v8zriv1c.fsf@codeaurora.org>
Date: Tue, 14 Dec 2021 17:46:31 +0200
In-Reply-To: <87v8zriv1c.fsf@codeaurora.org> (Kalle Valo's message of "Tue, 14
 Dec 2021 08:02:07 +0200")
Message-ID: <877dc7i3zc.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_074639_357344_9297B84B 
X-CRM114-Status: GOOD (  11.08  )
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

Kalle Valo <kvalo@kernel.org> writes:

> Kees Cook <keescook@chromium.org> writes:
>
>> In preparation for FORTIFY_SOURCE performing compile-time and run-time
>> field bounds checking for memset(), avoid intentionally writing across
>> neighboring fields.
>>
>> Use memset_startat() so memset() doesn't get confused about writing
>> beyond the destination member that is intended to be the starting point
>> of zeroing through the end of the struct. Additionally split up a later
>> field-spanning memset() so that memset() can reason about the size.
>>
>> Cc: Kalle Valo <kvalo@codeaurora.org>
>> Cc: "David S. Miller" <davem@davemloft.net>
>> Cc: Jakub Kicinski <kuba@kernel.org>
>> Cc: ath11k@lists.infradead.org
>> Cc: linux-wireless@vger.kernel.org
>> Cc: netdev@vger.kernel.org
>> Signed-off-by: Kees Cook <keescook@chromium.org>
>
> What's the plan for this patch? I would like to take this via my ath
> tree to avoid conflicts.

Actually this has been already applied:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=ath-next&id=d5549e9a6b86

Why are you submitting the same patch twice?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
