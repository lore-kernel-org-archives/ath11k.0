Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNuob-00021X-Fz
 for ath11k@lists.infradead.org; Fri, 25 Oct 2019 08:19:22 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: avoid WMM param truncation
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1571715179-7242-1-git-send-email-periyasa@codeaurora.org>
References: <1571715179-7242-1-git-send-email-periyasa@codeaurora.org>
Message-Id: <20191025081917.D034860D51@smtp.codeaurora.org>
Date: Fri, 25 Oct 2019 08:19:17 +0000 (UTC)
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

> In conf_tx() mac operation callback, we are truncating the tx
> params cw_min and cw_max due to lower data type cast. so modified
> the data type of cwmin and cwmax to avoid the trucation issue.
> 
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-post-bringup branch of ath.git, thanks.

0755d82eb177 ath11k: avoid WMM param truncation

-- 
https://patchwork.kernel.org/patch/11203723/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
