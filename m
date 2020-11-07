Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbJCb-0007sb-Hz
 for ath11k@lists.infradead.org; Sat, 07 Nov 2020 08:04:11 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix number of rules in filtered ETSI regdomain
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20201030101940.2387952-1-sven@narfation.org>
References: <20201030101940.2387952-1-sven@narfation.org>
Message-Id: <20201107080355.DB339C433C6@smtp.codeaurora.org>
Date: Sat,  7 Nov 2020 08:03:55 +0000 (UTC)
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
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Sven Eckelmann <sven@narfation.org> wrote:

> The ath11k code will try to insert wheather rader related limits when the
> DFS region is set to ETSI. For this reason, it will add two more entries in
> the array of reg_rules. But the 2.4.0.1 firmware is prefiltering the list
> of reg rules it returns for 2.4GHz PHYs. They will then not contain the
> list of 5GHz rules and thus no wheather radar band rules were inserted by
> this code.
> 
> But the code didn't fix the n_reg_rules for this regulatory domain and PHY
> when this happened. This resulted in a rejection by is_valid_rd because it
> found rules which start and end at 0khz. This resulted in a splat like:
> 
>   Invalid regulatory domain detected
>   ------------[ cut here ]------------
>   WARNING: at backports-20200628-4.4.60-9a94b73e75/net/wireless/reg.c:3721
>   [...]
>   ath11k c000000.wifi1: failed to perform regd update : -22
> 
> The number of rules must therefore be saved after they were converted from
> the ath11k format to the ieee80211_regdomain format and not before.
> 
> Tested with IPQ8074 WLAN.HK.2.4.0.1.r1-00019-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Sven Eckelmann <sven@narfation.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

6189be7d145c ath11k: Fix number of rules in filtered ETSI regdomain

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20201030101940.2387952-1-sven@narfation.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
