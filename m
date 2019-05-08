Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOJ8m-0007SZ-Db
 for ath11k@lists.infradead.org; Wed, 08 May 2019 09:45:33 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: update dfs cac timeout for weather radar band
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1557150871-1070-1-git-send-email-srirrama@codeaurora.org>
References: <1557150871-1070-1-git-send-email-srirrama@codeaurora.org>
Message-Id: <20190508094530.31B18609EF@smtp.codeaurora.org>
Date: Wed,  8 May 2019 09:45:30 +0000 (UTC)
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

> DFS CAC Timeout needs to be updated to 600s for channels
> in weather radar band. Split the reg rule if the rule has
> weather radar band between start and end freq and update
> the cac timeout.
> 
> Signed-off-by: Sriram R <srirrama@codeaurora.org>

Patch applied to ath.git, thanks.

c6854eccae90 ath11k: update dfs cac timeout for weather radar band

-- 
https://patchwork.kernel.org/patch/10931103/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
