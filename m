Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB161C77B7C
	for <ath11k@archiver.kernel.org>; Tue,  9 May 2023 16:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OLhYt+p63mHvq36t6TjW8npeAlYPPd6xLbFxQFZwFKA=; b=E62t4ccripTeVT
	Z2mrH37OF1HfdGNLiJEuHbM2bzmM5TBXzJww/MdNYKDTc2ukJk8XlTlW45sM/s7F/9xTQmc+XAw5O
	Vn5P+sdqhQpTBgOKR1zIxfF3/jwxpf8U2jHwp6jm5ATztjdvlufsceVKux30cX+NckBIVbOM0wCIQ
	2ASy6vY8uo6Uuzeo7NMywhyPeKC41/+rl7jYexvweK3goBV5UbwVl4Se3FFXDExf207HnwDsefIP8
	6tvmhnnxC41tZUc4QgMKBeTSDKSvAIsxqRB9XcetVgaVPU/h/i25x/rSVyeWpcDIIPostqedkSti5
	ahYZbwbvtDftLKy4M48g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwQVs-003pst-2U;
	Tue, 09 May 2023 16:48:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwQVq-003psK-1S;
	Tue, 09 May 2023 16:48:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3C92B633D1;
	Tue,  9 May 2023 16:48:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C37CC433D2;
	Tue,  9 May 2023 16:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683650908;
	bh=LmjYrDWXMZE+8F8WkMaybmS9iZ4N0nimi6u9xcjFLKw=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=tt6jpfyiENoz5vf/hNM2dFYrXBE3rwqEm5YlxpWgmSbjpWgSb0HlsDwfQEGWzW/U8
	 khDffhNuS0gK3J0c4VBdGPx+SL0VHUDQGL3Hax0enSTzgyJhvA2/XcmIq67TL4OsZF
	 yVRuho1lTp0XgQDdn2b4wRBYCklmWQtMu+dsxAjkGux5E0U0S+Q4D0vLhyhUuMKyKj
	 o4NdE5m+rfNOicFPmRWj3/O945/d0l+axShBhrO7VMgwCyKmzRxg8GpdROAAvRNW4v
	 YF/aZCKw8fZ8CXR0DAH/+t7UocW91MxFFt8v+AegAhRpvoBpZi9VF999DtPpqhPQh8
	 aTzX2VBX17Ikw==
MIME-Version: 1.0
Subject: Re: [PATCH] wireless: ath: work around false-positive
 stringop-overread
 warning
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230417205447.1800912-1-arnd@kernel.org>
References: <20230417205447.1800912-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Johannes Berg <johannes.berg@intel.com>,
 Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
 Wen Gong <quic_wgong@quicinc.com>, Baochen Qiang <quic_bqiang@quicinc.com>,
 Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 ath12k@lists.infradead.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168365090000.15706.12307969406639304142.kvalo@kernel.org>
Date: Tue,  9 May 2023 16:48:25 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_094830_557700_888D0B8D 
X-CRM114-Status: GOOD (  10.34  )
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

Arnd Bergmann <arnd@kernel.org> wrote:

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
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

695df2f417d2 wifi: ath: work around false-positive stringop-overread warning

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230417205447.1800912-1-arnd@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
