Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1aMQ-0007Bh-7e
 for ath11k@lists.infradead.org; Tue, 11 Feb 2020 18:34:16 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix parsing PPDU_CTRL type in pktlog
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1580886959-8436-1-git-send-email-akolli@codeaurora.org>
References: <1580886959-8436-1-git-send-email-akolli@codeaurora.org>
Message-Id: <20200211183411.61525C4479F@smtp.codeaurora.org>
Date: Tue, 11 Feb 2020 18:34:11 +0000 (UTC)
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
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Anilkumar Kolli <akolli@codeaurora.org> wrote:

> PPDU_CTRL type is missing in current pktlog dumps.
> PPDU_CTRL is sent on CE5 with len 2560 bytes, current
> driver ignores the payload len greter than 2048.
> PPDU_CTRL of 2560 bytes is sent in two fragments of len 2028
> and 532 bytes, but firmware reports pkt header has length as 2560
> for both of the fragments.
> 
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

443d2ee758ac ath11k: fix parsing PPDU_CTRL type in pktlog

-- 
https://patchwork.kernel.org/patch/11365851/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
