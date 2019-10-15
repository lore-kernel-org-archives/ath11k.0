Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKML3-00046v-D1
 for ath11k@lists.infradead.org; Tue, 15 Oct 2019 12:54:12 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath11k: Fix skb_panic observed during msdu coalescing
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1565771502-6999-1-git-send-email-srirrama@codeaurora.org>
References: <1565771502-6999-1-git-send-email-srirrama@codeaurora.org>
Message-Id: <20191015125409.1D43F60588@smtp.codeaurora.org>
Date: Tue, 15 Oct 2019 12:54:09 +0000 (UTC)
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
Cc: ath11k@lists.infradead.org

Sriram R <srirrama@codeaurora.org> wrote:

> skb_panic is hit during msdu coalescing whenever
> enough tailroom is not allocated based on the remaining
> msdu length which is spread across in different rx buffers.
> 
> Compute the extra length for resizing the skb based on
> the total msdu length and the msdu length of the first buffer.
> 
> Signed-off-by: Sriram R <srirrama@codeaurora.org>

Does not apply to ath11k-post-bringup, please rebase.

error: patch failed: drivers/net/wireless/ath/ath11k/dp_rx.c:1366
error: drivers/net/wireless/ath/ath11k/dp_rx.c: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/patch/11093499/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
