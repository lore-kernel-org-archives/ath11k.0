Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdDaV-0001Hm-0l
 for ath11k@lists.infradead.org; Tue, 18 Jun 2019 12:51:48 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath11k: add wrapper function to ath11k_dbg
References: <1560855152-2609-1-git-send-email-vnaralas@codeaurora.org>
Date: Tue, 18 Jun 2019 15:51:43 +0300
In-Reply-To: <1560855152-2609-1-git-send-email-vnaralas@codeaurora.org>
 (Venkateswara Naralasetty's message of "Tue, 18 Jun 2019 16:22:32
 +0530")
Message-ID: <87sgs783a8.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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

Venkateswara Naralasetty <vnaralas@codeaurora.org> writes:

> This patch define a macro for ath11k_dbg() which improves
> the Rx performance by avoid calling ath11k_dbg() from
> ath11k_dp_rx_deliver_msdu() when no dbg_mask set.
>
> Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>
> ---
> v2:
>  * corrected one style issue

When you submit v2 please remember to mark it as "[PATCH v2]" in the
Subject as well. But no need to resend because of this.

-- 
Kalle Valo

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
