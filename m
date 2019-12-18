Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihdaL-0003rn-Ms
 for ath11k@lists.infradead.org; Wed, 18 Dec 2019 17:58:12 +0000
MIME-Version: 1.0
Subject: Re: [PATCH -next] ath11k: Remove unneeded semicolon
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1576318954-40658-1-git-send-email-zhengbin13@huawei.com>
References: <1576318954-40658-1-git-send-email-zhengbin13@huawei.com>
Message-Id: <20191218175802.26186C4479D@smtp.codeaurora.org>
Date: Wed, 18 Dec 2019 17:58:02 +0000 (UTC)
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
To: zhengbin <zhengbin13@huawei.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, davem@davemloft.net, ath11k@lists.infradead.org

zhengbin <zhengbin13@huawei.com> wrote:

> Fixes coccicheck warning:
> 
> drivers/net/wireless/ath/ath11k/wmi.h:2570:2-3: Unneeded semicolon
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: zhengbin <zhengbin13@huawei.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

d1389e19e682 ath11k: Remove unneeded semicolon

-- 
https://patchwork.kernel.org/patch/11292181/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
