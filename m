Return-Path: <SRS0=kuZe=OG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22D51C433EF
	for <ath11k@archiver.kernel.org>; Thu, 16 Sep 2021 10:08:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6BFC60EB6
	for <ath11k@archiver.kernel.org>; Thu, 16 Sep 2021 10:08:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D6BFC60EB6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TmZTTmTJUpmud6CKXd/qOKu/8t14+fLPIIL8x8d7F8g=; b=Lqlrol6Jrkh4Jj
	Rnkp9e5NUoUTHdM/nH+WpJTQ2SupMHcwHfPYnnDHGCm3/rKIVlT5UEv+DvoT02dqNhvzWF2LspkCr
	En1mVSjhEVpIf2JbTd3uPcoqAWhainBunia/uDokfU6PMmygJWUfaj4YGbEh94BC/kKyZLVWqVTi+
	XdNlsL0xXN5NhEtbS3i4LiPe9y7hLY4EltLI8CRrtPBKLn11vVfgGM7sCKqpRHYxrNRbioROD2Oo3
	38usfg2OgvZjpqjxsbJ+4+WxkrgtQSs9TNcdJ/k/xn9As946dBle06/YfRAXHmTauuRex1tAELtqX
	a/NsseH9KtbNysbguczw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQoK7-00Aopo-Ru; Thu, 16 Sep 2021 10:08:55 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQoK4-00Aool-5a
 for ath11k@lists.infradead.org; Thu, 16 Sep 2021 10:08:54 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631786933; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=sMyFM1XxKIFNAeT1EdCNPlgOLieY17FvRZjGIhPfWRI=;
 b=FKPp3Njyy031/3Y9JAOdHm+A8z2MC8VNR89JT9vRfcVKtkMJ0VGlGVXYuHs81FVqe9LfEwiS
 miZqyjklXjt/za0WZisnizMyZiItYv9kYsLxRj3JDYH+nljQG8gKqNtSSjB1EbjZB2LdCMsi
 q2xc391NQSptxbefykr+rGPMq+U=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 61431790d914b05182406533 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 16 Sep 2021 10:08:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 38B94C4360D; Thu, 16 Sep 2021 10:08:15 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 63B72C4338F;
 Thu, 16 Sep 2021 10:08:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 63B72C4338F
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
Date: Thu, 16 Sep 2021 13:08:08 +0300
In-Reply-To: <20210914163726.38604-3-jouni@codeaurora.org> (Jouni Malinen's
 message of "Tue, 14 Sep 2021 19:37:26 +0300")
Message-ID: <875yv0zvcn.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210916_030853_252919_62FB8A81 
X-CRM114-Status: GOOD (  16.46  )
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

[...]

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
>  
>  	ar->hw->wiphy->max_scan_ssids = WLAN_SCAN_PARAMS_MAX_SSID;

This hunk failed, in the pending branch as I don't have that
ar->supports_6ghz check. I'll drop this patch 3 for now, let's revisit
after my queue of ath11k patches is smaller.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
