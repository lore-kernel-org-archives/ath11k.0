Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVs9f-0008HF-1W
 for ath11k@lists.infradead.org; Tue, 05 May 2020 07:38:17 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix resource unavailability for htt stats after
 peer stats display
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1588592755-10427-1-git-send-email-ssreeela@codeaurora.org>
References: <1588592755-10427-1-git-send-email-ssreeela@codeaurora.org>
Message-Id: <20200505073811.382FFC432C2@smtp.codeaurora.org>
Date: Tue,  5 May 2020 07:38:11 +0000 (UTC)
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
To: Sowmiya Sree Elavalagan <ssreeela@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Sowmiya Sree Elavalagan <ssreeela@codeaurora.org> wrote:

> htt stats are not working after htt peer stats display
> and also after htt peer stats reset. Trying to dump htt
> stats shows "Resource temporarily unavailable".
> This is because of "ar->debug.htt_stats.stats_req" member is being
> consecutively used for all htt stats without being reset
> during the previous usage. Hence assigning NULL to this member
> after freeing the allocated memory fixes the issue.
> 
> console logs below:
> # echo 9 >/sys/kernel/debug/ath11k/ipq8074/mac1/htt_stats_type
> # cat /sys/kernel/debug/ath11k/ipq8074/mac1/htt_stats_type
> 9
> # cat /sys/kernel/debug/ath11k/ipq8074/mac1/htt_stats
> cat: can't open '/sys/kernel/debug/ath11k/ipq8074/mac1/htt_stats'
> : Resource temporarily unavailable
> 
> Signed-off-by: Sowmiya Sree Elavalagan <ssreeela@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

52f274b51993 ath11k: fix resource unavailability for htt stats after peer stats display

-- 
https://patchwork.kernel.org/patch/11525557/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
