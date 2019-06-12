Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hb1CM-0005un-59
 for ath11k@lists.infradead.org; Wed, 12 Jun 2019 11:13:47 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix Rx signal strength reporting
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1560328622-9240-1-git-send-email-vthiagar@codeaurora.org>
References: <1560328622-9240-1-git-send-email-vthiagar@codeaurora.org>
Message-Id: <20190612111345.93CC860ACA@smtp.codeaurora.org>
Date: Wed, 12 Jun 2019 11:13:32 +0000 (UTC)
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

Failed to apply:

error: patch failed: drivers/net/wireless/ath/ath11k/mac.c:3679
error: drivers/net/wireless/ath/ath11k/mac.c: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/patch/10988967/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
