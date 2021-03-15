Return-Path: <SRS0=Ejh8=IN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98907C433E0
	for <ath11k@archiver.kernel.org>; Mon, 15 Mar 2021 16:43:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 490D764E98
	for <ath11k@archiver.kernel.org>; Mon, 15 Mar 2021 16:43:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 490D764E98
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bczMkzwPVFSvVUqyJmoPC4+NYTWSO/1u7PLRElcQCvU=; b=aRMThubaXX0ueJYX2QPqqPbz8
	VpJUuk+6U0XdTFOwfWwwa7IvUxs/tYMX2+IS4H0FJeXz2w4ZCG5KCYCj/NA0Lq8z73CbRwaheIpdF
	mpp0hlke3KpSBf8LSD0bxZxoxnyz/icTJ4OxcoprmRFt+eDguk2Irw2RwQAQuVv7dUoxGMOLsDP9L
	BmhwJe91lePLAl7apkcVLTNKCdNgxKHIiwyFxaA4UMxFtghX2S/Cik/1tJpd2r2ZrgEvRN8LObD/u
	FyEz5H37ujj5FtfdghGuwc++TC/uoLaLg9c8EypQPbACmeSnh/B1fs5JmLaMfEenYUUqd+rotBH+/
	gUi+/ECEg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLqJP-00GOIh-MQ; Mon, 15 Mar 2021 16:43:23 +0000
Received: from m42-2.mailgun.net ([69.72.42.2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLqJK-00GOHl-Mu
 for ath11k@lists.infradead.org; Mon, 15 Mar 2021 16:43:20 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1615826598; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=O3GddaTorDxtMtita3ja9xGI7KqGP0j1IgkbeqTfA2Y=;
 b=KZpx8+5m4kmp595PqAoFaPn8fuGFUj5yFbJ4TaBp2wA6pJZ3P2sn9tHFLn5tBhKPkQyA1IIy
 TYE0ihBzFZW2Sc4rsAwcCm5f5hUfTSmvlnf1xwpxvlJ88WxLTjCweCk0a/FBLf3e06DkY+9D
 U2JusFoDvFdm/h8830xyPSGKQ0Q=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 604f8e98e2200c0a0d908776 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Mar 2021 16:43:04
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E0CF9C433ED; Mon, 15 Mar 2021 16:43:04 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: periyasa)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 35A8EC433CA;
 Mon, 15 Mar 2021 16:43:04 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 15 Mar 2021 22:13:04 +0530
From: Karthikeyan periyasamy <periyasa@codeaurora.org>
To: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, Miles Hu
 <milehu@codeaurora.org>, John Crispin <john@phrozen.org>,
 pradeepc=codeaurora.org@codeaurora.org
Subject: Re: [PATCH v7 1/3] ath11k: switch to using ieee80211_tx_status_ext()
In-Reply-To: <20210305230337.23047-2-pradeepc@codeaurora.org>
References: <20210305230337.23047-1-pradeepc@codeaurora.org>
 <20210305230337.23047-2-pradeepc@codeaurora.org>
Message-ID: <65a8f70609a1758611c97205abd205f2@codeaurora.org>
X-Sender: periyasa@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_164318_920658_2A153E74 
X-CRM114-Status: GOOD (  12.03  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

> --- a/drivers/net/wireless/ath/ath11k/dp_tx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
> @@ -417,9 +417,12 @@ static void ath11k_dp_tx_complete_msdu(struct 
> ath11k *ar,
>  				       struct sk_buff *msdu,
>  				       struct hal_tx_status *ts)
>  {
> +	struct ieee80211_tx_status status = { 0 };
>  	struct ath11k_base *ab = ar->ab;
>  	struct ieee80211_tx_info *info;
>  	struct ath11k_skb_cb *skb_cb;
> +	struct ath11k_peer *peer;
> +	struct ath11k_sta *arsta;
> 
>  	if (WARN_ON_ONCE(ts->buf_rel_source != HAL_WBM_REL_SRC_MODULE_TQM)) {
>  		/* Must not happen */
> @@ -483,13 +486,22 @@ static void ath11k_dp_tx_complete_msdu(struct 
> ath11k *ar,
>  		ath11k_dp_tx_cache_peer_stats(ar, msdu, ts);
>  	}
> 
> -	/* NOTE: Tx rate status reporting. Tx completion status does not have
> -	 * necessary information (for example nss) to build the tx rate.
> -	 * Might end up reporting it out-of-band from HTT stats.
> -	 */
> -
> -	ieee80211_tx_status(ar->hw, msdu);
> -
> +	spin_lock_bh(&ab->base_lock);
> +	peer = ath11k_peer_find_by_id(ab, ts->peer_id);
> +	if (peer) {
> +		arsta = (struct ath11k_sta *)peer->sta->drv_priv;
> +		status.sta = peer->sta;
> +		status.skb = msdu;
> +		status.info = info;
> +		status.rate = &arsta->last_txrate;
> +	}
> +	rcu_read_unlock();
> +	if (peer)
> +		ieee80211_tx_status_ext(ar->hw, &status);
> +	else
> +		dev_kfree_skb_any(msdu);
> +	spin_unlock_bh(&ab->base_lock);

Why ieee80211_tx_status_ext() kept under spin_lock?

Thanks,
Karthikeyan P

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
