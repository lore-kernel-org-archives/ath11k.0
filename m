Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iInBj-0008G5-7W
 for ath11k@lists.infradead.org; Fri, 11 Oct 2019 05:10:04 +0000
MIME-Version: 1.0
Date: Fri, 11 Oct 2019 10:40:01 +0530
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: Re: [PATCH] ath11k: Add debugfs per chip
In-Reply-To: <87a7a837s5.fsf@kamboji.qca.qualcomm.com>
References: <1565336444-26904-1-git-send-email-akolli@codeaurora.org>
 <87a7a837s5.fsf@kamboji.qca.qualcomm.com>
Message-ID: <5a580e62daf75a265ad327f3db927912@codeaurora.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org

On 2019-10-10 21:35, Kalle Valo wrote:
> Anilkumar Kolli <akolli@codeaurora.org> writes:
> 
>> Add debugfs per chip [soc/pci] under ath11k debugfs entry.
>> 
>> Example:
>> $ls -l /sys/kernel/debug/ath11k/ipq8074/
>> mac0/              mac2/              soc_ring_stats
>> mac1/              simulate_fw_crash  soc_rx_stats
>> $ls -l /sys/kernel/debug/ieee80211/phy0/
>> lrwxrwxrwx    1 root     root             0 Aug  6 17:06 ath11k ->
>> ../../ath11k/ipq8074/mac0
>> $ ls -l /sys/kernel/debug/ieee80211/phy0/ath11k/
>> dfs_block_radar_events  htt_stats               spectral_bins
>> dfs_simulate_radar      htt_stats_reset         spectral_count
>> ext_rx_stats            htt_stats_type          spectral_scan0
>> ext_tx_stats            pktlog/                 spectral_scan_ctl
>> fw_stats/               pktlog_filter
>> 
>> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> 
> This didn't apply but I fixed the conflicts myself. Please double 
> check:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending-ath11k&id=727f4796623292eb33ce560a3e25ba0040d17871

Thanks Kalle, This looks good.

Regards
Anil.

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
