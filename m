Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iEadU-0006r8-FJ
 for ath11k@lists.infradead.org; Sun, 29 Sep 2019 14:57:22 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix multicast rate parameter size
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20190812091304.27184-1-sven@narfation.org>
References: <20190812091304.27184-1-sven@narfation.org>
Message-Id: <20190929145716.858CF608CC@smtp.codeaurora.org>
Date: Sun, 29 Sep 2019 14:57:16 +0000 (UTC)
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
To: Sven Eckelmann <sven@narfation.org>
Cc: ath11k@lists.infradead.org, Sven Eckelmann <seckelmann@datto.com>

Sven Eckelmann <sven@narfation.org> wrote:

> The ATH11K_HW_RATE_CODE() macro uses at least 28 bit to encode the
> parameters. An u8 cannot store all these bits.
> 
> Fixes: c885aaf227ec ("ath11k: support for multicast rate control")
> Signed-off-by: Sven Eckelmann <seckelmann@datto.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-bringup branch of ath.git, thanks.

bcd3f5043856 ath11k: fix multicast rate parameter size

-- 
https://patchwork.kernel.org/patch/11089507/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
