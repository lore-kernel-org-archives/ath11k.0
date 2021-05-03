Return-Path: <SRS0=wPjJ=J6=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 898D9C433ED
	for <ath11k@archiver.kernel.org>; Mon,  3 May 2021 17:25:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3652161159
	for <ath11k@archiver.kernel.org>; Mon,  3 May 2021 17:25:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3652161159
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NBG66u9vNECF3/oHMfyduXYPRYJhjGpYF28vjUie9Hs=; b=YYb42qSUr/UI73XiyUqwxwUkW
	bhEVKDfYlG9mu8Fh+p/NCrAvuUJnalSqcmB+sml3Fhv+y1GhI5M/IfPOxynNzh8Ip1x+AZ4IUWVJt
	49ftUULI346BJfSph7KH9PmKS4p15DFm2EB7JuiKm1QQQwH2XrJiuH7sH1+WcxANJAg8skOXkr08w
	tf0JVxoaJdAP/Cco+AMzE+qq3Eb/WZhtq5AM7kbTr16Ty7b3YSwKZg8MKeU7Ui9JJfBfC4HL8S9ty
	0YiSwMK+cBxaLPEWJwf3tsqIeTL7JbwlpD1RJTDw6qN4aX6oaGPCNa/MDCMRP6X94Mu6EZWS5wm7a
	l5ZnwLLfw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldcJd-00EVYL-AO; Mon, 03 May 2021 17:25:05 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldcJZ-00EVXe-Fn
 for ath11k@desiato.infradead.org; Mon, 03 May 2021 17:25:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=hsB8N+8JBY8AgfW7y30YN7AnS9xI7/dZQ0oNn0aKAKY=; b=0BckU5w/jLFvel734j7QnXjvYd
 H+XTumQaN1KD09xXn6rjiOSV7oxSi0Y8ejO6E04Cqtx2XYQnr1c5vBAtPb+/NiHYlwA1jD2rmlrhx
 Wxj/LzzkuAZcsrMn7VniNhGsG7xzex/kKxzupbfP86sH9iI4VPgmz6oHiBDR2ph61ic6tQTpvve1F
 Edf59WwVKGZRBYqF7V86IqtT9I9i+I7pmW1FXpgyzFzpEtiJCbDe2YV6lp27bx/hrqEMV4fgJ/HaR
 pc43xsxYpWJg19l/pBWGToUXNIFu2a+4uUwKY3QoXg0WvDpGDSfxIHJQsKitCQrv2S/xsO50looLB
 Z7PUdFcA==;
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldcJW-003LXc-VF
 for ath11k@lists.infradead.org; Mon, 03 May 2021 17:25:00 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1620062697; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=hsB8N+8JBY8AgfW7y30YN7AnS9xI7/dZQ0oNn0aKAKY=;
 b=rvu8mPxDSJT1djQwAi2107KjSUACIIVGJan7iqAtAichfiALmJQJ5dj8MVuJVCeC+0WLMpVu
 yU5IqmWPLOKwQGATGnR28MzLNwNQwpNverRm2w/fhkhoo1jSlVwf/n+sEb3jP/fi0yXmCPUH
 HXgReZaUB9y9YmScf1xQR7rrzCw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 609031e8c39407c32759b712 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 03 May 2021 17:24:56
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0CBCFC43217; Mon,  3 May 2021 17:24:56 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: jjohnson)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 13C97C4338A;
 Mon,  3 May 2021 17:24:54 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 03 May 2021 10:24:54 -0700
From: jjohnson@codeaurora.org
To: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, ath11k
 <ath11k-bounces@lists.infradead.org>
Subject: Re: [PATCH v2 1/3] nl80211: Add support for beacon tx mode
In-Reply-To: <1619696874-30072-2-git-send-email-mkenna@codeaurora.org>
References: <1619696874-30072-1-git-send-email-mkenna@codeaurora.org>
 <1619696874-30072-2-git-send-email-mkenna@codeaurora.org>
Message-ID: <445ba573b519b9434d0e009eb9ff6f45@codeaurora.org>
X-Sender: jjohnson@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_102459_060020_A25A8907 
X-CRM114-Status: GOOD (  12.77  )
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

On 2021-04-29 04:47, Maharaja Kennadyrajan wrote:
[..snip..]
> +/**
> + * enum nl80211_beacon_tx_mode - Beacon Tx Mode enum.
> + *      Used to configure beacon staggered mode or beacon burst mode.
> + */
> +enum nl80211_beacon_tx_mode {
> +	NL80211_BEACON_STAGGERED_MODE = 1,
> +	NL80211_BEACON_BURST_MODE = 2,
> +};
> +
[..snip..]
> @@ -5330,6 +5331,10 @@ static int nl80211_start_ap(struct sk_buff *skb,
> struct genl_info *info)
>  	params.dtim_period =
>  		nla_get_u32(info->attrs[NL80211_ATTR_DTIM_PERIOD]);
> 
> +	if (info->attrs[NL80211_ATTR_BEACON_TX_MODE])
> +		params.beacon_tx_mode =
> +
> nla_get_u32(info->attrs[NL80211_ATTR_BEACON_TX_MODE]);
> +

Note that in the case where NL80211_ATTR_BEACON_TX_MODE is not specified 
that
beacon_tx_mode will be zero, which is not a valid nl80211_beacon_tx_mode 
enumeration.

Should you renumber the nl80211_beacon_tx_mode enumerations so that the 
default
mode has a value of 0? Or add NL80211_BEACON_DEFAULT_MODE = 0 and allow 
the driver
to select a default mode?


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
