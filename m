Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdxIk-0005bZ-5e
 for ath11k@lists.infradead.org; Thu, 20 Jun 2019 13:40:31 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: add wrapper function to ath11k_dbg
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1560855152-2609-1-git-send-email-vnaralas@codeaurora.org>
References: <1560855152-2609-1-git-send-email-vnaralas@codeaurora.org>
Message-Id: <20190620134029.DAB266090E@smtp.codeaurora.org>
Date: Thu, 20 Jun 2019 13:40:29 +0000 (UTC)
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
To: Venkateswara Naralasetty <vnaralas@codeaurora.org>
Cc: ath11k@lists.infradead.org

Venkateswara Naralasetty <vnaralas@codeaurora.org> wrote:

> This patch define a macro for ath11k_dbg() which improves
> the Rx performance by avoid calling ath11k_dbg() from
> ath11k_dp_rx_deliver_msdu() when no dbg_mask set.
> 
> Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-bringup branch of ath.git, thanks.

6b4ad0ceb075 ath11k: add wrapper function to ath11k_dbg

-- 
https://patchwork.kernel.org/patch/11001381/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
