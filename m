Return-Path: <SRS0=lr6B=NS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC41C432BE
	for <ath11k@archiver.kernel.org>; Fri, 27 Aug 2021 08:29:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCB2C60F91
	for <ath11k@archiver.kernel.org>; Fri, 27 Aug 2021 08:29:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CCB2C60F91
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UhaMdasSfak8FcoeomYUTqzLOYlbdW3Bn0NDcKwQN3c=; b=kGUWm+75PctR5I8q1jXSsnn96K
	dxKCYGJ07HTyNWjzCTj1Kxh9vdTRzqzbwxYzJhW6mJ3ge7qESjb2UdpOanuPSneCHnSXX5q9h3m94
	241/9Jk62r5cluduigWl12vYOBaUd6BjJzjPG9vcc0UR89lL3LWC8imGgAaeiYU7UeKMh8Mv62qMm
	rlql9IhFyPoSzAOvYpF1F0fAxTqdt5SOk+jIx5sbbEqPcZD3XHsCVB3KgMjP++Z4CSg3MPbw1IeHh
	zZ4Z9EOjtwiqRn1j1rwfk/UIu1D+2zdZsecJ2JJ5vQVYKU5KWBR1xdcnpq/fVWs40iYBZYPZZ5Hby
	4vMIdalw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJXEj-00BxLX-Ew; Fri, 27 Aug 2021 08:29:17 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJXEd-00BxK8-Ql
 for ath11k@lists.infradead.org; Fri, 27 Aug 2021 08:29:16 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1630052951; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=KSnANkxkmR2WEQ3ZPEcdEYDljKk8xJccrXlBzDwykF8=;
 b=ErmAFy1GfL3MvAnKgWGD9JtnKwXKIneaySfR92gvHa1C6e3mnI6SP1Di3x056TeHjX862fuf
 W0JW58R3P6lvJobfzdnGDc5PZXKxZq2ftShLhLLuUOGSdN7EVq697T2nE7+UY3FRSda1M0BX
 RFyVGgavTitzGdJoXmyhtwY/T+I=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6128a24cb52e91333cfe8530 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 27 Aug 2021 08:29:00
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 479C7C4360D; Fri, 27 Aug 2021 08:29:00 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id EF6B8C4338F;
 Fri, 27 Aug 2021 08:28:59 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 27 Aug 2021 16:28:59 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2 8/8] mac80211: save transmit power envelope element and
 power constraint
In-Reply-To: <3483aeb87a81dea538af3a2640cd49831274320f.camel@sipsolutions.net>
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
Message-ID: <40e8c88cec2d3601afbfe187c57fac6b@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210827_012912_311219_59C95D2E 
X-CRM114-Status: GOOD (  13.51  )
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

On 2021-08-27 16:20, Johannes Berg wrote:
> On Fri, 2021-08-27 at 16:18 +0800, Wen Gong wrote:
>> 
>> then should I use "struct ieee802_11_elems elems = {0}" or "struct
>> ieee802_11_elems *elems = kzalloc(sizeof(*elems))"
>> in the parsing patch?
> 
> Yeah, it's a good question ...
> 
> We keep adding stuff here, so it'll be safer to alloc it.
> 
> I get a fair number of stack size warnings on the build now (possibly
> due to the addition of the TPE fields?), and while they're probably 
> fine
> for now (we get there from nl80211, so no deep stack), it's only going
> to increase - we have EHT patches already now, for example.
> 

the TPE is only 8 pointer in the struct ieee802_11_elems.
so stack size warnings should not caused by TPE.

#define IEEE80211_TPE_MAX_IE_COUNT	8
const struct ieee80211_tx_pwr_env 
*tx_pwr_env[IEEE80211_TPE_MAX_IE_COUNT];

> johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
