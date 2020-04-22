Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jR94h-0003vo-Td
 for ath11k@lists.infradead.org; Wed, 22 Apr 2020 06:41:37 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: remove conversion to bool in
 ath11k_dp_rxdesc_mpdu_valid()
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200420123718.3384-1-yanaijie@huawei.com>
References: <20200420123718.3384-1-yanaijie@huawei.com>
Message-Id: <20200422064128.53BBAC43637@smtp.codeaurora.org>
Date: Wed, 22 Apr 2020 06:41:28 +0000 (UTC)
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
To: Jason Yan <yanaijie@huawei.com>
Cc: srirrama@codeaurora.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, ath11k@lists.infradead.org

Jason Yan <yanaijie@huawei.com> wrote:

> The '==' expression itself is bool, no need to convert it to bool again.
> This fixes the following coccicheck warning:
> 
> drivers/net/wireless/ath/ath11k/dp_rx.c:255:46-51: WARNING: conversion
> to bool not needed here
> 
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

8af40902f839 ath11k: remove conversion to bool in ath11k_dp_rxdesc_mpdu_valid()

-- 
https://patchwork.kernel.org/patch/11498781/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
