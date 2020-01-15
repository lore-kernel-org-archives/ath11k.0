Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ireoi-000316-P9
 for ath11k@lists.infradead.org; Wed, 15 Jan 2020 09:18:30 +0000
MIME-Version: 1.0
Subject: Re: [PATCH -next] ath11k: add dependency for struct ath11k member
 debug
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191213012417.130719-1-maowenan@huawei.com>
References: <20191213012417.130719-1-maowenan@huawei.com>
Message-Id: <20200115091820.091F2C433A2@smtp.codeaurora.org>
Date: Wed, 15 Jan 2020 09:18:20 +0000 (UTC)
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
To: Mao Wenan <maowenan@huawei.com>
Cc: kernel-janitors@vger.kernel.org, milehu@codeaurora.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath11k@lists.infradead.org, julia.lawall@lip6.fr, mpubbise@codeaurora.org, msinada@codeaurora.org, periyasa@codeaurora.org, davem@davemloft.net

Mao Wenan <maowenan@huawei.com> wrote:

> If CONFIG_ATH11K, CONFIG_MAC80211_DEBUGFS are set,
> and CONFIG_ATH11K_DEBUGFS is not set, below error can be found,
> drivers/net/wireless/ath/ath11k/debugfs_sta.c: In function ath11k_dbg_sta_open_htt_peer_stats:
> drivers/net/wireless/ath/ath11k/debugfs_sta.c:411:4: error: struct ath11k has no member named debug
>   ar->debug.htt_stats.stats_req = stats_req;
> 
> It is to add the dependency for the member of struct ath11k.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Mao Wenan <maowenan@huawei.com>

Arnd already did something what I proposed:
https://patchwork.kernel.org/patch/11321921/

Patch set to Superseded.

-- 
https://patchwork.kernel.org/patch/11289709/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
