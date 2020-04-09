Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMSt8-000387-Ry
 for ath11k@lists.infradead.org; Thu, 09 Apr 2020 08:50:22 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 1/2] ath11k: fix missing return in
 ath11k_thermal_set_throttling
References: <20200408190606.870098-1-arnd@arndb.de>
Date: Thu, 09 Apr 2020 11:50:01 +0300
In-Reply-To: <20200408190606.870098-1-arnd@arndb.de> (Arnd Bergmann's message
 of "Wed, 8 Apr 2020 21:05:57 +0200")
Message-ID: <87h7xtujpi.fsf@kamboji.qca.qualcomm.com>
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

> The empty stub version of this function causes a compile-time
> warning:
>
> In file included from drivers/net/wireless/ath/ath11k/core.h:23,
>                  from drivers/net/wireless/ath/ath11k/dp_rx.h:8,
>                  from drivers/net/wireless/ath/ath11k/ce.c:6:
> drivers/net/wireless/ath/ath11k/thermal.h: In function 'ath11k_thermal_set_throttling':
> drivers/net/wireless/ath/ath11k/thermal.h:45:1: error: no return statement in function returning non-void [-Werror=return-type]
>
> Just return success here.
>
> Fixes: a41d10348b01 ("ath11k: add thermal sensor device support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/net/wireless/ath/ath11k/thermal.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/net/wireless/ath/ath11k/thermal.h b/drivers/net/wireless/ath/ath11k/thermal.h
> index 459b8d49c184..f1395a14748c 100644
> --- a/drivers/net/wireless/ath/ath11k/thermal.h
> +++ b/drivers/net/wireless/ath/ath11k/thermal.h
> @@ -42,6 +42,7 @@ static inline void ath11k_thermal_unregister(struct ath11k *ar)
>  
>  static inline int ath11k_thermal_set_throttling(struct ath11k *ar, u32 throttle_state)
>  {
> +	return 0;
>  }

Already fixed by this commit:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/wireless-drivers.git/commit/?id=c9be1a642a7b9ec021e3f32e084dc781b3e5216d

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
