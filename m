Return-Path: <SRS0=lr6B=NS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A069C432BE
	for <ath11k@archiver.kernel.org>; Fri, 27 Aug 2021 07:13:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3629F60F5B
	for <ath11k@archiver.kernel.org>; Fri, 27 Aug 2021 07:13:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3629F60F5B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FRBmf8eIjsugR+mZERzVE6Fp9sAlfL00xDcX81QC3Jo=; b=pMz2pNpPthGiH6E1D75Lo3ngEg
	lFnbhJweoo+1i4Z4ivYEpv4HOvivfMV/dYbjczJnNBk3UQAYGphF8NzeubXc++gNg1ITI7QrIAghs
	gti49SHQAQPDUIn8j2KZ0LVaGgtaYDUxMPdhABYvOpNovipD4onZ1NecTNAFc5xO12dbxmLJ5ijP9
	7g1OvMKfAETgRTSO1iHvQkvE+4c2yTaRILzrFchEFX6e8ObXfv60F0Chje0uyu0LrWn5ZjfFcrF5o
	O998dnf6SSrDxs/VBD+MzNEhrtd9uEiL2HvDVb2xS/xkMz/f4sKwAtMvvz3x/5Opk09Pxln0lKld+
	2kfhEUnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJW30-00Bo4M-Gj; Fri, 27 Aug 2021 07:13:06 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJW2u-00Bo2A-BV
 for ath11k@lists.infradead.org; Fri, 27 Aug 2021 07:13:04 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1630048380; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=y7bGqYBYJrZ9obw/nl1mgUKbpWuQGZGbG7c80dePyBM=;
 b=kUfpTOj48j9KlRJ8CZGKwJ60JegFMa0LI7tpmgM3y59zUtRoJTIYVZ/mM4OXM3WoKuc2dEIU
 4Vj+LfjRfnqVZVHUNh9lLBVgF68Mb6NgB9aNYCoD3cs45vR26TEZ9rWyoZq5mENI9dzHLiV1
 4XImVTmLhOlIzFnNvLo5utDNWKs=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 61289068cd680e8969438d40 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 27 Aug 2021 07:12:40
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 47E23C43616; Fri, 27 Aug 2021 07:12:39 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id F39BAC4338F;
 Fri, 27 Aug 2021 07:12:37 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 27 Aug 2021 15:12:37 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2 8/8] mac80211: save transmit power envelope element and
 power constraint
In-Reply-To: <0680b508a7864e02f55d763851f7460baa73b53f.camel@sipsolutions.net>
References: <20210820122041.12157-1-wgong@codeaurora.org>
 <20210820122041.12157-9-wgong@codeaurora.org>
 <dfe27f657b4615369cf751d394f5cba75f5fdcc1.camel@sipsolutions.net>
 <25fcede26b99604a03d0b321b7120db4@codeaurora.org>
 <48ad47869e703cbef437378c508d6a5b64c160ae.camel@sipsolutions.net>
 <db22a4cb9a07e3845a50f436c7052feb@codeaurora.org>
 <0680b508a7864e02f55d763851f7460baa73b53f.camel@sipsolutions.net>
Message-ID: <110489059796b17849d0f32fb5189828@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210827_001300_920299_4BD475D2 
X-CRM114-Status: GOOD (  18.99  )
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

On 2021-08-27 14:55, Johannes Berg wrote:
> On Fri, 2021-08-27 at 14:53 +0800, Wen Gong wrote:
>> >
>> > Well, there's an existing place in this function that uses
>> > cfg80211_find_ext_ie(), and various uses of ieee80211_bss_get_ie(), so
>> > it feels like if we're going to do the full parsing, we should switch
>> > all the existing "look up an element" to also use the parsed data
>> > instead.
> 
>> ok.
>> so it ha 2 way to change, right?
>> 1.
>> change ieee802_11_parse_elems() to ieee80211_bss_get_ie()
> 
> No why?
> 
> I think we should make a first patch (that doesn't add TPE yet) that
> changes the function to ieee80211_parse_elems() and removes all the
> ieee80211_bss_get_ie() / cfg80211_find_ext_ie() calls in favour of just
> parsing once, and then looking at the elements there.
> 
> Then your TPE patch becomes trivial since the elems are already there?
this patch still needed, because the lower driver need the info.
and this patch is save the info to "struct ieee80211_bss_conf *bss_conf" 
and
pass it to lower driver.

> 
>> 
>> 2.
>> still use ieee802_11_parse_elems(), and change others
>> ieee80211_bss_get_ie()/cfg80211_find_ext_ie()
>> to use the result of ieee802_11_parse_elems()
>> 
> 
> Right!
> 
> johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
