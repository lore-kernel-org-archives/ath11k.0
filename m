Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYvdO-0003kU-A9
 for ath11k@lists.infradead.org; Thu, 06 Jun 2019 16:53:03 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix nss value to get proper rate_code for peer
 fixed rate
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1559648213-16186-1-git-send-email-mkenna@codeaurora.org>
References: <1559648213-16186-1-git-send-email-mkenna@codeaurora.org>
Message-Id: <20190606165302.0F18D60255@smtp.codeaurora.org>
Date: Thu,  6 Jun 2019 16:53:01 +0000 (UTC)
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
To: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Cc: ath11k@lists.infradead.org

Maharaja Kennadyrajan <mkenna@codeaurora.org> wrote:

> The rate_code is not proper when the peer fixed rate is
> set by the user via the set bitrate command.
> The rate_code needs the nss values as {0, 1, 2, 3}.
> Hence fixing the nss value in this patch.
> 
> Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>

Patch applied to ath.git, thanks.

703350682ff7 ath11k: Fix nss value to get proper rate_code for peer fixed rate

-- 
https://patchwork.kernel.org/patch/10974781/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
