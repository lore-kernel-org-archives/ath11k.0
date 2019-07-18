Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ho4Ta-0000Ms-CR
 for ath11k@lists.infradead.org; Thu, 18 Jul 2019 11:21:31 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k/dp: Fix possible invalid skb memory access
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1563336807-23646-1-git-send-email-vthiagar@codeaurora.org>
References: <1563336807-23646-1-git-send-email-vthiagar@codeaurora.org>
Message-Id: <20190718112130.210E060F3E@smtp.codeaurora.org>
Date: Thu, 18 Jul 2019 11:21:30 +0000 (UTC)
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
To: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Cc: ath11k@lists.infradead.org

Vasanthakumar Thiagarajan <vthiagar@codeaurora.org> wrote:

> In ath11k_dp_rx_null_q_desc_sg_drop(), Use skb_queue_walk_safe()
> instead of skb_queue_walk() while processing skb from the queue
> since this involves removing skb from the list. Using just
> skb_queue_walk() could result in using invalid (or already freed)
> skb memory.
> 
> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-bringup branch of ath.git, thanks.

de542ad2ea10 ath11k/dp: Fix possible invalid skb memory access

-- 
https://patchwork.kernel.org/patch/11047147/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
