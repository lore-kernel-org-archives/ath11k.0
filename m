Return-Path: <SRS0=jWs5=NE=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7438C432BE
	for <ath11k@archiver.kernel.org>; Fri, 13 Aug 2021 08:48:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A67B6103E
	for <ath11k@archiver.kernel.org>; Fri, 13 Aug 2021 08:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6A67B6103E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9lNWhSCtOfcTBXs784vRL86UPy6OwyLJb1bAkRZBmo4=; b=oVxZOzx0a4/t91RvHYbf3j1NEt
	BQbnXDnSgEs1FArSpGo0/XK9AUBmkT+9dmQNUVXAAQlImcndC+iAxloiVdOdncQDZ/hFukW9jPJ4o
	OQBhv561fo7riNXkNJ2xVkG2Xdoq4QDJ+Pll1O1jTdEIVzxGnhOfH3WXe3Gz6q9i+1O8hgHpK3ctN
	aOnZ3BCJf6SEPy5DVXYu9blUfF7DsV8vy/EDLf1VvbSHdsGWyKuwccDA5WNlAmZEBoDSwf5q9kA6L
	L93X8hZIfY3F5rH5gkgxF+tPL0szkrzd14qmVmXpEU+qXwEKeU7CUPuAk9ZHDoDwKrbiySIeYQDyy
	a/6n7zhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mESrX-00CFVb-8f; Fri, 13 Aug 2021 08:48:23 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mESrM-00CFUr-3I
 for ath11k@lists.infradead.org; Fri, 13 Aug 2021 08:48:19 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1628844495; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=U5Vjp8FNKLyKkd6CIz80ylnWZ/KwDvvPahUsp8EwovQ=;
 b=qimakwwD/oQ/kHOH5rQqGxFwjBCmRqUUIJX2hLuKR1oim/xHFWM85D3LMQenEhaRklzLz0iE
 A8E/RJD0ncSy/ZwXQn2zfLvfmgn0NSAb6HCbnZb2M/78P5a5HW8WdjZAYmGYTulsYiiCr1T0
 hqZC6m93Ih7ej1y62Do1NYz6JEY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 611631bcb14e7e2ecbb576b4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 13 Aug 2021 08:47:56
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E4714C433D3; Fri, 13 Aug 2021 08:47:55 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 986BCC4338A;
 Fri, 13 Aug 2021 08:47:55 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 13 Aug 2021 16:47:55 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH 9/9] mac80211: save transmit power envelope element and
 power constraint
In-Reply-To: <1273cc1a399a7457c3d908648a7651c8fe9b93f3.camel@sipsolutions.net>
References: <20210517201932.8860-1-wgong@codeaurora.org>
 <20210517201932.8860-10-wgong@codeaurora.org>
 (sfid-20210517_222034_029448_A9A89D57)
 <d9491db4ece67ac78eb39a1078b91a106770fbb0.camel@sipsolutions.net>
 <1126f8d996e895ae048092b3f8aad19b@codeaurora.org>
 <38e7d9d2eebafa7245a36a0a0396094526eb3efd.camel@sipsolutions.net>
 <1273cc1a399a7457c3d908648a7651c8fe9b93f3.camel@sipsolutions.net>
Message-ID: <a056e32d4911400fb0822bf02167e91c@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_014815_429720_F7554A74 
X-CRM114-Status: GOOD (  20.10  )
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

On 2021-08-13 15:25, Johannes Berg wrote:
> On Fri, 2021-08-13 at 09:19 +0200, Johannes Berg wrote:
>> 
>> > > 2) Should we at least check it again from the protected beacon or such
>> > > after association, so we don't blindly trust the probe response or
>> > > beacon (received during scan, not validated) at least when BIGTK is in
>> > > use?
>> >
>> > May we add support for BIGTK in future with another patch?
>> 
>> We already have BIGTK support in mac80211, so if we don't do that now
>> we're almost certainly not going to do it, so I'd really prefer if you
>> did it here, or if a separate patch still did it now.
> 
> Actually, I should say though - the question was more whether we even
> need/want that, rather than whether we can do it later or not.
> 
> If we should protect this data/information then IMHO we should do it
> now, but it's not clear to me that we should, given that we also don't
> have encrypted association response and we still take information from
> there too, etc.
> 
> johannes
I prefer to add a new enum(not use BSS_CHANGED_TXPOWER),e.g, 
BSS_CHANGED_PWR_ENV.
And add check in ieee80211_rx_mgmt_beacon() as well as 
ieee80211_handle_pwr_constr(),
when the value of pwr_reduction or content of elems.tx_pwr_env changed,
save the pwr_reduction and elems.tx_pwr_env to ieee80211_bss_conf, and 
notify lower
driver with BSS_CHANGED_PWR_ENV, then lower driver will do next action.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
