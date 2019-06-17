Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hctbO-0004K4-EM
 for ath11k@lists.infradead.org; Mon, 17 Jun 2019 15:31:25 +0000
MIME-Version: 1.0
Subject: Re: [PATCH V2] ath11k: Fix Rx signal strength reporting
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1560399999-14062-1-git-send-email-vthiagar@codeaurora.org>
References: <1560399999-14062-1-git-send-email-vthiagar@codeaurora.org>
Message-Id: <20190617153121.973E560F3D@smtp.codeaurora.org>
Date: Mon, 17 Jun 2019 15:31:21 +0000 (UTC)
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

> Since rssi in not reported in MSDU_START tlv, current signal strength
> reporting is always wrong. Correct rssi is reported in PPDU_END tlv.
> Enable PPDU_END, PPDU_END_STATUS_DONE and MPDU_START tlv reporting in
> monitor status by default. Pass the sta's Rx signal strength to mac80211
> in sta_statistics() ops. This patch also makes sure the default rx filter
> is always enabled whenever there is a call to reset the filter (from
> extd_rx_stats debugfs and config_filter path). Since some of the rx_stats
> are enabled by default, make memory allocation of arsta->rx_stats unconditional.
> 
> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

This had a conflict and 3-way merge didn't work as the SHA ids were not valid.
Please always try to use ath11k-bringup branch as the baseline (and no extra
patches), that helps my conflict resolution a lot.

Applied patch drivers/net/wireless/ath/ath11k/core.h cleanly.
Applied patch drivers/net/wireless/ath/ath11k/debug.c cleanly.
Applied patch drivers/net/wireless/ath/ath11k/dp_rx.c cleanly.
Applying patch drivers/net/wireless/ath/ath11k/dp_tx.c with 1 reject...
Rejected hunk #1.
Applied patch drivers/net/wireless/ath/ath11k/hal_rx.c cleanly.
Applied patch drivers/net/wireless/ath/ath11k/mac.c cleanly.
Applied patch drivers/net/wireless/ath/ath11k/mac.h cleanly.
Patch failed at 0001 ath11k: Fix Rx signal strength reporting

I fixed the conflict in dp_tx.c, that was pretty easy. Also I fixed one
compilation error due to dp function renames. Also I removed
ath11k_dp_rx_h_msdu_start_rssi() as GCC warned that it's unused.

-- 
https://patchwork.kernel.org/patch/10991095/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
