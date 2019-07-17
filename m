Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hnj3y-0008Dw-CM
 for ath11k@lists.infradead.org; Wed, 17 Jul 2019 12:29:39 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: rename the data_lock for better code
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1563285770-13364-1-git-send-email-periyasa@codeaurora.org>
References: <1563285770-13364-1-git-send-email-periyasa@codeaurora.org>
Message-Id: <20190717122938.1F53C60D0C@smtp.codeaurora.org>
Date: Wed, 17 Jul 2019 12:29:38 +0000 (UTC)
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

> Having same lock name in two different structure lead to
> confuse the code readability. Avoid by renaming one of
> the lock name as base_lock.
> 
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-bringup branch of ath.git, thanks.

859918c22b34 ath11k: rename the data_lock for better code

-- 
https://patchwork.kernel.org/patch/11046161/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
