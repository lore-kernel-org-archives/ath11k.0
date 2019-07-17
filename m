Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hnjPF-0007re-67
 for ath11k@lists.infradead.org; Wed, 17 Jul 2019 12:51:38 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath11k: remove deprecated WMI PEER stats
References: <1563342664-4938-1-git-send-email-murugana@codeaurora.org>
Date: Wed, 17 Jul 2019 15:51:33 +0300
In-Reply-To: <1563342664-4938-1-git-send-email-murugana@codeaurora.org>
 (Sathishkumar Muruganandam's message of "Wed, 17 Jul 2019 11:21:04
 +0530")
Message-ID: <87pnm83ju2.fsf@kamboji.qca.qualcomm.com>
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
To: Sathishkumar Muruganandam <murugana@codeaurora.org>
Cc: ath11k@lists.infradead.org

Sathishkumar Muruganandam <murugana@codeaurora.org> writes:

> Removing WMI PEER stats which has been deprecated in FW and rx_duration of
> a peer is now fetched from HTT PPDU_END stats.
>
> Signed-off-by: Sathishkumar Muruganandam <murugana@codeaurora.org>

This does not apply and sha1 id is invalid. Please use ath11k-bringup
branch as the baseline, do NOT have any other patches applied.

Applying: ath11k: remove deprecated WMI PEER stats
fatal: sha1 information is lacking or useless (drivers/net/wireless/ath/ath11k/wmi.c).
error: could not build fake ancestor
Patch failed at 0001 ath11k: remove deprecated WMI PEER stats

-- 
Kalle Valo

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
