Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfMey-0001lm-Fr
 for ath11k@lists.infradead.org; Mon, 24 Jun 2019 10:57:17 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k/dp: Cleanup type casting in WBM link descriptor
 setup
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1561089055-7355-1-git-send-email-vthiagar@codeaurora.org>
References: <1561089055-7355-1-git-send-email-vthiagar@codeaurora.org>
Message-Id: <20190624105716.38DFF606DC@smtp.codeaurora.org>
Date: Mon, 24 Jun 2019 10:57:16 +0000 (UTC)
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

> Change the type of virtual address of struct hal_wbm_idle_scatter_list
> from u32 * to struct hal_wbm_link_desc *. This also makes the pointer
> arithmetic simpler. This also fixes a bug in pointer arithmetic
> on scatter buffer address. Scatter buffer address was incremented
> by HAL_LINK_DESC_SIZE instead of sizeof(hal_wbm_link_desc).
> 
> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-bringup branch of ath.git, thanks.

ec3e7d5d47a5 ath11k/dp: Cleanup type casting in WBM link descriptor setup

-- 
https://patchwork.kernel.org/patch/11008423/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
