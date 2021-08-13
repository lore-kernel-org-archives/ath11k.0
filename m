Return-Path: <SRS0=jWs5=NE=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 436F1C4338F
	for <ath11k@archiver.kernel.org>; Fri, 13 Aug 2021 08:13:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E19756109D
	for <ath11k@archiver.kernel.org>; Fri, 13 Aug 2021 08:13:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E19756109D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gw/eleeBxYhr7CN/nJ4uF4YFF0xzMeQmI7wTEB8fIPQ=; b=u9kon64dzQuwk7dzfPVC96iV6J
	ocCn2PAAQKTQgUuNeMdAmjNVU8P9e9ZVmODHzDig3oT0MEEk2mj2XEV7YxDk6nE5IztAwC6o/v0Sb
	r2H1Q1lvuDEPGnBY1EJzQuMKmyOsNQK+ZZnq77PxusodRZdHKUEOaBN188JnQ48T9qy8hCXIXHGoH
	U+yKzuQCGLnfpo0B+rLA1UuFHzzFH6YMdkKTrbuiRhZWzrIMW5gb7bxC+nSEAoPevjonladHHJUfj
	xUoNBznNUwpzQOgeZgAd8J0pVl3AbpS5W26THraOOpNqTb/cCmCcVyq8hsakqopLfOJT71y574Bzy
	S3/e60rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mESK3-00CCYt-1o; Fri, 13 Aug 2021 08:13:47 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mESJt-00CCWm-7f
 for ath11k@lists.infradead.org; Fri, 13 Aug 2021 08:13:45 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1628842419; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=wBGHTJ10sptczyAv1wSDcQxlqoupZwcFkpRzgxG+WkQ=;
 b=Hu4g+reTs7VG2O2cM15hIHdKF9wgNBlZxt77nv2Rl8DkT9VXDygRY/7jvBj8u2XqHFDPCmq1
 ehNsp1p0pvJNb6HgknELhzVqBE8GRexhk+KzQxa/XN4TvpeObzx0hw6Baug76rR5p8xr48E4
 IvNkQwqBNMv9feEW8Hsrr+aLOd4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 611629a5f746c298d973ac7d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 13 Aug 2021 08:13:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 45CDBC43460; Fri, 13 Aug 2021 08:13:25 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E951AC433D3;
 Fri, 13 Aug 2021 08:13:24 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 13 Aug 2021 16:13:24 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH 9/9] mac80211: save transmit power envelope element and
 power constraint
In-Reply-To: <38e7d9d2eebafa7245a36a0a0396094526eb3efd.camel@sipsolutions.net>
References: <20210517201932.8860-1-wgong@codeaurora.org>
 <20210517201932.8860-10-wgong@codeaurora.org>
 (sfid-20210517_222034_029448_A9A89D57)
 <d9491db4ece67ac78eb39a1078b91a106770fbb0.camel@sipsolutions.net>
 <1126f8d996e895ae048092b3f8aad19b@codeaurora.org>
 <38e7d9d2eebafa7245a36a0a0396094526eb3efd.camel@sipsolutions.net>
Message-ID: <bdbef7e30bf8d84049cd60a6350836e1@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_011340_036422_CD576BB5 
X-CRM114-Status: GOOD (  21.74  )
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

On 2021-08-13 15:19, Johannes Berg wrote:
> On Fri, 2021-07-30 at 18:47 +0800, Wen Gong wrote:
>> 
>> > And then two more questions:
>> >
>> > 1) Could this information change? Should we track it in beacons?
>> >
>> 
>> The information is from AP side, it should be not changed untill the 
>> AP
>> restart.
>> If someone want to change configure of AP, the AP should restart and
>> then take effect by my understand.
>> Is it have some case for this information change?
> 
> No, I guess that's fine then, I just didn't know.
> 
>> > 2) Should we at least check it again from the protected beacon or such
>> > after association, so we don't blindly trust the probe response or
>> > beacon (received during scan, not validated) at least when BIGTK is in
>> > use?
>> 
>> May we add support for BIGTK in future with another patch?
> 
> We already have BIGTK support in mac80211, so if we don't do that now
> we're almost certainly not going to do it, so I'd really prefer if you
> did it here, or if a separate patch still did it now.
> 
>> The info(pwr_reduction and tx_pwr_env) is used by lower driver such as
>> ath11k.
> 
> Sure.
> 
>> If the info changed after association, then how to notify lower 
>> driver?
>> Do it like below in ieee80211_rx_mgmt_beacon()?
>> And use BSS_CHANGED_TXPOWER or a new enum in ieee80211_bss_change?
> 
> Yeah, dunno. Are the drivers assuming now it's set once you get to
> associated state?

yes, driver need this info while associate process.

> 
> johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
