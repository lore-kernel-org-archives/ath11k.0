Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvypG-0002Dp-Nv
 for ath11k@lists.infradead.org; Fri, 09 Aug 2019 06:56:36 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath11k: ignore event 0x6017
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20190718054910.362-1-john@phrozen.org>
References: <20190718054910.362-1-john@phrozen.org>
Message-Id: <20190809065634.5E5F860795@smtp.codeaurora.org>
Date: Fri,  9 Aug 2019 06:56:34 +0000 (UTC)
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
To: John Crispin <john@phrozen.org>
Cc: ath11k@lists.infradead.org, Shashidhar Lakkavalli <slakkavalli@datto.com>

John Crispin <john@phrozen.org> wrote:

> Everytime a new peer gets associated, we see the following message in the log
> - ath11k c000000.wifi1: Unknown eventid: 0x6017
> Ignore this event for now. We probably need to handle the event properly when
> we add OMI support.
> 
> Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath11k-post-bringup branch of ath.git, thanks.

e56e2919db5f ath11k: ignore event 0x6017
53738c3c22bc ath11k: convert message from info to dbg

-- 
https://patchwork.kernel.org/patch/11048519/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
