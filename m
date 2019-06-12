Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hayNY-0005OJ-3V
 for ath11k@lists.infradead.org; Wed, 12 Jun 2019 08:13:09 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix the rate mask value for legacy and peer fixed
 rate
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1559648239-16220-1-git-send-email-mkenna@codeaurora.org>
References: <1559648239-16220-1-git-send-email-mkenna@codeaurora.org>
Message-Id: <20190612081307.9B72860769@smtp.codeaurora.org>
Date: Wed, 12 Jun 2019 08:13:07 +0000 (UTC)
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
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-bringup branch of ath.git, thanks.

b23bdcc21752 ath11k: Fix the rate mask value for legacy and peer fixed rate

-- 
https://patchwork.kernel.org/patch/10974783/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
