Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hcnKM-0003uw-TJ
 for ath11k@lists.infradead.org; Mon, 17 Jun 2019 08:49:24 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath11k: Added 'ath11k' as prefix to the struct
 dp_htt_wbm_tx_status
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1560336554-14420-4-git-send-email-mkenna@codeaurora.org>
References: <1560336554-14420-4-git-send-email-mkenna@codeaurora.org>
Message-Id: <20190617084922.9C38B6083E@smtp.codeaurora.org>
Date: Mon, 17 Jun 2019 08:49:22 +0000 (UTC)
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

> Renamed the struct dp_htt_wbm_tx_status by adding a prefix
> 'ath11k'.
> 
> Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath11k-bringup branch of ath.git, thanks.

78603c9f2986 ath11k: Added 'ath11k' as prefix to the struct dp_htt_wbm_tx_status
31f688e6d07a ath11k: Added prefix to all the functions in dp_tx.c file

-- 
https://patchwork.kernel.org/patch/10989375/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
