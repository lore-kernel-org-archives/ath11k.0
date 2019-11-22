Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-185.smtp-out.us-west-2.amazonses.com ([54.240.27.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iY6Lg-0003IF-L0
 for ath11k@lists.infradead.org; Fri, 22 Nov 2019 10:39:37 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix memory leak in monitor mode
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1573506903-3593-1-git-send-email-milehu@codeaurora.org>
References: <1573506903-3593-1-git-send-email-milehu@codeaurora.org>
Message-ID: <0101016e92b21088-a80e8b9a-1e05-47b7-875d-5f0b9be75e6d-000000@us-west-2.amazonses.com>
Date: Fri, 22 Nov 2019 10:39:33 +0000
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
To: Miles Hu <milehu@codeaurora.org>
Cc: ath11k@lists.infradead.org

Miles Hu <milehu@codeaurora.org> wrote:

> remove tail check to avoid last amsdu leak.
> recycle skb in ppdu id wrap around case
> 
> Signed-off-by: Miles Hu <milehu@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-post-bringup branch of ath.git, thanks.

a20bffb1b01d ath11k: fix memory leak in monitor mode

-- 
https://patchwork.kernel.org/patch/11237789/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
