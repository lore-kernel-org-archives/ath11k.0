Return-Path: <SRS0=03FT=OU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 680DAC433EF
	for <ath11k@archiver.kernel.org>; Thu, 30 Sep 2021 02:54:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 255A06187F
	for <ath11k@archiver.kernel.org>; Thu, 30 Sep 2021 02:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 255A06187F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EAFywon/cJ3nNXoOhKIESmhy3EUE1hvn2iQ5rtk8j5M=; b=0HMGTf+fOeBXg5xS8o20Mo/+5+
	eQ7M8RNuOj/14gWatZ07t3PTCjNqtacRL0m7uQlX96K9ibFEXCh00+/VRtydyB64TkRceFVWA8SxB
	3I8M1zYsr1u+LfhNQkIBzCtZiomd2Y3JU+XPNORu9Og9t3kXx9hOFCkdT+q92Zw/8kXdlNX3ah2yU
	ET0VLOldKyi0f97KDjtPSbFRSe7QKYTNhDOqTUpO3ev8xUEbQQTeZ2PEzp76hxEw8goRt7If8X7NS
	EiD5W69kKPn8bzcXFYCh/ORxG9aVmIA1vSy1nd0aDaUpV6pjtDnjMVPRZr/2Fb1tNqjqePFOfma7+
	d0GzWXTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVmCv-00Cqf6-9m; Thu, 30 Sep 2021 02:54:01 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVmCr-00CqeG-Se
 for ath11k@lists.infradead.org; Thu, 30 Sep 2021 02:53:59 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632970438; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ZKMe67P/2Bw1eWMhwJ5iUv3ZOQW99FDE4dvGTY8GNEw=;
 b=Ptc/E/FWaiRjyQQEA66J33FM/gbMby5S+U9fEaSbrDYSR46eKlmNkBsxGzyEjdtUqS87LD+n
 9sgEyjMqkbGJnW6ku2tZKZb9RWA+/8AoDzR+UfxlpJc1ParkYEhKTtycHR1cgkOur7yaU4I8
 mPwlttnK+2qv4V9gsbs5sxRk9oQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 615526c19ffb413149e3c839 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 30 Sep 2021 02:53:53
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E8452C4360C; Thu, 30 Sep 2021 02:53:52 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3C024C4338F;
 Thu, 30 Sep 2021 02:53:52 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 30 Sep 2021 10:53:52 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Venkateswara Naralasetty <vnaralas@codeaurora.org>
Cc: johannes@sipsolutions.net, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, wgong=codeaurora.org@codeaurora.org
Subject: Re: [PATCH v5] cfg80211: save power spectral density(psd) of
 regulatory rule
In-Reply-To: <2afb1bf6f06cb53f43fe0d354afa4e7c@codeaurora.org>
References: <20210928085211.26186-1-wgong@codeaurora.org>
 <bd649a3d2cf2ea9064d427d633055891@codeaurora.org>
 <cb20427eae96c4551084e4c899618b94@codeaurora.org>
 <2afb1bf6f06cb53f43fe0d354afa4e7c@codeaurora.org>
Message-ID: <2ed76cff292dcca18326de0407a93821@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_195358_592001_A77232B2 
X-CRM114-Status: GOOD (  18.55  )
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

On 2021-09-30 00:46, Venkateswara Naralasetty wrote:
> On 2021-09-29 09:07, Wen Gong wrote:
>> On 2021-09-28 21:12, vnaralas@codeaurora.org wrote:
>>> On 2021-09-28 14:22, Wen Gong wrote:
>>>> 6 GHz regulatory domains introduces power spectral density(psd).
>>>> The power spectral density(psd) of regulatory rule should be take
>>>> effect to the channels. Save the values to the channel which has
>>>> psd value and add nl80211 attributes for it.
>>>> 
>>>> Signed-off-by: Wen Gong <wgong@codeaurora.org>
>>>> ---
>> ...
>>>> 
>>>> @@ -2540,6 +2554,9 @@ static void handle_channel_custom(struct wiphy 
>>>> *wiphy,
>>>>  			chan->dfs_cac_ms = IEEE80211_DFS_MIN_CAC_TIME_MS;
>>>>  	}
>>>> 
>>>> +	if (chan->flags & IEEE80211_CHAN_PSD)
>>>> +		chan->psd = reg_rule->psd;
>>>> +
>>>>  	chan->max_power = chan->max_reg_power;
>>> 
>>> What about the case AP + STA concurrency? are we going to overwrite
>>> the PSD power and channel flags?
>>> 
>> 
>> Hi Venkateswara,
>> 
>> This patch is not relation with AP + STA concurrency.
>> For example, it also has other power intersection in
>> handle_channel_adjacent_rules().
>> 
>> 		chan->max_reg_power =
>> 			min_t(int, MBM_TO_DBM(power_rule1->max_eirp),
>> 			      MBM_TO_DBM(power_rule2->max_eirp));
>> 
>> For AP + STA concurrency, it should to maintain 2 group of reg rules,
>> one is for AP, another is for STA.
> 
> Can we maintain two power rules in the same channel one for AP and one
> for STA. In this way, we can update the power rules in the same
> channel for both AP and STA from the reg rules.
> 
> Otherwise, we need to maintain multiple channel lists in sband for all
> supported power mode combinations to apply the respective power rules
> and build channel flags from the multiple reg rules.
> right?

If AP+STA is up in the same wiphy/ieee80211_hw, and AP's reg rules is 
different
with STA, then it should maintain muti channel list for each band of the 
wiphy/ieee80211_hw
by my understand.

Currently there is only one "struct ieee80211_supported_band 
*bands[NUM_NL80211_BANDS]"
in "struct wiphy".

I advise to discuss the AP + STA concurrency in another mail thread 
since it is not
relative with this patch.

> 
>> This patch is to handle PSD info in the same reg rules.
>> It is to process only one reg rule in the reg rules.
>> AP + STA concurrency is a higher level things than this patch.
>>>>  }

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
