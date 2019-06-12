Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hb19D-0004vJ-NF
 for ath11k@lists.infradead.org; Wed, 12 Jun 2019 11:10:37 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: code cleanup in CE
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1560159408-5702-1-git-send-email-periyasa@codeaurora.org>
References: <1560159408-5702-1-git-send-email-periyasa@codeaurora.org>
Message-Id: <20190612111031.71FD06038E@smtp.codeaurora.org>
Date: Wed, 12 Jun 2019 11:10:31 +0000 (UTC)
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
To: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Cc: ath11k@lists.infradead.org

Karthikeyan Periyasamy <periyasa@codeaurora.org> wrote:

> Modify the WARN_ONCE() to WARN_ON_ONCE() with IS_ALIGNED() for
> better code.
> 
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-bringup branch of ath.git, thanks.

d7d29ad0c568 ath11k: code cleanup in CE

-- 
https://patchwork.kernel.org/patch/10984577/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
