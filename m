Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hg2ol-0006wc-UJ
 for ath11k@lists.infradead.org; Wed, 26 Jun 2019 07:58:13 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix mutex definition without comment warning
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1561456588-9460-1-git-send-email-periyasa@codeaurora.org>
References: <1561456588-9460-1-git-send-email-periyasa@codeaurora.org>
Message-Id: <20190626075811.9D8B96038E@smtp.codeaurora.org>
Date: Wed, 26 Jun 2019 07:58:11 +0000 (UTC)
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
To: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Cc: ath11k@lists.infradead.org

Karthikeyan Periyasamy <periyasa@codeaurora.org> wrote:

> drivers/net/wireless/ath/ath11k/core.h:446: struct mutex definition without comment
> drivers/net/wireless/ath/ath11k/core.h:447: spinlock_t definition without comment
> drivers/net/wireless/ath/ath11k/core.h:478: spinlock_t definition without comment
> 
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-bringup branch of ath.git, thanks.

5896237bc839 ath11k: fix mutex definition without comment warning

-- 
https://patchwork.kernel.org/patch/11015179/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
