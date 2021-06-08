Return-Path: <SRS0=tQ0v=LC=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0954DC4743D
	for <ath11k@archiver.kernel.org>; Tue,  8 Jun 2021 21:41:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC2B861375
	for <ath11k@archiver.kernel.org>; Tue,  8 Jun 2021 21:41:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC2B861375
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s4NzfKIItWEjR5j2WCVYqmxVt5r13MDzt3ybWte4t4k=; b=47R0BRgmUgfZh3p7AYdX0klWsT
	1xHZNVi+hlQ+3sp+GNuvQArPTsg2j86XOdMMB6iUGEFNaVFPbiGEhAsm+3+/1jSQPoumy+zPU6pdD
	m1a+YxqcgW2OySeynmL0hapt+fbE57ASQpCs7yf8czYGo79GW2IsjzuxlKX3Tkmyrhurk1zSK1sGS
	uTc1zqSNY43Fji8tugSaKT5kPuw8/SVKIVciOFVrv6ovalkE/mSaMVH55J/dWz6PIFjzJr3rgDQRv
	gQG1Ny0CGU0FKADPeZuLfxcmr8DS52LITHYX6aHHq1cXxdKZLqwwZRhCI9kQLBY+yzUM/SCPWntLX
	8iN8bpeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqjTQ-00AZHE-AD; Tue, 08 Jun 2021 21:41:24 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqjTM-00AZG7-3G
 for ath11k@lists.infradead.org; Tue, 08 Jun 2021 21:41:23 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1623188481; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=mE8kJXf0bdE+m2YIN9i+OGatUzHgx1SFwmYDOvJ6rT4=;
 b=YVoUdb8jx9MTxHBiKVBwdljsFkByFsembwo6HymCSKCVSXobqot1z8KhO9kZAM4k14U4TSfa
 nPZmpswpt3gSnEhsHby5lrE3ibEkR2OqnxapWwclzsr75Um2JKYArcKPaRAMI8miZ3w5v44M
 QlDR/yG4H7rxMv8fuuVaE1i2jl4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60bfe3f3e27c0cc77f37e01c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 08 Jun 2021 21:41:07
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 71591C4360C; Tue,  8 Jun 2021 21:41:06 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: jjohnson)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 441F2C4338A;
 Tue,  8 Jun 2021 21:41:05 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 08 Jun 2021 14:41:05 -0700
From: Jeff Johnson <jjohnson@codeaurora.org>
To: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, ath11k
 <ath11k-bounces@lists.infradead.org>
Subject: Re: [PATCH v4 0/3] Add support to configure beacon tx mode
In-Reply-To: <1623164855-15910-1-git-send-email-mkenna@codeaurora.org>
References: <1623164855-15910-1-git-send-email-mkenna@codeaurora.org>
Message-ID: <fb7af985fdc740c78e9615c518aa1616@codeaurora.org>
X-Sender: jjohnson@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_144122_061820_0CECE67B 
X-CRM114-Status: GOOD (  12.43  )
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

On 2021-06-08 08:07, Maharaja Kennadyrajan wrote:
> Add support to configure the beacon tx mode as STAGGERED
> or BURST mode via hostapd configuration during the AP
> bring-up or via wpa_suppplicant configuration during MESH
> bring-up.
> 
> Beacons can be sent out in burst(continuously in a single shot
> one after another) or staggered (equally spread out over beacon
> interval) mode.
> 
> V4: Rebased on latest ath.git TOT.
> 
> V3: Addressed Johnson's comment on v2 patch.
> 
> V2: Addressed Johannes's comment on v1 patch.
> 
> Maharaja Kennadyrajan (3):
>   nl80211: Add support for beacon tx mode
>   mac80211: Add support for beacon tx mode
>   ath11k: Add support for beacon tx mode
> 
>  drivers/net/wireless/ath/ath11k/mac.c | 10 +++++++---
>  include/net/cfg80211.h                |  4 ++++
>  include/net/mac80211.h                |  2 ++
>  include/uapi/linux/nl80211.h          | 16 ++++++++++++++++
>  net/mac80211/cfg.c                    |  2 ++
>  net/wireless/nl80211.c                |  9 +++++++++
>  6 files changed, 40 insertions(+), 3 deletions(-)

For entire set:
Reviewed-by: Jeff Johnson <jjohnson@codeaurora.org>

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
