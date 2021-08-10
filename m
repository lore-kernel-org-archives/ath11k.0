Return-Path: <SRS0=0MIV=NB=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7296EC4338F
	for <ath11k@archiver.kernel.org>; Tue, 10 Aug 2021 08:34:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30DA36108F
	for <ath11k@archiver.kernel.org>; Tue, 10 Aug 2021 08:34:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 30DA36108F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+yQBKo8XNlleRtZPfK6I9Hdc2n2tg2YhkENAlvKWSs=; b=GN0VM5xL7g9nEEo6rvABJP5a0f
	LKYHDi7w4LkMCHd7+Sf6mqayr/YlESdOxAmqlfq6iEYAkQHUquzoawwzPwFKSBqulmDhn74HWLlO5
	8YxBhxeWnEujwZkXULtipsQ7vt/Pjk+3sUMKAFMssbuvpglLqfSDTj1ZC2EzMXwckQgapx0FW9N5V
	E2TBzb51/D8fjKubSQuP2FdskKy646eoT8YyCnz5jh1RiKYhIZ6pvattDXyHll1MeFBj98XM5dBTV
	VDwQiRPlkDAGbo82LFfg1jzSOQydkzsXLgM8+++GK18Enen5pRcaZZTMSv56uw5TRjxTEizjt9EKQ
	sCHcmK/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDNDR-0032Tv-Gv; Tue, 10 Aug 2021 08:34:29 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDNBl-00314U-GB
 for ath11k@lists.infradead.org; Tue, 10 Aug 2021 08:32:51 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1628584368; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Vdw6tPm4oPokrFtxSREvD0rum2LAN2Ai75BjwbZLPCQ=;
 b=ifH1eUUT9lpuODn9QUPK1St6MGXYUUnoJRNMeJxCt7kp5BaB9uSbgTFu4wdZa8EXrbm31T8r
 nhTOszhiGsN2IcUD0v6JWnbBOx8HX/f13qc3fukIfAn+7iEa46t2MkrvMnGN/V1H8mwsk0+r
 ouhvwba5NTkCITuwe6MaZ7bOwVw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 611239a776c3a9a17262e7a2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 10 Aug 2021 08:32:39
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id AE696C43144; Tue, 10 Aug 2021 08:32:38 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: mkenna)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BE660C43144;
 Tue, 10 Aug 2021 08:32:36 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 10 Aug 2021 14:02:36 +0530
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: Johannes Berg <johannes@sipsolutions.net>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org
Subject: Re: [PATCH v4 1/3] nl80211: Add support for beacon tx mode
In-Reply-To: <0e3d0abd-a895-77d8-d3a6-ef6d2616b7db@nbd.name>
References: <1623164855-15910-1-git-send-email-mkenna@codeaurora.org>
 <1623164855-15910-2-git-send-email-mkenna@codeaurora.org>
 <f14e6e6b81978ace4580774981a7e032b4001182.camel@sipsolutions.net>
 <0e3d0abd-a895-77d8-d3a6-ef6d2616b7db@nbd.name>
Message-ID: <0430f508f293d0b5b0d82cc1da78284d@codeaurora.org>
X-Sender: mkenna@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_013248_250469_BCF408F9 
X-CRM114-Status: GOOD (  13.57  )
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

On 2021-06-29 23:14, Felix Fietkau wrote:
> On 2021-06-23 13:16, Johannes Berg wrote:
>> First, I'd like to see some input from other vendors - is this useful?
>> 
>> I have no objections to it and it comes with an in-kernel driver, so 
>> I'm
>> inclined to accept it, but maybe we should have other modes, etc.?
> I haven't seen any config option like this outside of QCA stuff.
> It seems to me that before getting merged, the documentation should at
> least cover when and why the *user* would configure this implementation
> detail, instead of having the driver/fw make a reasonable decision on
> its own.
> 
> - Felix
[Maha]: I will do the documentation for this in the next version 
patchset.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
