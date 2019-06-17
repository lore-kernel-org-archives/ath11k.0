Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hctYH-0002FA-RW
 for ath11k@lists.infradead.org; Mon, 17 Jun 2019 15:28:11 +0000
MIME-Version: 1.0
Subject: Re: [PATCHv2] ath11k: cleanup in rx data path
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1560344785-8162-1-git-send-email-periyasa@codeaurora.org>
References: <1560344785-8162-1-git-send-email-periyasa@codeaurora.org>
Message-Id: <20190617152809.25A1F606FC@smtp.codeaurora.org>
Date: Mon, 17 Jun 2019 15:28:09 +0000 (UTC)
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

> Removed all unused function definition from dp_rx.
> Moved all non exposed API inside the dp_rx.
> Removed inline attribute and let the compiler handle
> the optimization.
> 
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

This had a conflict but 3-way merge fixed that automatically. Please check
anyway the patch in the pending branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending-ath11k&id=8cb26afd05e9019b2f3dbfa25c1b280cc77f05b3

-- 
https://patchwork.kernel.org/patch/10989979/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
