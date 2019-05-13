Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQCHP-0002v9-Rv
 for ath11k@lists.infradead.org; Mon, 13 May 2019 14:50:17 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix target assert when unload driver
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1557326726-29837-1-git-send-email-vnaralas@codeaurora.org>
References: <1557326726-29837-1-git-send-email-vnaralas@codeaurora.org>
Message-Id: <20190513145015.8F41560850@smtp.codeaurora.org>
Date: Mon, 13 May 2019 14:50:15 +0000 (UTC)
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

> Currently ath11k_ahb_ext_irq_disable() called before ath11k_mac_unregister
> which will disable napi before mac_unregister and still we might receive
> packets on all active devices which results reo_dest_ring full.
> 
> Fix this issue by moving ath11k_ahb_ext_irq_disable() after
> ath11k_mac_unregister().
> 
> Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>

Patch applied to ath.git, thanks.

25c08e7a8442 ath11k: fix target assert when unload driver

-- 
https://patchwork.kernel.org/patch/10935837/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
