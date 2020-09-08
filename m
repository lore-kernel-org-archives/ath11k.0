Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFVCs-0000uR-7p
 for ath11k@lists.infradead.org; Tue, 08 Sep 2020 04:26:11 +0000
Received: by mail-qk1-x741.google.com with SMTP id w16so14203213qkj.7
 for <ath11k@lists.infradead.org>; Mon, 07 Sep 2020 21:26:04 -0700 (PDT)
Date: Mon, 7 Sep 2020 21:26:01 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] ath11k: fix a double free and a memory leak
Message-ID: <20200908042601.GB111690@ubuntu-n2-xlarge-x86>
References: <20200906212625.17059-1-trix@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200906212625.17059-1-trix@redhat.com>
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
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: trix@redhat.com
Cc: mkenna@codeaurora.org, rmanohar@codeaurora.org, linux-wireless@vger.kernel.org, vnaralas@codeaurora.org, ndesaulniers@google.com, linux-kernel@vger.kernel.org, ath11k@lists.infradead.org, clang-built-linux@googlegroups.com, netdev@vger.kernel.org, john@phrozen.org, kuba@kernel.org, davem@davemloft.net, kvalo@codeaurora.org

On Sun, Sep 06, 2020 at 02:26:25PM -0700, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> clang static analyzer reports this problem
> 
> mac.c:6204:2: warning: Attempt to free released memory
>         kfree(ar->mac.sbands[NL80211_BAND_2GHZ].channels);
>         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> The channels pointer is allocated in ath11k_mac_setup_channels_rates()
> When it fails midway, it cleans up the memory it has already allocated.
> So the error handling needs to skip freeing the memory.
> 
> There is a second problem.
> ath11k_mac_setup_channels_rates(), allocates 3 channels. err_free
> misses releasing ar->mac.sbands[NL80211_BAND_6GHZ].channels
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Tom Rix <trix@redhat.com>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
>  drivers/net/wireless/ath/ath11k/mac.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index f4a085baff38..f1a964b01a83 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -6089,7 +6089,7 @@ static int __ath11k_mac_register(struct ath11k *ar)
>  	ret = ath11k_mac_setup_channels_rates(ar,
>  					      cap->supported_bands);
>  	if (ret)
> -		goto err_free;
> +		goto err;
>  
>  	ath11k_mac_setup_ht_vht_cap(ar, cap, &ht_cap);
>  	ath11k_mac_setup_he_cap(ar, cap);
> @@ -6203,7 +6203,8 @@ static int __ath11k_mac_register(struct ath11k *ar)
>  err_free:
>  	kfree(ar->mac.sbands[NL80211_BAND_2GHZ].channels);
>  	kfree(ar->mac.sbands[NL80211_BAND_5GHZ].channels);
> -
> +	kfree(ar->mac.sbands[NL80211_BAND_6GHZ].channels);
> +err:
>  	SET_IEEE80211_DEV(ar->hw, NULL);
>  	return ret;
>  }
> -- 
> 2.18.1
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
