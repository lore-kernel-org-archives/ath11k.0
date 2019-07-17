Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hnj2F-0005cI-DA
 for ath11k@lists.infradead.org; Wed, 17 Jul 2019 12:27:52 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix duplicate rx packets in co-exist monitor mode
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1563204876-10746-1-git-send-email-milehu@codeaurora.org>
References: <1563204876-10746-1-git-send-email-milehu@codeaurora.org>
Message-Id: <20190717122751.289746172D@smtp.codeaurora.org>
Date: Wed, 17 Jul 2019 12:27:51 +0000 (UTC)
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

> Add SKIP_MONITOR flag to rx data packets so mac80211 can skip them. Monitor ring already push same packets up.
> 
> Signed-off-by: Miles Hu <milehu@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-bringup branch of ath.git, thanks.

6dd081e75062 ath11k: fix duplicate rx packets in co-exist monitor mode

-- 
https://patchwork.kernel.org/patch/11044487/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
