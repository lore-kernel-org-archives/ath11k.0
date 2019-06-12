Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hb17L-0003HK-PJ
 for ath11k@lists.infradead.org; Wed, 12 Jun 2019 11:08:37 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: add locking on ppdu_stats_info list access
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1559797899-16925-1-git-send-email-akolli@codeaurora.org>
References: <1559797899-16925-1-git-send-email-akolli@codeaurora.org>
Message-Id: <20190612110835.66ED960312@smtp.codeaurora.org>
Date: Wed, 12 Jun 2019 11:08:35 +0000 (UTC)
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
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>, ath11k@lists.infradead.org

Anilkumar Kolli <akolli@codeaurora.org> wrote:

> This patch fixes below issue on wifi interface with ping traffic
> Unable to handle kernel paging request at virtual address fffffd78
> PC is at ath11k_dp_htt_htc_t2h_msg_handler+0x19c/0x728
> LR is at ath11k_dp_htt_htc_t2h_msg_handler+0x28/0x728
> 
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-bringup branch of ath.git, thanks.

3590f28b4aac ath11k: add locking on ppdu_stats_info list access

-- 
https://patchwork.kernel.org/patch/10978429/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
