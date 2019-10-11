Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iIq9F-0001wH-MK
 for ath11k@lists.infradead.org; Fri, 11 Oct 2019 08:19:43 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Add debugfs per chip
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1565336444-26904-1-git-send-email-akolli@codeaurora.org>
References: <1565336444-26904-1-git-send-email-akolli@codeaurora.org>
Message-Id: <20191011081941.64E3C60791@smtp.codeaurora.org>
Date: Fri, 11 Oct 2019 08:19:41 +0000 (UTC)
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
Cc: ath11k@lists.infradead.org

Anilkumar Kolli <akolli@codeaurora.org> wrote:

> Add debugfs per chip [soc/pci] under ath11k debugfs entry.
> 
> Example:
> $ls -l /sys/kernel/debug/ath11k/ipq8074/
> mac0/              mac2/              soc_ring_stats
> mac1/              simulate_fw_crash  soc_rx_stats
> $ls -l /sys/kernel/debug/ieee80211/phy0/
> lrwxrwxrwx    1 root     root             0 Aug  6 17:06 ath11k ->
> ../../ath11k/ipq8074/mac0
> $ ls -l /sys/kernel/debug/ieee80211/phy0/ath11k/
> dfs_block_radar_events  htt_stats               spectral_bins
> dfs_simulate_radar      htt_stats_reset         spectral_count
> ext_rx_stats            htt_stats_type          spectral_scan0
> ext_tx_stats            pktlog/                 spectral_scan_ctl
> fw_stats/               pktlog_filter
> 
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-bringup branch of ath.git, thanks.

78b6da0fb67c ath11k: Add debugfs per chip

-- 
https://patchwork.kernel.org/patch/11085571/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
