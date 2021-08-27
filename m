Return-Path: <SRS0=lr6B=NS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7179C432BE
	for <ath11k@archiver.kernel.org>; Fri, 27 Aug 2021 02:02:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1E9060524
	for <ath11k@archiver.kernel.org>; Fri, 27 Aug 2021 02:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A1E9060524
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2XEel8xYFiaR/hx/paZkiC7WaKKNRySN0EVA2K3rSoc=; b=uvBHG0HrBGJkQDII/qCphjktOI
	dxcFlWjNTsIdBmBufkB+6LGhL/7fuoIquIuL+6pesnwDRmfz5Lk9y3IT2pQEBTUrxUqFrMbGcrgsm
	VDs+aATseqsgH9644atUtBJjEQOkEbwekX7kjHaVWb+Sneq1EDRuE9sEYkY8+SP9dbGB4Il3fN0rd
	DRzUDABx/LSHkW0PocevifRLdovyzctDp3LDMVfnxmWjsUkZXwd2wY3/GFmtO1sLoIPxUhbfj9A9z
	6hjEGWdi0ZiFZHTsyKK7Ja32yGENf8e5GGMxEfUBamjVnMWOs7VqrH6MM75qLbPjHBjL6MZEBGHOI
	2/Es2mAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJRCJ-00BLT4-1n; Fri, 27 Aug 2021 02:02:23 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJRCC-00BLSR-5n
 for ath11k@lists.infradead.org; Fri, 27 Aug 2021 02:02:22 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1630029738; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=01sQCPM90oT/9Y0DVA/AYmIOOSIUjqYBOT5kYLBRkUA=;
 b=HXtj+7p/rOd+PbeKhC/YiJZzagKe6R0Rq8Qs7WMMj2QJ0EfpA/W9uSr0SrBHkg8/oDLRQXff
 VrFbTvc7ySEbDJs8ZnxkRhuFPHXRFAxFAdfBBWXk9uJkgjNRjF6HFcf3qrleDHuOzpVv9Gje
 MhH7lXRbX0DJaxzunNgtHsAKICM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 61284794fc1f4cb6929e3d02 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 27 Aug 2021 02:01:56
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 11D42C43460; Fri, 27 Aug 2021 02:01:56 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6754EC4338F;
 Fri, 27 Aug 2021 02:01:54 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 27 Aug 2021 10:01:54 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2 8/8] mac80211: save transmit power envelope element and
 power constraint
In-Reply-To: <e75ee4e160d6ec09d9c5f131f882d2e9d8eb49cd.camel@sipsolutions.net>
References: <20210820122041.12157-1-wgong@codeaurora.org>
 <20210820122041.12157-9-wgong@codeaurora.org>
 <dfe27f657b4615369cf751d394f5cba75f5fdcc1.camel@sipsolutions.net>
 <fe21853e8c9a73632e0ca860eef00296@codeaurora.org>
 <5c85b2bcfbffb617c5aa3f55e7ae94a1ab4df743.camel@sipsolutions.net>
 <f86091b72422d194a2e59b1f6d27a69b@codeaurora.org>
 <e75ee4e160d6ec09d9c5f131f882d2e9d8eb49cd.camel@sipsolutions.net>
Message-ID: <6cf1f6ee76f675831ca506d188c58850@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_190218_392161_344B3BBF 
X-CRM114-Status: GOOD (  15.05  )
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

On 2021-08-26 19:10, Johannes Berg wrote:
> On Thu, 2021-08-26 at 19:00 +0800, Wen Gong wrote:
>> On 2021-08-26 18:57, Johannes Berg wrote:
>> > On Thu, 2021-08-26 at 18:50 +0800, Wen Gong wrote:
>> > > >
>> > > it is memset here i this patch:
>> >
>> > Oops, missed that.
>> >
>> > But is that really a good place for it? Doesn't really seem to belong
>> > to
>> > assigning a channel context - maybe put it into set_disassoc()?
>> >
>> it is correct.
>> you can see it is place together with "drv_unassign_vif_chanctx(local,
>> sdata, curr_ctx)"
>> in ieee80211_assign_vif_chanctx(), it is for disconnect.
> 
> Yes, I know it's *correct*, but that doesn't mean it's *good*?
> 
> Look at that code - it does nothing with bss_conf. Nobody is ever going
> to look there.
> 
Yes,
seems it is better do memset() in ieee80211_set_disassoc().
I will change it in next verion.
> johannes
>> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
