Return-Path: <SRS0=jWs5=NE=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FCA0C4338F
	for <ath11k@archiver.kernel.org>; Fri, 13 Aug 2021 10:29:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 509826109D
	for <ath11k@archiver.kernel.org>; Fri, 13 Aug 2021 10:29:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 509826109D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gol5/L1q8M5vmbtrddsIWHRWOYa+VlVvWhAHSY+wtVU=; b=h3fydm8tg6x0Cagsfn5SwqWXxa
	LQrjgtYSPxaWuT/2V8E5qV7Q5VHdyLLZ1yCFPJ2f/xLjQjwTUBel+leDDUQaJO9hN6dJps0NQ6zWl
	byXPjjp5xd1sbiwF+DmmKlFcIpcHiLsxZKYu2WdIhpnAHV3Hs14k/9XvPnW0Ey/gTWpeSBZD5VQFG
	ZYAb26NAd33ScwNeYd3aTGAq+CNqdZI8s2vUMW1qrmNht2d2SVPfhOulUCUqwATqoFxn1tfu/2Ve3
	fxCApBhpIZYI5/lqMOaom2uUOrfXYwqeedLI3TXCsM1KjwWlaapZerMjNq+b2chGG0vM5SOfsWyEB
	Sowytg+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEURa-00CS8v-KU; Fri, 13 Aug 2021 10:29:42 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEURV-00CS7r-23
 for ath11k@lists.infradead.org; Fri, 13 Aug 2021 10:29:41 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1628850577; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=JMbb3u1CBTlERu7OfhgTVF+ONjo8s0o9ICBhT6ODPf8=;
 b=NyKALiXfLZKFHokP9mJbwK03BZjVESzpTuPcA1kL/bILV5yctUdYibfCxL+cTG8a0rzT49qk
 /sMNEAfO/D67JL2Pd5RHR2NkR4V6dzGrB29mbJCDToxwJ7CF+fSxGVuDcO57KpyvCSkhmtut
 ut7LC49o1X/fUn4uKFKGitCa2xw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6116498cb14e7e2ecb11452e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 13 Aug 2021 10:29:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9E3FDC43460; Fri, 13 Aug 2021 10:29:32 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 48B69C4338A;
 Fri, 13 Aug 2021 10:29:31 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 13 Aug 2021 18:29:31 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH 9/9] mac80211: save transmit power envelope element and
 power constraint
In-Reply-To: <569d85aec8fecc836b5a6f9d40b53dff6e41c1b1.camel@sipsolutions.net>
References: <20210517201932.8860-1-wgong@codeaurora.org>
 <20210517201932.8860-10-wgong@codeaurora.org>
 (sfid-20210517_222034_029448_A9A89D57)
 <d9491db4ece67ac78eb39a1078b91a106770fbb0.camel@sipsolutions.net>
 <1126f8d996e895ae048092b3f8aad19b@codeaurora.org>
 <38e7d9d2eebafa7245a36a0a0396094526eb3efd.camel@sipsolutions.net>
 <1273cc1a399a7457c3d908648a7651c8fe9b93f3.camel@sipsolutions.net>
 <a056e32d4911400fb0822bf02167e91c@codeaurora.org>
 <f61cdc7bae2dd2a645e164ca143b9db402472559.camel@sipsolutions.net>
 <465b6b8535fc17ae51ee2f3116af87bb@codeaurora.org>
 <569d85aec8fecc836b5a6f9d40b53dff6e41c1b1.camel@sipsolutions.net>
Message-ID: <24bcb0c5da824f830f31328781c634b9@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_032937_685709_97D8C588 
X-CRM114-Status: GOOD (  17.77  )
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

On 2021-08-13 18:11, Johannes Berg wrote:
> On Fri, 2021-08-13 at 17:16 +0800, Wen Gong wrote:
>> 
>> yes, it should have some flag/logic to check whether it is BIGTK.
>> If you know it, you can tell me. :)
> 
> Uh, actually, we don't have a secure indication of BIGTK getting used
> until after the 4-way-HS.
> 
>> >
>> Yes, the lower driver also have the max power limit itself. If power
>> calulated
>> from the fake beacon is bigger than the max power limit, then it will 
>> be
>> ignored.
> 
> Right.
> 
>> >
>> The Transmit Power Envelope is not existed in the assoc response, it 
>> is
>> existed
>> in beacon. So it can not use assoc response.
> 
> Right.
> 
> 
> Given this discussion, I think we should just leave it as is, and 
> simply
> not assume that the TPE is protected by beacon protection or such. 
> There
> are a number of other similar parameters, and doing some real 
> protection
> at this level would likely require further spec changes.
> 
Thanks.
I will leave it as is without change for BIGTK.
I will change others patch and send new version.
> johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
