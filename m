Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hb181-0003c9-Hp
 for ath11k@lists.infradead.org; Wed, 12 Jun 2019 11:09:18 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix PMF config during peer assoc
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1559901181-8292-1-git-send-email-mpubbise@codeaurora.org>
References: <1559901181-8292-1-git-send-email-mpubbise@codeaurora.org>
Message-Id: <20190612110917.0987B60DA8@smtp.codeaurora.org>
Date: Wed, 12 Jun 2019 11:09:17 +0000 (UTC)
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
To: Manikanta Pubbisetty <mpubbise@codeaurora.org>
Cc: ath11k@lists.infradead.org

Manikanta Pubbisetty <mpubbise@codeaurora.org> wrote:

> Currently, PMF config for peers is not being sent to the
> firmware in peer assoc command. As a result, in cases where
> PMF is enabled, there would be mismatch in configuration
> between host software and the firmware, eventually leading
> to packet drops in mac80211.
> 
> Fix it by setting appropriate PMF flags during peer assoc.
> 
> Signed-off-by: Manikanta Pubbisetty <mpubbise@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-bringup branch of ath.git, thanks.

819d9adcb7f7 ath11k: fix PMF config during peer assoc

-- 
https://patchwork.kernel.org/patch/10981261/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
