Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdy8Q-0006tp-Tw
 for ath11k@lists.infradead.org; Thu, 20 Jun 2019 14:33:56 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Disable peer fixed before setting ht-mcs or
 vht-mcs
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1560927014-17823-1-git-send-email-mkenna@codeaurora.org>
References: <1560927014-17823-1-git-send-email-mkenna@codeaurora.org>
Message-Id: <20190620143354.9151E60A24@smtp.codeaurora.org>
Date: Thu, 20 Jun 2019 14:33:53 +0000 (UTC)
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
To: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Cc: ath11k@lists.infradead.org

Maharaja Kennadyrajan <mkenna@codeaurora.org> wrote:

> Peer fixed rate should be disabled before setting the ht-mcs
> or vht-mcs as peer fixed rate has higher priority in the rate
> setting.
> 
> Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-bringup branch of ath.git, thanks.

a9e6c87cff1e ath11k: Disable peer fixed before setting ht-mcs or vht-mcs

-- 
https://patchwork.kernel.org/patch/11003535/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
