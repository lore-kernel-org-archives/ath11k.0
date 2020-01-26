Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ivfSE-0001xu-VB
 for ath11k@lists.infradead.org; Sun, 26 Jan 2020 10:47:48 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v4] ath11k: Add missing pdev rx rate stats
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1578570530-32038-1-git-send-email-bperumal@codeaurora.org>
References: <1578570530-32038-1-git-send-email-bperumal@codeaurora.org>
Message-Id: <20200126104744.E22D5C4479C@smtp.codeaurora.org>
Date: Sun, 26 Jan 2020 10:47:44 +0000 (UTC)
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
To: Bhagavathi Perumal S <bperumal@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Bhagavathi Perumal S <bperumal@codeaurora.org> wrote:

> This adds missing rx rate info stats like pilot evm,
> per chain rssi, per user ul ppdu and mpdu counts and
> ul ofdma rate info etc.
> 
> And add null checks for memory alloc failures.
> 
> Signed-off-by: Bhagavathi Perumal S <bperumal@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

875603b3de9f ath11k: Add missing pdev rx rate stats

-- 
https://patchwork.kernel.org/patch/11325519/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
