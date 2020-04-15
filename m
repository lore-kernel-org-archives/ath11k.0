Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOczV-0005o6-GU
 for ath11k@lists.infradead.org; Wed, 15 Apr 2020 08:01:54 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix rx_filter flags setting for per peer rx_stats
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1586538405-16226-3-git-send-email-mkenna@codeaurora.org>
References: <1586538405-16226-3-git-send-email-mkenna@codeaurora.org>
Message-Id: <20200415080102.8BC15C433F2@smtp.codeaurora.org>
Date: Wed, 15 Apr 2020 08:01:02 +0000 (UTC)
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
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Maharaja Kennadyrajan <mkenna@codeaurora.org> wrote:

> Rx_filter flags are set with default filter flags during
> wifi up/down sequence even though the 'ext_rx_stats' debugfs
> is enabled as 1. So, that we are not getting proper per peer
> rx_stats.
> Hence, fixing this by setting the missing rx_filter when
> ext_rx_stats is already set/enabled.
> 
> Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

ec48d28ba291 ath11k: Fix rx_filter flags setting for per peer rx_stats

-- 
https://patchwork.kernel.org/patch/11483475/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
