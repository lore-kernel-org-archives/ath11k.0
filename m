Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLTvY-0003XB-SW
 for ath11k@lists.infradead.org; Thu, 24 Sep 2020 16:17:03 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: removing the ath11k debugfs dir properly
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1600885519-29535-1-git-send-email-kathirve@codeaurora.org>
References: <1600885519-29535-1-git-send-email-kathirve@codeaurora.org>
Message-Id: <20200924161623.A0009C433CA@smtp.codeaurora.org>
Date: Thu, 24 Sep 2020 16:16:23 +0000 (UTC)
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
To: Karthikeyan Kathirvel <kathirve@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Karthikeyan Kathirvel <kathirve@codeaurora.org> wrote:

> ath11k_debug_pdev_destroy was not called for proper cleaning of debug
> files when destroying the pdev, this results in not removing the ath11k
> directory in debugfs folder even after rmmod of ath11k. So when next
> time doing insmod of ath11k prevents creating another ath11k directory,
> hence causing ipq8074_2 to get created in parent dir of debugfs.
> 
> Signed-off-by: Karthikeyan Kathirvel <kathirve@codeaurora.org>

Fails to apply, please rebase. Also Tested-on missing.

error: patch failed: drivers/net/wireless/ath/ath11k/debug.c:973
error: drivers/net/wireless/ath/ath11k/debug.c: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/patch/11795461/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
