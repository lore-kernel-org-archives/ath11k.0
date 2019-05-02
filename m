Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMCQD-0001vL-7P
 for ath11k@lists.infradead.org; Thu, 02 May 2019 14:10:50 +0000
MIME-Version: 1.0
Date: Thu, 02 May 2019 19:40:48 +0530
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: Re: [PATCH v2] ath11k: move per peer pktlog entry to per sta debugfs
In-Reply-To: <874l6dm0n0.fsf@kamboji.qca.qualcomm.com>
References: <1556099374-11893-1-git-send-email-akolli@codeaurora.org>
 <874l6dm0n0.fsf@kamboji.qca.qualcomm.com>
Message-ID: <ee94731795954f316d25e25113a0f26e@codeaurora.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org

> 
> Applying: ath11k: move per peer pktlog entry to per sta debugfs
> Using index info to reconstruct a base tree...
> M       drivers/net/wireless/ath/ath11k/debugfs_sta.c
> M       drivers/net/wireless/ath/ath11k/dp_rx.c
> Falling back to patching base and 3-way merge...
> Auto-merging drivers/net/wireless/ath/ath11k/dp_rx.c
> Auto-merging drivers/net/wireless/ath/ath11k/debugfs_sta.c
> CONFLICT (content): Merge conflict in
> drivers/net/wireless/ath/ath11k/debugfs_sta.c
> Recorded preimage for 'drivers/net/wireless/ath/ath11k/debugfs_sta.c'
> error: Failed to merge in the changes.
> Patch failed at 0001 ath11k: move per peer pktlog entry to per sta 
> debugfs

Hi Kalle,

Could you please try in this order,
0001-ath11k-move-per-peer-pktlog-entry-to-per-sta-debugfs.patch
0001-ath11k-fix-build-issues-on-disabling-ATH11K_DEBUG.patch


Thanks
Anil.

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
