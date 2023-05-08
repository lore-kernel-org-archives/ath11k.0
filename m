Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BDCC77B75
	for <ath11k@archiver.kernel.org>; Mon,  8 May 2023 08:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YGwDIa/7o/NBCjXCvzHoNYtLLeTZLuhl5ZP2l/gZ/Bk=; b=tx+rAzTsVJyh1i
	W0euVHWjiO8Nllan2aeKBq+BpsXNyPU6F0pvls5t00zCV9iK51dZwEUMKqhjIen6mAVENJs4ArX9p
	XODe9QBZasgLxxOb2lEQ7FrcjpDk9AIbKbJvJjjy8PXv3xcUbshJp9ZN4KicC4PRusQyQxxpZvhr5
	o4BHIxwa2mbb8jR4BCRGiABmzXQYuWbu65o9/Rb/i4v1ASgp7jIegE0tsgurmHNE1PbchNGtW9lKZ
	E2o9RDAnvAQl5NpdBrElpIwBfssLeBvvBcoqtAMNi40r4D9e3Hv/fMCluHm+d3CJyZVGqLdmym72E
	HFz/YpcBpCDpOvbxOHug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvwUK-0000oF-2B;
	Mon, 08 May 2023 08:44:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvwUI-0000nk-0h;
	Mon, 08 May 2023 08:44:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 572C9611B5;
	Mon,  8 May 2023 08:44:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DC5FC433EF;
	Mon,  8 May 2023 08:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683535492;
	bh=4r3I/p321L24aAx0oFkvVjKBy4Ysck/E+5s0WPzJpB4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Idi0uxdhC0IAIqdFhRDaGnjKm6BtsAeoZxde4HBaCAGj0spmTGStkmr7e8SPNw8rp
	 Nu3QMcgKRSvP1m4fTcff+oBGfiROJfCLvCF27uuKlSHDOjPB0A4pKZqhWCbmunFJMb
	 eTmXv+aOLEvT0SLoNxKYjChy9TaxfsZXlIpTN1SeIDxO4OKSk3xASB0H1FeBzVxKLa
	 Wuk7qx5qIQ8otkjmAUrArGp0Bhz71uBjmHEbG+SPtFR5g+YEyp5fbBgTfteLOxSg+e
	 JwQYSksPZCHm3jVUueeJJeprPuDHMim7rJONUbR+kSr6rK7McAE1OfM4B0POrZ/xeW
	 /QUr6qcr0r/WA==
From: Kalle Valo <kvalo@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Arnd Bergmann <arnd@arndb.de>,  Johannes Berg <johannes.berg@intel.com>,  Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,  Wen Gong <quic_wgong@quicinc.com>,  Baochen Qiang <quic_bqiang@quicinc.com>,  Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,  ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org,  netdev@vger.kernel.org,  linux-kernel@vger.kernel.org,  ath12k@lists.infradead.org
Subject: Re: [PATCH] wireless: ath: work around false-positive stringop-overread warning
References: <20230417205447.1800912-1-arnd@kernel.org>
Date: Mon, 08 May 2023 11:44:44 +0300
In-Reply-To: <20230417205447.1800912-1-arnd@kernel.org> (Arnd Bergmann's
	message of "Mon, 17 Apr 2023 22:54:20 +0200")
Message-ID: <87ttwnnrer.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_014454_323518_849E590A 
X-CRM114-Status: GOOD (  13.72  )
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

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
>
> In a rare arm64 randconfig build, I got multiple warnings for ath11k
> and ath12k:
>
> In function 'ath11k_peer_assoc_h_ht',
>     inlined from 'ath11k_peer_assoc_prepare' at drivers/net/wireless/ath/ath11k/mac.c:2665:2:
> drivers/net/wireless/ath/ath11k/mac.c:1709:13: error: 'ath11k_peer_assoc_h_ht_masked' reading 10 bytes from a region of size 0 [-Werror=stringop-overread]
>  1709 |         if (ath11k_peer_assoc_h_ht_masked(ht_mcs_mask))
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> This happens whenever gcc-13 fails to inline one of the functions
> that take a fixed-length array argument but gets passed a pointer.
>
> Change these functions to all take a regular pointer argument
> instead.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

s/wireless:/wifi:/ but I can fix that.

In a awat it's a shame to lose the explicit length but I guess there's
no other way to fix this?

Also I hope you find the time to add GCC 13 to crosstool :) Related to
this, last year we had a similar warning with GCC 11 for which I added this
not-so-pretty workaround:

abf93f369419 wifi: ath11k: mac: fix reading 16 bytes from a region of size 0 warning

https://git.kernel.org/linus/abf93f369419

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
