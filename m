Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hg35z-0006vt-Gv
 for ath11k@lists.infradead.org; Wed, 26 Jun 2019 08:16:01 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath11k: add hal dbg mask and utilized for hal stats
References: <1561487752-24827-1-git-send-email-msinada@codeaurora.org>
Date: Wed, 26 Jun 2019 11:15:55 +0300
In-Reply-To: <1561487752-24827-1-git-send-email-msinada@codeaurora.org> (Muna
 Sinada's message of "Tue, 25 Jun 2019 11:35:52 -0700")
Message-ID: <87o92koj7o.fsf@kamboji.qca.qualcomm.com>
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

> Added HAL debug mask. Replaced use of ath11k_info() in
> ath11k_hal_reo_status_queue_stats() with ath11k_dbg(), which utilizes new
> HAL debug mask.
>
> Signed-off-by: Muna Sinada <msinada@codeaurora.org>

This added new checkpatch warnings:

drivers/net/wireless/ath/ath11k/hal_rx.c:492: Alignment should match open parenthesis
drivers/net/wireless/ath/ath11k/hal_rx.c:495: Alignment should match open parenthesis
drivers/net/wireless/ath/ath11k/hal_rx.c:500: Alignment should match open parenthesis
drivers/net/wireless/ath/ath11k/hal_rx.c:502: Alignment should match open parenthesis
drivers/net/wireless/ath/ath11k/hal_rx.c:505: Alignment should match open parenthesis
drivers/net/wireless/ath/ath11k/hal_rx.c:509: Alignment should match open parenthesis
drivers/net/wireless/ath/ath11k/hal_rx.c:514: Alignment should match open parenthesis
drivers/net/wireless/ath/ath11k/hal_rx.c:523: Alignment should match open parenthesis
drivers/net/wireless/ath/ath11k/hal_rx.c:528: Alignment should match open parenthesis
drivers/net/wireless/ath/ath11k/hal_rx.c:531: Alignment should match open parenthesis
drivers/net/wireless/ath/ath11k/hal_rx.c:538: Alignment should match open parenthesis

I fixed them in the pending branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending-ath11k&id=1641a362ba648575cf4fabf846e08ee0df2467d6

-- 
Kalle Valo

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
