Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E815C46467
	for <ath11k@archiver.kernel.org>; Tue,  3 Jan 2023 09:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EUmFLf6svGc8Lq6a3zFNbzVYAvP/miT2caMJfNAoIAc=; b=YqXRSw0Gt+LkpH
	qZaDHYm4MI7iG4q/4QLERfFsabXaVMHPrNRBbx45zyR45hoZMWLgQsO41+bet9rXyZaEFgOp/i/ru
	JMT/pn/LIFEjuF1PDTeQLl/gData53Bj11TMbjoNLFLz+4TfVe7a3OGD/c+6eeg/4Gj0Mn9zH4CIY
	5pk34PdYYnxFK/KIFF5afSEC1wZNy8oeunIlTU3RHUQgBmh1GEp2cpD2XrdSW1bpabBnJXJCXsFNq
	vHNqd0AojivakYalW9vPM8o8/qoDIaTmURiR9dlQLBHy47H3ynVUp9f/8TLcEpC5CDla9g6h/h5XC
	mNGkYFxSlsi2K7IVOIEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCdm8-000UzL-8q; Tue, 03 Jan 2023 09:40:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCdUB-000RQF-B8
	for ath11k@lists.infradead.org; Tue, 03 Jan 2023 09:21:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 08E786121C;
	Tue,  3 Jan 2023 09:21:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3A5EC433F0;
	Tue,  3 Jan 2023 09:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672737689;
	bh=UeojPqccHQLunvAMGJSsAkbqVgpgQ+tfNxLVQSSNOZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b/RBp64HRv1JBVg9NRj1UOMrS5fir3u7Q+K58ib+ylvFOOXJsuWyU2+IGBMV6Z/+b
	 quQxCkBLya6xWIS64yUUg56K2vkATqNPHGhnyOsqecTGakav8KH6hf1E8q/RJmrCZP
	 hT+i/RXPZ+oSKwlMZgECssdeP8DwM/DvTzYj6EcvL6fIMhCRw4noK0Vsk0udVM6d4Y
	 7uwbEfeK4CoZGEwQzHMYWI5E7y6h9TVC2ZwWQ76Jwj3U6NUIKdm1WyYxmKQ5I1W7qQ
	 pcRuf3R3zhuTO2HaUXb0q42ZG6b2rdvO3II93dv/eXxed+nA6bLh2Ba97E8dQHdqqx
	 qZCgNjrQpJMMA==
Date: Tue, 3 Jan 2023 11:21:25 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Manikanta Pubbisetty <mpubbise@codeaurora.org>,
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] wifi: ath11k: Fix memory leak in
 ath11k_peer_rx_frag_setup
Message-ID: <Y7PzlY3S0B1OBtmE@unreal>
References: <20230102081142.3937570-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230102081142.3937570-1-linmq006@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_012131_483643_D055233B 
X-CRM114-Status: GOOD (  12.83  )
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

On Mon, Jan 02, 2023 at 12:11:42PM +0400, Miaoqian Lin wrote:
> crypto_alloc_shash() allocates resources, which should be released by
> crypto_free_shash(). When ath11k_peer_find() fails, there has memory
> leak. Add missing crypto_free_shash() to fix this.
> 
> Fixes: 243874c64c81 ("ath11k: handle RX fragments")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
> change in v2:
> - add crypto_free_shash() in the error path instead of move
> crypto_alloc_shash().
> ---
>  drivers/net/wireless/ath/ath11k/dp_rx.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Thanks,
Reviewed-by: Leon Romanovsky <leonro@nvidia.com>

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
