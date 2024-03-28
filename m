Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26588CD1284
	for <ath11k@archiver.kernel.org>; Thu, 28 Mar 2024 17:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uhgARVDlTR79mRxevKk9fKEXKk+7wbwsaUclyGM+9WA=; b=BWPj7vKGr1z95huJCoOE4ByOU0
	B/6gl9UQML8RvBm4hvvAK+4Q3n8FsWSs2HG0CN23xbeKqkttb6IgwcdstWb7/Mpprvwp5pb6a5B/X
	pRlbB0pNnHPNti5d6/vqnMR3zveeVmSD8JQBEM4YHlr3g9trqWSE8+U3MFktYqXBI/l752ucqgYrL
	a3fjwmAlq2v0QIJmB/yXVoTcLndYL6+hysqSvcs2odaV6BcONJq+POcQxAWdkhfSGnqV/3tAtmCFD
	Ny2veH9uBF2cwNivW/RgafYfCwywHeiR8Jiea6TZKvCB7KoA31z1l8HBjZomuSA7qb8mGNreyayez
	P9ShHylw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rptxM-0000000F2zT-2rLe;
	Thu, 28 Mar 2024 17:54:28 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rptxH-0000000F2vN-3pKS
	for ath11k@lists.infradead.org;
	Thu, 28 Mar 2024 17:54:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=uhgARVDlTR79mRxevKk9fKEXKk+7wbwsaUclyGM+9WA=;
	t=1711648462; x=1712858062; b=b46XEUj2wUNSQ/QJmPbcib6HaLZHu/LQ988d9mb+QeEUllr
	RmxYajaJzGzMp+yzzXwuilVji4wf40VdNEA65MGEowo3eQWz1FWMGP3nt1MaVFY2eKpaAjJQ78D+6
	R/Ef/SMx6sU48IiAK8387k44Pcvu5xCiKRhlzrqztZLWzI8Wp+OISbeZVW7qns8VRKDIkEAVirnc+
	ruFHff31tFrJ3uSiXCqVNfz9PEnsgkxBofqYGlvS+qiwhJqbPZwZ7ubtbkFH1eLD9t5LhSinHRL6V
	08LWGHZaPPxrUSU6evy8/OJwfMKQZtl1c5Y0xo7d/OUeikIJ6PC0w6llkzmZbpgA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rptxD-00000001C7S-16Yh;
	Thu, 28 Mar 2024 18:54:19 +0100
Message-ID: <3f6de100163a8521ab09929abc537e57d26dafea.camel@sipsolutions.net>
Subject: Re: [PATCH v2 1/2] wifi: cfg80211/mac80211: Add support to rx retry
 stats
From: Johannes Berg <johannes@sipsolutions.net>
To: Hari Chandrakanthan <quic_haric@quicinc.com>, Jeff Johnson
	 <quic_jjohnson@quicinc.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Thu, 28 Mar 2024 18:54:18 +0100
In-Reply-To: <4d569d40-d0a8-10d5-7e6d-4c9c03c14371@quicinc.com>
References: <20240319134522.4021062-1-quic_haric@quicinc.com>
	 <20240319134522.4021062-2-quic_haric@quicinc.com>
	 <d364e872eb29f03236630bab49a3243e2118ab22.camel@sipsolutions.net>
	 <14699537-99b2-e468-6a7b-7b721193400e@quicinc.com>
	 <b9dfab64822bacf0cc72380c0de034b79d489668.camel@sipsolutions.net>
	 <68c6fcbd-0aaa-43b2-b5e2-08367c11e79d@quicinc.com>
	 <f5cb9edcea875920e0ce156be76d06c78d1279ec.camel@sipsolutions.net>
	 <4d569d40-d0a8-10d5-7e6d-4c9c03c14371@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_105424_121663_9A342867 
X-CRM114-Status: GOOD (  31.55  )
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

On Thu, 2024-03-28 at 22:49 +0530, Hari Chandrakanthan wrote:
> On 3/27/2024 8:37 PM, Johannes Berg wrote:
> > On Wed, 2024-03-27 at 08:02 -0700, Jeff Johnson wrote:
> > > > I'm also imagining that we change the API from cfg80211 to the driv=
ers
> > > > to get the *link* STA information, and do the summing up and/or "be=
st"
> > > > selection there in cfg80211 itself. However, I am prepared to accep=
t the
> > > > possibility that we may do _both_ in the API, if not all drivers ca=
n
> > > > even do all of the statistics per link. We should probably still ha=
ve
> > > > the link STAs in the statistics in nl80211, but then they may not b=
e
> > > > populated?
> > > First remember that there are a lot of statistics, and each driver is=
 free to
> > > return as many or as few as they support, indicating the ones they ar=
e
> > > returning using the "filled" bitmap.
> > Yes, I'd think we want to use the same data structure for both, though
> > setting something in *both* links and *mld* would (should) be an error.
> The statistics can be populated by driver or mac80211.(say tx retries,=
=20
> tx packets etc)

Right.

> So we should also change the existing stats update in mac80211 on link=
=20
> STA basis instead of deflink?

Absolutely, we need to do that, it's been on my list forever, since the
early MLO work... I'm a bit torn between not wanting you to have to do
all that work (even if we know that we'll have to do it) and on the
other hand not wanting to make it worse with more statistics now ...
There's no good middle ground here though now.

> > Good point, when they're really removed we'd want to probably keep that
> > value as a bias for the MLD-level stats?
>=20
> ok. Then the statistics value in MLD STA would be bias + summed up value=
=20
> of currently alive links?

I guess? But I'm not sure where we'd actually _keep_ the bias values.
Maybe give up on that idea that cfg80211 could sum it all up, and just
require the underlying driver (or mac80211) to report both per-link and
total stats, where available? That way, mac80211 could keep the bias
somewhere and just add it to the total before reporting _that_.

> On the same line , ethtool stats(*interface level stats*) in=20
> mac80211(ieee80211_get_stats())
> computes the stats by summing up the current STA statistics.
> Here stations can come and go and the ethtool stats may not reflect the=
=20
> total packets transmitted or received by the interface.
> It just reflects the summed up value of current alive stations.

Yeah ... I know Ben loves it, but personally I kind of think of ethtool
as a dead legacy interface for this respect, it just doesn't have the
ability to reflect the required structures/hierarchy/etc. well since
it's just a flat list. Sure you can structure the names in some way, but
it's iffy at best. I'd just ignore that for now. If we have better
statistics to nl80211, we can always make ethtool support on top of
that, perhaps even moving it to cfg80211, if we even need more support
there. I'm not hugely in favour, but if it stays contained somewhere and
consumes existing APIs I'm OK with it.

> Since these two problems are similar (ethtool stats and MLD stats=20
> calculation),
> would like to understand what type of value would be more useful to user?
>=20

What do you mean by that?

johannes

