Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOf2b-0005n6-W5
 for ath11k@lists.infradead.org; Thu, 09 May 2019 09:08:39 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix bug in QOS capability and related
 configurations in STA mode
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1557204554-6821-1-git-send-email-vthiagar@codeaurora.org>
References: <1557204554-6821-1-git-send-email-vthiagar@codeaurora.org>
Message-Id: <20190509090837.A70B0607B9@smtp.codeaurora.org>
Date: Thu,  9 May 2019 09:08:37 +0000 (UTC)
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
To: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Cc: ath11k@lists.infradead.org

Vasanthakumar Thiagarajan <vthiagar@codeaurora.org> wrote:

> set is_wme_set to true to mark the peer QOS capable for STA mode as well.
> This would also properly configure other dependant capabilities like ht and
> vht. This fixes low performance issue in STA mode.
> 
> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>

Patch applied to ath.git, thanks.

df31a71e2465 ath11k: Fix bug in QOS capability and related configurations in STA mode

-- 
https://patchwork.kernel.org/patch/10932273/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
