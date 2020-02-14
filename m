Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2aeu-0003zB-13
 for ath11k@lists.infradead.org; Fri, 14 Feb 2020 13:05:29 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 0/2] Support hash based reo destination ring selection
References: <1581676286-13265-1-git-send-email-srirrama@codeaurora.org>
Date: Fri, 14 Feb 2020 15:05:17 +0200
In-Reply-To: <1581676286-13265-1-git-send-email-srirrama@codeaurora.org>
 (Sriram R.'s message of "Fri, 14 Feb 2020 16:01:24 +0530")
Message-ID: <87pnehqpyq.fsf@kamboji.qca.qualcomm.com>
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
To: Sriram R <srirrama@codeaurora.org>
Cc: ath11k@lists.infradead.org

Sriram R <srirrama@codeaurora.org> writes:

> Currently, reo destination ring selection is based on pdev,
> i.e each pdev is allocated a static reo destintaion ring and
> rx packets for the pdev is always received on the ring.
> This allows use of only 3 out of 4 reo destination rings at the
> max when all pdev's are active and when only one pdev is active
> we utilize only one ring and other 3 rings remain idle.
> To make effective use of all the reo rings, this patchset enables
> hash based reo destination ring selection where the hash is computed
> based on the 5-tuple ( src/dst ip, src/dst port, protocol) info
> from each packet and is used by hw for destination ring selection.
>
> Also, current implementation of amsdu list based processing is replaced
> with per msdu based handling since the received subframe could be
> pushed to different rings after decap based on hash value computed.
>
> This patchset is based on patchset "ath11k: offload PN verification to the HW"
>
> Sriram R (2):
>   ath11k: Configure hash based reo destination ring selection
>   ath11k: Perform per-msdu rx processing

You need to CC linux-wireless, so please resend as v2.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
