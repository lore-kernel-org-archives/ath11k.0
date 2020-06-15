Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkqBN-0001h5-Qt
 for ath11k@lists.infradead.org; Mon, 15 Jun 2020 14:33:59 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath11k: Add dp tx err stats
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1591768308-32005-2-git-send-email-srirrama@codeaurora.org>
References: <1591768308-32005-2-git-send-email-srirrama@codeaurora.org>
Message-Id: <20200615143342.EB926C4339C@smtp.codeaurora.org>
Date: Mon, 15 Jun 2020 14:33:42 +0000 (UTC)
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
To: Sriram R <srirrama@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Sriram R <srirrama@codeaurora.org> wrote:

> Add support for dp tx error stats which logs tx failure reasons due
> to ring full condition, etc. This stats is added in soc_dp_stats
> which was earlier used as soc_rx_stats so that all dp related info
> are logged in same file.
> 
> Below is an example usage,
> 
> root@OpenWrt:/# cat /sys/kernel/debug/ath11k/ipq8074/soc_dp_stats
> SOC RX STATS:
> 
> err ring pkts: 0
> Invalid RBM: 0
> <snip>
> 
> SOC TX STATS:
> 
> Ring Full Failures:
> ring0: 4
> ring1: 3
> ring2: 5
> 
> Misc Transmit Failures: 2
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01213-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Sriram R <srirrama@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath-next branch of ath.git, thanks.

0dd6392ac2c0 ath11k: Add dp tx err stats
71fbc847978f ath11k: Add support for ring backpressure stats

-- 
https://patchwork.kernel.org/patch/11597089/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
