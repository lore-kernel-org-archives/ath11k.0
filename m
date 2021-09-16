Return-Path: <SRS0=kuZe=OG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC93C433EF
	for <ath11k@archiver.kernel.org>; Thu, 16 Sep 2021 09:14:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6446E61108
	for <ath11k@archiver.kernel.org>; Thu, 16 Sep 2021 09:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6446E61108
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SgC3SQQOH27vJdZ4lPZrrj+fXoy0PE873nzNNwteBrY=; b=uZBSwqNit3GLis
	KiY3ggfB38oBM368GGgcR9ypn7O5V/qP9beRNEH4vcoClH+eP8drJf8dGjpINHA+FGjUtRjleJ96a
	Y96kA94Nc+ey9y2zm7QDoqHhvCou0LlQj1ss7j+AB0KFTrK6wXpR8RH2cQYIX8S08p7HQR6sneOhi
	S6p+bD3HTH86xBS1HBgirdvDYR1/Vla0dzxorlWT0ALaw9anxSdF92dDGoBE2S2K0/RrzTICLyCpY
	AgqBtb0RPO9u5JwzjaYMZekDX3awbgPR5yPPk/4dqeoaB8oFcLuagsvnHPccHzsEBrdAVpKztgPce
	mrZfy1kbgEvTThctGMkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQnTn-00AeP4-H4; Thu, 16 Sep 2021 09:14:51 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQnTK-00Ae96-9u
 for ath11k@lists.infradead.org; Thu, 16 Sep 2021 09:14:26 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631783663; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=GK5RrJBohqVNyxkCsNpqXozYtZFMscFYkIM9WyaOMZQ=;
 b=GPfWRjqxjPwM+CIcPD+hwoOvM2Law5qgQZZSSKzV5q1QIcLfhpqrKIsBmqfeIMdgRXjAZBX6
 yx/0gDtLbYuct+FDm8S7AFlSR6m/ANpmv9rA6zxUGYztyYTwnoVJxz2qL0nGRx4xrdBNBhNv
 a2ExEM8FOPpCw9g0RXBBuWgf3ts=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 61430ae0648642cc1c445732 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 16 Sep 2021 09:14:08
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D3DA2C43460; Thu, 16 Sep 2021 09:14:07 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4CFDEC4338F;
 Thu, 16 Sep 2021 09:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 4CFDEC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Jouni Malinen <jouni@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Sathishkumar Muruganandam <murugana@codeaurora.org>
Subject: Re: [PATCH 1/2] ath11k: fix 4-addr tx failure for AP and STA modes
References: <20210720213147.90042-1-jouni@codeaurora.org>
Date: Thu, 16 Sep 2021 12:14:02 +0300
In-Reply-To: <20210720213147.90042-1-jouni@codeaurora.org> (Jouni Malinen's
 message of "Wed, 21 Jul 2021 00:31:46 +0300")
Message-ID: <87wnngzxut.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210916_021423_909319_A92D856E 
X-CRM114-Status: GOOD (  22.13  )
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

Jouni Malinen <jouni@codeaurora.org> writes:

> From: Sathishkumar Muruganandam <murugana@codeaurora.org>
>
> Ath11k FW requires peer parameter WMI_PEER_USE_4ADDR to be set for
> 4-addr peers allowing 4-address frame transmission to those peers.
>
> Add ath11k driver callback for sta_set_4addr() to queue new workq
> set_4addr_wk only once based on new boolean, use_4addr_set.
>
> sta_set_4addr() will be called during 4-addr STA association cases
> applicable for both AP and STA modes.
>
> In ath11k_sta_set_4addr_wk(),
>
> AP mode:
>         WMI_PEER_USE_4ADDR will be set for the corresponding
>         associated 4-addr STA(s)
>
> STA mode:
>         WMI_PEER_USE_4ADDR will be set for the AP to which the
>         4-addr STA got associated.
>
> Tested-on: IPQ8074 WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Sathishkumar Muruganandam <murugana@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath11k/core.h |  3 ++
>  drivers/net/wireless/ath/ath11k/mac.c  | 48 ++++++++++++++++++++++++--
>  2 files changed, 49 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
> index 018fb2385f2a..11c8dffd0236 100644
> --- a/drivers/net/wireless/ath/ath11k/core.h
> +++ b/drivers/net/wireless/ath/ath11k/core.h
> @@ -362,6 +362,7 @@ struct ath11k_sta {
>  	enum hal_pn_type pn_type;
>  
>  	struct work_struct update_wk;
> +	struct work_struct set_4addr_wk;
>  	struct rate_info txrate;
>  	struct rate_info last_txrate;
>  	u64 rx_duration;
> @@ -374,6 +375,8 @@ struct ath11k_sta {
>  	/* protected by conf_mutex */
>  	bool aggr_mode;
>  #endif
> +
> +	bool use_4addr_set;
>  };

[...]

> +static void ath11k_mac_op_sta_set_4addr(struct ieee80211_hw *hw,
> +					struct ieee80211_vif *vif,
> +					struct ieee80211_sta *sta, bool enabled)
> +{
> +	struct ath11k *ar = hw->priv;
> +	struct ath11k_sta *arsta = (struct ath11k_sta *)sta->drv_priv;
> +
> +	if (enabled && !arsta->use_4addr_set) {
> +		ieee80211_queue_work(ar->hw, &arsta->set_4addr_wk);
> +		arsta->use_4addr_set = true;
> +	}
> +}

There's no locking for accessing arsta->use_4addr_set. Most likely it's
just a theoretical issue but wanted to point out anyway. Maybe mac80211
handles serialisation of this callback?

I'm going to apply this patch anyway so that I get my patch queue
smaller, we can fix any issues in a followup patch.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
