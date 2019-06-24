Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfMdb-0001er-In
 for ath11k@lists.infradead.org; Mon, 24 Jun 2019 10:55:52 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix possible mem leak in extd tx stats
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1561094024-32433-1-git-send-email-vnaralas@codeaurora.org>
References: <1561094024-32433-1-git-send-email-vnaralas@codeaurora.org>
Message-Id: <20190624105551.0244B60746@smtp.codeaurora.org>
Date: Mon, 24 Jun 2019 10:55:50 +0000 (UTC)
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

> This patch fix the memory leak in extd tx stats.
> 
> Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath11k-bringup branch of ath.git, thanks.

a3ba6e2f28a5 ath11k: fix possible mem leak in extd tx stats
b9e30f01194c ath11k: fix line over 90 characters warnings

-- 
https://patchwork.kernel.org/patch/11008437/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
