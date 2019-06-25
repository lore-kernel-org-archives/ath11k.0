Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfbK4-0001CJ-E3
 for ath11k@lists.infradead.org; Tue, 25 Jun 2019 02:36:41 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/5] ath11k: removed duplicated functionality
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1561396141-23382-1-git-send-email-msinada@codeaurora.org>
References: <1561396141-23382-1-git-send-email-msinada@codeaurora.org>
Message-Id: <20190625023639.B334F6085C@smtp.codeaurora.org>
Date: Tue, 25 Jun 2019 02:36:39 +0000 (UTC)
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
To: Muna Sinada <msinada@codeaurora.org>
Cc: ath11k@lists.infradead.org

Muna Sinada <msinada@codeaurora.org> wrote:

> Removed duplicated functionality in ath11k_hal_desc_reo_parse_err() and
> replaced with function call to ath11k_hal_rx_reo_entl_paddr_get().
> 
> Signed-off-by: Muna Sinada <msinada@codeaurora.org>

Does not apply and sha1 information is incorrect. Remember to use
ath11k-bringup branch as baseline AND no extra patches applied.

Applying: ath11k: removed duplicated functionality
Applying: ath11k: changed parameter from u8 * to struct sk_buff *
fatal: sha1 information is lacking or useless (drivers/net/wireless/ath/ath11k/dp_rx.c).
error: could not build fake ancestor
Patch failed at 0002 ath11k: changed parameter from u8 * to struct sk_buff *

5 patches set to Changes Requested.

11013825 [1/5] ath11k: removed duplicated functionality
11013827 [2/5] ath11k: changed parameter from u8 * to struct sk_buff *
11013829 [3/5] ath11k: comments added to explain purpose
11013831 [4/5] ath11k: added RMB to return_buffer_manager description
11013833 [5/5] ath11k: add hal dbg mask and utilized for hal stats

-- 
https://patchwork.kernel.org/patch/11013825/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
