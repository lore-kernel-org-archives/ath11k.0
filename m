Return-Path: <SRS0=zwws=MW=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B88DDC4338F
	for <ath11k@archiver.kernel.org>; Fri, 30 Jul 2021 10:16:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70A3760EBB
	for <ath11k@archiver.kernel.org>; Fri, 30 Jul 2021 10:16:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 70A3760EBB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X50YYUxd9yzk8OoyJLQJXC8T9S/lcs+GNRV7ZgVinbI=; b=cVsTJafFC1sV5J0bbft6Vq4uiS
	a+coi4r8+oeobyrIvy4PTaLM6pT5PAqJ/oKR0nZfBdFIVUKLNzGxft9Y+tcuZmxuYKZA5uCMNoQqe
	g+8qljcZJvBck/p4WYIQo6InDg+8XHbcrFfQ1BtsORDOh5WZmK25mjuF5HjHh+nteb6mgciTnySOf
	Xo9h4PggcG+QLMFWHLutLcyHbgNOkZUNCKevnpghYUrZHsfn8JUUn5ykWOlNATrUYYht3ErYqqX60
	LcsPVFLP/PODGghEImMvdOpHEVEVIYRQW5VWpH2qeUtV3uZyueMUYvsmamR6ThAnEX5hMaGg1g2Jd
	CeSXbnlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9PZA-00880q-5I; Fri, 30 Jul 2021 10:16:32 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9PZ3-0087z4-Lp
 for ath11k@lists.infradead.org; Fri, 30 Jul 2021 10:16:30 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1627640189; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=TaCpOqrOFZuMA47LguCMiBbgEddGbjLL2Omm1v9zSrk=;
 b=dPMTTrYYUN1Few7vHLInaFJznI+tOcowmsL/qgu2Az01808Pi+7HcC/fBKVQB8ZqJGhrvkx4
 9s2cjKjNn78GFldQUjJ6k+mNEv88yaQuiZZFVja7LRTUjsPDUYgrjGFUddgK7dLkvDmWYMMj
 I1dd1JYD+MEZZer1lJu3kJdRYyk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 6103d1634815712f3a750b39 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 30 Jul 2021 10:16:03
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 58F1CC43460; Fri, 30 Jul 2021 10:16:02 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1CFD6C433F1;
 Fri, 30 Jul 2021 10:16:01 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 30 Jul 2021 18:16:01 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH 7/9] mac80211: add parse transmit power envelope element
In-Reply-To: <ed5566ab47d271b845635b5c731938f333ee96b6.camel@sipsolutions.net>
References: <20210517201932.8860-1-wgong@codeaurora.org>
 <20210517201932.8860-8-wgong@codeaurora.org>
 (sfid-20210517_222024_817809_7D68677B)
 <ed5566ab47d271b845635b5c731938f333ee96b6.camel@sipsolutions.net>
Message-ID: <80b779458e0edfb9c0f7194116b35286@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_031629_183060_8331DE1D 
X-CRM114-Status: GOOD (  17.21  )
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

On 2021-07-23 17:33, Johannes Berg wrote:
> On Mon, 2021-05-17 at 16:19 -0400, Wen Gong wrote:
>> This patch is to add the transmit power envelope element parse in
>> _ieee802_11_parse_elems_crc(), it maybe have more than one transmit
>> power envelope element in a beacon.
> 
> This is really hard to read.
> 
> I'm sure you're aware of
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches#commit_messages
> 
> Also, FWIW, "This patch" language is pointless. We all know we're
> talking about a patch. Or maybe even not, we may be reading the commit
> later on.

will change it.
> 
>> +		case WLAN_EID_TX_POWER_ENVELOPE:
>> +			if (elems->tx_pwr_env_num >=
>> ARRAY_SIZE(elems->tx_pwr_env))
>> +				break;
>> 
> 
> Seems to me this should do some validation on the actual element? It at
> least has to have _one_ octet, afaict?
> 

will change it.
> johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
