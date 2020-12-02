Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-5.mailgun.net ([69.72.42.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkWj4-00053o-DW
 for ath11k@lists.infradead.org; Wed, 02 Dec 2020 18:19:40 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/3] ath11k: Don't cast ath11k_skb_cb to
 ieee80211_tx_info.control
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20201119154235.263250-1-sven@narfation.org>
References: <20201119154235.263250-1-sven@narfation.org>
Message-Id: <20201202181934.483D9C43461@smtp.codeaurora.org>
Date: Wed,  2 Dec 2020 18:19:34 +0000 (UTC)
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

> The driver_data area of ieee80211_tx_info is used in ath11k for
> ath11k_skb_cb. The first function in the TX patch which rewrites it to
> ath11k_skb_cb is already ath11k_mac_op_tx. No one else in the code path
> must use it for something else before it reinitializes it. Otherwise the
> data has to be considered uninitialized or corrupt.
> 
> But the ieee80211_tx_info.control shares exactly the same area as
> ieee80211_tx_info.driver_data and ath11k is still using it. This results in
> best case in a
> 
>   ath11k c000000.wifi1: no vif found for mgmt frame, flags 0x0
> 
> or (slightly worse) in a kernel oops.
> 
> Instead, the interesting data must be moved first into the ath11k_skb_cb
> and ieee80211_tx_info.control must then not be used anymore.
> 
> Tested-on: IPQ8074 hw2.0 WLAN.HK.2.4.0.1.r1-00026-QCAHKSWPL_SILICONZ-2
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Sven Eckelmann <sven@narfation.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

3 patches applied to ath-next branch of ath.git, thanks.

f4d291b43f80 ath11k: Don't cast ath11k_skb_cb to ieee80211_tx_info.control
5da7acfec5ec ath11k: Reset ath11k_skb_cb before setting new flags
d35d1375493b ath11k: Build check size of ath11k_skb_cb

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20201119154235.263250-1-sven@narfation.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
