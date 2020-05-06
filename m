Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWDLe-0001dA-1G
 for ath11k@lists.infradead.org; Wed, 06 May 2020 06:16:04 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Add support to reset htt peer stats
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1588610147-20231-1-git-send-email-tamizhr@codeaurora.org>
References: <1588610147-20231-1-git-send-email-tamizhr@codeaurora.org>
Message-Id: <20200506061548.201CFC433F2@smtp.codeaurora.org>
Date: Wed,  6 May 2020 06:15:48 +0000 (UTC)
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
To: Tamizh Chelvam <tamizhr@codeaurora.org>
Cc: Ashok Raj Nagarajan <arnagara@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Tamizh Chelvam <tamizhr@codeaurora.org> wrote:

> This patch add supports to reset the per peer htt stats.
> 
> Usage:
> 
> echo 1 > /sys/kernel/debug/ieee80211/phyX/netdev:wlanX/stations/<peer MAC addr>/htt_peer_stats_reset
> 
> While doing so, sync the wmi services between FW and host.
> 
> Signed-off-by: Ashok Raj Nagarajan <arnagara@codeaurora.org>
> Signed-off-by: Tamizh Chelvam <tamizhr@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

559ef68f5f69 ath11k: Add support to reset htt peer stats

-- 
https://patchwork.kernel.org/patch/11526701/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
