Return-Path: <SRS0=0MIV=NB=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40486C4338F
	for <ath11k@archiver.kernel.org>; Tue, 10 Aug 2021 15:55:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0E0F60E97
	for <ath11k@archiver.kernel.org>; Tue, 10 Aug 2021 15:55:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D0E0F60E97
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5iTE+RBGuNRDjIp3/N+UkdXjHwG1Vy9DdmLjoyhUg+c=; b=pBPH9BZwEJBz/WWjflIYPouOhW
	oBu/eZ/UQN20Cgq/LwKPt8KRM7UiOZE5qhAPchJsbJlem87/9RiUdUXoXOXhqoyp8S0RiE/sCh/fo
	6Vb7jRoNaiN8J/ZfVW/pu3izOWTFzIgmAyMvwT4RW2h+LSa/DlXBF3oDAXwMi67fct8/X8u6xYTGy
	02PS1KcI8UdMCZll8tOR2EAT4D9qSbZlZvqSYybFOICmt+1CJk4hbEHYXRb6Ic6ibpMp68lWjFHiR
	UgWkriplysVJAyhC4TsfI38Z1wAmiB55DkZUGC1mg/50ORTlTSQZ+puX1+pMIgIFkX8qtlmsoqyMb
	RqSMkjzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDU5m-004Nc7-6o; Tue, 10 Aug 2021 15:55:02 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDU5a-004NZx-MI
 for ath11k@lists.infradead.org; Tue, 10 Aug 2021 15:55:01 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1628610898; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=0EHxLVlZlJBMo/aM7aac2qrxctgwztSCU2PKgDLdGHw=;
 b=WwNSO0hFx6N5A80MWG8J0fqFRNBcHh5iNgXITzRJZrTgY9vAtSYSoXTvDmvW7yNGRmtlGDNd
 AsnlPsOEvYzxn0KsOF8T1loqCfXKBaHc3zAlN7BDw57fv0hasPtbz00tt3sIzW28mvVaUpv3
 1udy8rW+aHYKEnXcA1YSGSuKseA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6112a14076c3a9a17216b92d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 10 Aug 2021 15:54:40
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 57875C433D3; Tue, 10 Aug 2021 15:54:39 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: jjohnson)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8E2C9C433F1;
 Tue, 10 Aug 2021 15:54:37 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 10 Aug 2021 08:54:37 -0700
From: Jeff Johnson <jjohnson@codeaurora.org>
To: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, ath11k
 <ath11k-bounces@lists.infradead.org>
Subject: Re: [PATCH v5 3/3] ath11k: Add support for beacon tx mode
In-Reply-To: <1628585783-21139-4-git-send-email-mkenna@codeaurora.org>
References: <1628585783-21139-1-git-send-email-mkenna@codeaurora.org>
 <1628585783-21139-4-git-send-email-mkenna@codeaurora.org>
Message-ID: <f5df29c9e3322a82198bf21689779326@codeaurora.org>
X-Sender: jjohnson@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_085458_335860_ECD96B13 
X-CRM114-Status: GOOD (  21.32  )
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

On 2021-08-10 01:56, Maharaja Kennadyrajan wrote:
> Add support to configure the beacon tx mode in
> the driver.
> 
> Beacons can be sent out in burst(continuously in a single shot
> one after another) or staggered (equally spread out over beacon
> interval) mode.
> 
> Use the below configuration in the hostapd/wpa_supplicant
> for AP/MESH mode to configure the beacon tx mode.
> 
> "beacon_tx_mode=N", where N = 1 for STAGGERED beacon mode
> and N = 2 for BURST beacon mode.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-00480-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath11k/mac.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c
> b/drivers/net/wireless/ath/ath11k/mac.c
> index e9b3689..2eda788 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -2136,7 +2136,10 @@ static void 
> ath11k_mac_op_bss_info_changed(struct
> ieee80211_hw *hw,
> 
>  	if (changed & BSS_CHANGED_BEACON) {
>  		param_id = WMI_PDEV_PARAM_BEACON_TX_MODE;
> -		param_value = WMI_BEACON_STAGGERED_MODE;
> +		if (info->beacon_tx_mode == NL80211_BEACON_BURST_MODE)
> +			param_value = WMI_BEACON_BURST_MODE;
> +		else
> +			param_value = WMI_BEACON_STAGGERED_MODE;
>  		ret = ath11k_wmi_pdev_set_param(ar, param_id,
>  						param_value,
> ar->pdev->pdev_id);
>  		if (ret)
> @@ -2144,8 +2147,9 @@ static void ath11k_mac_op_bss_info_changed(struct
> ieee80211_hw *hw,
>  				    arvif->vdev_id);
>  		else
>  			ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
> -				   "Set staggered beacon mode for VDEV:
> %d\n",
> -				   arvif->vdev_id);
> +				   "Set %s beacon mode for VDEV: %d mode:
> %d\n",
> +				   param_value ? "burst" : "staggered",

Suggest this should be param_value == WMI_BEACON_BURST_MODE ?
or other similar logic since ideally code should avoid making 
assumptions about the values assigned to enumerators

> +				   arvif->vdev_id, param_value);
> 
>  		ret = ath11k_mac_setup_bcn_tmpl(arvif);
>  		if (ret)
> --
> 2.7.4

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
