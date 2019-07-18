Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ho4Om-00070W-F0
 for ath11k@lists.infradead.org; Thu, 18 Jul 2019 11:16:33 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix enabling dynamic bandwidth param
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1563288059-2753-1-git-send-email-srirrama@codeaurora.org>
References: <1563288059-2753-1-git-send-email-srirrama@codeaurora.org>
Message-Id: <20190718111631.94FFF60FEB@smtp.codeaurora.org>
Date: Thu, 18 Jul 2019 11:16:31 +0000 (UTC)
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

Sriram R <srirrama@codeaurora.org> wrote:

> Currently the dynamic bandwidth pdev param is not enabled.
> Correct the parameter passed to enable this feature. This
> is required to dynamically switch bandwidth, for eg. when
> noise in injected in secondary channel of a 40MHz channel
> the fw will switch to 20MHz when this feature is enabled.
> 
> Signed-off-by: Sriram R <srirrama@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-bringup branch of ath.git, thanks.

8e22fb7f66e2 ath11k: Fix enabling dynamic bandwidth param

-- 
https://patchwork.kernel.org/patch/11046185/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
