Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOH0g-00020c-Vu
 for ath11k@lists.infradead.org; Tue, 14 Apr 2020 08:33:36 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: set IRQ_DISABLE_UNLAZY flag for DP interrupts
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1586421013-23025-1-git-send-email-mpubbise@codeaurora.org>
References: <1586421013-23025-1-git-send-email-mpubbise@codeaurora.org>
Message-Id: <20200414083333.0B007C433F2@smtp.codeaurora.org>
Date: Tue, 14 Apr 2020 08:33:33 +0000 (UTC)
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
To: Manikanta Pubbisetty <mpubbise@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Manikanta Pubbisetty <mpubbise@codeaurora.org> wrote:

> Unlike CE interrupts, DP interrupts are not enabled/disabled at
> source; they are enabled/disabled only at GIC level, therefore
> it is required to set IRQ_DISABLE_UNLAZY flag to avoid spurious
> interrupts.
> 
> Signed-off-by: Manikanta Pubbisetty <mpubbise@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

05090864fc7e ath11k: set IRQ_DISABLE_UNLAZY flag for DP interrupts

-- 
https://patchwork.kernel.org/patch/11481417/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
