Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hb18e-0003gj-GN
 for ath11k@lists.infradead.org; Wed, 12 Jun 2019 11:09:57 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Removed the redundant function call in ahb probe
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1560159269-5564-1-git-send-email-periyasa@codeaurora.org>
References: <1560159269-5564-1-git-send-email-periyasa@codeaurora.org>
Message-Id: <20190612110956.3FA3460721@smtp.codeaurora.org>
Date: Wed, 12 Jun 2019 11:09:56 +0000 (UTC)
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

> Removed dma_set_mask() call in ath11k_ahb_probe() because
> dma_set_mask_and_coherent() call will do both dma and coherent
> mask set
> 
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-bringup branch of ath.git, thanks.

430b444a45f9 ath11k: Removed the redundant function call in ahb probe

-- 
https://patchwork.kernel.org/patch/10984575/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
