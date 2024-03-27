Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD21C54E67
	for <ath11k@archiver.kernel.org>; Wed, 27 Mar 2024 10:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/vE/qKbFcsr453lP/nQUsxyq9xtcN9Hp1eXb/WHDqZg=; b=GW/EOETJZ0deMPaaHMQDivUAg3
	hCqVccL7DfBlC/cp/kMGGwDh9usb6NjeRkZzdX1DEupPAeCEfeBDUlCu1GxrzJbC8/3Vlm/gO3Rkt
	aOo7FusePLs/sQlAX1SlsxEWLmIw2iSLglU0PKTUG9yQ9OKgia21qJizo+uCfWuXwh3ZYwHGNSkcZ
	C0NAT4CGMdEdvO2ObH2epFV1xW2oLdVmVHAX0tMGNHhYKs+1XrcKEBJ1/iFI5edLgFqILoEYrutuZ
	5sdWbwH5n3FFFfT4jJL6cfsAIwucaa0pDxaFbX5DEsWkCYzmP9lfls+YGjMWFf8vHaQq87rPhYlQV
	1J8OfwXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpQaX-00000008QfU-0wHP;
	Wed, 27 Mar 2024 10:32:57 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpQaT-00000008Qe0-3SE7
	for ath11k@lists.infradead.org;
	Wed, 27 Mar 2024 10:32:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=/vE/qKbFcsr453lP/nQUsxyq9xtcN9Hp1eXb/WHDqZg=;
	t=1711535572; x=1712745172; b=DA3hdq8NnuyG59eTTb4jcPaNfPTqqUV60S2pFjC78WmKqMh
	lNMfsyaosXSi5uK2ZjWUG2cyNFcESM9ePPhT09RL9JcSq3EnIbNiidhCg8WNz0ztXIj3y21jvI+SF
	nMbiaWnHxvM/0c6QPor7ZX6+brzqWIDotc+6dw/r2a9Y+VCgSWGhJmwfFSljfmyx6mrXuA4Y4YR/5
	VRkfjSwgEdEI/rg8TSQLfkXVJqX1RM3SHzYWinEtQt6bWoFqusFzByLbtLggApTlX3J1HYy4pvLlq
	hydafhE49AIoi8ohiOLd8QV2+ilV0mc2REDXTw3rtFkb8UOUb3Si1F07iURSj2aQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rpQaP-0000000H0PI-00ZZ;
	Wed, 27 Mar 2024 11:32:49 +0100
Message-ID: <b9dfab64822bacf0cc72380c0de034b79d489668.camel@sipsolutions.net>
Subject: Re: [PATCH v2 1/2] wifi: cfg80211/mac80211: Add support to rx retry
 stats
From: Johannes Berg <johannes@sipsolutions.net>
To: Hari Chandrakanthan <quic_haric@quicinc.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Wed, 27 Mar 2024 11:32:48 +0100
In-Reply-To: <14699537-99b2-e468-6a7b-7b721193400e@quicinc.com>
References: <20240319134522.4021062-1-quic_haric@quicinc.com>
	 <20240319134522.4021062-2-quic_haric@quicinc.com>
	 <d364e872eb29f03236630bab49a3243e2118ab22.camel@sipsolutions.net>
	 <14699537-99b2-e468-6a7b-7b721193400e@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_033254_171939_0E70B8C0 
X-CRM114-Status: GOOD (  11.14  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Wed, 2024-03-27 at 15:39 +0530, Hari Chandrakanthan wrote:

> Fields such packet count, retries etc can be summed up for the MLD=20
> representation and the existing NL attribute can be used for exposing
> the summed up value.

I think the existing attributes can also be used for per-link STA?

I'm kind of imagining that - once we actually do all of this properly -
the representation in nl80211 would be something like


STA 00:00:00:00:00:00
 - TX bytes: 123456
 - RX bytes: 654321
 - signal avg: -60 dBm     // picking the best of all links?
 ...
 - LINK 00:00:00:00:00:01
    - link ID: 10
    - TX bytes: 100000
    - RX bytes: 600000
    - signal avg: -60 dBm
 - LINK 00:00:00:00:00:02
    - link ID: 11
    - TX bytes: 23456
    - RX bytes: 54321
    - signal avg: -70 dBm

etc.

> But there are fields such as signal avg, bitrate etc which cannot be=20
> summed up.

Right, but I guess we can pick 'best' for those, to at least have a
value? Or we could just not emit those attributes I guess, but not sure
if that's then all that useful?

> Should we expose such fields of each link STA through NL?

All of them, I guess?

I'm also imagining that we change the API from cfg80211 to the drivers
to get the *link* STA information, and do the summing up and/or "best"
selection there in cfg80211 itself. However, I am prepared to accept the
possibility that we may do _both_ in the API, if not all drivers can
even do all of the statistics per link. We should probably still have
the link STAs in the statistics in nl80211, but then they may not be
populated?

johannes

