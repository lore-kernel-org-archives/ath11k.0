Return-Path: <SRS0=sd5d=M2=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 829CDC4338F
	for <ath11k@archiver.kernel.org>; Tue,  3 Aug 2021 08:54:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EBEF60EB9
	for <ath11k@archiver.kernel.org>; Tue,  3 Aug 2021 08:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3EBEF60EB9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1oGNQrY2WtiRRYJvKMstiC66tIOKS9MZkNAn/pGhYhA=; b=n9uzao5WXX6Jqyl/sPnVJCqynI
	PDf6gKZEEArLcNP5N0XQsGI2imSKGTXCQVrVopTCa9SaQXfqwzynVeXPetjwoRERzILsaZrGpkZ4S
	g1teDoONhQ7XN/m6IMh8n6B6wNrZ2o5shXswx4EKs1tV0gYg0f7Djt6OiLWw93kwGpcDYbLrGOFGV
	ORfpfI8UTakvldB7ey3El7ffjGEVXc+l9pzrK6vTEjrFrX46i2grVTj9OyhwBzyVQpdE+8wfrXvp6
	n9VVtOFh/FaI8tIzRVC9GsqgiJJA65yC/9mPF1YTYbi/ujo9kf2M9Qx75W0D+vki9Jwg9gZh5fqXm
	kT8tehTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAqBW-001f4J-4L; Tue, 03 Aug 2021 08:54:02 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAqBS-001f3v-M6
 for ath11k@lists.infradead.org; Tue, 03 Aug 2021 08:54:00 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1627980838; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=abStokMOHD5/rkoDLaed2ke3OYy1nFP6XjtCBnzj1nU=;
 b=JHz0R+QdJAqkEV7ljxmqsfsAHlw6mYSrpbipan4sbEhzSD9PLZY6wYup6+6+H01mQAWASo+s
 ds+FAGkNBQWem+j8HEC4OweNCT3wwlk22SZ3kT+jgeiqnD7RdbAo1SpOmCnhNY4KD9sF9HZT
 0sA4stqps8LZjjJMgn/NeBHV8uw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 610904249771b05b2492c09d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 03 Aug 2021 08:53:56
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6552AC433F1; Tue,  3 Aug 2021 08:53:56 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6959CC433D3;
 Tue,  3 Aug 2021 08:53:55 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 03 Aug 2021 16:53:55 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH 9/9] mac80211: save transmit power envelope element and
 power constraint
In-Reply-To: <1126f8d996e895ae048092b3f8aad19b@codeaurora.org>
References: <20210517201932.8860-1-wgong@codeaurora.org>
 <20210517201932.8860-10-wgong@codeaurora.org>
 (sfid-20210517_222034_029448_A9A89D57)
 <d9491db4ece67ac78eb39a1078b91a106770fbb0.camel@sipsolutions.net>
 <1126f8d996e895ae048092b3f8aad19b@codeaurora.org>
Message-ID: <270e3bd0143564b2e2ec6c359897a507@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_015358_831641_AE60594A 
X-CRM114-Status: GOOD (  25.76  )
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

Hi johannes,

Could you see my answer below?
please feel free to point out the mistakes :)

On 2021-07-30 18:47, Wen Gong wrote:
> On 2021-07-23 17:38, Johannes Berg wrote:
>> On Mon, 2021-05-17 at 16:19 -0400, Wen Gong wrote:
>>> 
>>> +		if (is_6ghz) {
>>> +			struct ieee802_11_elems elems;
>>> +			struct ieee80211_bss_conf *bss_conf;
>>> +			u8 i, n;
>>> +
>>> +			ieee802_11_parse_elems(ies->data, ies->len, false, &elems,
>>> +					       NULL, NULL);
>>> +			bss_conf = &sdata->vif.bss_conf;
>>> +			bss_conf->pwr_reduction = 0;
>>> +			if (elems.pwr_constr_elem)
>>> +				bss_conf->pwr_reduction = *elems.pwr_constr_elem;
>>> +
>>> +			memset(bss_conf->tx_pwr_env, 0, sizeof(bss_conf->tx_pwr_env));
>>> +			bss_conf->tx_pwr_env_num = elems.tx_pwr_env_num;
>>> +			n = min_t(u8, elems.tx_pwr_env_num,
>>> +				  ARRAY_SIZE(elems.tx_pwr_env));
>> 
>> If anything, that min_t would make sense only if you were actually 
>> using
>> ARRAY_SIZE(bss_conf->tx_pwr_env), but like this it's quite pointless,
>> just checking again if the element parsing was internally consistent?
>> 
>> I'd probably remove it and throw in a
>> 
>> 	BUILD_BUG_ON(ARRAY_SIZE(bss_conf->tx_pwr_env) !=
>>                      ARRAY_SIZE(elems.tx_pwr_env));
>> 
>> instead.
>> 
>>> +			for (i = 0; i < n; i++)
>>> +				memcpy(&bss_conf->tx_pwr_env[i], elems.tx_pwr_env[i],
>>> +				       elems.tx_pwr_env_len[i]);
>> 
>> You also never validated that the element wasn't too long!
>> 
> will change it.
>> 
>> If you connect to 6 Ghz with this, and then again to another AP that
>> doesn't, you'll have it stuck at the old values. You need to reset at
>> some point (during disconnect).
>> 
> will change to reset it in ieee80211_prep_channel outside is_6ghz{}.
> Then it will be reset for each connection.
>> And then two more questions:
>> 
>> 1) Could this information change? Should we track it in beacons?
>> 
> 
> The information is from AP side, it should be not changed untill the AP 
> restart.
> If someone want to change configure of AP, the AP should restart and
> then take effect by my understand.
> Is it have some case for this information change?
> 
> 
>> 2) Should we at least check it again from the protected beacon or such
>> after association, so we don't blindly trust the probe response or
>> beacon (received during scan, not validated) at least when BIGTK is in
>> use?
> 
> May we add support for BIGTK in future with another patch?
> The info(pwr_reduction and tx_pwr_env) is used by lower driver such as 
> ath11k.
> If the info changed after association, then how to notify lower driver?
> Do it like below in ieee80211_rx_mgmt_beacon()?
> And use BSS_CHANGED_TXPOWER or a new enum in ieee80211_bss_change?
> 
> ieee80211_rx_mgmt_beacon{
> 	changed |= ieee80211_handle_pwr_constr(sdata, chan, mgmt,
> 					       elems.country_elem,
> 					       elems.country_elem_len,
> 					       elems.pwr_constr_elem,
> 					       elems.cisco_dtpc_elem);
> 
> 	ieee80211_bss_info_change_notify(sdata, changed);
> }
> 
>> 
>> johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
