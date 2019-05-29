Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hW0H0-000356-LQ
 for ath11k@lists.infradead.org; Wed, 29 May 2019 15:13:52 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix invalid dma address access in hal rx
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1558964139-13399-1-git-send-email-periyasa@codeaurora.org>
References: <1558964139-13399-1-git-send-email-periyasa@codeaurora.org>
Message-Id: <20190529151350.2066060A44@smtp.codeaurora.org>
Date: Wed, 29 May 2019 15:13:50 +0000 (UTC)
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

> ath11k_hal_rx_buf_addr_info_get() populating the MSB of the
> dma address from the info0 member, which is invalid. It has
> to populate the MSB from info1 member.
> 
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>

Patch applied to ath.git, thanks.

911365b0f0a8 ath11k: Fix invalid dma address access in hal rx

-- 
https://patchwork.kernel.org/patch/10963087/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
