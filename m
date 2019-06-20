Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdxHI-0004Id-NT
 for ath11k@lists.infradead.org; Thu, 20 Jun 2019 13:39:02 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: cleanup in HTC and tx data path
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1560832368-17047-1-git-send-email-periyasa@codeaurora.org>
References: <1560832368-17047-1-git-send-email-periyasa@codeaurora.org>
Message-Id: <20190620133900.6FDCA606FC@smtp.codeaurora.org>
Date: Thu, 20 Jun 2019 13:39:00 +0000 (UTC)
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

> Removed the unnecessary parenthesis in ath11k_dp_tx().
> Replaced the Hard code value to the HTC header structure
> size while reserve the skb. Modify the WARN_ONCE to WARN_ON
> in ath11k_htc_build_tx_ctrl_skb().
> 
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-bringup branch of ath.git, thanks.

4d57f3c14410 ath11k: cleanup in HTC and tx data path

-- 
https://patchwork.kernel.org/patch/11000875/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
