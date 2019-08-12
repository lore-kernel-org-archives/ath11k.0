Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxBhK-0001x0-VK
 for ath11k@lists.infradead.org; Mon, 12 Aug 2019 14:53:24 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: remove bdf-addr from dtsi
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1565188479-3027-1-git-send-email-akolli@codeaurora.org>
References: <1565188479-3027-1-git-send-email-akolli@codeaurora.org>
Message-Id: <20190812145322.A13AA608CE@smtp.codeaurora.org>
Date: Mon, 12 Aug 2019 14:53:22 +0000 (UTC)
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
Cc: ath11k@lists.infradead.org

Anilkumar Kolli <akolli@codeaurora.org> wrote:

> The board file address is contanst, at least at the moment, so there's no need
> to have the address in Device Tree. Hardcode the address in ath11k instead,
> much cleaner that way.
> 
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-bringup branch of ath.git, thanks.

1bf36e0b25cd ath11k: remove bdf-addr from Device Tree

-- 
https://patchwork.kernel.org/patch/11082293/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
