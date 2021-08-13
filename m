Return-Path: <SRS0=jWs5=NE=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9505EC4320E
	for <ath11k@archiver.kernel.org>; Fri, 13 Aug 2021 07:23:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 172836103E
	for <ath11k@archiver.kernel.org>; Fri, 13 Aug 2021 07:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 172836103E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+emc0RNW+jW0YwN+0NqreCJv4pGFfJt+f1Rh+AAc2nQ=; b=Gg6Y8VuA4Pgth1
	821kfoQ3OquLjusKigttUHawn7ZLbBo7MAfEuh9S8lPsWvvAK7AyJ9Ig3cVCwY+vEcCSejCOueMAA
	z/DiKTFTxUYVTNj9hkNnG2TmQT8qHLsGOEJtcRddLLMCJuEt6ukPyCGCe28O0UyeHTX+57KurRB57
	sfL7VLNmsaLfcCDnxl/NQyuDP0qfkDJr+8KYTekY92MtRLMpDwhGrvRNwIYHrqeQGL7UTUM/ZYp0R
	qgsP5hQo7P0DkBAJOr/rYwBKdfwN9kx5yDoOxQiuT+YEeuiswCRWkhgt8TLqu8n0uWzEtrB0vJaiF
	nshQKmP6TolursrmwxbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mERXg-00C7c1-O0; Fri, 13 Aug 2021 07:23:48 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mERU2-00C5xN-MS
 for ath11k@lists.infradead.org; Fri, 13 Aug 2021 07:20:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=ii8qigtqoWhNY+QmoOCkpVp/ABXpmn52aG2GUe/zRcw=; 
 t=1628839199; x=1630048799; b=HmdHqnT6W/jk/fiQighkDW5Gz3TI10fne/anXhTOmeaX8oN
 R9FhoCeHEOZ9l0Nklm9Z8j6QkUpYBvPOxePfMaM8QtPmDnmBNgOIkcH/e3TBI8oSxZi98I5eY4ZpQ
 JeVLzE+WFbWfijuoJIriFWJYkbq4ozSIXF2pkCXb2ZYlL97uJSUehBIdcMdrVxF0+8jkBNqxbvsb5
 demeJQbDRJFR+pOBI7AVeshTkdOeOAS1BNHfKGnPBnZ5EJT8+b6CHPbd7y4Q7HgGeUEmbaIf7gfax
 9sc9unkkWveSDieTXpaDtmsDhFnM48gygP9SDFodY0bW5xdcneHxK2sCmKdIB3dQ==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <johannes@sipsolutions.net>)
 id 1mERTw-00A8YF-8k; Fri, 13 Aug 2021 09:19:56 +0200
Message-ID: <38e7d9d2eebafa7245a36a0a0396094526eb3efd.camel@sipsolutions.net>
Subject: Re: [PATCH 9/9] mac80211: save transmit power envelope element and
 power constraint
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <wgong@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Date: Fri, 13 Aug 2021 09:19:55 +0200
In-Reply-To: <1126f8d996e895ae048092b3f8aad19b@codeaurora.org>
References: <20210517201932.8860-1-wgong@codeaurora.org>
 <20210517201932.8860-10-wgong@codeaurora.org>
 (sfid-20210517_222034_029448_A9A89D57)
 <d9491db4ece67ac78eb39a1078b91a106770fbb0.camel@sipsolutions.net>
 <1126f8d996e895ae048092b3f8aad19b@codeaurora.org>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_002002_897443_4D689C18 
X-CRM114-Status: GOOD (  18.77  )
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

On Fri, 2021-07-30 at 18:47 +0800, Wen Gong wrote:
> 
> > And then two more questions:
> > 
> > 1) Could this information change? Should we track it in beacons?
> > 
> 
> The information is from AP side, it should be not changed untill the AP 
> restart.
> If someone want to change configure of AP, the AP should restart and 
> then take effect by my understand.
> Is it have some case for this information change?

No, I guess that's fine then, I just didn't know.

> > 2) Should we at least check it again from the protected beacon or such
> > after association, so we don't blindly trust the probe response or
> > beacon (received during scan, not validated) at least when BIGTK is in
> > use?
> 
> May we add support for BIGTK in future with another patch?

We already have BIGTK support in mac80211, so if we don't do that now
we're almost certainly not going to do it, so I'd really prefer if you
did it here, or if a separate patch still did it now.

> The info(pwr_reduction and tx_pwr_env) is used by lower driver such as 
> ath11k.

Sure.

> If the info changed after association, then how to notify lower driver?
> Do it like below in ieee80211_rx_mgmt_beacon()?
> And use BSS_CHANGED_TXPOWER or a new enum in ieee80211_bss_change?

Yeah, dunno. Are the drivers assuming now it's set once you get to
associated state?

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
