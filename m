Return-Path: <SRS0=n+kH=PR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B441C433EF
	for <ath11k@archiver.kernel.org>; Fri, 29 Oct 2021 02:30:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B336610C7
	for <ath11k@archiver.kernel.org>; Fri, 29 Oct 2021 02:30:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2B336610C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cXou7rx8jMIiGgUBrWekrGyxwBASvJrwQxiWJA3Od+E=; b=n0/1+vw4dgeZKg1kjJrtJtT0Ie
	PbHXG8RTQjK/j49ULxnxotnMV5Ql6fyfByIdd7+1IT6PfYuenas5j6//52RFXTfpIE6ci7q+8JFzt
	YzKwdhURE5Vwes9erPLp8JDXOmSLFLnh6M00/6SzrUNELvdKg7TwmF9eTHBFIWon4f5kxqesh7JnB
	mnWjH/xc7NNQSZrh2y0iSCVrMKDcYSDpBy5b8mDTsXjjizVhvP/IebYpFG70ALOv5jp31rTBBNQdZ
	0889mNWe17Fr95tPHMukHjsFnD/kDGeGOaiP7WhMgEwpc8zEVqkmfsfuXauqqLnMDHVbhF1+Td0UK
	2oaGyTfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgHfK-009agA-Tv; Fri, 29 Oct 2021 02:30:46 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgHfH-009afb-R0
 for ath11k@lists.infradead.org; Fri, 29 Oct 2021 02:30:45 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1635474642; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=wcrDjJzQSDlZlOocrUwmswx3ElWAGGaa4tJSF8O252E=;
 b=E7ZciZJOtt8aLwRmL7y18s1E6CcVOD80Juga2F+jLJdH8LodTDlEe5HN/T5xS4aNVqzpuvv4
 4rX+WiASMPbocm85SfT9WPz6Zu9knhThBvlr9fMWCIkGA6TroEezg+NwJHNg+N2DtrgVIv/Y
 VXwbFD8ymmCGE5HgcAw5NFy6Ec4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 617b5ccc648aeeca5c52f91b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 29 Oct 2021 02:30:36
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 02A72C43460; Fri, 29 Oct 2021 02:30:36 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 28E3FC4338F;
 Fri, 29 Oct 2021 02:30:34 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 29 Oct 2021 10:30:34 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Jouni Malinen <jouni@codeaurora.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org
Subject: Re: [PATCH 3/3] ath11k: set correct NL80211_FEATURE_DYNAMIC_SMPS for
 WCN6855
In-Reply-To: <87a6it5upc.fsf@codeaurora.org>
References: <20210914163726.38604-1-jouni@codeaurora.org>
 <20210914163726.38604-3-jouni@codeaurora.org>
 <87a6it5upc.fsf@codeaurora.org>
Message-ID: <50c21cd4f727e61c7602a61fe37258df@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_193043_981880_50D6ECA7 
X-CRM114-Status: GOOD (  12.90  )
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

On 2021-10-28 18:07, Kalle Valo wrote:
> Jouni Malinen <jouni@codeaurora.org> writes:
> 
>> From: Wen Gong <wgong@codeaurora.org>
>> 
...
>> diff --git a/drivers/net/wireless/ath/ath11k/mac.c 
>> b/drivers/net/wireless/ath/ath11k/mac.c
>> index 1f4765e43546..97a2c92b7b9b 100644
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
> 
> Instead of a "negative" flag I reverted the test and renamed the flag 
> to
> supports_dynamic_smps_6ghz. AFAIK QCN9074 is the only device supporting
> 6 GHz band so I enabled the flag only for it.
> 
> Please review my changes in the pending branch:
Thanks.
the change is OK for WCN6855/QCA6390.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=cc692cfb9f2981691b39b601b37e4544ecf01136

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
