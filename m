Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 143BFC32793
	for <ath11k@archiver.kernel.org>; Wed, 18 Jan 2023 06:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/LHIsCPYSUxiS8+V4j/dDn+jITXw3toa9L07EHY3wRQ=; b=3SamZcDU/F+b/X
	kd1iJawrL3i4E6twxX1swkq/9o8DVcYTzdMa7cbCrIW15EfYiFl74Z/fhcv8RgrKIgkmxptBQSKdZ
	OtFgapcAtRIAm6tG0P2VedJ1kEOrrA9A0nNtb2+Zwjj/eztENkH9KP23Jq+yXmk1RMxDGSntcdfs6
	Ndi4ROcYsqvMijQImjRE76iarOceLwviXqUx4wHbVTCVMYmH0pK25mgjfKUdi3qGbZ3sNiiuNjm5O
	ps9xNH4txxh0UwHTaIic+ecEiripgSs3gx6ktJdxFJWs5ewEl0Aby62hm50RGZTNd0B+I0qcSLkGT
	o2N5iv0v53Bcz9kZOWQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI22h-00H6vi-5i; Wed, 18 Jan 2023 06:35:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI22e-00H6uz-Bc
	for ath11k@lists.infradead.org; Wed, 18 Jan 2023 06:35:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7E266616C7;
	Wed, 18 Jan 2023 06:35:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A980BC433EF;
	Wed, 18 Jan 2023 06:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674023722;
	bh=UsZhg3e/FoLkTU5R3hvEWS8a+d3s1oq7ddrZA6/R5ZE=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=rkbSW35Tf5XzQltEqJK1XK2bgCeGOIyt0k25tAaDauGymr2QAEfDKzjLEafnEjg+m
	 6E6ixXFJP/Y9sgiaTtGf2DqLLGJvJFj9/1i0m0cjW/wco172djAyy4Ov+NqBuKxiWO
	 3y3GLZwo09QopS8eFVfnls35rdFuHELzhIEiDBmYLZhMHzZkFXxFyWqWS9RavSE1O/
	 vseCn2qrZgium/eGEvupTLm9c3qnLKVKNl9SKV28uDZzYhQWBQTyxYlEsDFRWZE2ZF
	 bCoCim3jlVYAqNW1Z+2eZil5DZqMu0Zg5Iaf/v2cX0+NbguVqGFS15L4/ze4n2WPgN
	 czNXfcZZ5tRKg==
MIME-Version: 1.0
Subject: Re: [PATCH v2] wifi: ath11k: Fix memory leak in
 ath11k_peer_rx_frag_setup
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230102081142.3937570-1-linmq006@gmail.com>
References: <20230102081142.3937570-1-linmq006@gmail.com>
To: Miaoqian Lin <linmq006@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Manikanta Pubbisetty <mpubbise@codeaurora.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linmq006@gmail.com
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167402371642.24104.14787775190477327666.kvalo@kernel.org>
Date: Wed, 18 Jan 2023 06:35:19 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_223524_464798_43165BD5 
X-CRM114-Status: UNSURE (   7.99  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Miaoqian Lin <linmq006@gmail.com> wrote:

> crypto_alloc_shash() allocates resources, which should be released by
> crypto_free_shash(). When ath11k_peer_find() fails, there has memory
> leak. Add missing crypto_free_shash() to fix this.
> 
> Fixes: 243874c64c81 ("ath11k: handle RX fragments")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

ed3f83b3459a wifi: ath11k: Fix memory leak in ath11k_peer_rx_frag_setup

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230102081142.3937570-1-linmq006@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
