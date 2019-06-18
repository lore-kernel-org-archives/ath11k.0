Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdD2W-00035l-Rt
 for ath11k@lists.infradead.org; Tue, 18 Jun 2019 12:16:42 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: cleanup warnings due to conflicting enum types
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1560385861-18893-1-git-send-email-srirrama@codeaurora.org>
References: <1560385861-18893-1-git-send-email-srirrama@codeaurora.org>
Message-Id: <20190618121640.66F3660867@smtp.codeaurora.org>
Date: Tue, 18 Jun 2019 12:16:40 +0000 (UTC)
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

> Cleanup warnings due to conflicting enum types
> dfs_reg and ath11k_dfs_region
> 
> This will resolve the below warning.
> 
> "drivers/net/wireless/ath/ath11k/wmi.c:4597:34:
>  warning: mixing different enum types"
> 
> Signed-off-by: Sriram R <srirrama@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-bringup branch of ath.git, thanks.

1bf43cd058ec ath11k: cleanup warnings due to conflicting enum types

-- 
https://patchwork.kernel.org/patch/10991021/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
