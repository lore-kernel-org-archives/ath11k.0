Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdxRv-0003gr-Oh
 for ath11k@lists.infradead.org; Thu, 20 Jun 2019 13:50:01 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix extended stats update issue
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1560832537-22777-1-git-send-email-periyasa@codeaurora.org>
References: <1560832537-22777-1-git-send-email-periyasa@codeaurora.org>
Message-Id: <20190620134958.B189560C60@smtp.codeaurora.org>
Date: Thu, 20 Jun 2019 13:49:54 +0000 (UTC)
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
To: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Cc: ath11k@lists.infradead.org

Karthikeyan Periyasamy <periyasa@codeaurora.org> wrote:

> user not able to see the valid tx stats. htt stats update
> process get failed due to the wrong argument pass to
> ath11k_get_ar_by_pdev_id API. Expected argument is pdev_id not
> the pdev index. so avoid the conversion logic of pdev id to pdev
> index in htt stats update process.
> 
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>

This was already applied, right?

error: patch failed: drivers/net/wireless/ath/ath11k/dp_rx.c:1294
error: drivers/net/wireless/ath/ath11k/dp_rx.c: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Rejected.

-- 
https://patchwork.kernel.org/patch/11000877/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
