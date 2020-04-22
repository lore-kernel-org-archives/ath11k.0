Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jR96K-0003vo-5h
 for ath11k@lists.infradead.org; Wed, 22 Apr 2020 06:43:22 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: remove conversion to bool in
 ath11k_debug_fw_stats_process()
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200420123745.4159-1-yanaijie@huawei.com>
References: <20200420123745.4159-1-yanaijie@huawei.com>
Message-Id: <20200422064304.DF161C433CB@smtp.codeaurora.org>
Date: Wed, 22 Apr 2020 06:43:04 +0000 (UTC)
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath11k@lists.infradead.org, colin.king@canonical.com, davem@davemloft.net

Jason Yan <yanaijie@huawei.com> wrote:

> The '==' expression itself is bool, no need to convert it to bool again.
> This fixes the following coccicheck warning:
> 
> drivers/net/wireless/ath/ath11k/debug.c:198:57-62: WARNING: conversion
> to bool not needed here
> drivers/net/wireless/ath/ath11k/debug.c:218:58-63: WARNING: conversion
> to bool not needed here
> 
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

d81709346cea ath11k: remove conversion to bool in ath11k_debug_fw_stats_process()

-- 
https://patchwork.kernel.org/patch/11498785/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
