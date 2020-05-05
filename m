Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVs9E-0008HF-7v
 for ath11k@lists.infradead.org; Tue, 05 May 2020 07:37:49 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: use true,false for bool variables
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200504113336.41249-1-yanaijie@huawei.com>
References: <20200504113336.41249-1-yanaijie@huawei.com>
Message-Id: <20200505073746.A9EC3C433D2@smtp.codeaurora.org>
Date: Tue,  5 May 2020 07:37:46 +0000 (UTC)
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
To: Jason Yan <yanaijie@huawei.com>
Cc: srirrama@codeaurora.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, ath11k@lists.infradead.org

Jason Yan <yanaijie@huawei.com> wrote:

> Fix the following coccicheck warning:
> 
> drivers/net/wireless/ath/ath11k/dp_rx.c:2964:1-39: WARNING: Assignment
> of 0/1 to bool variable
> drivers/net/wireless/ath/ath11k/dp_rx.c:2965:1-38: WARNING: Assignment
> of 0/1 to bool variable
> 
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

b7b527b9c7c8 ath11k: use true,false for bool variables

-- 
https://patchwork.kernel.org/patch/11525535/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
