Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4291EC433EF
	for <ath11k@archiver.kernel.org>; Mon, 21 Mar 2022 11:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xxvHCzv//j317/Nko8OOme+bLS5TfWDSqNn9PPy0BIw=; b=t3ZQzhfOY5mH4z
	QS3HHsyFNHbIfTRsr4LIDvf3iNt8lXiFTy0a5K9aMynPw27daiOdHtWA35Pq+0ZKJmLvnCieGA4Gt
	KWyDlBfLR6JJFxrp1NQbCCeHe3I4vSz0w5NXpITMvLaaBNkeCWwufUyC8eculFSlKrcIOSgvT/p7u
	UctBJlr+qE3IiWfEvI8LA6mDOymZbwidDTDQyrnBXGRg662N5bHn6FQsZh4/mRSkyaMPJTyim7H8s
	urXNs7HrYoKiMGiSloJOh8VM5rFlA0VGhOs2Vt1ehjc1qyNrurlm6jPSR9hXF3gnmb0PKeer8S411
	z4ifaExWpgANcgQs3uHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWGZV-007UIU-RB; Mon, 21 Mar 2022 11:51:37 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWGZE-007UA0-33
 for ath11k@lists.infradead.org; Mon, 21 Mar 2022 11:51:21 +0000
Received: by mail-ej1-x635.google.com with SMTP id d10so29230836eje.10
 for <ath11k@lists.infradead.org>; Mon, 21 Mar 2022 04:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=31mi1xSjYY2wTa+khnQ3+dG3iEIyKWgXiXOvGCIrKBE=;
 b=jfFZ8VsFI1HdLREUwkEXd8rFqvLRXM+yai7M/Md38tN+Zgmen+m0EfUYdbVZ/eIXaw
 0u4nXDxU/wuVDeS3CMnlD2UvpWKsVkrry9fkMIbjeOenM+hWcoAjOMR1QJ2NUAEI6GAg
 wv8z8JNiN+MEtPMhqj8f0sXCyHFv2a3ILzzwrLiG1H2LbU816FLj2yreFtSYYjc/uJq5
 ZJxsH/WF9mYVu/levNzwoXmfH0cx7lqPEnx6B7al/tF8fh3K6vaubw4PpmZR9fqIJdRP
 I13VOepbJoH5HNNYmxfwlwvWGLw6dlJ/s2k8kW1B13nRPnMFkqwykh6PdTJ6yrxYj5ng
 wl3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=31mi1xSjYY2wTa+khnQ3+dG3iEIyKWgXiXOvGCIrKBE=;
 b=3RdsRXfSKwIvEMF/8yZvJc+FSJTP/NzE+PggnTlyuRJjEkh1aUVF6ljTw0j2DHFRFu
 Ln/kX7j41GVWp7ug2e9trzceCWi5e3tg6+ni9Ud8nEmvkVIQOp0aeKfMJ49u+iu0RKOt
 Tv4uarwkhbQjUozvkUQ11E/lIw5tmHIDsNx5JeEc9MKKgHNlgpRS+IN5r5+AvEAWkmDZ
 mVEP52EaDQBLl4gEiAeA+ScPW6yaT97b4fgqnaeOjQLtvhRskCWrsPIc1YUsC5lrEnVK
 rj+soNq4WQ/XO5Y7XEaSpj/UoI1cxwvG+LtlYMDIMOcm7dw+HZuc2jALLKilULw2VyRI
 bP6A==
X-Gm-Message-State: AOAM533xTLYEtrVltICKSd2/X1s2AdUR3W9XQui16jqrruG60yENEe1/
 6RHEmr7WAfz7xNvhxgxfNkw=
X-Google-Smtp-Source: ABdhPJzhR3m6WoS4q0lvp2YisKZtGfj14YEvdA15dKdTpcMajLdKU8aw+FTomp6V/1deqGCz8I2D3g==
X-Received: by 2002:a17:907:ea1:b0:6df:7900:e4de with SMTP id
 ho33-20020a1709070ea100b006df7900e4demr19925395ejc.26.1647863477497; 
 Mon, 21 Mar 2022 04:51:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:cc83:eef0:7bf1:a0f8:a9aa:ac98?
 (ptr-dtfv0pmq82wc9dcpm6w.18120a2.ip6.access.telenet.be.
 [2a02:1811:cc83:eef0:7bf1:a0f8:a9aa:ac98])
 by smtp.gmail.com with ESMTPSA id
 x12-20020a50d9cc000000b0040f70fe78f3sm7969608edj.36.2022.03.21.04.51.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 04:51:17 -0700 (PDT)
Message-ID: <306b8f3c-55ff-24a3-1f7f-31c0b9e247fc@gmail.com>
Date: Mon, 21 Mar 2022 12:51:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] ath11k: acquire ab->base_lock in unassign when finding
 the peer by addr
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Carl Huang <cjhuang@codeaurora.org>
References: <20220314215253.92658-1-dossche.niels@gmail.com>
 <87zgljmvne.fsf@kernel.org>
From: Niels Dossche <dossche.niels@gmail.com>
In-Reply-To: <87zgljmvne.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_045120_184714_0052C7DE 
X-CRM114-Status: GOOD (  17.34  )
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

On 21/03/2022 11:45, Kalle Valo wrote:
> Niels Dossche <dossche.niels@gmail.com> writes:
> 
>> ath11k_peer_find_by_addr states via lockdep that ab->base_lock must be
>> held when calling that function in order to protect the list. All
>> callers except ath11k_mac_op_unassign_vif_chanctx have that lock
>> acquired when calling ath11k_peer_find_by_addr. That lock is also not
>> transitively held by a path towards ath11k_mac_op_unassign_vif_chanctx.
>> The solution is to acquire the lock when calling
>> ath11k_peer_find_by_addr inside ath11k_mac_op_unassign_vif_chanctx.
>>
>> Fixes: 701e48a43e15 ("ath11k: add packet log support for QCA6390")
>> Signed-off-by: Niels Dossche <dossche.niels@gmail.com>
>> ---
>>  drivers/net/wireless/ath/ath11k/mac.c | 12 +++++++++---
>>  1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
>> index 07f499d5ec92..5db2333478a2 100644
>> --- a/drivers/net/wireless/ath/ath11k/mac.c
>> +++ b/drivers/net/wireless/ath/ath11k/mac.c
>> @@ -7077,9 +7077,15 @@ ath11k_mac_op_unassign_vif_chanctx(struct ieee80211_hw *hw,
>>  	WARN_ON(!arvif->is_started);
>>  
>>  	if (ab->hw_params.vdev_start_delay &&
>> -	    arvif->vdev_type == WMI_VDEV_TYPE_MONITOR &&
>> -	    ath11k_peer_find_by_addr(ab, ar->mac_addr))
>> -		ath11k_peer_delete(ar, arvif->vdev_id, ar->mac_addr);
>> +	    arvif->vdev_type == WMI_VDEV_TYPE_MONITOR) {
>> +		struct ath11k_peer *peer;
> 
> In the pending branch I moved the declaration to the beginning of the
> function and added this to the commit log:
> 
> "I am currently working on a static analyser to detect missing locks and
> this was a reported case. I manually verified the report by looking at
> the code, but I do not have real hardware so this is compile tested
> only."
> 

Sounds good to me. Thanks!

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
