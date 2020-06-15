Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkq7O-0005xR-R0
 for ath11k@lists.infradead.org; Mon, 15 Jun 2020 14:29:51 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: removing redundant reo unlock followed by
 immediate lock
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1591713432-26426-1-git-send-email-ssreeela@codeaurora.org>
References: <1591713432-26426-1-git-send-email-ssreeela@codeaurora.org>
Message-Id: <20200615142940.74858C433CB@smtp.codeaurora.org>
Date: Mon, 15 Jun 2020 14:29:40 +0000 (UTC)
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

> Removed reo cmd lock and unlock which was acquiring the lock immediately
> after unlock. Done for code clean up.
> 
> Signed-off-by: Sowmiya Sree Elavalagan <ssreeela@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

8cacd0389c4f ath11k: removing redundant reo unlock followed by immediate lock

-- 
https://patchwork.kernel.org/patch/11595859/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
