Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNuqK-0003fT-4r
 for ath11k@lists.infradead.org; Fri, 25 Oct 2019 08:21:10 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v3] ath11k: Fix skb_panic observed during msdu coalescing
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1571896991-19713-1-git-send-email-srirrama@codeaurora.org>
References: <1571896991-19713-1-git-send-email-srirrama@codeaurora.org>
Message-Id: <20191025082107.C91BC60D95@smtp.codeaurora.org>
Date: Fri, 25 Oct 2019 08:21:06 +0000 (UTC)
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
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-post-bringup branch of ath.git, thanks.

1f59a8d204e9 ath11k: Fix skb_panic observed during msdu coalescing

-- 
https://patchwork.kernel.org/patch/11208333/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
