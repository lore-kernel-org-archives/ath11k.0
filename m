Return-Path: <SRS0=rto1=NR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E79FC432BE
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 11:00:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16D1F6108F
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 11:00:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 16D1F6108F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CvHtES0o6skAP/kEKDjBNev8C5D7TFjQzOH+VaStycE=; b=rC36ywR5Sh5P7+K1n71ePoLlPN
	7KHhYWQqIRonbATNKECeDMiNbLfCj29ZBaAyDWkPTjLoDRfjvtrEZrGwKvFFc4cnPQ0WM3IyigB6D
	r2WR5vHV+nbIqHNOdCR8LUNjCjfVjfr1GcfQ7jvNdyFH5b3e0/+svE0s69+TQk3FWvrII5LNvt+Wz
	S9fVmwTMGTc6JbbMZN23xRbnikTdGzLDZHD6hBfyLT2bBP5gvG4OrsQpCf+fDu2fMXe30ePVoJOsp
	k5MFyEIYiQK7suHB3NiZpbKkJKb1w21hul0lIwdzh9L4RhO1/0FlZRzPwkf4jC3JlaSawEKxmsA+S
	w0/j2NyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJD7m-009qq0-3f; Thu, 26 Aug 2021 11:00:46 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJD7g-009qOi-4Z
 for ath11k@lists.infradead.org; Thu, 26 Aug 2021 11:00:45 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1629975641; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=pJ+bz9wD7XOqHk2p2R+b9YiyyLyqz0L0AkZHisb0OFY=;
 b=sp5nC+JVDnaqcaoRSsrNV9DQlN9hm2IUVI/PKipHjWuSHLAj0nPHRqsCa7TunMcPY3TusxSG
 flTYbeWBu4q3w6/T3biNb+VjuEH0zJ1tANBcpY6UnM9Aldu9PEA2aWoAi7jYBDFiHIQRDURo
 d0l8TAgu8hTrA0UWFhuPQCxoBUQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6127744dd6653df767de3364 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 26 Aug 2021 11:00:29
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id CC60EC43460; Thu, 26 Aug 2021 11:00:28 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7A8A7C4338F;
 Thu, 26 Aug 2021 11:00:27 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 26 Aug 2021 19:00:27 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2 8/8] mac80211: save transmit power envelope element and
 power constraint
In-Reply-To: <5c85b2bcfbffb617c5aa3f55e7ae94a1ab4df743.camel@sipsolutions.net>
References: <20210820122041.12157-1-wgong@codeaurora.org>
 <20210820122041.12157-9-wgong@codeaurora.org>
 <dfe27f657b4615369cf751d394f5cba75f5fdcc1.camel@sipsolutions.net>
 <fe21853e8c9a73632e0ca860eef00296@codeaurora.org>
 <5c85b2bcfbffb617c5aa3f55e7ae94a1ab4df743.camel@sipsolutions.net>
Message-ID: <f86091b72422d194a2e59b1f6d27a69b@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_040041_486346_E3939DDE 
X-CRM114-Status: GOOD (  10.93  )
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

On 2021-08-26 18:57, Johannes Berg wrote:
> On Thu, 2021-08-26 at 18:50 +0800, Wen Gong wrote:
>> >
>> it is memset here i this patch:
> 
> Oops, missed that.
> 
> But is that really a good place for it? Doesn't really seem to belong 
> to
> assigning a channel context - maybe put it into set_disassoc()?
> 
it is correct.
you can see it is place together with "drv_unassign_vif_chanctx(local, 
sdata, curr_ctx)"
in ieee80211_assign_vif_chanctx(), it is for disconnect.
> johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
