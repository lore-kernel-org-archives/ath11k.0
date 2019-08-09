Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvyqe-0002I1-04
 for ath11k@lists.infradead.org; Fri, 09 Aug 2019 06:58:01 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix missed bw conversion in tx completion
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1564494334-5187-1-git-send-email-tamizhr@codeaurora.org>
References: <1564494334-5187-1-git-send-email-tamizhr@codeaurora.org>
Message-Id: <20190809065759.A673D60721@smtp.codeaurora.org>
Date: Fri,  9 Aug 2019 06:57:59 +0000 (UTC)
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
To: Tamizh chelvam <tamizhr@codeaurora.org>
Cc: ath11k@lists.infradead.org

Tamizh chelvam <tamizhr@codeaurora.org> wrote:

> TX rate stats for the retried packets for a station comes through
> tx completion events. Assigning hw reported bandwidth information
> directly to station's txrate bandwidth will cause below warning.
> Fix this warning by converting the hw reported bandwidth to
> mac80211 base bandwidth.
> 
> [ 134.758190] PC is at cfg80211_calculate_bitrate+0x1bc/0x214 [cfg80211]
> [ 134.765730] LR is at cfg80211_calculate_bitrate+0x1bc/0x214 [cfg80211]
> [ 134.875014] [<ffffffbffca8d708>] cfg80211_calculate_bitrate+0x1bc/0x214 [cfg80211]
> [ 134.877192] [<ffffffbffcaa9704>] nl80211_put_sta_rate+0x54/0xf24 [cfg80211]
> [ 134.884829] [<ffffffbffcaa9d48>] nl80211_put_sta_rate+0x698/0xf24 [cfg80211]
> [ 134.891687] [<ffffffbffcaaa490>] nl80211_put_sta_rate+0xde0/0xf24 [cfg80211]
> [ 134.898975] [<ffffffc0004de748>] genl_lock_dumpit+0x30/0x4c
> [ 134.905998] [<ffffffc0004dc264>] netlink_dump+0xf4/0x248
> [ 134.911291] [<ffffffc0004dc910>] __netlink_dump_start+0xe0/0x174
> [ 134.916850] [<ffffffc0004df114>] genl_family_rcv_msg+0x130/0x2c0
> 
> Signed-off-by: Tamizh chelvam <tamizhr@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-post-bringup branch of ath.git, thanks.

ae4f3a46c657 ath11k: fix missed bw conversion in tx completion

-- 
https://patchwork.kernel.org/patch/11065849/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
