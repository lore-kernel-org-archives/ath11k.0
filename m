Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hW0Ix-0004ju-ET
 for ath11k@lists.infradead.org; Wed, 29 May 2019 15:15:53 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix bug in SMPS support
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1559034571-25406-1-git-send-email-vnaralas@codeaurora.org>
References: <1559034571-25406-1-git-send-email-vnaralas@codeaurora.org>
Message-Id: <20190529151551.06FA5602FA@smtp.codeaurora.org>
Date: Wed, 29 May 2019 15:15:50 +0000 (UTC)
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

> Currently firmware ignores SMPS support flags in peer assoc command.
> For SMPS to work it is necessary to send SMPS mode parameters to
> firmware so that tx chainmask is properly set to that peer.
> 
> Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>

Patch applied to ath.git, thanks.

6798d968da0e ath11k: Fix bug in SMPS support

-- 
https://patchwork.kernel.org/patch/10964427/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
