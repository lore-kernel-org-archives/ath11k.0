Return-Path: <SRS0=lr6B=NS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA94EC432BE
	for <ath11k@archiver.kernel.org>; Fri, 27 Aug 2021 08:47:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EFCD60187
	for <ath11k@archiver.kernel.org>; Fri, 27 Aug 2021 08:47:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6EFCD60187
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jQhhupnDzV2blFecp3QWTtAUZPdArLF90FZ7ildx6ZA=; b=cSFFvPdP67+W34f0/4+SJb7Ukg
	pE8DwDz7CMBcai3SQUXHn3i5Q6+izo/REc98+oQEYVdzFxMKIMeg0IEPj/fSKFqW2J/f+JzBlzTQE
	cwTfYyyMf802MfDOcdxGmUNUXDdETyoOqorHKMlNM769eaNtHV4GcrR7/RVHIi4J16UQnvdEkKkuy
	aoJjIcug+9Zoh930iVYFglS7MCT3SJL9Eba10sQdWrxRFOEWSRLBxlUlD+FMFtLnx+Zbrpoj+Iwr7
	Up9nvGaEeyL5sQKo9AuXVfZ2DEGWeLcUIhemOj70KTHc/yfps3yyuazNh/wmY5FT+iTMNL48Fm/LT
	Km1RIVQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJXWM-00ByfT-6K; Fri, 27 Aug 2021 08:47:30 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJXWD-00Byf5-K2
 for ath11k@lists.infradead.org; Fri, 27 Aug 2021 08:47:29 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1630054045; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=nuWZZjA/CahwoY0D3QK4iRrNop3uymnaep3vKQXmInE=;
 b=l84KS48wiwTvetnGeTUF5GvTX0rVDTiF7I1iK1qcdyAqniCGcHiRiDRu8P2rFOrdB6lwTt6L
 lJtVq4XCfidpqElZa1UgZEIIQ9l2hU7nOs2dy5VE0yyqTnhu9GTp0T4skUcYxLF+wPC8NrHU
 TUDI9ICjnJPpohyEr62c2pkBGBo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6128a692d6653df767fa6ec2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 27 Aug 2021 08:47:14
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id ECC7DC4360D; Fri, 27 Aug 2021 08:47:13 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B3DC0C4338F;
 Fri, 27 Aug 2021 08:47:13 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 27 Aug 2021 16:47:13 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2 8/8] mac80211: save transmit power envelope element and
 power constraint
In-Reply-To: <e985d4aa1556e9660cc7d4a3ff348d64764c4ad8.camel@sipsolutions.net>
References: <20210820122041.12157-1-wgong@codeaurora.org>
 <20210820122041.12157-9-wgong@codeaurora.org>
 <dfe27f657b4615369cf751d394f5cba75f5fdcc1.camel@sipsolutions.net>
 <25fcede26b99604a03d0b321b7120db4@codeaurora.org>
 <48ad47869e703cbef437378c508d6a5b64c160ae.camel@sipsolutions.net>
 <db22a4cb9a07e3845a50f436c7052feb@codeaurora.org>
 <0680b508a7864e02f55d763851f7460baa73b53f.camel@sipsolutions.net>
 <110489059796b17849d0f32fb5189828@codeaurora.org>
 <27680423e824dd67217cc6f1e62f9ac0a1af78f2.camel@sipsolutions.net>
 <01d9e4eadbb0d87edbc026fc719858a3@codeaurora.org>
 <3483aeb87a81dea538af3a2640cd49831274320f.camel@sipsolutions.net>
 <40e8c88cec2d3601afbfe187c57fac6b@codeaurora.org>
 <e985d4aa1556e9660cc7d4a3ff348d64764c4ad8.camel@sipsolutions.net>
Message-ID: <c2362285a37a21bb3d4131d84bd3db60@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210827_014725_434248_1EF8A524 
X-CRM114-Status: GOOD (  10.73  )
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

On 2021-08-27 16:30, Johannes Berg wrote:
> On Fri, 2021-08-27 at 16:28 +0800, Wen Gong wrote:
>> 
>> the TPE is only 8 pointer in the struct ieee802_11_elems.
> 
> 
> I know, but it's showing _just_ above the threshold for the warning 
> now,
> so if it was _just_ below the threshold before, adding 64 bytes could
> still do that. 64 bytes is a lot, after all, the threshold is only 512 
> I
> think.
> 
Yes, I will change to below in next version.
"struct ieee802_11_elems *elems = kzalloc(sizeof(*elems))"
> johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
