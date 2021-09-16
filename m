Return-Path: <SRS0=kuZe=OG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C1B6C433F5
	for <ath11k@archiver.kernel.org>; Thu, 16 Sep 2021 14:09:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B663F61056
	for <ath11k@archiver.kernel.org>; Thu, 16 Sep 2021 14:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B663F61056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n8v+mneeFHm6lybg5m+PfkmcL0YVI/X8Ge8dwnK3n00=; b=Xs4wg4hkZXQGECZSsH/cXUTQd6
	N5NLqW1gQOdwBAEv9//qo+aosUWsHz8jDk7RlfelQq+f+Y61nqVfl5yzOsL7tNK3v+tcOFm7C4f+C
	CSYMtvhtPVr3y72bXX8Af2tytqzp6cozCS4jm0u+E9fz4xURy/mvVWaNuaETgnR+5FxApTFSAcjeU
	q1gyNdsdiE3poSPrWx7Daz5hU4+rR1SB/h7TiJruBF8pBZymsQuRZDjsGNwLOYfch+58bRniffg9r
	HwkwNSvs5igTNfMb6HKon/I9Q6e1yMDFVfFJZKLAmoiPprq8TLmenkTPN7WhgtIPQS6k9pMOOQnMX
	J5tB7Krw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQs59-00BISl-Kf; Thu, 16 Sep 2021 14:09:43 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQs52-00BISK-P4
 for ath11k@lists.infradead.org; Thu, 16 Sep 2021 14:09:42 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631801380; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=kfWwSfeJ4uB1YBXQt2Si8k+yxFnF4PGMz82PeiLD3rU=;
 b=dIm+haTqb7oIwlSTaLq+pv6mLP5uDBT6Ll9rzBl0k6pzJlEJFowrWV+iI9FEsTrSarUBDYwH
 L97+txA5l1LZo3PsGZeN3s8/ANA+ikg0rIqlW42jOP41OFPjf0snbFB6EAs+qX0JOyQZMIE0
 YpTPUe8g0ocJJHwenlnSSrn90sI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 61434ffd65c3cc8c6306f4e8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 16 Sep 2021 14:09:01
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2D912C43616; Thu, 16 Sep 2021 14:09:01 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7AC92C4338F;
 Thu, 16 Sep 2021 14:09:00 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 16 Sep 2021 22:09:00 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Jouni Malinen <jouni@codeaurora.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org
Subject: Re: [PATCH 3/3] ath11k: set correct NL80211_FEATURE_DYNAMIC_SMPS for
 WCN6855
In-Reply-To: <875yv0zvcn.fsf@codeaurora.org>
References: <20210914163726.38604-1-jouni@codeaurora.org>
 <20210914163726.38604-3-jouni@codeaurora.org>
 <875yv0zvcn.fsf@codeaurora.org>
Message-ID: <6ec81d2b9ec3a2665570baf90e624bf5@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210916_070940_810089_FB5B8BB9 
X-CRM114-Status: GOOD (  15.29  )
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

On 2021-09-16 18:08, Kalle Valo wrote:
> Jouni Malinen <jouni@codeaurora.org> writes:
> 
>> From: Wen Gong <wgong@codeaurora.org>
>> 
>> Commit "ath11k: support SMPS configuration for 6 GHz" changed "if
>> (ht_cap & WMI_HT_CAP_DYNAMIC_SMPS)" to "if (ht_cap &
>> WMI_HT_CAP_DYNAMIC_SMPS || ar->supports_6ghz)" which means
>> NL80211_FEATURE_DYNAMIC_SMPS is enabled for all chips which support 6
>> GHz. However, WCN6855 supports 6 GHz but it does not support feature
>> NL80211_FEATURE_DYNAMIC_SMPS, and this can lead to MU-MIMO test 
>> failures
>> for WCN6855.
>> 
>> Disable NL80211_FEATURE_DYNAMIC_SMPS for WCN6855 since its ht_cap does
>> not support WMI_HT_CAP_DYNAMIC_SMPS.
>> 
>> Tested-on: WCN6855 hw2.0 PCI 
>> WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>> 
>> Signed-off-by: Wen Gong <wgong@codeaurora.org>
>> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> 
> [...]
> 
>> --- a/drivers/net/wireless/ath/ath11k/mac.c
>> +++ b/drivers/net/wireless/ath/ath11k/mac.c
>> @@ -7570,7 +7570,8 @@ static int __ath11k_mac_register(struct ath11k 
>> *ar)
>>  	 * for each band for a dual band capable radio. It will be tricky to
>>  	 * handle it when the ht capability different for each band.
>>  	 */
>> -	if (ht_cap & WMI_HT_CAP_DYNAMIC_SMPS || ar->supports_6ghz)
>> +	if (ht_cap & WMI_HT_CAP_DYNAMIC_SMPS ||
>> +	    (ar->supports_6ghz && !ab->hw_params.check_dynamic_smps))
>>  		ar->hw->wiphy->features |= NL80211_FEATURE_DYNAMIC_SMPS;
>> 
>>  	ar->hw->wiphy->max_scan_ssids = WLAN_SCAN_PARAMS_MAX_SSID;
> 
> This hunk failed, in the pending branch as I don't have that
> ar->supports_6ghz check. I'll drop this patch 3 for now, let's revisit
> after my queue of ath11k patches is smaller.
Hi Kalle,

ar->supports_6ghz is introduced by this patch:
https://patchwork.kernel.org/project/linux-wireless/patch/20210913175510.193005-3-jouni@codeaurora.org/

@@ -7559,7 +7570,7 @@  static int __ath11k_mac_register(struct ath11k 
*ar)
  	 * for each band for a dual band capable radio. It will be tricky to
  	 * handle it when the ht capability different for each band.
  	 */
-	if (ht_cap & WMI_HT_CAP_DYNAMIC_SMPS)
+	if (ht_cap & WMI_HT_CAP_DYNAMIC_SMPS || ar->supports_6ghz)
  		ar->hw->wiphy->features |= NL80211_FEATURE_DYNAMIC_SMPS;

  	ar->hw->wiphy->max_scan_ssids = WLAN_SCAN_PARAMS_MAX_SSID;

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
