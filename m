Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMStQ-0003Eh-Di
 for ath11k@lists.infradead.org; Thu, 09 Apr 2020 08:50:38 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 2/2] ath11k: fix ath11k_thermal_unregister() prototype
References: <20200408190606.870098-1-arnd@arndb.de>
 <20200408190606.870098-2-arnd@arndb.de>
Date: Thu, 09 Apr 2020 11:50:29 +0300
In-Reply-To: <20200408190606.870098-2-arnd@arndb.de> (Arnd Bergmann's message
 of "Wed, 8 Apr 2020 21:05:58 +0200")
Message-ID: <87d08hujoq.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Arnd Bergmann <arnd@arndb.de>
Cc: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath11k@lists.infradead.org, "David S. Miller" <davem@davemloft.net>

Arnd Bergmann <arnd@arndb.de> writes:

> The stub function has the wrong prototype, causing a warning:
>
> drivers/net/wireless/ath/ath11k/core.c: In function 'ath11k_core_pdev_destroy':
> drivers/net/wireless/ath/ath11k/core.c:416:28: error: passing argument 1 of 'ath11k_thermal_unregister' from incompatible pointer type [-Werror=incompatible-pointer-types]
>
> Change it to take the same arguments as the normal implementation.
>
> Fixes: 2a63bbca06b2 ("ath11k: add thermal cooling device support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/net/wireless/ath/ath11k/thermal.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/thermal.h b/drivers/net/wireless/ath/ath11k/thermal.h
> index f1395a14748c..ea9a58bf6a93 100644
> --- a/drivers/net/wireless/ath/ath11k/thermal.h
> +++ b/drivers/net/wireless/ath/ath11k/thermal.h
> @@ -36,7 +36,7 @@ static inline int ath11k_thermal_register(struct ath11k_base *sc)
>  	return 0;
>  }
>  
> -static inline void ath11k_thermal_unregister(struct ath11k *ar)
> +static inline void ath11k_thermal_unregister(struct ath11k_base *ar)
>  {
>  }

Already fixed by this commit:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/wireless-drivers.git/commit/?id=c9be1a642a7b9ec021e3f32e084dc781b3e5216d

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
