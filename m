Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hwEEB-0002AN-4P
 for ath11k@lists.infradead.org; Fri, 09 Aug 2019 23:23:20 +0000
MIME-Version: 1.0
Date: Fri, 09 Aug 2019 16:23:16 -0700
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Subject: Re: [PATCH 6/6] ath11k: switch to using ieee80211_tx_status_ext()
In-Reply-To: <20190714154419.11854-7-john@phrozen.org>
References: <20190714154419.11854-1-john@phrozen.org>
 <20190714154419.11854-7-john@phrozen.org>
Message-ID: <2dc32161ae3cf25deae0542c72941dc4@codeaurora.org>
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
Cc: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>


> @@ -431,12 +434,18 @@ static void ath11k_dp_tx_complete_msdu(struct 
> ath11k *ar,
> -	ieee80211_tx_status(ar->hw, msdu);
> +	spin_lock_bh(&ab->data_lock);
> +	peer = ath11k_peer_find_by_id(ab, ts->peer_id);
> +	arsta = (struct ath11k_sta *)peer->sta->drv_priv;
Hi John,

Accesing sta when peer is deleted is causing null pointer dereference 
issue.

Thanks
Pradeep

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
