Return-Path: <SRS0=748x=PQ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC73BC433F5
	for <ath11k@archiver.kernel.org>; Thu, 28 Oct 2021 10:07:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6175C6044F
	for <ath11k@archiver.kernel.org>; Thu, 28 Oct 2021 10:07:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6175C6044F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tYSh0yl3bmJRCOzUda73dgNrsuT9/53Sk1KidANgklo=; b=mNNvdg4ZC8ITAG
	ubdzLJjhcsEIK28ZwpEdnIBZ4paHGslUawTEGinBxOn1k/PJ4JSdzobXwE2RErVVKcN6NuKV4td5e
	JpSCiYTVzgXtlxhfFbP1yJnZr+Lnl3e/73dyjp7g4hI/oyS/jj2juKDC6qis+dJSTcc7guYykSEhS
	/YEnaW2THrC9bSkhDtK4/MakgjFjIdyVQL7x+kylcbLuWZlhBX5FA61CAQeub8cHCYHVjNMTLNnHq
	WnZabmtTOtjdl1he4n4I+7aiX53kbBz41io+Q+BuaokRPTjPCoqheYwXe7ygQWzVCB3sANKTTL6mX
	/72iDZpKQ8E2tdH67kEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg2Jk-007Tpq-Hc; Thu, 28 Oct 2021 10:07:28 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg2Jh-007Too-9n
 for ath11k@lists.infradead.org; Thu, 28 Oct 2021 10:07:26 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1635415643; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=3AZaDE+Iw8g7xCcE9V3ga0XRcUE6ZHwB7hURcTld6+I=;
 b=ZO+SaYPfAqHGUGOze34ZOWYXPxYIWNfcYivD3R5b3waVSpmCtm0VzGEdVcc1WWGVYZ25GNKh
 0mpt7c9aQnBM4f+jzXlwfShhvc6FglBhhQvYOWlYeE/HVgtWdksw5AmQuT9Ad+0qJBc3CKet
 h7BjmjshCb5MWVZaIqG5jP1Q58g=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 617a7656c8c1b282a503cdc2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 28 Oct 2021 10:07:18
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DB3E6C4360C; Thu, 28 Oct 2021 10:07:17 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 425CBC4338F;
 Thu, 28 Oct 2021 10:07:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 425CBC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Jouni Malinen <jouni@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH 3/3] ath11k: set correct NL80211_FEATURE_DYNAMIC_SMPS for
 WCN6855
References: <20210914163726.38604-1-jouni@codeaurora.org>
 <20210914163726.38604-3-jouni@codeaurora.org>
Date: Thu, 28 Oct 2021 13:07:11 +0300
In-Reply-To: <20210914163726.38604-3-jouni@codeaurora.org> (Jouni Malinen's
 message of "Tue, 14 Sep 2021 19:37:26 +0300")
Message-ID: <87a6it5upc.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_030725_412218_8078EC89 
X-CRM114-Status: GOOD (  22.78  )
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

> From: Wen Gong <wgong@codeaurora.org>
>
> Commit "ath11k: support SMPS configuration for 6 GHz" changed "if
> (ht_cap & WMI_HT_CAP_DYNAMIC_SMPS)" to "if (ht_cap &
> WMI_HT_CAP_DYNAMIC_SMPS || ar->supports_6ghz)" which means
> NL80211_FEATURE_DYNAMIC_SMPS is enabled for all chips which support 6
> GHz. However, WCN6855 supports 6 GHz but it does not support feature
> NL80211_FEATURE_DYNAMIC_SMPS, and this can lead to MU-MIMO test failures
> for WCN6855.
>
> Disable NL80211_FEATURE_DYNAMIC_SMPS for WCN6855 since its ht_cap does
> not support WMI_HT_CAP_DYNAMIC_SMPS.
>
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath11k/core.c | 1 +
>  drivers/net/wireless/ath/ath11k/hw.h   | 1 +
>  drivers/net/wireless/ath/ath11k/mac.c  | 3 ++-
>  3 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> index 265ff225bd81..2bae8c5184d4 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -279,6 +279,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
>  		.sram_dump = &sram_dump_wcn6855,
>  		.max_tx_ring = DP_TCL_NUM_RING_MAX_QCA6390,
>  		.hal_params = &ath11k_hal_params_qca6390,
> +		.check_dynamic_smps = true,
>  	},
>  };
>  
> diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
> index c6831fb110ba..7463b96770b7 100644
> --- a/drivers/net/wireless/ath/ath11k/hw.h
> +++ b/drivers/net/wireless/ath/ath11k/hw.h
> @@ -180,6 +180,7 @@ struct ath11k_hw_params {
>  	const struct ath11k_hw_sram_dump *sram_dump;
>  	u8 max_tx_ring;
>  	const struct hal_param *hal_params;
> +	bool check_dynamic_smps;
>  };
>  
>  struct ath11k_hw_ops {
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index 1f4765e43546..97a2c92b7b9b 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -7570,7 +7570,8 @@ static int __ath11k_mac_register(struct ath11k *ar)
>  	 * for each band for a dual band capable radio. It will be tricky to
>  	 * handle it when the ht capability different for each band.
>  	 */
> -	if (ht_cap & WMI_HT_CAP_DYNAMIC_SMPS || ar->supports_6ghz)
> +	if (ht_cap & WMI_HT_CAP_DYNAMIC_SMPS ||
> +	    (ar->supports_6ghz && !ab->hw_params.check_dynamic_smps))
>  		ar->hw->wiphy->features |= NL80211_FEATURE_DYNAMIC_SMPS;

Instead of a "negative" flag I reverted the test and renamed the flag to
supports_dynamic_smps_6ghz. AFAIK QCN9074 is the only device supporting
6 GHz band so I enabled the flag only for it.

Please review my changes in the pending branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=cc692cfb9f2981691b39b601b37e4544ecf01136

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
