Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hg2lF-0004yg-N1
 for ath11k@lists.infradead.org; Wed, 26 Jun 2019 07:54:35 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: set HE phymodes at vdev start by default
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1561418955-9119-1-git-send-email-pradeepc@codeaurora.org>
References: <1561418955-9119-1-git-send-email-pradeepc@codeaurora.org>
Message-Id: <20190626075432.CA4E0608CE@smtp.codeaurora.org>
Date: Wed, 26 Jun 2019 07:54:32 +0000 (UTC)
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
To: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Cc: ath11k@lists.infradead.org

Pradeep Kumar Chitrapu <pradeepc@codeaurora.org> wrote:

> phymode cannot be classified at vdev_start as driver wont be aware of
> operating mode (11n/11ac/11ax) at this point. So setting HE phymodes
> by default corresponding to bandwidth at vdev start will prevent FW
> assert when phymode configured for the connecting peer is greater
> than the phymode configured for the VDEV. phymode for each peer is
> configured appropriately at the time of peer association.
> 
> Tested on IPQ8074.
> 
> Suggested-by: Rajkumar Manoharan <rmanohar@codeaurora.org>
> Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-bringup branch of ath.git, thanks.

f9dbe2e2a22f ath11k: set HE phymodes at vdev start by default

-- 
https://patchwork.kernel.org/patch/11014395/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
