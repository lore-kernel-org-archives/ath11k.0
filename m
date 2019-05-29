Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hW0GY-000324-Jp
 for ath11k@lists.infradead.org; Wed, 29 May 2019 15:13:23 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: add CE specific callbacks
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1558963190-30814-1-git-send-email-akolli@codeaurora.org>
References: <1558963190-30814-1-git-send-email-akolli@codeaurora.org>
Message-Id: <20190529151322.4905E602FA@smtp.codeaurora.org>
Date: Wed, 29 May 2019 15:13:21 +0000 (UTC)
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

> CE5 is used for pktlog and other HTT messages.
> CE5 does not have HTC header, add separate callbacks
> to handle this.
> 
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>

Patch applied to ath.git, thanks.

160c2a1d9574 ath11k: add CE specific callbacks

-- 
https://patchwork.kernel.org/patch/10963041/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
