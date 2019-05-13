Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQCDT-0001Ai-Pb
 for ath11k@lists.infradead.org; Mon, 13 May 2019 14:46:14 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix compile warning in dp_tx.c
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1557421369-6676-1-git-send-email-milehu@codeaurora.org>
References: <1557421369-6676-1-git-send-email-milehu@codeaurora.org>
Message-Id: <20190513144611.03A0160CF1@smtp.codeaurora.org>
Date: Mon, 13 May 2019 14:46:10 +0000 (UTC)
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
To: Miles Hu <milehu@codeaurora.org>
Cc: ath11k@lists.infradead.org

Miles Hu <milehu@codeaurora.org> wrote:

> Remove lmac_ring_id_offset variable declaration to eliminate warning
> below:
> 
> drivers/net/wireless/ath/ath11k/dp_tx.c: In function
> 'ath11k_dp_htt_srng_setup':
> drivers/net/wireless/ath/ath11k/dp_tx.c:615:6: warning: unused variable
> 'lmac_ring_id_offset' [-Wunused-variable]
> 
> Signed-off-by: Miles Hu <milehu@codeaurora.org>

Patch applied to ath.git, thanks.

1de770f77e27 ath11k: fix compile warning in dp_tx.c

-- 
https://patchwork.kernel.org/patch/10937355/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
