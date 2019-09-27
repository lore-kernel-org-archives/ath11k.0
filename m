Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDrpm-0004Mk-EA
 for ath11k@lists.infradead.org; Fri, 27 Sep 2019 15:07:03 +0000
MIME-Version: 1.0
Subject: Re: [PATCH bringup 1/3] ath11k: Clean ups in
 ath11k_ce_rx_buf_enqueue_pipe() error path
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1569386658-1325-1-git-send-email-vthiagar@codeaurora.org>
References: <1569386658-1325-1-git-send-email-vthiagar@codeaurora.org>
Message-Id: <20190927150702.1C64F611FD@smtp.codeaurora.org>
Date: Fri, 27 Sep 2019 15:07:02 +0000 (UTC)
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

> Unify the unlock/ring_access_end calls with error path in
> ath11k_ce_rx_buf_enqueue_pipe(). Update to ce_pipe->rx_buf_needed
> is done inside srng->lock before ath11k_hal_srng_access_end().
> Also rename the goto label from err to exit.
> 
> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

3 patches applied to ath11k-bringup branch of ath.git, thanks.

8cc72b480777 ath11k: Clean ups in ath11k_ce_rx_buf_enqueue_pipe() error path
9f55e5658237 ath11k: Clean up parameter list in ath11k_ce_completed_send_next()
3dcb3e76a260 ath11k: Use struct_size() to get the structure size with trailing array

-- 
https://patchwork.kernel.org/patch/11160007/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
