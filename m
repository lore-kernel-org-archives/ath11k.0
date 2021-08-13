Return-Path: <SRS0=jWs5=NE=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DDD2C4338F
	for <ath11k@archiver.kernel.org>; Fri, 13 Aug 2021 08:53:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A1036103E
	for <ath11k@archiver.kernel.org>; Fri, 13 Aug 2021 08:53:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A1036103E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r8rZZmgccW4eExUfbr8sUfjxiUgnqexCUrB22QeebMQ=; b=2mhptPqrrCNZuY
	1xaI7GkjM9ZMOz94lkvNFRIrPmEyAg4MfFfExaIMwF2hhJZZc4m6axH+iStuxsA9+XNpt2v/N2b9f
	mKgyiPCqajR5JpnnmJ2PnlUtn1ROg8n4kSL8UNw7yS2EL8FMQbQ5kdXlNdLJzD3Pnor79bVN9c7pv
	NdL7j/JYJGaW+juvTTCZsCUQaAK4bFJi8ftQxik9a2wzc8FbuTDlGfRyIgpy+G7xyNHXAry5YBIVm
	5AUQZCrZQ8S+1iq4B3pMBTZI7nmSXGwbhMVVX3N0TWJk6w09GGiBbluIJNRWvBnjYbPJeDHOUQU18
	Fq81p0nzUDpFNgtsae5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mESwJ-00CGOB-Bh; Fri, 13 Aug 2021 08:53:19 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mESwD-00CGLP-UN
 for ath11k@lists.infradead.org; Fri, 13 Aug 2021 08:53:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=yEydqY9Xy13lsq8FKdyDyWGqKcxRfkS1FfPdMJ2lE1E=; 
 t=1628844793; x=1630054393; b=cfCkjHFFg7Xp3CB7eyWfyqxipUpqcsP9rBaKKI2NslBFNX4
 Bmks13ZHdnsdZt8j2FK7sADsd83oYecxZ+wGWXSP1oZu1nAkUEzK37g8Pznrxrl7H8DZnDIiVFagv
 nas2AD2lzTs6WODmMLVBvvs0G6VSHebLBfvbu5BbGgqfaV3bGbY4qLjbYaZeIjYZ3RvloccK35vdp
 KSb9mi3ltafo/9Aw32sSFVKgf/fxjVgQ6s6HRlwuXEnkcuK6NWk7kPlpXvxqbQ/7JW/dfJH3c5Vzt
 zFdiE2X4fbilZAoBgezaAyNP0aVHJPqUOw3sb+ET7NOI7x4ptlpvzTFaaXCDAIvQ==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <johannes@sipsolutions.net>)
 id 1mESwA-00AANQ-Nf; Fri, 13 Aug 2021 10:53:10 +0200
Message-ID: <f61cdc7bae2dd2a645e164ca143b9db402472559.camel@sipsolutions.net>
Subject: Re: [PATCH 9/9] mac80211: save transmit power envelope element and
 power constraint
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <wgong@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Date: Fri, 13 Aug 2021 10:53:09 +0200
In-Reply-To: <a056e32d4911400fb0822bf02167e91c@codeaurora.org>
References: <20210517201932.8860-1-wgong@codeaurora.org>
 <20210517201932.8860-10-wgong@codeaurora.org>
 (sfid-20210517_222034_029448_A9A89D57)
 <d9491db4ece67ac78eb39a1078b91a106770fbb0.camel@sipsolutions.net>
 <1126f8d996e895ae048092b3f8aad19b@codeaurora.org>
 <38e7d9d2eebafa7245a36a0a0396094526eb3efd.camel@sipsolutions.net>
 <1273cc1a399a7457c3d908648a7651c8fe9b93f3.camel@sipsolutions.net>
 <a056e32d4911400fb0822bf02167e91c@codeaurora.org>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_015314_038139_9A5118DE 
X-CRM114-Status: GOOD (  29.08  )
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

On Fri, 2021-08-13 at 16:47 +0800, Wen Gong wrote:
> > > > > 2) Should we at least check it again from the protected beacon or such
> > > > > after association, so we don't blindly trust the probe response or
> > > > > beacon (received during scan, not validated) at least when BIGTK is in
> > > > > use?
> > > > 
> > > > May we add support for BIGTK in future with another patch?
> > > 
> > > We already have BIGTK support in mac80211, so if we don't do that now
> > > we're almost certainly not going to do it, so I'd really prefer if you
> > > did it here, or if a separate patch still did it now.
> > 
> > Actually, I should say though - the question was more whether we even
> > need/want that, rather than whether we can do it later or not.
> > 
> > If we should protect this data/information then IMHO we should do it
> > now, but it's not clear to me that we should, given that we also don't
> > have encrypted association response and we still take information from
> > there too, etc.
> > 
> > johannes
> I prefer to add a new enum(not use BSS_CHANGED_TXPOWER),e.g, 
> BSS_CHANGED_PWR_ENV.
> And add check in ieee80211_rx_mgmt_beacon() as well as 
> ieee80211_handle_pwr_constr(),
> when the value of pwr_reduction or content of elems.tx_pwr_env changed,
> save the pwr_reduction and elems.tx_pwr_env to ieee80211_bss_conf, and 
> notify lower
> driver with BSS_CHANGED_PWR_ENV, then lower driver will do next action.
> 
I don't really have any objection to this, but OTOH it feels like
drivers will probably not really listen to this if it can only happen
due to BIGTK?

And if we always defer this until the first beacon, that also feels
wrong and bad?

I'm not sure what the right answer here is, TBH.

Maybe the right answer is to indeed ignore beacon protection for this,
and do exactly what you did here, and say that the TX power envelope
thing is just not meant to be protected, because the protection is meant
to protect the connection etc. and not the performance (and regulatory?)

Do we get this *only* in the beacon, or also in the association
response? If it's also in the association response we could use the data
from *there*, and basically say that the association response might need
some protection (later) anyway?

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
