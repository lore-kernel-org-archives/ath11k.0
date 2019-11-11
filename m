Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUAOz-0003ZB-Mp
 for ath11k@lists.infradead.org; Mon, 11 Nov 2019 14:10:47 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: change failed to find peer id log level
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1573447787-30517-1-git-send-email-vnaralas@codeaurora.org>
References: <1573447787-30517-1-git-send-email-vnaralas@codeaurora.org>
Message-Id: <20191111141044.CE52660D97@smtp.codeaurora.org>
Date: Mon, 11 Nov 2019 14:10:44 +0000 (UTC)
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

> Peer deletion and NAPI processing are from two different paths,
> failed to find peer id is expected when NAPI scheduled
> for mon stats processing after peer deletion.
> 
> This patch change the log level from warn to debug.
> 
> Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>

Failed to apply, please rebase.

error: patch failed: drivers/net/wireless/ath/ath11k/dp_rx.c:2618
error: drivers/net/wireless/ath/ath11k/dp_rx.c: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/patch/11236547/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
