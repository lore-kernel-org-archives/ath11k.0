Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNupF-0002Ad-48
 for ath11k@lists.infradead.org; Fri, 25 Oct 2019 08:20:02 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: remove unused tx ring counters
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1571889246-1793-1-git-send-email-pradeepc@codeaurora.org>
References: <1571889246-1793-1-git-send-email-pradeepc@codeaurora.org>
Message-Id: <20191025082000.C31896101B@smtp.codeaurora.org>
Date: Fri, 25 Oct 2019 08:20:00 +0000 (UTC)
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
To: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Cc: ath11k@lists.infradead.org

Pradeep Kumar Chitrapu <pradeepc@codeaurora.org> wrote:

> remove unused counter to avoid taking locks inorder to optimize
> cpu load.
> 
> Using Flamegraph, cpu usage of ath11k_dp_tx() observed to be decreased
> from 5.58% to 3.74% with iperf traffic running with 80MHz bandwidth ap
> mode.
> 
> Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-post-bringup branch of ath.git, thanks.

be0217cf9f47 ath11k: remove unused tx ring counters

-- 
https://patchwork.kernel.org/patch/11208261/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
