Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKMKD-00043L-6G
 for ath11k@lists.infradead.org; Tue, 15 Oct 2019 12:53:18 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Add missing pdev rx rate stats
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1564672545-27675-1-git-send-email-bperumal@codeaurora.org>
References: <1564672545-27675-1-git-send-email-bperumal@codeaurora.org>
Message-Id: <20191015125316.D640860112@smtp.codeaurora.org>
Date: Tue, 15 Oct 2019 12:53:16 +0000 (UTC)
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
To: Bhagavathi Perumal S <bperumal@codeaurora.org>
Cc: ath11k@lists.infradead.org

Bhagavathi Perumal S <bperumal@codeaurora.org> wrote:

> This adds missing rx rate info stats like pilot evm,
> per chain rssi, per user ul ppdu and mpdu counts and
> ul ofdma rate info etc.
> 
> And add null checks for memory alloc failures.
> 
> Signed-off-by: Bhagavathi Perumal S <bperumal@codeaurora.org>

Does not apply to ath11k-post-bringup, please rebase.

error: patch failed: drivers/net/wireless/ath/ath11k/debug_htt_stats.c:882
error: drivers/net/wireless/ath/ath11k/debug_htt_stats.c: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/patch/11070887/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
