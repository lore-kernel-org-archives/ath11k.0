Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hg33U-00054Q-NP
 for ath11k@lists.infradead.org; Wed, 26 Jun 2019 08:13:26 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 2/4] ath11k: changed parameter from u8 * to struct sk_buff
 *
References: <1561487614-24577-1-git-send-email-msinada@codeaurora.org>
 <1561487614-24577-2-git-send-email-msinada@codeaurora.org>
Date: Wed, 26 Jun 2019 11:12:53 +0300
In-Reply-To: <1561487614-24577-2-git-send-email-msinada@codeaurora.org> (Muna
 Sinada's message of "Tue, 25 Jun 2019 11:33:32 -0700")
Message-ID: <87pnn0ojcq.fsf@kamboji.qca.qualcomm.com>
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
To: Muna Sinada <msinada@codeaurora.org>
Cc: ath11k@lists.infradead.org

Muna Sinada <msinada@codeaurora.org> writes:

> Changed ath11k_hal_rx_parse_mon_status() to take sk_buff pointer instead of
> opaque u8 pointer. Removed variables that became unused.
>
> Signed-off-by: Muna Sinada <msinada@codeaurora.org>

Doesn't apply and sha1 is invalid so I can't use 3-way merge. Please
ALWAYS use ath11k-bringup branch as the baseline and don't have any
extra patches applied.

Applying: ath11k: removed duplicated functionality
Applying: ath11k: changed parameter from u8 * to struct sk_buff *
fatal: sha1 information is lacking or useless (drivers/net/wireless/ath/ath11k/dp_rx.c).
error: could not build fake ancestor
Patch failed at 0002 ath11k: changed parameter from u8 * to struct sk_buff *

-- 
Kalle Valo

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
