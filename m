Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CAFC5DF9C
	for <ath11k@archiver.kernel.org>; Mon, 24 Aug 2026 10:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YxYqyWhF8jVUPOayUCIRYu2TYnEdqmifixKbrw4KZ+g=; b=V0mR1nbojbenlWYUbwjzuA7jUw
	fXJR6A1zxxmnDV/fVZKOOc2NYPa830ygQP8GYYOopCPolcBBrhbJ6JfCNXp/UtR0X6DuQZR8lIFPM
	9MBJVC80v5+vdNEm269OhU2lwlBvh3/rHukOP39C6Fq2j/Kz0GoXnyAWYPRl+d2O1Hq1cpfXM5EOL
	P2re3k0tbc5wlKvneNjpc6BbnGi7kCGGO4xP2y6q9Dr4d5QrovDaWB3HMmIV/V2vN20kKhSPVoeks
	ijGSHQD4QzT7s+MGMdsUWVWFHN74zosKWQfvVDsstQ6bdjavXBBN4hjpnNKp6uAtrNhQOeNeCYNZT
	JBWK9Tvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wySJA-0000000GRGY-4300;
	Mon, 24 Aug 2026 10:53:40 +0000
Received: from mail.toke.dk ([45.145.95.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wySJ7-0000000GREq-2BFK
	for ath11k@lists.infradead.org;
	Mon, 24 Aug 2026 10:53:39 +0000
Authentication-Results: mail.toke.dk; dkim=none
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: Julius Bairaktaris <julius@bairaktaris.de>, Jeff Johnson
 <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Subject: Re: [PATCH v1 4/4] wifi: ath11k: report tx airtime and enable
 airtime fairness
In-Reply-To: <20260823195703.49198-5-julius@bairaktaris.de>
References: <20260823195703.49198-1-julius@bairaktaris.de>
 <20260823195703.49198-5-julius@bairaktaris.de>
Date: Mon, 24 Aug 2026 12:53:33 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87se43eqmq.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_035338_023251_EB3849F7 
X-CRM114-Status: GOOD (  12.37  )
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

Julius Bairaktaris <julius@bairaktaris.de> writes:

> mac80211's airtime scheduler charges sta->airtime[ac].deficit from one
> place, ieee80211_sta_register_airtime(). Unlike AQL there is no estimator
> fallback, and ath11k never calls it, so the ATF feature bit cannot be
> advertised on its own: the deficit would only ever be
> replenished, every station would stay permanently in credit, and the DRR
> would be inert. The bit is not a no-op in that state either, because it
> also moves txq insertion to the head of the active list, which
> __ieee80211_schedule_txq() documents as safe only because the DRR moves a
> station back once its deficit goes negative.
>
> fes_duration_us arrives with every PPDU's stats and is already
> accumulated into arsta->tx_duration a few lines above. Register it, and
> set the feature bit in the same change so the two cannot be separated.
>
> Measured on an IPQ8074 AP with two stations on one radio, a 1x1 VHT
> client at 433 Mbit/s and a 2x2 HE client, both receiving at once. Before,
> 'iw station set <mac> airtime_weight' is refused with -EOPNOTSUPP and the
> per-station airtime file reads zero. After, the weight is accepted and
> read back, TX airtime accumulates, and the per-AC deficits move.
>
> The fairness this delivers is coarse. Weighting the fast station 4:1 moves
> the slow station's share of airtime from 59.5% to 52.1% and the fast
> station's throughput from 315 to 392 Mbit/s: the direction is correct, the
> magnitude is not the ratio requested.

How consistent is this change between runs? Seems a bit marginal if the
policy was supposed to give a 4:1 ratio between stations, so does this
work at all?

-Toke

