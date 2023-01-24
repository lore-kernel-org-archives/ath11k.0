Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BB8C38142
	for <ath11k@archiver.kernel.org>; Tue, 24 Jan 2023 14:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o+nzRHrWhjH2dsa/R66mt46xT/SbuqDDIlcbmo67Cv4=; b=KjZJXuWGWf6varAR9zfcrhxnD/
	LeJRn7ku+SiBCoOq6bNpmmZLnUY2NgkavWXNWXHtVkB1UrdvlNrwjNOLyJBRNWWI7koPp5QCfXWIx
	pYqJ7WnItLB8tezIK+14CvgSHvTfXVG+6EjwCt8OxpnkcmkpIkI7DLXDNrqTz7D0bHfZ+HlC2OpE8
	JW78L8yScqsarO+gBX5EU7YeeVvzXE5tnT6XXIsFWuJx802Xe8D7M9fyiaeboDhtGuyU5J5o8VM+1
	rEdxZvbsWUrcv5+1sfRFH3u5k7Nj5gBibsac3sQwQpi/56WyGkEQTBtVNxTMVGn0reRKEzHFKGyC8
	4ihZG0Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKJzx-004DvY-If; Tue, 24 Jan 2023 14:10:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKJzq-004DrX-F0
	for ath11k@lists.infradead.org; Tue, 24 Jan 2023 14:10:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 07964611FD;
	Tue, 24 Jan 2023 14:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18523C433D2;
	Tue, 24 Jan 2023 14:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674569396;
	bh=sUSQ4rRR2voo2ldj3QiVRjuvbcztF53dx1O09U7qYPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fgo/aXDqlADdG/gzPAmab7GsI6zR9KgqMek7O50kMuM/zJdMbYSeE8UKewm03SmzK
	 5tE2VP4rYydyXZMVHS7KvjACOXM0z1ZmNHLN3zntM8ZBhyleuLe+pq6AK7ngOadHSS
	 GhLgjr8Ei2DWAqLiwE6wBOWqHPKHhfUUaR6R1vo/i7wdTgRiGq7hp04Q5/FLeBy+tI
	 hm6wulGlEHK6c3fX8FcXi+oNgb09o5rnkiCI2uBAKNDHo3vjzB8mN8CSbJkiWsWgy7
	 khetK+M617cv/b3uSandB6U15su966EH88IW7dEwLTEtjjU7DM/P1Ppz3WAeT0kxdG
	 tZuvLDsk8sF7w==
Date: Tue, 24 Jan 2023 15:09:52 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Rameshkumar Sundaram <quic_ramess@quicinc.com>,
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH 1/2] nl80211: add support to enable/disable bss color
 collision detection
Message-ID: <Y8/msHegwheXGWze@lore-desk>
References: <20221226083328.29051-1-quic_ramess@quicinc.com>
 <20221226083328.29051-2-quic_ramess@quicinc.com>
 <74c57dc34af10537f98f5bb9b6ce80e5676e09b0.camel@sipsolutions.net>
 <1609a645-3e23-7e37-9aa1-94f970e481e2@green-communications.fr>
 <Y8q5Z98S3pODD77W@lore-desk>
 <eac1cf31-518f-6542-24c6-69e6c059f3c9@green-communications.fr>
MIME-Version: 1.0
In-Reply-To: <eac1cf31-518f-6542-24c6-69e6c059f3c9@green-communications.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_060958_574752_FAABE2BF 
X-CRM114-Status: GOOD (  18.89  )
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
Content-Type: multipart/mixed; boundary="===============2415226493247801712=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org


--===============2415226493247801712==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UXJYoUx10BtVHe1a"
Content-Disposition: inline


--UXJYoUx10BtVHe1a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi Lorenzo,
>=20
> On 20/01/2023 16:55, Lorenzo Bianconi wrote:
> > I agree, I think we can ratelimit netlink messages sent by the kernel to
> > userspace (e.g. to hostapd), I would say every 500ms is ok.
> > I guess we can move cfg80211_obss_color_collision_notify() in a dedicat=
ed
> > delayed_work so we can grab wdev mutex (cfg80211_obss_color_collision_n=
otify is
> > currently running in interrupt context).
> > To give an idea, what do you think about patch below? (please note it i=
s just
> > compiled tested so far).
>=20
> The patch does not work, the fix appears easy:
> > +void ieee80211_color_collision_detection_work(struct work_struct *work)
> > +{
> > +	struct delayed_work *delayed_work =3D to_delayed_work(work);
> > +	struct ieee80211_link_data *link =3D
> > +		container_of(delayed_work, struct ieee80211_link_data,
> > +			     dfs_cac_timer_work);
>=20
> This should probably be color_collision_detect_work.

Yep, sorry. It is just a copy paste issue :)
I will share a new version.

Regards,
Lorenzo

>=20
> > +	struct ieee80211_sub_if_data *sdata =3D link->sdata;
> > +
> > +	sdata_lock(sdata);
>=20
> It crashed here, link is NULL.
>=20
> > +	cfg80211_obss_color_collision_notify(sdata->dev, link->color_bitmap,
> > +					     GFP_KERNEL);
> > +	sdata_unlock(sdata);
> > +}
> Will test the fixed version later.

--UXJYoUx10BtVHe1a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY8/msAAKCRA6cBh0uS2t
rI7GAP9cHNQ2OD3bpQyWnbor78X4lca5ghTsqvOQwjII59oUEgD+KTMnOcxwvUEc
8TP1mK6SZYd9dKJyWpSRtiSoGN0PXQU=
=erja
-----END PGP SIGNATURE-----

--UXJYoUx10BtVHe1a--


--===============2415226493247801712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============2415226493247801712==--

