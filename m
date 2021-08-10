Return-Path: <SRS0=0MIV=NB=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36047C4338F
	for <ath11k@archiver.kernel.org>; Tue, 10 Aug 2021 12:02:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E802460F41
	for <ath11k@archiver.kernel.org>; Tue, 10 Aug 2021 12:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E802460F41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pRSy8JGd9xQr8N9VfrDm74mfwBTG6SQN9OPMz/Yrhgs=; b=x+x6bqYBtN3+uHA1k0btv01mx4
	W4yEI/V7KIkxvIWyjq6q6jA1xL0MYuzIBDD/kcMBUKdkFSJjsJEhEjpdGAkdQk5pMHm5pB/49gR9b
	rN9AAZU9ma3653BFuPlOn/406TSr8KkZrq4bIcRIpUswwMxr4mWBw6aIZRvZralLxZk1X1cOURIwh
	YfgcI5d6lmwsjsh1T0X/b1r3h1xNoqZTPmCv3FerNnnXzuPUxRldNGfHw2RyRXY5q/ZXpJd42hCw0
	5KVkaO0IGte2r2V6Hlo1LealAhUJXyv2hC/Xp/DkV5ggDuMPWwd+3vsoy7HeBS85LrBXW3hghgbbb
	LsBynwsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDQT1-003ghj-BL; Tue, 10 Aug 2021 12:02:47 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDQSq-003ggh-8I
 for ath11k@lists.infradead.org; Tue, 10 Aug 2021 12:02:46 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1628596962; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=w4YQaQH2LBKxBMptHGZhvdKN7L2B42qvUJiqZuTkJnQ=;
 b=LMnevIJrBzSRwS6EpHkIc2F0AHryqdIUxO6q/8ZC+8rQxN/FsCcXvgfWt6s465yknCnBZCfX
 l6+s1v9WzpW1yZkzZfYQBtVzowMnuqNryWoxYB+Vxfbz6AK3XFOiuzm+V6CAnWjZasYVyBw/
 UwXYhzzX6+GcexcC1gxZz3HJ5wc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 61126ac9b3873958f5dedc91 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 10 Aug 2021 12:02:17
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 50789C433D3; Tue, 10 Aug 2021 12:02:16 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: mkenna)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1E492C433F1;
 Tue, 10 Aug 2021 12:02:15 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 10 Aug 2021 17:32:15 +0530
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH v5 1/3] nl80211: Add support for beacon tx mode
In-Reply-To: <7eaa665c-7f9b-268c-5297-4d3851e10e43@nbd.name>
References: <1628585783-21139-1-git-send-email-mkenna@codeaurora.org>
 <1628585783-21139-2-git-send-email-mkenna@codeaurora.org>
 <7eaa665c-7f9b-268c-5297-4d3851e10e43@nbd.name>
Message-ID: <f96e91618142c34172d12954f2f08ce9@codeaurora.org>
X-Sender: mkenna@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_050242_781230_4CAE7BB7 
X-CRM114-Status: GOOD (  11.75  )
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

On 2021-08-10 15:44, Felix Fietkau wrote:
> On 2021-08-10 10:56, Maharaja Kennadyrajan wrote:
>> User can configure the below beacon tx mode
>> 1. Staggered mode and 2. Burst mode while bring-up the AP
>> or MESH.
>> 
>> Beacons can be sent out in burst(continuously in a single shot
>> one after another) or staggered (equally spread out over beacon
>> interval) mode.
>> 
>> Set the beacon_tx_mode as 1 for Staggered mode and 2 for
>> burst mode.
> What's the advantage of one over the other? When and why would the user
> choose a different mode other than the default?
> 
[Maha]: In the multi-vap scenario and default or staggered mode,
tx failure of the packets will happen if the packets duration
is greater than the beacon interval between the two vaps.
In case of burst mode it works, where during retry it transmits
the packet.
> - Felix

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
