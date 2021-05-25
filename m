Return-Path: <SRS0=rYI7=KU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F7F4C2B9F8
	for <ath11k@archiver.kernel.org>; Tue, 25 May 2021 10:05:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E96766117A
	for <ath11k@archiver.kernel.org>; Tue, 25 May 2021 10:05:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E96766117A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yYcgvACSn5VyOkkg/oNAN4G/WmL4R4GCIbVHN4sFlVE=; b=yBdRrKzjM/lZEmL3ndOE8EiG21
	kOHyrV2KeXR1BH0xh+i664cULkIRgHnVh9DG85IUMYn4JaD7DJ0eyx9NUulz/31wtv17IwhZhVxnD
	Ef4QpEwCeda7+BaObTUkG61IeFoX5/fE3/U9VGcTbxJqskjVqxhN+R5SVYLYgN5kF2VjOyy6rxluH
	8Kp3qVdagLc8KiCg7XqKXsidVyDmAjCp+QsUZx6lPlFNoXhpxekMMZMgT6pTOYIcXSHdp90aK0vfW
	AOJ+X79bO5PCEaNnjXM/ZEB89Y5/LQY+Wd5UsvX2RXU7AfRlifs7KX6NIb5buaM79U+iuE6ojDBao
	63MUfibA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llTvq-004Uax-So; Tue, 25 May 2021 10:05:02 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llTvc-004UW0-B7
 for ath11k@lists.infradead.org; Tue, 25 May 2021 10:04:50 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1621937088; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=o9bT9+FK61C5nJ4QeqWHG5L+nxmR0swD5q3w4EZHM4w=;
 b=pFZANQrLIAFKBnFm6zywi0I1ZT0cqX+DBe15wXmLHDH1BdebVEFup4i1BgdZiJ+H2eS9yvY/
 U1hX6+iFi9A/9oo8B4KnbSWnfGogzx62ddGuS5JA8DMf4S1glnTfxrp12v3FhoYYo6ycHb0u
 SRFqVRx6rIaagFG295YUrskQMXY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60accbb760c53c8c9d039853 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 25 May 2021 10:04:39
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3AB13C43217; Tue, 25 May 2021 10:04:38 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B1AA1C4338A;
 Tue, 25 May 2021 10:04:37 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 25 May 2021 18:04:37 +0800
From: Wen Gong <wgong@codeaurora.org>
To: ath11k@lists.infradead.org, johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH 0/9] cfg80211/mac80211: Add support for 6GHZ STA for
 various modes : LPI, SP and VLP
In-Reply-To: <20210517201932.8860-1-wgong@codeaurora.org>
References: <20210517201932.8860-1-wgong@codeaurora.org>
Message-ID: <6add42222bd66655fe76ce62676bd105@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_030448_480243_C2ABC321 
X-CRM114-Status: GOOD (  12.15  )
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

On 2021-05-18 04:19, Wen Gong wrote:
> It introduced some new concept:
> power type of AP(STANDARD_POWER_AP, INDOOR_AP, VERY_LOW_POWER_AP)
> power type of STATION(DEFAULT_CLIENT, SUBORDINATE_CLIENT)
> power spectral density(psd)
> 
> This patchset for cfg80211/mac80211 is to add the definition of new
> concept of 6G and add basic parse of IE(transmit power envelope
> element) in beacon and save power spectral density(psd) reported
> by lower-driver for 6G channel, the info will be passed to lower
> driver when connecting to 6G AP.
> 
> Wen Gong (9):
>   cfg80211: add power type definition for 6G Hz
>   mac80211: add definition of regulatory info in 6G Hz operation
>     information
>   mac80211: add parse regulatory info in 6G Hz operation information
>   cfg80211: add definition for 6G power spectral density(psd)
>   cfg80211: save power spectral density(psd) of regulatory rule
>   mac80211: add definition for transmit power envelope element
>   mac80211: add parse transmit power envelope element
>   mac80211: add transmit power envelope element and power constraint in
>     bss_conf
>   mac80211: save transmit power envelope element and power constraint
> 
...
Nobody have comments?

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
