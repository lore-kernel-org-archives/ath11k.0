Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihXsr-0003dq-JE
 for ath11k@lists.infradead.org; Wed, 18 Dec 2019 11:52:56 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v3] ath11k: Add missing pdev rx rate stats
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <0101016ed1b43bf2-1e21d5b3-b396-446f-9f19-c7de3df29a61-000000@us-west-2.amazonses.com>
References: <0101016ed1b43bf2-1e21d5b3-b396-446f-9f19-c7de3df29a61-000000@us-west-2.amazonses.com>
Message-Id: <20191218115248.D24D5C433A2@smtp.codeaurora.org>
Date: Wed, 18 Dec 2019 11:52:48 +0000 (UTC)
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
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Bhagavathi Perumal S <bperumal@codeaurora.org> wrote:

> This adds missing rx rate info stats like pilot evm,
> per chain rssi, per user ul ppdu and mpdu counts and
> ul ofdma rate info etc.
> 
> And add null checks for memory alloc failures.
> 
> Signed-off-by: Bhagavathi Perumal S <bperumal@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

This one has warnings, please fix and resend:

drivers/net/wireless/ath/ath11k/debug_htt_stats.c:2846:59: warning: Using plain integer as NULL pointer
drivers/net/wireless/ath/ath11k/debug_htt_stats.c:3025:68: warning: Using plain integer as NULL pointer
drivers/net/wireless/ath/ath11k/debug_htt_stats.c:3026:59: warning: Using plain integer as NULL pointer
drivers/net/wireless/ath/ath11k/debug_htt_stats.c:3028:73: warning: Using plain integer as NULL pointer
drivers/net/wireless/ath/ath11k/debug_htt_stats.c:779:59: warning: Using plain integer as NULL pointer
drivers/net/wireless/ath/ath11k/debug_htt_stats.c:867:68: warning: Using plain integer as NULL pointer
drivers/net/wireless/ath/ath11k/debug_htt_stats.c:868:59: warning: Using plain integer as NULL pointer
drivers/net/wireless/ath/ath11k/debug_htt_stats.h:1294: Avoid CamelCase: <rx_pilot_evm_dB>
drivers/net/wireless/ath/ath11k/debug_htt_stats.h:1300: Avoid CamelCase: <rx_pilot_evm_dB_mean>
drivers/net/wireless/ath/ath11k/debug_htt_stats.c:3028: Avoid CamelCase: <rx_pilot_evm_dB>
drivers/net/wireless/ath/ath11k/debug_htt_stats.c:3114: Avoid CamelCase: <rx_pilot_evm_dB_mean>

-- 
https://patchwork.kernel.org/patch/11273269/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
