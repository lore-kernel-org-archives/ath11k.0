Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 189D9C433F5
	for <ath11k@archiver.kernel.org>; Mon, 21 Feb 2022 10:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NhS+pDiiqGGyOVuZWpmWbI01+w4qr3Sehh4IKMcM/no=; b=raLcifiPfAvdes
	CP+pMj9ImUffr2C1WLEdTSeGm/0/tQZltfFoNY6SJhizJ3kOf85QAYIQIAYAWMownEn0orp8CEecS
	fL/m+KBtd0hufHfSrh+5zy+cUdhcFp4OkTSE+6RKG06t8Ln6M6+LZDFF6Gna0cx70hHN8O+qb/3U3
	x65hEYegwt/w7vCYgT2miCU/sidChyKVm9WMZiFyIbC/HviWmkXwQKxwOF09LeFVwVXq/6iMC4+Ue
	NHqt99f0JGrBdQPv9GINAZFxMgAOnyMcdTgWPYSAmb5SoFO+B9T8GThuSVoZEIM++0gnczxy97VVT
	vcXG4ABMIIP8+nX272yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM6NI-005AZ2-Fg; Mon, 21 Feb 2022 10:57:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM6JO-0058IO-Fn
 for ath11k@lists.infradead.org; Mon, 21 Feb 2022 10:53:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D5F1861133;
 Mon, 21 Feb 2022 10:52:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D59DC340E9;
 Mon, 21 Feb 2022 10:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645440777;
 bh=HIwMS/QNmvIMrz2nkQTGWNzTOiKAHN4AXscIkZ5Atok=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=T5Zf17Dz54lD0Rf+lQjYJQI+6ZQ2+2KyoGb/fBLlV+Ed+qifsoexD3HImjmet6S1N
 aGrvk0LE52G2zPN6Hck0OFR8ewBnJRdFOEzpPXmzM+J7LEbMeXMGrxd96uW9oWUT3i
 IOY1C0oBK/JGPq7/EuS3kZeGbUAMzh3+1TSxUh65ksmLHnd1jcJcI0CRhjEXthnsC8
 i/Fw5BNRQ0H9ajSiZNcPOH0drAjDvttuvyKaNvBrwm4UmdXsCLOhrPz4ha93Ow5gfp
 Cognp3cQ4Q3zIhFA99zHBS80z68YUj9kAn7f96KtLxmjmUKydUwoALndFuwb5tuZWO
 lVRMDNt2/BSfw==
From: Kalle Valo <kvalo@kernel.org>
To: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Miles Hu <milehu@codeaurora.org>, John Crispin <john@phrozen.org>
Subject: Re: [PATCH v10 1/3] ath11k: switch to using ieee80211_tx_status_ext()
References: <20220217012112.31211-1-pradeepc@codeaurora.org>
 <20220217012112.31211-2-pradeepc@codeaurora.org>
Date: Mon, 21 Feb 2022 12:52:50 +0200
In-Reply-To: <20220217012112.31211-2-pradeepc@codeaurora.org> (Pradeep Kumar
 Chitrapu's message of "Wed, 16 Feb 2022 17:21:10 -0800")
Message-ID: <87ley4wkxp.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_025258_663939_159DCCEC 
X-CRM114-Status: GOOD (  19.07  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
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
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Pradeep Kumar Chitrapu <pradeepc@codeaurora.org> writes:

> This allows us to pass HE rates down into the stack.
>
> Co-developed-by: Miles Hu <milehu@codeaurora.org>
> Signed-off-by: Miles Hu <milehu@codeaurora.org>
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath11k/dp_tx.c | 32 +++++++++++++++++++++----
>  1 file changed, 27 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
> index c7d7631efa5a..6f553a870e70 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_tx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
> @@ -519,9 +519,13 @@ static void ath11k_dp_tx_complete_msdu(struct ath11k *ar,
>  				       struct sk_buff *msdu,
>  				       struct hal_tx_status *ts)
>  {
> +	struct ieee80211_tx_status status = { 0 };
>  	struct ath11k_base *ab = ar->ab;
>  	struct ieee80211_tx_info *info;
>  	struct ath11k_skb_cb *skb_cb;
> +	struct ath11k_peer *peer;
> +	struct ath11k_sta *arsta;
> +	struct rate_info rate;
>  
>  	if (WARN_ON_ONCE(ts->buf_rel_source != HAL_WBM_REL_SRC_MODULE_TQM)) {
>  		/* Must not happen */
> @@ -584,12 +588,30 @@ static void ath11k_dp_tx_complete_msdu(struct ath11k *ar,
>  		ath11k_dp_tx_cache_peer_stats(ar, msdu, ts);
>  	}
>  
> -	/* NOTE: Tx rate status reporting. Tx completion status does not have
> -	 * necessary information (for example nss) to build the tx rate.
> -	 * Might end up reporting it out-of-band from HTT stats.
> -	 */
> +	spin_lock_bh(&ab->base_lock);
> +	peer = ath11k_peer_find_by_id(ab, ts->peer_id);
> +	if (!peer || !peer->sta) {
> +		ath11k_dbg(ab, ATH11K_DBG_DATA,
> +			   "dp_tx: failed to find the peer with peer_id %d\n",
> +			    ts->peer_id);
> +		spin_unlock_bh(&ab->base_lock);
> +		dev_kfree_skb_any(msdu);
> +		goto exit;
> +	}
> +	arsta = (struct ath11k_sta *)peer->sta->drv_priv;
> +	status.sta = peer->sta;
> +	status.skb = msdu;
> +	status.info = info;
> +	rate = arsta->last_txrate;
> +	status.rate = &rate;
>  
> -	ieee80211_tx_status(ar->hw, msdu);
> +	spin_unlock_bh(&ab->base_lock);
> +	rcu_read_unlock();
> +
> +	ieee80211_tx_status_ext(ar->hw, &status);
> +	return;
> +exit:
> +	rcu_read_unlock();
>  }

This patch gives a warning:

drivers/net/wireless/ath/ath11k/dp_tx.c:600:9: warning: context imbalance in 'ath11k_dp_tx_complete_msdu' - unexpected unlock

I don't understand why there's rcu_read_unlock() so in the pending
branch I removed both of the calls and also the exit label.

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=cb63b88dca170d9de9ff30a546e08917e91c6f05

Please check my changes.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
