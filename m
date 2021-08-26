Return-Path: <SRS0=rto1=NR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47159C4320A
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 08:21:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12D29601FA
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 08:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 12D29601FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0M+Hx1Jc4BABXB/vaCCzsu3rOUzy32d7FVsVRfu7CAc=; b=zGy6O6+y7x5gyM
	Hkypo+csaQYiV5X/FNiEwyOOe5p1OMp0uYvjRY5jNf6ZpMZSoYzE9yLydrtzoHHlVca3x8Hd4BjBC
	qyc0EGL0oHLq1Fq6jcv22q5WUHqFQsOLEvQWL9fEukfndixAcI2zyjOkyNlJ0hNz4BptZpEptYrz2
	5vLjHqk9DfxRa6gXlqwoQQldEVPGVs1g4ZcdwYUgMHrEtzL54dP9ctYLUsr1JXIRS9A4pCdu0WCyx
	fE1DtLv7IltTNA0dmg4og9eiBg4lAH8uE2QKGMROyO9OMZle7Jf2VHIWs+ntXth/p9uZXaxB0uD4M
	yB5MNJ2aqeYN48oYONFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJAdC-009XSR-6t; Thu, 26 Aug 2021 08:21:02 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJAd7-009XRU-0Z
 for ath11k@lists.infradead.org; Thu, 26 Aug 2021 08:21:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=/wciBovcEww3cLA7tWSOeTZCIekl7Ox7i6utsNXClyo=; 
 t=1629966056; x=1631175656; b=i1C2mPzSILSsXsi6K/jPdcOFyUk5pi9X1GHyw68o8FmVukG
 hg4vZQMxLR+16vUmzkonPn31uRqQ6hrOaOACwCpT0TufCJVsbhi+dYNDo7fKFJtBKt0KlEItiHggO
 I5Oc9f4oG12zVQdbrdtL5dQmSMBYl/gT1psenHxUCONYsZj8KZ15ZgfJ9cAznTGb2sQcNG+3h2N9b
 4iDwq5HFQcwgjYR9ZqstxhPtaOgjOHjSGFIGsRzEvX2zz3gdvcRbGIMxmp5kpy3LzwTqP7T/n/1JO
 AfuwrTSZYsB3xzaNlbsJb489Nen7bWJJlM9cvjOU9m2rsLnQRIWfORc2vb0I3wmA==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <johannes@sipsolutions.net>)
 id 1mJAd5-00G4e2-Ba; Thu, 26 Aug 2021 10:20:55 +0200
Message-ID: <2c911f0e716cbe7c430f46ca5d7fdfd616b06e6a.camel@sipsolutions.net>
Subject: Re: [PATCH v2 7/8] mac80211: add parse transmit power envelope element
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <wgong@codeaurora.org>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Thu, 26 Aug 2021 10:20:54 +0200
In-Reply-To: <20210820122041.12157-8-wgong@codeaurora.org>
References: <20210820122041.12157-1-wgong@codeaurora.org>
 <20210820122041.12157-8-wgong@codeaurora.org>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_012057_104294_5964DA25 
X-CRM114-Status: UNSURE (   6.59  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Fri, 2021-08-20 at 08:20 -0400, Wen Gong wrote:
> 
> +		case WLAN_EID_TX_POWER_ENVELOPE:
> +			if (elems->tx_pwr_env_num >= ARRAY_SIZE(elems->tx_pwr_env) ||
> +			    elen < 1)
> +				break;

IMHO this should also check the max length, but I'll fix that.

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
