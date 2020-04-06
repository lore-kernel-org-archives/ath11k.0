Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLSdh-0002ZH-F4
 for ath11k@lists.infradead.org; Mon, 06 Apr 2020 14:22:15 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix compiler warnings without CONFIG_THERMAL
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200403083414.31392-1-yuehaibing@huawei.com>
References: <20200403083414.31392-1-yuehaibing@huawei.com>
Message-Id: <20200406142207.C7F3CC433F2@smtp.codeaurora.org>
Date: Mon,  6 Apr 2020 14:22:07 +0000 (UTC)
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
To: YueHaibing <yuehaibing@huawei.com>
Cc: pradeepc@codeaurora.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath11k@lists.infradead.org, davem@davemloft.net

YueHaibing <yuehaibing@huawei.com> wrote:

> drivers/net/wireless/ath/ath11k/thermal.h:45:1:
>  warning: no return statement in function returning non-void [-Wreturn-type]
> drivers/net/wireless/ath/ath11k/core.c:416:28: error:
>  passing argument 1 of 'ath11k_thermal_unregister' from incompatible pointer type [-Werror=incompatible-pointer-types]
> 
> Add missing return 0 in ath11k_thermal_set_throttling,
> and fix ath11k_thermal_unregister param type.
> 
> Fixes: 2a63bbca06b2 ("ath11k: add thermal cooling device support")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied to wireless-drivers.git, thanks.

c9be1a642a7b ath11k: fix compiler warnings without CONFIG_THERMAL

-- 
https://patchwork.kernel.org/patch/11472105/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
