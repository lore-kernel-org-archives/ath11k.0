Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgSGX-0003yM-PS
 for ath11k@lists.infradead.org; Thu, 27 Jun 2019 11:08:35 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: add hal dbg mask and utilized for hal stats
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1561487752-24827-1-git-send-email-msinada@codeaurora.org>
References: <1561487752-24827-1-git-send-email-msinada@codeaurora.org>
Message-Id: <20190627110832.1391460AA8@smtp.codeaurora.org>
Date: Thu, 27 Jun 2019 11:08:32 +0000 (UTC)
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
To: Muna Sinada <msinada@codeaurora.org>
Cc: ath11k@lists.infradead.org

Muna Sinada <msinada@codeaurora.org> wrote:

> Added HAL debug mask. Replaced use of ath11k_info() in
> ath11k_hal_reo_status_queue_stats() with ath11k_dbg(), which utilizes new
> HAL debug mask.
> 
> Signed-off-by: Muna Sinada <msinada@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-bringup branch of ath.git, thanks.

a84ef1e54ac9 ath11k: add hal dbg mask and utilized for hal stats

-- 
https://patchwork.kernel.org/patch/11016319/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
