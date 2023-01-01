Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7A8C4167B
	for <ath11k@archiver.kernel.org>; Sun,  1 Jan 2023 07:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F2lcDDMb28TMcdAoF9UHmg1YVPTzA1g18KJ5kVoFzys=; b=ng1Yz2mOQUk+6W
	eVcwgKeFautUcudaTtGSva/VH8QpaqatbpDG+/7WEO8Nw9V8C4SHceTRpeIBGvdT3KzGeU06nJbgv
	Y2xU7aUqDQ+s/EvNvCGpbZtA+rKe+HVP99RzAVPY8nuFBTJJaEYBR0HCqLNv90EDYxGX8L0Wei9Id
	b5KZ0wzsHYVtB4OgmO8khoEb7aBROYJOHkooPsNUkRJNIXLSWmGyfC99bgpamwdyZb9Np0hH+Ban8
	A8QiaI6DmG610A6VWrv6CcqhyjqWpJ9Q6O3/LUJf/ElLvXHzCygkj10QHiquuJQE1vocDTQDt5V7M
	9fVAQzY7z840gxvD5DTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBt21-00G14u-I7; Sun, 01 Jan 2023 07:45:21 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBt1c-00G0o4-2M
	for ath11k@lists.infradead.org; Sun, 01 Jan 2023 07:44:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6B466B80979;
	Sun,  1 Jan 2023 07:44:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FFEFC433D2;
	Sun,  1 Jan 2023 07:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672559091;
	bh=59eVHOxrFMgU3R7WYLVhvDVwYrTPlF5buBzKHCX931k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=is7+RLaLyADQ4dKsPNK1KChFOHA9VTV9UI3BiJeAitFOZE5tm1gC2gH96BKujzrJH
	 kbPyvzDoO0F3jPcBVykTXOMeDUyHZkBmzje8HI5wd3SJVvsZLxCs/5ijuXtNJnfYfj
	 IGsur9tnSLdBN/pjo/LCmp+8jyqBjzLKsCmUFzKgfb7tZAboXyT5qWWag8ldq07yU5
	 8l3k3E83rhuXlfQgslr82WtPB5bpuOntF6uV2t7S3263CNKSxPBPkp8byDwekjW7Mx
	 NfNJMbKyIYszXDt8vnyiHwUWyRNIYLQyW3OMmKrTKFO84RENpDWF8IRvMUGQc9nZ0/
	 8MxfZt+3KLXJw==
Date: Sun, 1 Jan 2023 09:44:46 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Manikanta Pubbisetty <mpubbise@codeaurora.org>,
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: ath11k: Fix memory leak in
 ath11k_peer_rx_frag_setup
Message-ID: <Y7E57sQ9LiJWefoj@unreal>
References: <20221229073849.1388315-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221229073849.1388315-1-linmq006@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221231_234456_334694_56A5B5EF 
X-CRM114-Status: GOOD (  17.93  )
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

On Thu, Dec 29, 2022 at 11:38:48AM +0400, Miaoqian Lin wrote:
> crypto_alloc_shash() allocates resources, which should be released by
> crypto_free_shash(). When ath11k_peer_find() fails, there has memory
> leak. Move crypto_alloc_shash() after ath11k_peer_find() to fix this.
> 
> Fixes: 243874c64c81 ("ath11k: handle RX fragments")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>  drivers/net/wireless/ath/ath11k/dp_rx.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
> index c5a4c34d7749..1297caa2b09a 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
> @@ -3116,10 +3116,6 @@ int ath11k_peer_rx_frag_setup(struct ath11k *ar, const u8 *peer_mac, int vdev_id
>  	struct dp_rx_tid *rx_tid;
>  	int i;
>  
> -	tfm = crypto_alloc_shash("michael_mic", 0, 0);
> -	if (IS_ERR(tfm))
> -		return PTR_ERR(tfm);
> -
>  	spin_lock_bh(&ab->base_lock);
>  
>  	peer = ath11k_peer_find(ab, vdev_id, peer_mac);
> @@ -3129,6 +3125,10 @@ int ath11k_peer_rx_frag_setup(struct ath11k *ar, const u8 *peer_mac, int vdev_id
>  		return -ENOENT;
>  	}
>  
> +	tfm = crypto_alloc_shash("michael_mic", 0, 0);
> +	if (IS_ERR(tfm))
> +		return PTR_ERR(tfm);
> +

You forgot to unlock ab->base_lock.

Thanks

>  	for (i = 0; i <= IEEE80211_NUM_TIDS; i++) {
>  		rx_tid = &peer->rx_tid[i];
>  		rx_tid->ab = ab;
> -- 
> 2.25.1
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
