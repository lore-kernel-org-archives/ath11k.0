Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKf2I-0004fs-PC
 for ath11k@lists.infradead.org; Wed, 16 Oct 2019 08:52:04 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: update tcl cmd descriptor parameters for STA mode
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1569240441-18252-1-git-send-email-akolli@codeaurora.org>
References: <1569240441-18252-1-git-send-email-akolli@codeaurora.org>
Message-Id: <20191016085202.7222A60540@smtp.codeaurora.org>
Date: Wed, 16 Oct 2019 08:52:02 +0000 (UTC)
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

> It is observed that ath11k STA mode UL throughput is low.
> This is due to packets delivered to FW from TCL instead of TQM.
> TCL AST search fail causes packet delivered to FW, fix this by
> properly configuring the TCL address search type and ast_hash.
> STA UL throughput is improved 10times with 11AC AP.
> 
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-post-bringup branch of ath.git, thanks.

578468defa7f ath11k: update tcl cmd descriptor parameters for STA mode

-- 
https://patchwork.kernel.org/patch/11156647/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
