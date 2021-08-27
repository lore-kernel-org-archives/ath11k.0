Return-Path: <SRS0=lr6B=NS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56404C432BE
	for <ath11k@archiver.kernel.org>; Fri, 27 Aug 2021 07:38:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13A5660F92
	for <ath11k@archiver.kernel.org>; Fri, 27 Aug 2021 07:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 13A5660F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rwgOn6HHpQdz9Y/cqhtIWGy9Q5/sMzCMFZFHpuUWbRM=; b=zn5MD/yBYaVSve
	14pbxgpvmWWd0nFbOSouxg38w3WABQsRyVR57ME5AkBoIjwVHaV9/1AJFcT9BLLXCSXHVqnE4rJDi
	5jA6OIf72Q7NAjq5xAYeGxNOVa0/sJlUykB8qpdFKwv07/hfhASUcu+M3u0yZLa9NZjvwvfPjyerg
	aRWTLEpZZ/XVMzbaoBW9CcFzCWvVo2SRDNiuee4AULMhuNpZgFMM3UAI0Gv+fmvPAePSQg8lgMHfk
	AdolUiZ+8fu2lx49ebBh9YwH/Yfj7l5lU8+gu35SVSRhXNYwZE5peLJjPOyOVnbOVm3xwGMsYeke1
	QI7KgJDALRooMT9TtB4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJWRV-00Brtq-Hm; Fri, 27 Aug 2021 07:38:25 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJWRQ-00Brsm-J9
 for ath11k@lists.infradead.org; Fri, 27 Aug 2021 07:38:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=GcJN2gXeESFjQDI1jkzgRhsBaiskCjhNlWKpqIMRnVQ=; 
 t=1630049900; x=1631259500; b=JSwWGufZ38pfC79tKK8MbcpK0VNj3TPA5lBX75KsFKtJRTW
 VRo1+qNwzZgbQHMTuONxGz9xcFAy9mRC1rdPM7QjyqmPzS/6fsdYce1Mm5eoC/ikYrtboUAgVaNT/
 TeSz9olP5HgeLpEGXBRGOAkbIud3zaIUU4VltMd+BZCY/IGtRItzaMd/Xn87vKONH7QIX43M8RbgG
 Hh1yIijhlQcn7alr9nMyETJY88UvqXMssGnH+MtOF4IVY2HAsgFkMcvwYgdf6UWjVDx4DI9LS+1Y7
 GEMMLmHrUyzzAxVyK6H9IUAEWsZAK3IeXpvqcGfn1W44cXiLSlrM0AHaxU40o2ig==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <johannes@sipsolutions.net>)
 id 1mJWRO-00GWNY-Rh; Fri, 27 Aug 2021 09:38:18 +0200
Message-ID: <27680423e824dd67217cc6f1e62f9ac0a1af78f2.camel@sipsolutions.net>
Subject: Re: [PATCH v2 8/8] mac80211: save transmit power envelope element
 and power constraint
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <wgong@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Date: Fri, 27 Aug 2021 09:38:18 +0200
In-Reply-To: <110489059796b17849d0f32fb5189828@codeaurora.org>
References: <20210820122041.12157-1-wgong@codeaurora.org>
 <20210820122041.12157-9-wgong@codeaurora.org>
 <dfe27f657b4615369cf751d394f5cba75f5fdcc1.camel@sipsolutions.net>
 <25fcede26b99604a03d0b321b7120db4@codeaurora.org>
 <48ad47869e703cbef437378c508d6a5b64c160ae.camel@sipsolutions.net>
 <db22a4cb9a07e3845a50f436c7052feb@codeaurora.org>
 <0680b508a7864e02f55d763851f7460baa73b53f.camel@sipsolutions.net>
 <110489059796b17849d0f32fb5189828@codeaurora.org>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210827_003820_685062_8FB7068F 
X-CRM114-Status: GOOD (  19.10  )
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

On Fri, 2021-08-27 at 15:12 +0800, Wen Gong wrote:
> On 2021-08-27 14:55, Johannes Berg wrote:
> > On Fri, 2021-08-27 at 14:53 +0800, Wen Gong wrote:
> > > > 
> > > > Well, there's an existing place in this function that uses
> > > > cfg80211_find_ext_ie(), and various uses of ieee80211_bss_get_ie(), so
> > > > it feels like if we're going to do the full parsing, we should switch
> > > > all the existing "look up an element" to also use the parsed data
> > > > instead.
> > 
> > > ok.
> > > so it ha 2 way to change, right?
> > > 1.
> > > change ieee802_11_parse_elems() to ieee80211_bss_get_ie()
> > 
> > No why?
> > 
> > I think we should make a first patch (that doesn't add TPE yet) that
> > changes the function to ieee80211_parse_elems() and removes all the
> > ieee80211_bss_get_ie() / cfg80211_find_ext_ie() calls in favour of just
> > parsing once, and then looking at the elements there.
> > 
> > Then your TPE patch becomes trivial since the elems are already there?
> this patch still needed, because the lower driver need the info.
> and this patch is save the info to "struct ieee80211_bss_conf *bss_conf" 
> and
> pass it to lower driver.

Of course, but you don't have to deal with parsing etc. in that patch
then.

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
