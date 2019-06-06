Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYvfU-0005uV-Tp
 for ath11k@lists.infradead.org; Thu, 06 Jun 2019 16:55:15 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Disable peer fixed rate before setting the vdev
 fixed rate
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1559648280-16284-1-git-send-email-mkenna@codeaurora.org>
References: <1559648280-16284-1-git-send-email-mkenna@codeaurora.org>
Message-Id: <20190606165512.3FD0461157@smtp.codeaurora.org>
Date: Thu,  6 Jun 2019 16:55:11 +0000 (UTC)
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

> As per the firmware design, peer fixed rate should be disabled before
> setting the VDEV fixed rate again.
> When it is not disabled, then the user can't set the legacy rate(VDEV
> fixed rate) after setting peer fixed rate(as peer fixed rate has higher
> priority in the rate setting).
> 
> Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>

Patch applied to ath.git, thanks.

3676c26226da ath11k: Disable peer fixed rate before setting the vdev fixed rate

-- 
https://patchwork.kernel.org/patch/10974785/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
