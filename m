Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQCI5-0002xb-0C
 for ath11k@lists.infradead.org; Mon, 13 May 2019 14:50:58 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: reject tx fragmentation configuration
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1557326764-29931-1-git-send-email-vnaralas@codeaurora.org>
References: <1557326764-29931-1-git-send-email-vnaralas@codeaurora.org>
Message-Id: <20190513145056.A9F1160364@smtp.codeaurora.org>
Date: Mon, 13 May 2019 14:50:56 +0000 (UTC)
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
To: Venkateswara Naralasetty <vnaralas@codeaurora.org>
Cc: ath11k@lists.infradead.org

Venkateswara Naralasetty <vnaralas@codeaurora.org> wrote:

> Currently no known firmware actually implements frag threshold support.
> Moreover it is not possible to rely frame fragmentation to mac80211
> because firmware clears the "more fragments" bit in frame control making
> it impossible for remote devices to reassemble frames.
> 
> Hence implement a dummy callback just to say fragmentation isn't
> supported. This effectively prevents mac80211 from doing frame
> fragmentation in software.
> 
> This fixes Tx becoming broken after setting fragmentation threshold.
> 
> Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>

Patch applied to ath.git, thanks.

39d03a41aa04 ath11k: reject tx fragmentation configuration

-- 
https://patchwork.kernel.org/patch/10935861/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
