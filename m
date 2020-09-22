Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKcwM-0008A0-4D
 for ath11k@lists.infradead.org; Tue, 22 Sep 2020 07:42:21 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] ath11k: refactor debugfs code into debugfs.c
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1600264523-12939-1-git-send-email-kvalo@codeaurora.org>
References: <1600264523-12939-1-git-send-email-kvalo@codeaurora.org>
Message-Id: <20200922074215.2ED65C433F1@smtp.codeaurora.org>
Date: Tue, 22 Sep 2020 07:42:15 +0000 (UTC)
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

> If CONFIG_ATH11K_DEBUGFS is disabled there are warnings debug.c:
> 
> drivers/net/wireless/ath/ath11k/debug.c:36:20: warning: 'htt_bp_lmac_ring' defined but not used [-Wunused-variable]
>    36 | static const char *htt_bp_lmac_ring[HTT_SW_LMAC_RING_IDX_MAX] = {
>       |                    ^~~~~~~~~~~~~~~~
> drivers/net/wireless/ath/ath11k/debug.c:15:20: warning: 'htt_bp_umac_ring' defined but not used [-Wunused-variable]
>    15 | static const char *htt_bp_umac_ring[HTT_SW_UMAC_RING_IDX_MAX] = {
>       |                    ^~~~~~~~~~~~~~~~
> 
> Fix this by refactoring debugfs code to debugfs.c. This also reduces the number
> of ifdefs in debug.c and makes it easier to maintain the code.
> 
> No functional changes. Compile tested only.
> 
> Reported-by: YueHaibing <yuehaibing@huawei.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

4 patches applied to ath-next branch of ath.git, thanks.

da3a9d3c1576 ath11k: refactor debugfs code into debugfs.c
cb4e57db2ff0 ath11k: debugfs: use ath11k_debugfs_ prefix
56292162b9a2 ath11k: rename debug_htt_stats.[c|h] to debugfs_htt_stats.[c|h]
568f06036ee2 ath11k: debugfs: move some function declarations to correct header files

-- 
https://patchwork.kernel.org/patch/11781017/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
