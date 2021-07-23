Return-Path: <SRS0=bbE0=MP=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE44CC4338F
	for <ath11k@archiver.kernel.org>; Fri, 23 Jul 2021 09:33:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A6EE60E8E
	for <ath11k@archiver.kernel.org>; Fri, 23 Jul 2021 09:33:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A6EE60E8E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bnvj/qCumUXimsnzihMa4XHNgleOG7nYcGzXAB1FwIQ=; b=cLKEPM+dg6lohd
	pxIYeKty2Il9fJkjuD4t4ZFFaUarzag5yjXBtMoua1PoHCis7zyyYmcJrN0xuKsPpMwt1toghtBpj
	oEFa2d1xnIlQEW422CeKuB+e7lFOduJiVp2UPVBLgqL+yryRjWWhBVLeTolgpvckeXqXJ3fRWiAe+
	Zr9wQhtpZBHMnTE6MiExTjJc9nEdkxdc0m+n5FNRfoOpb8wVfbBgcp75noQMV27yTymXDs8W59t2i
	kJtLZ9y02PeXyaLbs+XMEjp1x5NG3PCnvV0GCFMjxhA8etUuKVfgjVwnTq+Y8w6DWfO9t2MDm7wf3
	v1Pm+PH4rMTekUPpFsmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6rYK-0046xV-Jg; Fri, 23 Jul 2021 09:33:08 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6rYH-0046w9-J1
 for ath11k@lists.infradead.org; Fri, 23 Jul 2021 09:33:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=k02mzyzwnJSXidYSsn7ZgHTab0GPbNCSJLd5UKesRMc=; 
 t=1627032785; x=1628242385; b=KF+JKSlLCz6QJkrAwaehO950c/xhAqipAFve5E7FW6L15J9
 Xot3FC4JinYZlZJqjlzZuv59IL3C+b8prMJrA4imQSlkAuTyyceN2XvEQnDJ2Bv9TTGKoknQfCwoh
 hpcHv/3z0SHBCSOzkPuo9pySqu4tVxskIyXTWjWTlRr8hlpAetkgWOYKFZYMh07fVQvQEU3rLXjHC
 eNgO7lkl1bhBhqQwQoUX2LDS1ZD78kBIVW6kGukxgo9LCK9YZFMorU7Qp0Agq0oKhfEudOJGmvW4Y
 dv8qYzPYrT22df/pR30wpk40ryhUXxoxKbSCGYQzhgC7pVjObTqDhTVmU671M4aQ==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <johannes@sipsolutions.net>)
 id 1m6rVh-000UCP-Aw; Fri, 23 Jul 2021 11:33:04 +0200
Message-ID: <ed5566ab47d271b845635b5c731938f333ee96b6.camel@sipsolutions.net>
Subject: Re: [PATCH 7/9] mac80211: add parse transmit power envelope element
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <wgong@codeaurora.org>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Fri, 23 Jul 2021 11:33:03 +0200
In-Reply-To: <20210517201932.8860-8-wgong@codeaurora.org>
 (sfid-20210517_222024_817809_7D68677B)
References: <20210517201932.8860-1-wgong@codeaurora.org>
 <20210517201932.8860-8-wgong@codeaurora.org>
 (sfid-20210517_222024_817809_7D68677B)
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_023305_680197_15D0D5A3 
X-CRM114-Status: GOOD (  11.36  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Mon, 2021-05-17 at 16:19 -0400, Wen Gong wrote:
> This patch is to add the transmit power envelope element parse in
> _ieee802_11_parse_elems_crc(), it maybe have more than one transmit
> power envelope element in a beacon.

This is really hard to read.

I'm sure you're aware of
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches#commit_messages

Also, FWIW, "This patch" language is pointless. We all know we're
talking about a patch. Or maybe even not, we may be reading the commit
later on.

> +		case WLAN_EID_TX_POWER_ENVELOPE:
> +			if (elems->tx_pwr_env_num >=
> ARRAY_SIZE(elems->tx_pwr_env))
> +				break;
> 

Seems to me this should do some validation on the actual element? It at
least has to have _one_ octet, afaict?

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
