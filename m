Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hcnL0-000438-Ra
 for ath11k@lists.infradead.org; Mon, 17 Jun 2019 08:50:04 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Avoid unnecessary WARN_ON() in
 ath11k_dp_tx_complete_msdu()
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1560336554-14420-6-git-send-email-mkenna@codeaurora.org>
References: <1560336554-14420-6-git-send-email-mkenna@codeaurora.org>
Message-Id: <20190617085002.86C236083E@smtp.codeaurora.org>
Date: Mon, 17 Jun 2019 08:50:02 +0000 (UTC)
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

> In order to avoid unnecessary WARN_ON in the function
> ath11k_dp_tx_complete_msdu, changed that WARN_ON to WARN_ON_ONCE.
> 
> Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-bringup branch of ath.git, thanks.

f6598b82d86a ath11k: Avoid unnecessary WARN_ON() in ath11k_dp_tx_complete_msdu()

-- 
https://patchwork.kernel.org/patch/10989379/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
