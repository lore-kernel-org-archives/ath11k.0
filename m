Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2A1C4725D
	for <ath11k@archiver.kernel.org>; Fri, 19 Jan 2024 06:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+WjhaWDL1v9ajKtKVC+vyuQvC6YacprOCkHhqOgcNE8=; b=o+wf+VCOJAqkxvpCiFivQ7M/ze
	79Qy1rc+sY7/DhnR0cZ/jlQSBUf13LX06U00rUkydR1BenQD9/fVVihul5SofHgZs4YR7jSBIxSaK
	D16m9i6eVzgaBWk/qK5gOcpieLE3tWIKfHfH2gjlxe0hPFRgQO+gW7XiHU3E75bLKduFfBrNdWvTV
	TaXHFyHGoQ2otot30P+kKWcO/hIfsx79euI7B60C+C6dfN2VnxxmDfq+NNVzd0DNVG1A7jzfziznQ
	+S1T6Tfxl+fsMAuKNp6gXTgFM0NaTW17h4O7BkukY5g4JAbPjeCjhZsI0+H3U8Uv1mzBLoKtC0/aU
	pIpUShlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQiSj-004c1r-2P;
	Fri, 19 Jan 2024 06:34:45 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQiSf-004c0t-2n
	for ath11k@lists.infradead.org;
	Fri, 19 Jan 2024 06:34:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A1A02CE20AA
	for <ath11k@lists.infradead.org>; Fri, 19 Jan 2024 06:34:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAFE6C433F1;
	Fri, 19 Jan 2024 06:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705646078;
	bh=ybA7Oc8IdtrO7eV7Gbv0lepTuXv8HmJ31IowmvsVq8w=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=PGAzh/4YmVT5S4OS9eQk1mS4lN+09SjCWQE/JyAgmagMRQz0wNuhoSlnMlF/0FY5x
	 /Ij/Gt1u0ioX1CjhSasQTC5mSgkYcKOtyMJgptXWkUM/RpVpgYHku/cyC2m9Q6mVJ5
	 RkE2DP+0ODENZESZATD8M6uMMXYhuSEQVGtc9LP1soaBY8Oh7HE5YY9qoy2aaRk/am
	 UgyZgUKGC4Uwg2QFHNsL7QVId0nBxXu3O2TJhHkiBsMYTEyHPLTlq45GgLNr/9mb4i
	 u743CyBKjfqm+It734T8hi4T7yWXmPlI8rolnK2IksV6rBscxQ+B1wNrYR8vblXK7S
	 AyqlpJGW1p8vw==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,  regressions@lists.linux.dev,
  linux-kernel@vger.kernel.org
Subject: Re: [regression] ath11k broken in v6.7
References: <874jfjiolh.fsf@kernel.org>
Date: Fri, 19 Jan 2024 08:34:35 +0200
In-Reply-To: <874jfjiolh.fsf@kernel.org> (Kalle Valo's message of "Thu, 11 Jan
	2024 22:47:54 +0200")
Message-ID: <87frytg7b8.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_223442_082819_416D34D1 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
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

Kalle Valo <kvalo@kernel.org> writes:

> Just trying to make everyone aware because I suspect this will affect
> quite a few people: ath11k is crashing during suspend on v6.7 due to a
> mac80211 patch, more info:
>
> https://bugzilla.kernel.org/show_bug.cgi?id=218364
>
> Proposed fix:
>
> https://patchwork.kernel.org/project/linux-wireless/patch/20240111170629.1257217-1-benjamin@sipsolutions.net/

The fix is now applied:

https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.git/commit/?id=556857aa1d0855aba02b1c63bc52b91ec63fc2cc

I'll try to use regzbot for the first time, let's see how it goes:

#regzbot introduced: 0a3d898ee9a8 ^

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

