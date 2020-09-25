Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLqJg-0007zN-Pl
 for ath11k@lists.infradead.org; Fri, 25 Sep 2020 16:11:29 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix undefined reference to
 'ath11k_debugfs_htt_ext_stats_handler'
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1601024241-16594-1-git-send-email-kvalo@codeaurora.org>
References: <1601024241-16594-1-git-send-email-kvalo@codeaurora.org>
Message-Id: <20200925161027.C7305C43382@smtp.codeaurora.org>
Date: Fri, 25 Sep 2020 16:10:27 +0000 (UTC)
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> wrote:

> kbuild bot reported than link fails when CONFIG_ATH11K_DEBUGFS is disabled:
> 
> drivers/net/wireless/ath/ath11k/dp_rx.c:1662: undefined reference to `ath11k_debugfs_htt_ext_stats_handler'
> 
> This was because I had missed to move the static inline version of the function
> (which are used when CONFIG_ATH11K_DEBUGFS is disabled) to debufs_htt_stats.h.
> Also move ath11k_debugfs_htt_stats_req() at the same time. And create a stub
> also for ath11k_debugfs_htt_stats_init() for consistency, even if it's not
> needed.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 568f06036ee2 ("ath11k: debugfs: move some function declarations to correct header files")
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to wireless-drivers-next.git, thanks.

bc8befe6f950 ath11k: fix undefined reference to 'ath11k_debugfs_htt_ext_stats_handler'

-- 
https://patchwork.kernel.org/patch/11799379/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
