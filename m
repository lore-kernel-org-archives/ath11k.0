Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hW0Ha-00037g-BW
 for ath11k@lists.infradead.org; Wed, 29 May 2019 15:14:27 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: cleanup in data path
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1558964213-13440-1-git-send-email-periyasa@codeaurora.org>
References: <1558964213-13440-1-git-send-email-periyasa@codeaurora.org>
Message-Id: <20190529151425.EB7F4602FA@smtp.codeaurora.org>
Date: Wed, 29 May 2019 15:14:25 +0000 (UTC)
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

> Removed unnecessary call of ath11k_hal_srng_get_entrysize() in
> ath11k_dp_srng_setup().
> 
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>

Patch applied to ath.git, thanks.

db59e31c7e3f ath11k: cleanup in data path

-- 
https://patchwork.kernel.org/patch/10963089/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
