Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hg30p-0003qi-D7
 for ath11k@lists.infradead.org; Wed, 26 Jun 2019 08:10:45 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath11k: Fix rx_duration reporting
References: <1561456816-27459-1-git-send-email-gseset@codeaurora.org>
Date: Wed, 26 Jun 2019 11:10:33 +0300
In-Reply-To: <1561456816-27459-1-git-send-email-gseset@codeaurora.org> (Ganesh
 Sesetti's message of "Tue, 25 Jun 2019 15:30:16 +0530")
Message-ID: <87tvccojgm.fsf@kamboji.qca.qualcomm.com>
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
To: Ganesh Sesetti <gseset@codeaurora.org>
Cc: ath11k@lists.infradead.org

Ganesh Sesetti <gseset@codeaurora.org> writes:

> Since rx duration is wrongly reported in iw wlanX station dump,
> fetch correct rx duration reported in PPDU_END tlv.
> Enable PPDU_END, MPDU_START and PPDU_END_STATUS_DONE tlv
> reporting in monitor status by default. Pass the sta's Rx duration
> to mac80211 in sta_statistics() ops.
>
> Signed-off-by: Ganesh Sesetti <gseset@codeaurora.org>

Doesn't apply and sha1 is invalid so I can't use 3-way merge. Please
ALWAYS use ath11k-bringup branch as the baseline and don't have any
extra patches applied.

Applying: ath11k: Fix rx_duration reporting
fatal: sha1 information is lacking or useless (drivers/net/wireless/ath/ath11k/core.h).
error: could not build fake ancestor
Patch failed at 0001 ath11k: Fix rx_duration reporting

-- 
Kalle Valo

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
