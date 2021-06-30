Return-Path: <SRS0=ylbk=LY=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE07EC11F65
	for <ath11k@archiver.kernel.org>; Wed, 30 Jun 2021 05:18:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F6516127C
	for <ath11k@archiver.kernel.org>; Wed, 30 Jun 2021 05:18:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F6516127C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1QitzdfWORyznOYCYy6B3DOTDA8neTml7Qig6vle6iE=; b=EzmDMuemAueeLE7vJmNzUzwMzD
	5V1zTZtkCsRmw53iB0dMeXn2OXgpjz2lpBjF+Hp8RZYVWn10yBn5CARWkVYieAURetWMeKjRdmvP4
	9f3jL1mbycEJjtqAs0rrplaNT3MGRMMGIMLm2dDwoJxaPIfq7o/x0ruMyUVsUjG3hqUSZ7+xOdGF0
	GsqesRSirL7rlu0xCaXCc1rczkqBuOLP8DlUuQ7pjCqEWoNpJdElOApEPGYaoeg0/Q3efp7isZic1
	2He4J0v24IAQQ/HET8o9aaQwY6B0tqJNc6WRsNrH8g9B9nzCQay2JGyRiWGvFE/giceSnwEoqCYxt
	9lcXWdlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lySbr-00CnkJ-8i; Wed, 30 Jun 2021 05:18:03 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lySbn-00Cnjt-RK
 for ath11k@lists.infradead.org; Wed, 30 Jun 2021 05:18:01 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1625030276; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=r6StrvAgtSjDvxY5bx8SeVF3UJV/4tFr9nqHkH2GysI=;
 b=I6+dJGFR+yOAr3se0figRmiws7QlLvjWzJcGoqJn6CTmBwAkUrCK/rQhwUtXXqFLMdyc1rmM
 aPQQ6izChdoAm3nF3QKgf6d2JrrQIo5/MaDuX3HP5T/PvIAjOWgQ4xvvTOwah//nekNHXBXp
 FxzTmNaCFTZzRnDgLMEqtmRxq3Y=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60dbfe80ad0600eedebbc86d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 30 Jun 2021 05:17:52
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8E5CDC43460; Wed, 30 Jun 2021 05:17:52 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: ppranees)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 41CF5C433F1;
 Wed, 30 Jun 2021 05:17:51 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 30 Jun 2021 10:47:51 +0530
From: P Praneesh <ppranees@codeaurora.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: Jouni Malinen <jouni@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, Karthikeyan
 Periyasamy <periyasa@codeaurora.org>
Subject: Re: [PATCH 12/12] ath11k: avoid unnecessary lock contention in
 tx_completion path
In-Reply-To: <b1dbd11a-e978-16ea-1473-7eb81399981c@nbd.name>
References: <20210615211407.92233-1-jouni@codeaurora.org>
 <20210615211407.92233-13-jouni@codeaurora.org>
 <b1dbd11a-e978-16ea-1473-7eb81399981c@nbd.name>
Message-ID: <01aa763e6a2cd58139a6b3685b8151a7@codeaurora.org>
X-Sender: ppranees@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_221759_994203_12F586CD 
X-CRM114-Status: GOOD (  16.48  )
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

On 2021-06-29 23:05, Felix Fietkau wrote:
> On 2021-06-15 23:14, Jouni Malinen wrote:
>> From: P Praneesh <ppranees@codeaurora.org>
>> 
>> Lock is not needed for the readable idr operation, so avoid 
>> spin_lock_bh
>> for the idr_find() call. No need to disable the bottom half preempt if
>> it is already in bottom half context, so modify the spin_lock_bh to
>> spin_lock in the data tx completion handler.
>> 
>> Tested-on: IPQ8074 hw2.0 AHB 
>> WLAN.HK.2.4.0.1-01734-QCAHKSWPL_SILICONZ-1 v2
>> 
>> Co-developed-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
>> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
>> Signed-off-by: P Praneesh <ppranees@codeaurora.org>
>> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
>> ---
>>  drivers/net/wireless/ath/ath11k/dp_tx.c | 18 ++++++++----------
>>  1 file changed, 8 insertions(+), 10 deletions(-)
>> 
>> diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c 
>> b/drivers/net/wireless/ath/ath11k/dp_tx.c
>> index ab9ccf0eb274..659f9d98bc0c 100644
>> --- a/drivers/net/wireless/ath/ath11k/dp_tx.c
>> +++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
>> @@ -288,19 +288,18 @@ static void ath11k_dp_tx_free_txbuf(struct 
>> ath11k_base *ab, u8 mac_id,
>>  	struct sk_buff *msdu;
>>  	struct ath11k_skb_cb *skb_cb;
>> 
>> -	spin_lock_bh(&tx_ring->tx_idr_lock);
>>  	msdu = idr_find(&tx_ring->txbuf_idr, msdu_id);
>> -	if (!msdu) {
>> +	if (unlikely(!msdu)) {
>>  		ath11k_warn(ab, "tx completion for unknown msdu_id %d\n",
>>  			    msdu_id);
>> -		spin_unlock_bh(&tx_ring->tx_idr_lock);
>>  		return;
>>  	}
>> 
>>  	skb_cb = ATH11K_SKB_CB(msdu);
>> 
>> +	spin_lock(&tx_ring->tx_idr_lock);
>>  	idr_remove(&tx_ring->txbuf_idr, msdu_id);
> Why are you doing the lookups twice instead of just using the return
> value of idr_remove?
> 
> - Felix
Yes, we will address this in the next version of the patch.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
