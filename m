Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdxGg-00040N-H3
 for ath11k@lists.infradead.org; Thu, 20 Jun 2019 13:38:23 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath11k: fix typo with swap16() and swap32()
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1560859413-8788-1-git-send-email-kvalo@codeaurora.org>
References: <1560859413-8788-1-git-send-email-kvalo@codeaurora.org>
Message-Id: <20190620133822.3D1A46090E@smtp.codeaurora.org>
Date: Thu, 20 Jun 2019 13:38:22 +0000 (UTC)
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

> Fix GCC errors on sparc64:
> 
> drivers/net/wireless/ath/ath11k/dp.h:1490:13: error: implicit declaration of function 'swap32' [-Werror=implicit-function-declaration]
> drivers/net/wireless/ath/ath11k/dp.h:1491:13: error: implicit declaration of function 'swap16' [-Werror=implicit-function-declaration]
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath11k-bringup branch of ath.git, thanks.

3378cd644bcc ath11k: fix typo with swap16() and swap32()
e0e87d74740a ath11k: include vmalloc.h to fix a compilation error on sparc64

-- 
https://patchwork.kernel.org/patch/11001473/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
