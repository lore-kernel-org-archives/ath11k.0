Return-Path: <SRS0=lr6B=NS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DB49C432BE
	for <ath11k@archiver.kernel.org>; Fri, 27 Aug 2021 06:53:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6CBF60F92
	for <ath11k@archiver.kernel.org>; Fri, 27 Aug 2021 06:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D6CBF60F92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UYwxtCtejRsWFzwY+sWn/SWL24R4VW65uXGE71Utc7Y=; b=NAU9qTkhoTCtm7W/p6k3odwHIb
	0ZRvpfewJSkiApX6ZV1wgwFrr4Hafoeul+VGuinCafRz+hi1fAdGdTZOjI+eOkIFOEqh08z72Ehpd
	N+HFYgHDEJyCQEwAr+VrKesWLIApJJfPaA3wEQXrrDyKCp38JSLFB1KVa86HpB5R5V/IXUQ7b4RfC
	IQ1gKr4bbdBrdXrs3BBLuei1OQYK0mACdFAWF/DNYQcvUZUkpHYxreIMBXPwbUvdDToWFDh2rHlgI
	814yeVh0sD1W7RpgRwyv5kGMv9g+fEcnPdMn0kt2KhoG7K2NozwpL6k+abGeKlkLyPfT/+s2/b4Ot
	fRXaykRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJVkE-00BiGY-L5; Fri, 27 Aug 2021 06:53:42 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJVk7-00BiF3-Nn
 for ath11k@lists.infradead.org; Fri, 27 Aug 2021 06:53:40 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1630047216; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=AJV7Q6czYcMi4KLMzcD/A2eh7WPmYMiRyUK5jnvafSk=;
 b=rthl6kGehjIPQwwL24KId6xNov5maelg+FIzumF/grfstjXV7AmBvARzTv4VgQTbk9X6W+f+
 VbpWsKyawe7r3ID6gMu30VlvQ1piW7MZFZmX3RNpSaYEXL6Okj4IPWJG68H8PYuaqiixM6EH
 lvEc2SehRbXTBOasz4EDNX/ILyo=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 61288bd9cd680e89692e415a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 27 Aug 2021 06:53:13
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 01740C4360D; Fri, 27 Aug 2021 06:53:12 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9D753C4338F;
 Fri, 27 Aug 2021 06:53:12 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 27 Aug 2021 14:53:12 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2 8/8] mac80211: save transmit power envelope element and
 power constraint
In-Reply-To: <48ad47869e703cbef437378c508d6a5b64c160ae.camel@sipsolutions.net>
References: <20210820122041.12157-1-wgong@codeaurora.org>
 <20210820122041.12157-9-wgong@codeaurora.org>
 <dfe27f657b4615369cf751d394f5cba75f5fdcc1.camel@sipsolutions.net>
 <25fcede26b99604a03d0b321b7120db4@codeaurora.org>
 <48ad47869e703cbef437378c508d6a5b64c160ae.camel@sipsolutions.net>
Message-ID: <db22a4cb9a07e3845a50f436c7052feb@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_235336_657736_604E5783 
X-CRM114-Status: GOOD (  15.93  )
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

On 2021-08-27 14:46, Johannes Berg wrote:
> On Fri, 2021-08-27 at 10:11 +0800, Wen Gong wrote:
>> > Also, if we're doing this anyway, then we can change
>> > the code above (perhaps as a separate patch) to not do
>> > cfg80211_find_ext_ie() but rather take it out of the parsed.
>> do you mean NOT use cfg80211_find_ext_ie()/cfg80211_find_ie() and 
>> still
>> use "struct ieee802_11_elems elems" here and
>> move this code to a separate function/patch?
> 
> Well, there's an existing place in this function that uses
> cfg80211_find_ext_ie(), and various uses of ieee80211_bss_get_ie(), so
> it feels like if we're going to do the full parsing, we should switch
> all the existing "look up an element" to also use the parsed data
> instead.
> 
> Not the other way around :)
ok.
so it ha 2 way to change, right?
1.
change ieee802_11_parse_elems() to ieee80211_bss_get_ie()

2.
still use ieee802_11_parse_elems(), and change others 
ieee80211_bss_get_ie()/cfg80211_find_ext_ie()
to use the result of ieee802_11_parse_elems()
> 
> johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
