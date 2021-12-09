Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17BEC433F5
	for <ath11k@archiver.kernel.org>; Thu,  9 Dec 2021 17:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1BO5PnvN+qgHgUf3yoqH0YraFr2hRxPe0NKn04zk7wk=; b=PhVMxmkKxL2Xem
	hu65Tj0lspbUkeqWrsFNGLDZWfm6zwKBSaIT/EFb3zVHpI+PQhh7Hwz2aW970zyJIPlv1xtrPW2V8
	Kj3985jFxCcuxWo6uyNN9fFJxNH8DwwNmtc0c49w4zLIb9FeGBrOxwB2B839yNxFSbAE8Eec0tWMC
	Oc9wtEmSz6GcCfbAYYbdPi96RyHTgIK8jx55LkLZ2T7dHrYrmk/EzXj9pY7XpI6mm+nT6uF1Ck7bz
	7CitydXKu3J+Y2yAcffwzhQgeRZINVZFzWEGJ2pmEm2u2UKZ63SRrgeyMtmcO3m0Aj2ZuhxE2CoNh
	gfyw2WUq4IWlphpdrVJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvNNr-00H0mM-Mv; Thu, 09 Dec 2021 17:39:07 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvNNo-00H0lC-D4
 for ath11k@lists.infradead.org; Thu, 09 Dec 2021 17:39:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8E4ADB8249C;
 Thu,  9 Dec 2021 17:39:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94296C004DD;
 Thu,  9 Dec 2021 17:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639071541;
 bh=C57ohrRWygB7gaq8VrUriv9aNbPRrHR0eMaKh1CP4vQ=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=K357uOqbh4zOlzlYIJNy74u05MJLtafKT5KM04SBVna8gTr7m6pwTMgjELMvXLuR2
 6ACrFhN0ZoPCtGL5aPES2EwmctFkpUuSiGEWIK2mXAb5rPkKnnYtzVzWiqZng+G2Tx
 eQEGjh7kswhysmbgYsiH4yrppUMEgjDopXU9NgUqmav4HqNz9DXZBwuFo9rY5anbD3
 icpOwzPsHnBt5fdFZE+A0H2vEH9cqwZqMEkDeFXLbcxSzpLflWZt/goHRiyqiZN4k2
 /vJxG+o4Fbf7D3A6HFqOAW4U5qPRnnFnifElP17/UhesY1v/dgt9QpgiTlP7dtdwxe
 /9Wc/hJNeIZBg==
From: Kalle Valo <kvalo@kernel.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 13/15] ath11k: discard BSS_CHANGED_TXPOWER when
 EXT_TPC_REG_SUPPORT for 6 GHz
References: <20211026111913.7346-1-quic_wgong@quicinc.com>
 <20211026111913.7346-14-quic_wgong@quicinc.com>
Date: Thu, 09 Dec 2021 19:38:58 +0200
In-Reply-To: <20211026111913.7346-14-quic_wgong@quicinc.com> (Wen Gong's
 message of "Tue, 26 Oct 2021 07:19:11 -0400")
Message-ID: <87tufhvft9.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_093904_625403_6E6EB013 
X-CRM114-Status: GOOD (  20.28  )
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

Wen Gong <quic_wgong@quicinc.com> writes:

> When station is connected to a 6 GHz AP, it has 2 way to configure
> the power limit to firmware. The first way is to send 2 wmi command
> WMI_PDEV_PARAM_TXPOWER_LIMIT2G/WMI_PDEV_PARAM_TXPOWER_LIMIT5G to
> firmware, the second way is to send WMI_VDEV_SET_TPC_POWER_CMDID to
> firmware which include more parameters for power control.
>
> When firmware support SERVICE_EXT_TPC_REG, it means firmware support
> the second way for WMI_VDEV_SET_TPC_POWER_CMDID, then ath11k discard
> BSS_CHANGED_TXPOWER flag from mac80211 which is used to the first way
> for 6 GHz band in this patch and select the second way in the subsequent
> patch.
>
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath11k/core.h |  6 ++++++
>  drivers/net/wireless/ath/ath11k/mac.c  | 19 +++++++++++++++++--
>  2 files changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
> index 6969e0a6fc7b..6ef639975725 100644
> --- a/drivers/net/wireless/ath/ath11k/core.h
> +++ b/drivers/net/wireless/ath/ath11k/core.h
> @@ -1017,4 +1017,10 @@ static inline bool ath11k_support_6G_cc_ext(struct ath11k *ar)
>  	return ath11k_support_cc_ext(ar->ab) && ar->supports_6ghz;
>  }
>  
> +static inline bool ath11k_support_tpc_ext(struct ath11k *ar)
> +{
> +	return ath11k_support_6G_cc_ext(ar) &&
> +	       test_bit(WMI_TLV_SERVICE_EXT_TPC_REG_SUPPORT, ar->ab->wmi_ab.svc_map);
> +}

Move to hw.h and rename to:

ath11k_hw_supports_tpc_ext()

> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -2170,6 +2170,16 @@ static int ath11k_mac_config_obss_pd(struct ath11k *ar,
>  	return 0;
>  }
>  
> +static bool ath11k_mac_station_support_tpc(struct ath11k *ar,
> +					   struct ath11k_vif *arvif,
> +					   struct cfg80211_chan_def *chandef)
> +{
> +	return ath11k_support_tpc_ext(ar) &&
> +	       arvif->vdev_type == WMI_VDEV_TYPE_STA &&
> +	       chandef->chan &&
> +	       chandef->chan->band == NL80211_BAND_6GHZ;
> +}

ath11k_mac_supports_station_tpc()

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
