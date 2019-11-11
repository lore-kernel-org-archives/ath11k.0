Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUAHD-0008Li-Rl
 for ath11k@lists.infradead.org; Mon, 11 Nov 2019 14:02:45 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Update tx and rx chain count properly on
 drv_set_antenna
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1573202355-15351-1-git-send-email-srirrama@codeaurora.org>
References: <1573202355-15351-1-git-send-email-srirrama@codeaurora.org>
Message-Id: <20191111140243.46FC860F39@smtp.codeaurora.org>
Date: Mon, 11 Nov 2019 14:02:43 +0000 (UTC)
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

> Set the number of tx and rx chains properly on drv_set_antenna().
> This will ensure the related ht/vht/he caps are properly recalculated
> based on the tx/rx chains set.
> 
> Signed-off-by: Sriram R <srirrama@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-post-bringup branch of ath.git, thanks.

4c5edb1ad5df ath11k: Update tx and rx chain count properly on drv_set_antenna

-- 
https://patchwork.kernel.org/patch/11234303/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
