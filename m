Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYveR-00047I-Nr
 for ath11k@lists.infradead.org; Thu, 06 Jun 2019 16:54:09 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix the rate mask value for legacy and peer fixed
 rate
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1559648239-16220-1-git-send-email-mkenna@codeaurora.org>
References: <1559648239-16220-1-git-send-email-mkenna@codeaurora.org>
Message-Id: <20190606165407.78B1460E41@smtp.codeaurora.org>
Date: Thu,  6 Jun 2019 16:54:07 +0000 (UTC)
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

> The rate mask value is changed from 0xff to oxffff (u8 to u32)
> in the firmware for the legacy fixed rate and peer fixed rate
> setting in the set bitrate command.
> Hence this patch is fixing the same in the driver.
> 
> Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>

Is this backwards compatible change? I'm not convinced about that.

-- 
https://patchwork.kernel.org/patch/10974783/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
