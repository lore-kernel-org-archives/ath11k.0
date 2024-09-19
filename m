Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C50CF395D
	for <ath11k@archiver.kernel.org>; Thu, 19 Sep 2024 16:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BPl5kvcIi+QTYJVXOcZhyegN9sd8kZG0PUk5ImMIVME=; b=vcgdRZ9xAPcVubn7WELDFuHMeq
	nzawsPxKlaN2dsQcsXobsGR31/l4/SSTjyWGMQgc4Fpcx4cXSrJtUaDgK+fAF4ab2tqfeR4Z2uagT
	mLwTfRXRn0qwcLoMYsRy46uFZbyFc5ulBUwEU2yanDUoQmv00X8HFpTo8W46bj01tbFhCNzQ5kl0k
	u+rqphHlJFqqpK/nmKUwE9nzID3T6+jWcbcYlIETFLw9b0lfgPbgVhiHcyoSEW+pW9SgzGv1psTGN
	j+jlns2FBtHvHH3WEjIC+nwvntTQ6U0K2Z5kz87p5jjhlu9HIo+i15PklMdgsGOJmFo2aq4YSssPa
	a8SLrUGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srKIT-0000000Ahlx-409q;
	Thu, 19 Sep 2024 16:46:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srKIR-0000000AhlY-0uP1
	for ath11k@lists.infradead.org;
	Thu, 19 Sep 2024 16:46:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C2B955C01A2;
	Thu, 19 Sep 2024 16:46:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9964C4CEC4;
	Thu, 19 Sep 2024 16:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726764382;
	bh=Vuv8FLFA9PwbWOnTvAxXu6BnGw5oinSe1553u2C8Ysw=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=f3EH6ElbaZu2o1Wsv/PHru5l/55w7fG6L8NBWBWAnETFMMb1AnL3YE8OSpGg64FEP
	 JBZG+Lb4VnlGJe92DmsECuUY4K8e5k6A/Qwxr3rnUGJhQfOMHyQ79Rrwarp7j5lK6X
	 8nM8yVVtD8I39XDLy7qYpQWNGjh7Z3qT0MGguwv3ZyAtONsazVrGlFvrkuYZXQD6ze
	 JFI9GUOdka2DNnKYhkYcOVrBsyHx5iv0xTEsNT7TieNxoD4Mttbgrwhn90ygrD8F6X
	 8VAjhe9AmpEpjPslLNU53Zi0L565Jys/WmOVcZnuzkZH0yKV0z7T2R3JfenC4u/tWm
	 HqKPZy0gkfTVw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] ath11k: modify null check logic in
 ath11k_ce_rx_post_pipe()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240909150824.28195-1-m.lobanov@rosalinux.ru>
References: <20240909150824.28195-1-m.lobanov@rosalinux.ru>
To: Mikhail Lobanov <m.lobanov@rosalinux.ru>
Cc: Mikhail Lobanov <m.lobanov@rosalinux.ru>,
 Jeff Johnson <jjohnson@kernel.org>,
 Govindaraj Saminathan <quic_gsamin@quicinc.com>,
 Miles Hu <milehu@codeaurora.org>, Sven Eckelmann <seckelmann@datto.com>,
 Rajkumar Manoharan <rmanohar@codeaurora.org>,
 John Crispin <john@phrozen.org>, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <172676437762.281449.1201751345434084726.kvalo@kernel.org>
Date: Thu, 19 Sep 2024 16:46:19 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_094623_336901_A84F2D12 
X-CRM114-Status: UNSURE (   8.88  )
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

Mikhail Lobanov <m.lobanov@rosalinux.ru> wrote:

> The previous logic in ath11k_ce_rx_post_pipe() incorrectly required both 
> dest_ring and status_ring to be NULL in order to exit the function. 
> This caused the function to continue even if only one of the pointers 
> was NULL, potentially leading to null pointer dereferences in 
> ath11k_ce_rx_buf_enqueue_pipe().
> 
> Fix the condition by modifying the logic so that the function returns 
> early if either dest_ring or status_ring is NULL.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>

Jeff, what do you think?

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240909150824.28195-1-m.lobanov@rosalinux.ru/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
https://docs.kernel.org/process/submitting-patches.html


