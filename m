Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvyrd-0002Me-63
 for ath11k@lists.infradead.org; Fri, 09 Aug 2019 06:59:02 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Remove dead code while handling amsdu packets
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1564494602-5380-1-git-send-email-tamizhr@codeaurora.org>
References: <1564494602-5380-1-git-send-email-tamizhr@codeaurora.org>
Message-Id: <20190809065900.DE156602ED@smtp.codeaurora.org>
Date: Fri,  9 Aug 2019 06:59:00 +0000 (UTC)
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
To: Tamizh chelvam <tamizhr@codeaurora.org>
Cc: ath11k@lists.infradead.org

Tamizh chelvam <tamizhr@codeaurora.org> wrote:

> Remove unexecuted code while handling amsdu packets.
> The same logic is done before calling ath11k_dp_rx_msdu_coalesce
> 
> Signed-off-by: Tamizh chelvam <tamizhr@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-post-bringup branch of ath.git, thanks.

45ba2ded8b5f ath11k: Remove dead code while handling amsdu packets

-- 
https://patchwork.kernel.org/patch/11065867/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
