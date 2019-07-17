Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hnizO-0000ls-QZ
 for ath11k@lists.infradead.org; Wed, 17 Jul 2019 12:24:56 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix no traffic problem in co-exist monitor mode
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1563204839-10683-1-git-send-email-milehu@codeaurora.org>
References: <1563204839-10683-1-git-send-email-milehu@codeaurora.org>
Message-Id: <20190717122454.831A4616DA@smtp.codeaurora.org>
Date: Wed, 17 Jul 2019 12:24:54 +0000 (UTC)
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
To: Miles Hu <milehu@codeaurora.org>
Cc: ath11k@lists.infradead.org

Miles Hu <milehu@codeaurora.org> wrote:

> Clear monitor flag in CB for regular data packet to avoid drop in mac80211.
> 
> Signed-off-by: Miles Hu <milehu@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-bringup branch of ath.git, thanks.

fe59026f2695 ath11k: fix no traffic problem in co-exist monitor mode

-- 
https://patchwork.kernel.org/patch/11044483/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
