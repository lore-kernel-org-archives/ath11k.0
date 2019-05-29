Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hW0Fs-0002xl-B9
 for ath11k@lists.infradead.org; Wed, 29 May 2019 15:12:41 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix error received while aborting hw scan
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1558962958-13090-1-git-send-email-srirrama@codeaurora.org>
References: <1558962958-13090-1-git-send-email-srirrama@codeaurora.org>
Message-Id: <20190529151240.0055F6029B@smtp.codeaurora.org>
Date: Wed, 29 May 2019 15:12:39 +0000 (UTC)
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

> Set the appropriate scan cancel request param while stopping
> the hw scan. Also, when a interface is stopped, the SDATA_STATE_RUNNING
> flag will be cleared before cancelling the scan, hence
> the interface can't be found in active interfaces in corresponding
> scan cancellation event. Hence search the corresponding 'ar'
> by iterating through the active pdev's if the scan state is aborting.
> 
> This will avoid 'failed to stop wmi scan' error received
> while aborting the scan.
> 
> Signed-off-by: Sriram R <srirrama@codeaurora.org>

Failed to apply, please rebase.

fatal: sha1 information is lacking or useless (drivers/net/wireless/ath/ath11k/wmi.c).
error: could not build fake ancestor
Applying: ath11k: Fix error received while aborting hw scan
Patch failed at 0001 ath11k: Fix error received while aborting hw scan
The copy of the patch that failed is found in: .git/rebase-apply/patch

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/patch/10963039/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
