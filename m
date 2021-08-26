Return-Path: <SRS0=rto1=NR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70795C432BE
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 10:43:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 409256109F
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 10:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 409256109F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uAP4Fk7arJ8q0U7ZKdAPtcrauPJYmaHIa9kCWtLhGUQ=; b=RJNrt/R9ELgylRN46yKZxhqCdj
	YO0PJIIqcORqB8Pw1Y1Lh78tKvkCZ1wi8K+xKgQlcv5zQvWy4+wsZcydUOigOZ0OUKt/lp/LyoWe6
	qsB5bKBMZ/DDCkQzw7HChHyqAQqfGZioVIourk3wdi8NujIOAyMBA1EcH5SbuufuTIADxUscYWxOC
	0l5DZVoMvhVzUFG2wEw6V2+Sf3P8sZxHaswuYNOYNXcv2Pq7IQ78sZ71QqokAzXVqEBsLtqKpjBEm
	/nm6cUbvWgda86Wz0Dc9poO4VoJPrhqktmiOvVKx/EW3XtgGRYTmgR9xbH47caoEY+UtZJ83x67Ox
	mnprG1bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJCqm-009pV6-6r; Thu, 26 Aug 2021 10:43:12 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJCqg-009pU3-J3
 for ath11k@lists.infradead.org; Thu, 26 Aug 2021 10:43:10 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1629974586; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=jxQj+Qq58uCngE8BIFIYp5sPKXbtHgYgxSLMFmISMug=;
 b=niTR1FDWsTO0QhqY02vdvhBhwVoQDEqu50vPTKRg7/xgYOPW4KjUv82D2lOzUDi5sSxfMRKu
 WSQVIGVbEXmuME673P63dsagpA0pzAXM/QaFWdZ6OcOquuZm1AC/sIqUzYq+4piccU7sdLEh
 RoObTRHqavvZs5U4ETiDLPyrgp8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 61277037d6653df767d0b904 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 26 Aug 2021 10:43:03
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 34923C4360D; Thu, 26 Aug 2021 10:43:03 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BE528C4338F;
 Thu, 26 Aug 2021 10:43:02 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 26 Aug 2021 18:43:02 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2 5/8] cfg80211: save power spectral density(psd) of
 regulatory rule
In-Reply-To: <101b523a6fe06fea3e1c9642a1bf5e85a9d0e680.camel@sipsolutions.net>
References: <20210820122041.12157-1-wgong@codeaurora.org>
 <20210820122041.12157-6-wgong@codeaurora.org>
 <101b523a6fe06fea3e1c9642a1bf5e85a9d0e680.camel@sipsolutions.net>
Message-ID: <4eca272868dae4f7a923656a12b03024@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_034306_727288_81B6ACF1 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
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

On 2021-08-26 16:25, Johannes Berg wrote:
> I was going to apply this and patch 4 squashed, saying:
> 
> 
>     cfg80211: regulatory: handle 6 GHz power spectral density (PSD)
> 
>     6 GHz regulatory domains introduce power spectral density (PSD).
>     Allow wiphy-specific regulatory rules to specify these values.
> 
> but ...
>> 
>> +		if (chan->flags & IEEE80211_CHAN_PSD)
>> +			chan->psd = min_t(s8, rrule1->psd, rrule1->psd);
>> +
> 
> This is obviously wrong?
Yes it should change like this:

	if ((rrule1->flags & NL80211_RRF_PSD) && (rrule1->flags & 
NL80211_RRF_PSD))
		chan->psd = min_t(s8, rrule1->psd, rrule1->psd);
	else
		chan->flags &= ~NL80211_RRF_PSD;

> 
> johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
