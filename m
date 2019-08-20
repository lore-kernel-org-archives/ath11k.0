Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0134-0002we-0Q
 for ath11k@lists.infradead.org; Tue, 20 Aug 2019 10:07:31 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: change remaining UTF-8 characters to ASCII
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1566290692-5129-1-git-send-email-kvalo@codeaurora.org>
References: <1566290692-5129-1-git-send-email-kvalo@codeaurora.org>
Message-Id: <20190820100729.62D4160ACE@smtp.codeaurora.org>
Date: Tue, 20 Aug 2019 10:07:29 +0000 (UTC)
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> wrote:

> While testing git send-email it reported that there are few UTF-8 characters in
> the comments, which is unnecessary. Change those to ASCII to keep things simpler.
> 
> No functional changes.
> 
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-bringup branch of ath.git, thanks.

2a87d965bc23 ath11k: change remaining UTF-8 characters to ASCII

-- 
https://patchwork.kernel.org/patch/11103393/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
