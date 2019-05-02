Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMC0s-00069H-S5
 for ath11k@lists.infradead.org; Thu, 02 May 2019 13:44:40 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2] ath11k: move per peer pktlog entry to per sta debugfs
References: <1556099374-11893-1-git-send-email-akolli@codeaurora.org>
Date: Thu, 02 May 2019 16:44:35 +0300
In-Reply-To: <1556099374-11893-1-git-send-email-akolli@codeaurora.org>
 (Anilkumar Kolli's message of "Wed, 24 Apr 2019 15:19:34 +0530")
Message-ID: <874l6dm0n0.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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

Anilkumar Kolli <akolli@codeaurora.org> writes:

> Per peer pktlog is enabled through per sta debugfs
> Currently this feature is limited on single peer.
>
> Enable pktlog using,
> echo "0x6f 2" > /sys/kernel/debug/ath11k/mac0/pktlog_filter
>
> Enable peer pktlog using,
> echo 1 > /sys/kernel/debug/ieee80211/phy9/netdev\:wlan0/stations
> /8c\:fd\:f0\:0a\:8c\:14/peer_pktlog
>
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>

Thank you for using ath11k-bringup branch as the baseline so with help
of 3-way merge I was able to fix easy the conflict in debugfs_sta.c.
This is now applied.

Applying: ath11k: move per peer pktlog entry to per sta debugfs
Using index info to reconstruct a base tree...
M       drivers/net/wireless/ath/ath11k/debugfs_sta.c
M       drivers/net/wireless/ath/ath11k/dp_rx.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/ath/ath11k/dp_rx.c
Auto-merging drivers/net/wireless/ath/ath11k/debugfs_sta.c
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath11k/debugfs_sta.c
Recorded preimage for 'drivers/net/wireless/ath/ath11k/debugfs_sta.c'
error: Failed to merge in the changes.
Patch failed at 0001 ath11k: move per peer pktlog entry to per sta debugfs

-- 
Kalle Valo

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
