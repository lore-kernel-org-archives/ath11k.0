Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hg2m2-0006PG-7E
 for ath11k@lists.infradead.org; Wed, 26 Jun 2019 07:55:23 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix NULL pointer dereference in sta_statistics()
 callback
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1561439898-24320-1-git-send-email-vthiagar@codeaurora.org>
References: <1561439898-24320-1-git-send-email-vthiagar@codeaurora.org>
Message-Id: <20190626075521.DBAD360E5A@smtp.codeaurora.org>
Date: Wed, 26 Jun 2019 07:55:21 +0000 (UTC)
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
To: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Cc: ath11k@lists.infradead.org

Vasanthakumar Thiagarajan <vthiagar@codeaurora.org> wrote:

> It is possible to dereference NULL arsta->rx_stats memory to get
> rssi information after STA disconnection. Instead of dereferencing
> a memory which is allocated/freed in sta_state() callback, add a
> new member for rssi in arsta itself and use it in sta_statistics().
> 
> 	ath11k c000000.wifi1: Station 8c:fd:f0:0a:90:f3 moved to disassociated state
> 	ath11k c000000.wifi1: Removed peer: 8c:fd:f0:0a:90:f3 for VDEV: 0
> 	Unable to handle kernel NULL pointer dereference at virtual address 00000218
> 	Internal error: Oops: 5 [#1] PREEMPT SMP ARM
> 	PC is at ath11k_sta_statistics+0x90/0xa0 [ath11k]
> 	LR is at sta_set_sinfo+0xb8/0xcb4 [mac80211]
> 
> Fixes: ecdb3adeda5c ("ath11k: Fix Rx signal strength reporting")
> Reported-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-bringup branch of ath.git, thanks.

38934d6b0c2c ath11k: Fix NULL pointer dereference in sta_statistics() callback

-- 
https://patchwork.kernel.org/patch/11014709/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
