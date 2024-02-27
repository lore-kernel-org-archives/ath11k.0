Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C56C5478C
	for <ath11k@archiver.kernel.org>; Tue, 27 Feb 2024 07:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ddim0juEYH9dYsDYFVcggUBT7rEqhWT1XS3J5aa+pGY=; b=gUnDHM/t2siP4YR4zkWFnEu5VF
	1QIyLducAuBKbqkKPMSs2ivVJ0bjDupljneG67a4GP1DY/rxwr80AmXc+JJakt4FmSrGRYPg953UZ
	chMg60MescodJESocI0Ci/sg+jCW+SyFo4oJ/+K16fdvCUpYvORjmY+nN/YHLEM3wEIr7qtE3OolE
	UVUGAHk+E4KJDro4sz8e9nr+6yXE18mjbkLhDqoNQdtJAOfzoH5yKvlpyiX63Mc1iXO1oK5sgkRPM
	uc1eR6i+my1mM8rfZS5YTCYtSBjW8DTLcm4Zr24KMZe8U7JreLXRP/IRHB+e5z4CiySnPSZwWzMU7
	Xq8X5yEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rerxR-000000048vH-30ng;
	Tue, 27 Feb 2024 07:32:57 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rerxO-000000048uR-3tng
	for ath11k@lists.infradead.org;
	Tue, 27 Feb 2024 07:32:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=Ddim0juEYH9dYsDYFVcggUBT7rEqhWT1XS3J5aa+pGY=;
	t=1709019172; x=1710228772; b=gYizsJ55si3Ue5LNol6H3PFAGBfW12npt+e+fPmWerG5lCW
	1F9iMnfz0EfJVT2bSUpOOb3O3u98t2ex4wlQe55cRnkjWamgvDv3wOWf1D6rgnIazToGI2baF8tyR
	i5aEI1LHJNWXb8tTO0zeoEFbfvMRY5GcXMrydB4QlyIizmyZkmQD8ubu3zmVR4QvBLKVOYrGJKcq3
	0aTYkN4S40diMpUNWNr0NGq6FtQu+NWI2Pq6DEIgbS6xr0QaKBh11aUxNGkPt770PP25OKl40ncQw
	l2b+Zy4XEraX/iBbA0iEHrpUmVGtm5p3MU+DofCcKezkwyYR79hlo332bsp3SOSA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rerxJ-0000000AUNd-39S9;
	Tue, 27 Feb 2024 08:32:49 +0100
Message-ID: <5c5ad99d3c2f3b9915b440057eab6618639cd31f.camel@sipsolutions.net>
Subject: Re: [PATCH 2/6] wifi: ath11k: add P2P IE in beacon template
From: Johannes Berg <johannes@sipsolutions.net>
To: Kang Yang <quic_kangyang@quicinc.com>, Jeff Johnson
	 <quic_jjohnson@quicinc.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Tue, 27 Feb 2024 08:32:48 +0100
In-Reply-To: <b20fc717-654d-4e64-920f-699fe3ec5598@quicinc.com>
References: <20240226060203.2040444-1-quic_kangyang@quicinc.com>
	 <20240226060203.2040444-3-quic_kangyang@quicinc.com>
	 <42652a06-33f3-445a-bd8a-da4633fa52f8@quicinc.com>
	 <b20fc717-654d-4e64-920f-699fe3ec5598@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_233255_299216_6E745E6A 
X-CRM114-Status: UNSURE (   8.12  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Tue, 2024-02-27 at 14:58 +0800, Kang Yang wrote:
>=20
> > > +	if (arvif->vif->type !=3D NL80211_IFTYPE_AP || !arvif->vif->p2p)
> >=20
> > this logic isn't applicable for NL80211_IFTYPE_P2P_GO ?
>=20
> The original intention here is to determine if it is P2P GO, if yes,=20
> continue, otherwise return.
>=20
>=20
> Maybe this judgment is a bit misleading, let me replace with
> if (arvif->vdev_subtype !=3D WMI_VDEV_SUBTYPE_P2P_GO) ?

There's also

	ieee80211_vif_type_p2p(arvif->vif) !=3D NL80211_IFTYPE_P2P_GO

if you wanted to write it that way.

@Jeff: NL80211_IFTYPE_P2P_GO is not used by mac80211 internally, it
translates that to vif->type=3D=3DNL80211_IFTYPE_AP && vif->p2p=3D=3Dtrue.

johannes


