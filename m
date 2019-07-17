Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hniwW-000761-8o
 for ath11k@lists.infradead.org; Wed, 17 Jul 2019 12:21:57 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Add probe response throttling logic
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1561595753-11351-1-git-send-email-srirrama@codeaurora.org>
References: <1561595753-11351-1-git-send-email-srirrama@codeaurora.org>
Message-Id: <20190717122154.8107F611CF@smtp.codeaurora.org>
Date: Wed, 17 Jul 2019 12:21:54 +0000 (UTC)
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

> Drop probe response packets when the pending management tx
> count has reached a certain threshold, so as to prioritize
> other mgmt packets like auth and assoc to be sent on time
> for establishing successful connections.
> This might be required in dense networks, multi-vap scenarios
> or due to emulated probe requests (DoS attack),
> which could lead to association failures due to failure to
> send auth/assoc packets as high probe response traffic occupies the
> limited target mgmt transmit queue.
> Currently the threshold is set to 3/4th of the target management
> tx queue.
> 
> Signed-off-by: Sriram R <srirrama@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-bringup branch of ath.git, thanks.

1a50014ff2d3 ath11k: Add probe response throttling logic

-- 
https://patchwork.kernel.org/patch/11018825/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
