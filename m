Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKcvS-0007u6-SS
 for ath11k@lists.infradead.org; Tue, 22 Sep 2020 07:41:26 +0000
MIME-Version: 1.0
Subject: Re: [PATCH -next] ath11k: Add checked value for ath11k_ahb_remove
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200621095136.7xdbzkthoxuw2qow@debian.debian-2>
References: <20200621095136.7xdbzkthoxuw2qow@debian.debian-2>
Message-Id: <20200922074114.6E9C3C433FE@smtp.codeaurora.org>
Date: Tue, 22 Sep 2020 07:41:14 +0000 (UTC)
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
To: Bo YU <tsu.yubo@gmail.com>
Cc: kuba@kernel.org, linux-wireless@vger.kernel.org, davem@davemloft.net, ath11k@lists.infradead.org

Bo YU <tsu.yubo@gmail.com> wrote:

> Return value form wait_for_completion_timeout should to be checked.
> 
> This is detected by Coverity: #CID:1464479 (CHECKED_RETURN)
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Bo YU <tsu.yubo@gmail.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

80b892fc8a90 ath11k: Add checked value for ath11k_ahb_remove

-- 
https://patchwork.kernel.org/patch/11616495/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
