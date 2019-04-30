Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLMay-0008Fr-Vc
 for ath11k@lists.infradead.org; Tue, 30 Apr 2019 06:50:30 +0000
MIME-Version: 1.0
Date: Mon, 29 Apr 2019 23:50:28 -0700
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH V2 3/3] ath11k: add TWT support
In-Reply-To: <20190426094150.18078-4-john@phrozen.org>
References: <20190426094150.18078-1-john@phrozen.org>
 <20190426094150.18078-4-john@phrozen.org>
Message-ID: <a71b6e5a4e60500c2d7cfa94563b0a5a@codeaurora.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: John Crispin <john@phrozen.org>
Cc: linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, Srini Kode <skode@qti.qualcomm.com>, Shashidhar Lakkavalli <slakkavalli@datto.com>, Johannes Berg <johannes@sipsolutions.net>, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

On 2019-04-26 02:41, John Crispin wrote:
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c
> b/drivers/net/wireless/ath/ath11k/mac.c
> index 8bb4ff82fb6f..a38c101e0140 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -1938,6 +1938,13 @@ static void ath11k_bss_info_changed(struct
> ieee80211_hw *hw,
>  		ath11k_mac_txpower_recalc(ar);
>  	}
> 
> +	if (changed & BSS_CHANGED_TWT) {
> +		if (info->twt_responder || info->twt_responder)
> 
typo? two twt_responder checks?

-Rajkumar

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
