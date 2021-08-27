Return-Path: <SRS0=lr6B=NS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E056C4320A
	for <ath11k@archiver.kernel.org>; Fri, 27 Aug 2021 06:55:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D101060F92
	for <ath11k@archiver.kernel.org>; Fri, 27 Aug 2021 06:55:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D101060F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G7SB70fwndBBbrvO7p94fyXzKYkMhCEGpdNrETUiOiE=; b=G9qLJWLDI/UVtw
	hm1Elf3GD7NtxBFb8OofWao6RrpLOJEubSYp9Fucjvcl9V6UmFiQCaoX8aj5apcPL1FsfsMNxLxDh
	PQcaQdTFIH6tDJTYU4MhjRG79930II4ndJxI+QAcBJbFDcdNN24FTkioKcZKYyxq/giqpaJ4hkX4m
	CK6v8Qd3ygeZyOjz5ePzKrW+DcwZK2Xc/J5PWuow08dyNYekRaB4uTQxbBN2VrYDCQnaWfYZ1nwp3
	8AngbCxCJwAGplo9vLxUT6lEl/t69G0Zoj5Ja+lJgPQsaGkrknWg3HNvfoTlkwN9kut0OWQab+Fmg
	NRdC4JnDVqSs5gSI9k/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJVli-00BiX3-LY; Fri, 27 Aug 2021 06:55:14 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJVld-00BiVs-4i
 for ath11k@lists.infradead.org; Fri, 27 Aug 2021 06:55:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=X8GH0wKg4VdBo0Rmn8JgKYN05qcOXgnb3Jh8iZDPov8=; 
 t=1630047308; x=1631256908; b=GEmmMbvVLJg0XxC+060xwtjNJrQPmTxrvYnmK9w760AqDS+
 XC4G5RzBGYb2dMu4Z6+WIweJ9O2H/uQPhN6z9BJKiNmCVSjgEjQ7K/dZkkHKMfDsySbbQeURab5zQ
 NJrNBbgWUM/gLliqpqEemGogwmWlxKGIymetKJMstbp9sBZJGaZGoWBQEchiVY5XRE7nxTV0USf6S
 vS7Cb8LnZiVzkV5mKeKxbDw79mS2n59kF89MZmr3zT3j9rrW2sl5gbfAs4PcZ9gIS9+0As1WoxiU5
 HvxDh6jL2FVHcb3zPX444Ev84TLu86cs7jPyuTgnO09yC2Lnmlm9HyfI7M86C4BQ==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <johannes@sipsolutions.net>)
 id 1mJVlb-00GVdn-F9; Fri, 27 Aug 2021 08:55:07 +0200
Message-ID: <0680b508a7864e02f55d763851f7460baa73b53f.camel@sipsolutions.net>
Subject: Re: [PATCH v2 8/8] mac80211: save transmit power envelope element
 and power constraint
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <wgong@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Date: Fri, 27 Aug 2021 08:55:06 +0200
In-Reply-To: <db22a4cb9a07e3845a50f436c7052feb@codeaurora.org>
References: <20210820122041.12157-1-wgong@codeaurora.org>
 <20210820122041.12157-9-wgong@codeaurora.org>
 <dfe27f657b4615369cf751d394f5cba75f5fdcc1.camel@sipsolutions.net>
 <25fcede26b99604a03d0b321b7120db4@codeaurora.org>
 <48ad47869e703cbef437378c508d6a5b64c160ae.camel@sipsolutions.net>
 <db22a4cb9a07e3845a50f436c7052feb@codeaurora.org>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_235509_238770_3E9B8008 
X-CRM114-Status: GOOD (  13.76  )
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

On Fri, 2021-08-27 at 14:53 +0800, Wen Gong wrote:
> > 
> > Well, there's an existing place in this function that uses
> > cfg80211_find_ext_ie(), and various uses of ieee80211_bss_get_ie(), so
> > it feels like if we're going to do the full parsing, we should switch
> > all the existing "look up an element" to also use the parsed data
> > instead.

> ok.
> so it ha 2 way to change, right?
> 1.
> change ieee802_11_parse_elems() to ieee80211_bss_get_ie()

No why?

I think we should make a first patch (that doesn't add TPE yet) that
changes the function to ieee80211_parse_elems() and removes all the
ieee80211_bss_get_ie() / cfg80211_find_ext_ie() calls in favour of just
parsing once, and then looking at the elements there.

Then your TPE patch becomes trivial since the elems are already there?

> 
> 2.
> still use ieee802_11_parse_elems(), and change others 
> ieee80211_bss_get_ie()/cfg80211_find_ext_ie()
> to use the result of ieee802_11_parse_elems()
> 

Right!

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
