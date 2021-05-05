Return-Path: <SRS0=fjpk=KA=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE6EDC433ED
	for <ath11k@archiver.kernel.org>; Wed,  5 May 2021 07:18:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54BD1613BC
	for <ath11k@archiver.kernel.org>; Wed,  5 May 2021 07:18:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54BD1613BC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j9CxgsUim0G5Oj/5vUPGkwMlwEQtkjPzpvWrBgtw418=; b=nnzmPhfJETeylz2uulMD6pVOp
	RtwVHORSeHQdqXS7XR6vsO52nM3pARmkRZG2hqFM+B940SjmyA6XRqs64XAQdx00oUHrLtwyZKvvc
	o03ofnGhSp0ZRZy8dWcjiaijscrgCowHKRt+Wj7Rh4/L2E9h7yZ7hCZoBlRH8RHcSWI5ZsSajz+qt
	e7RkGztKv+cmNpShk5NKC8eU0M2hJyKR/7NbQiP2EjEEnfyWzCGxWJKyRUgrWW2mt7BMyvQw/GjBI
	21X1qWLBek7dnbqaqeXWBeskyN37JqtlNRjtJXt1JZFWafcoUxLkCccy2bHwlR+Mv7jGQziXtXgFm
	CMYdKDJOw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leBnV-000R0P-Q8; Wed, 05 May 2021 07:18:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leBnS-000QsG-H6
 for ath11k@desiato.infradead.org; Wed, 05 May 2021 07:18:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=OpInw1Tew815TdwcqGzqmtmjFZ/n9U86KvmoBeOdH2U=; b=jYjT0nC0T8Hq47vK/Q9L9khXET
 Itx1FP70RghYF0X+nX++HmU6LXhbX1mSlRsFXl1wGfJd2/TyMGgyLwKkxdPmgVM0ZmiSDV8ntPqdL
 qpi0L015atJj5gYPF3Su4yJWl9Z9iMCwBeaqalrMyuoedJ45OH/j2vP2mq4pP+icITqPJpD5fUS/U
 g/2BnGqHnAf12S82bYdyHnlj9j8xdw4LoLexEbzy1k01HL4WcHd3MzQd9G4waKAy/tje1r5xiy4Gq
 kxgv8mbu3KhJHtkrAVqrb7YagKigZm2JNI2+GQbeRbNRtp0GCSGXCrNBHxUh3zudAjlWdVVrptlwX
 Va1UkWCw==;
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leBnP-004WXx-Pq
 for ath11k@lists.infradead.org; Wed, 05 May 2021 07:18:13 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1620199089; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=OpInw1Tew815TdwcqGzqmtmjFZ/n9U86KvmoBeOdH2U=;
 b=ikaeKvrUDIhDPLU2odBXX1DtxrfOqkapv0GL6W8emlqugcdfXtn6GbyRaYrJBtHYxzT2dm2P
 Sg/OA9zeTE1g5A5SnEVAdUlcSxXbaM1Qrd8srimoK44E18vE/7qNCqjqqXuaJbJJ35DGLKuG
 pPqT1BeRbgHqVB9Z3CRcy2NQaTM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 609246ac79b6f9e57b9de969 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 05 May 2021 07:18:04
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 474E9C43460; Wed,  5 May 2021 07:18:04 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: mkenna)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9BDB3C4338A;
 Wed,  5 May 2021 07:18:03 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 05 May 2021 12:48:03 +0530
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
To: jjohnson@codeaurora.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, ath11k
 <ath11k-bounces@lists.infradead.org>
Subject: Re: [PATCH v2 1/3] nl80211: Add support for beacon tx mode
In-Reply-To: <445ba573b519b9434d0e009eb9ff6f45@codeaurora.org>
References: <1619696874-30072-1-git-send-email-mkenna@codeaurora.org>
 <1619696874-30072-2-git-send-email-mkenna@codeaurora.org>
 <445ba573b519b9434d0e009eb9ff6f45@codeaurora.org>
Message-ID: <cc2182041c5fc8f1c168a262e3a3263c@codeaurora.org>
X-Sender: mkenna@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_001811_942746_E01B43DF 
X-CRM114-Status: GOOD (  16.56  )
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

On 2021-05-03 22:54, jjohnson@codeaurora.org wrote:
> On 2021-04-29 04:47, Maharaja Kennadyrajan wrote:
> [..snip..]
>> +/**
>> + * enum nl80211_beacon_tx_mode - Beacon Tx Mode enum.
>> + *      Used to configure beacon staggered mode or beacon burst mode.
>> + */
>> +enum nl80211_beacon_tx_mode {
>> +	NL80211_BEACON_STAGGERED_MODE = 1,
>> +	NL80211_BEACON_BURST_MODE = 2,
>> +};
>> +
> [..snip..]
>> @@ -5330,6 +5331,10 @@ static int nl80211_start_ap(struct sk_buff 
>> *skb,
>> struct genl_info *info)
>>  	params.dtim_period =
>>  		nla_get_u32(info->attrs[NL80211_ATTR_DTIM_PERIOD]);
>> 
>> +	if (info->attrs[NL80211_ATTR_BEACON_TX_MODE])
>> +		params.beacon_tx_mode =
>> +
>> nla_get_u32(info->attrs[NL80211_ATTR_BEACON_TX_MODE]);
>> +
> 
> Note that in the case where NL80211_ATTR_BEACON_TX_MODE is not 
> specified that
> beacon_tx_mode will be zero, which is not a valid
> nl80211_beacon_tx_mode enumeration.
> 
> Should you renumber the nl80211_beacon_tx_mode enumerations so that the 
> default
> mode has a value of 0? Or add NL80211_BEACON_DEFAULT_MODE = 0 and
> allow the driver
> to select a default mode?

[Maha]: Yes, it will select the default mode as STAGGERED mode when the 
user set
beacon_tx_mode as 0 in the hostapd conf file.
Also, it will select the default mode as STAGGERED mode when the user 
didn't add
beacon_tx_mode config in the hostapd conf file.
This is how it is handled here already.

Regards,
Maha

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
