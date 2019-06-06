Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYvb4-0002TH-5n
 for ath11k@lists.infradead.org; Thu, 06 Jun 2019 16:50:39 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: advertize beacon_int_min_gcd as 100 while bring
 up multi vaps
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1559648187-16152-1-git-send-email-mkenna@codeaurora.org>
References: <1559648187-16152-1-git-send-email-mkenna@codeaurora.org>
Message-Id: <20190606165037.E66F4605FC@smtp.codeaurora.org>
Date: Thu,  6 Jun 2019 16:50:37 +0000 (UTC)
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

> When the user tries to bring up the multi vaps with different
> beacon interval, then the beacon intervals of the multi vaps
> should be the minimum GCD of 100.
> 
> Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>

Patch applied to ath.git, thanks.

dc7ecc81805e ath11k: advertize beacon_int_min_gcd as 100 while bring up multi vaps

-- 
https://patchwork.kernel.org/patch/10974779/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
