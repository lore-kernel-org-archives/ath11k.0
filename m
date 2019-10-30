Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPpLG-0005WH-8D
 for ath11k@lists.infradead.org; Wed, 30 Oct 2019 14:52:59 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: mac: Remove WAR on max a-mpdu len in vht
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1572332456-5419-1-git-send-email-akolli@codeaurora.org>
References: <1572332456-5419-1-git-send-email-akolli@codeaurora.org>
Message-Id: <20191030145257.E492B60E07@smtp.codeaurora.org>
Date: Wed, 30 Oct 2019 14:52:57 +0000 (UTC)
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

> Revert commit a24b88b56074424a413a ("ath10k: Fix bug in max.
> VHT A-MPDU size"), Moving this logic to mac80211.
> 
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>

The mac80211 patch is not yet in my tree so I'll put this patch into my
wait queue.

Patch set to Awaiting Upstream.

-- 
https://patchwork.kernel.org/patch/11217307/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
