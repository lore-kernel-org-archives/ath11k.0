Return-Path: <SRS0=RIxe=KV=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC15C47088
	for <ath11k@archiver.kernel.org>; Wed, 26 May 2021 15:22:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EA9561378
	for <ath11k@archiver.kernel.org>; Wed, 26 May 2021 15:22:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EA9561378
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7TA08PEnlL2mARhqh+KNr1A/FHzsF5MZyCp1Mvl21sQ=; b=qbuHQyeb/7ZMAXYFPSYg6/9g/e
	anbyPBe7b/i8PWyVMa9kx+Szwbl1FMAC2TbfUwsEKIKjETS91YI8tz9xsoYv3bD+8Wh4wH9ZwKMX0
	GI3KDQMIkpxjp8iqPB0tV6KwqnkT5HJQXdb7nKXmFJjaSFU3A0AQSm5R6HjOI6RRrQKRLdCevhIOo
	uyVK9pl0BIt6BLs3UQFZeSNDWboZM2vjsowpTxEm9VBc8INDb2STJLIpfmN58MucvSdrjWQG5CkCz
	+yWbvpe6a1C5Gdtr8syMUlq6iSXaxZnpTBjXpbD6W4RJk5v/iTRIBT+DxwExYMhCF02hGpK9VXN1n
	N/HaV8Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llvM9-00FJoY-Kr; Wed, 26 May 2021 15:22:01 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lluIM-00ElZQ-4S
 for ath11k@lists.infradead.org; Wed, 26 May 2021 14:14:04 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1622038442; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=n6PHiisgHgQlDORx6QefX5AK85Ela8tk1Mj69iUrWqM=;
 b=nC34vld9bKZcLwkWZGcxz3GEv7/nrUcyROMrJ3i3pJnjlNhAilH+NFrNy4WoZBJApY9PgpYQ
 5XMLPkhXsevg4czDikwJC5vn7kNgqE8QKcdifi/YQfi1Ul6wgSz9kII6A+iz7c7AnBLNSL6X
 8nY8RFlwB9qHQGWzH57BYNwaWII=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60ae5797ceebd0e932893e81 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 26 May 2021 14:13:43
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 89D08C43460; Wed, 26 May 2021 14:13:42 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: mkenna)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D8827C433F1;
 Wed, 26 May 2021 14:13:40 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 26 May 2021 19:43:40 +0530
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
To: Sven Eckelmann <sven@narfation.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Add support to configure beacon tx mode
In-Reply-To: <4581459.tLtf2NohVe@ripper>
References: <1619696874-30072-1-git-send-email-mkenna@codeaurora.org>
 <4581459.tLtf2NohVe@ripper>
Message-ID: <4038b2868605da158392bd4c65d10c66@codeaurora.org>
X-Sender: mkenna@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_071402_541536_36EDBC5A 
X-CRM114-Status: GOOD (  14.00  )
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

On 2021-04-30 12:45, Sven Eckelmann wrote:
> On Thursday, 29 April 2021 13:47:51 CEST Maharaja Kennadyrajan wrote:
> [...]
>> Beacons can be sent out in burst(continuously in a single shot
>> one after another) or staggered (equally spread out over beacon
>> interval) mode.
>> 
>> V2:
>> 	Addressed Johannes's comment on v1 patch.
>> 	Updated the commit log.
> 
> Still it is advertised as vif setting but the code itself shows that it 
> is a
> phy setting (as you would expect). Or is it a potential feature for a 
> device
> to send some beacons staggered and some beacons as burst?

[Maha]: No, it won't allow to send some beacons in staggered and some 
beacons in burst
mode. It will send either staggered or burst mode at a time in a device.

> Kind regards,
> 	Sven

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
