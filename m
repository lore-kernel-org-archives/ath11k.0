Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgSLx-0005jo-Hg
 for ath11k@lists.infradead.org; Thu, 27 Jun 2019 11:14:10 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: avoid inappropriate data lock
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1561539725-24438-1-git-send-email-periyasa@codeaurora.org>
References: <1561539725-24438-1-git-send-email-periyasa@codeaurora.org>
Message-Id: <20190627111409.501556085C@smtp.codeaurora.org>
Date: Thu, 27 Jun 2019 11:14:09 +0000 (UTC)
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

> peer data should protected by the ath11k_base data_lock not
> by the ath11k data_lock. so lock the ath11k_base data_lock
> before accessing ath11k_peer_find().
> 
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-bringup branch of ath.git, thanks.

208caa5fb874 ath11k: avoid inappropriate data lock

-- 
https://patchwork.kernel.org/patch/11017269/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
