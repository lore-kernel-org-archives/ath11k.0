Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxBir-000238-Ij
 for ath11k@lists.infradead.org; Mon, 12 Aug 2019 14:54:58 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Remove mac_registered variable
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1565269511-27056-1-git-send-email-periyasa@codeaurora.org>
References: <1565269511-27056-1-git-send-email-periyasa@codeaurora.org>
Message-Id: <20190812145457.3EB04608FF@smtp.codeaurora.org>
Date: Mon, 12 Aug 2019 14:54:57 +0000 (UTC)
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

> mac_registered is used as a check to avoid the mac register functionality
> in recovery flow. It can be achieved by check the dev flags. so removed
> the mac_registered variable.
> 
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-bringup branch of ath.git, thanks.

81b27083b2e5 ath11k: Remove mac_registered variable

-- 
https://patchwork.kernel.org/patch/11084135/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
