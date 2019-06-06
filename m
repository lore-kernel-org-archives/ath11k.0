Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYvPG-0003pD-5s
 for ath11k@lists.infradead.org; Thu, 06 Jun 2019 16:38:27 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix vdev start failure when operating in CN,
 KR regdomain
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1559561865-27928-1-git-send-email-srirrama@codeaurora.org>
References: <1559561865-27928-1-git-send-email-srirrama@codeaurora.org>
Message-Id: <20190606163825.E0DD560E75@smtp.codeaurora.org>
Date: Thu,  6 Jun 2019 16:38:25 +0000 (UTC)
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
To: Sriram R <srirrama@codeaurora.org>
Cc: ath11k@lists.infradead.org

Sriram R <srirrama@codeaurora.org> wrote:

> Currently, firmware expects the correct regdomain to be set in
> vdev start command. As firmware supports regulatory offload, it can track
> the current regdomain. This info is received from firmware via
> REG_CHAN_LIST_CC event during bringup or after setting country code.
> Currently the dfs_region received is mapped to nl80211_dfs_regions
> and stored in default_regd or new_regd and is used for vdev start.
> But since nl80211_dfs_regions doesn't have a value enumerated for CN
> KR, the firmware rejects VDEV start with an 'invalid regdomain' error.
> Hence, send the appropriate regdomain received from firmware during
> REG_CHAN_LIST_CC event in vdev start to avoid vdev start failure.
> 
> Signed-off-by: Sriram R <srirrama@codeaurora.org>

Patch applied to ath.git, thanks.

b0d742f32bc3 ath11k: Fix vdev start failure when operating in CN, KR regdomain

-- 
https://patchwork.kernel.org/patch/10972787/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
