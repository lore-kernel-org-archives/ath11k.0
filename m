Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQCEj-0001V3-Ch
 for ath11k@lists.infradead.org; Mon, 13 May 2019 14:47:30 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: support HE max rx aggregation subframes
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1557275593-2994-1-git-send-email-rmanohar@codeaurora.org>
References: <1557275593-2994-1-git-send-email-rmanohar@codeaurora.org>
Message-Id: <20190513144729.17854609D4@smtp.codeaurora.org>
Date: Mon, 13 May 2019 14:47:27 +0000 (UTC)
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
To: Rajkumar Manoharan <rmanohar@codeaurora.org>
Cc: ath11k@lists.infradead.org

Rajkumar Manoharan <rmanohar@codeaurora.org> wrote:

> HE supports upto 256 subframes in an A-MPDU. Hence update
> max_rx_aggregation_subframes to 256 at device registration.
> Since tx A-MPDU aggregation is offloaded to HW, no need to
> update tx aggregation subframes size.
> 
> Signed-off-by: Rajkumar Manoharan <rmanohar@codeaurora.org>

Patch applied to ath.git, thanks.

cf0dc8a12521 ath11k: support HE max rx aggregation subframes

-- 
https://patchwork.kernel.org/patch/10934009/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
