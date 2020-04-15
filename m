Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOd5T-0005AB-Mb
 for ath11k@lists.infradead.org; Wed, 15 Apr 2020 08:08:05 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Add dynamic tcl ring selection logic with retry
 mechanism
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1586782622-22570-1-git-send-email-srirrama@codeaurora.org>
References: <1586782622-22570-1-git-send-email-srirrama@codeaurora.org>
Message-Id: <20200415080752.F3016C433BA@smtp.codeaurora.org>
Date: Wed, 15 Apr 2020 08:07:52 +0000 (UTC)
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
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Sriram R <srirrama@codeaurora.org> wrote:

> IPQ8074 HW supports three TCL rings for tx. Currently these rings
> are mapped based on the Access categories, viz. VO, VI, BE, BK.
> In case, one of the traffic type dominates, then it could stress
> the same tcl rings. Rather, it would be optimal to make use of all
> the rings in a round robin fashion irrespective of the traffic type
> so that the load could be evenly distributed among all the rings.
> Also, in case the selected ring is busy or full, a retry mechanism
> is used to ensure other available ring is selected without dropping
> the packet.
> 
> In SMP systems, this change avoids a single CPU from getting hogged
> when heavy traffic of same category is transmitted.
> The tx completion interrupts corresponding to the used tcl ring
> would be more which causes the assigned CPU to get hogged.
> Distribution of tx packets to different tcl rings helps balance
> this load.
> 
> Signed-off-by: Sriram R <srirrama@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

d687275b268b ath11k: Add dynamic tcl ring selection logic with retry mechanism

-- 
https://patchwork.kernel.org/patch/11485549/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
