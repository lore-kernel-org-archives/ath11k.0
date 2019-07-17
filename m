Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hniy5-0007QE-9S
 for ath11k@lists.infradead.org; Wed, 17 Jul 2019 12:23:34 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] ath11k: support for multicast rate control
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20190705103109.3731-2-sven@narfation.org>
References: <20190705103109.3731-2-sven@narfation.org>
Message-Id: <20190717122332.AED4161728@smtp.codeaurora.org>
Date: Wed, 17 Jul 2019 12:23:32 +0000 (UTC)
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
To: Sven Eckelmann <sven@narfation.org>
Cc: ath11k@lists.infradead.org, Sven Eckelmann <seckelmann@datto.com>

Sven Eckelmann <sven@narfation.org> wrote:

> The multicasts have to be done at a rate which is a basic rate. But the
> ath11k firmware is always doing them on 1 Mbit/s for 2.4GHz and 6 Mbit/s
> for 5GHz. These might not be the basic rates which the AP advertised.
> Clients which don't support these rates will therefore not be able to
> receive the multicast/broadcast.
> 
> Also some mesh protocols try to estimate the probability of a successful
> submission of broadcast/multicast frames. In such setups, the multicast
> rate is usually manually set to an higher value to better simulate the
> rates which are used for unicast transmission.
> 
> mac80211 already calculates the correct multicast rate for the driver and
> ath11k just has to send this information to the firmware rate control.
> 
> Signed-off-by: Sven Eckelmann <seckelmann@datto.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

3 patches applied to ath11k-bringup branch of ath.git, thanks.

c885aaf227ec ath11k: support for multicast rate control
caa114b794e3 ath11k: support for mgmt rate control
687fbb379e71 ath11k: apply mgmt rate for beacons

-- 
https://patchwork.kernel.org/patch/11032957/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
