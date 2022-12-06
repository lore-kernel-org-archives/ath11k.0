Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7284C3A5A7
	for <ath11k@archiver.kernel.org>; Tue,  6 Dec 2022 08:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v7tc/ciT+DlcsBSuOoEGWvNIUX0J1ZRcstTtkQv8Pro=; b=g6N2IuJRQq7GlscIfM7PM73j6R
	NysA6Wn8WU/f5OFgS8aNcNchemMiO4J57WBbZabZfgrxd5WmfEyesRjYaFS9jHdteMOYYWbkKTLlC
	giZG0VaNkr7xYWSfOmXxjtgev/1uBUmYEPKFL0s28Vo83WhSqW/piUurhNg0t21/4Ofrcu4vPK+L+
	3WrjtsFwTAeT59d95aAgeMaVbVwwyOGQ4SfTkcfV+4Kxy79nAP1tiM0lCHcPpcdr2TNWiLo2zvvPb
	+eqCnL1ISxpHbwPdj5zRG2JNmf+CZi/e8ol3MdECmzMshBmw/d0cpTgQlo3UEln1u5iv49X+KlX6v
	Zq3np5ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Tki-005KOH-GS; Tue, 06 Dec 2022 08:56:36 +0000
Received: from dvalin.narfation.org ([213.160.73.56])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Tke-005KB7-My
	for ath11k@lists.infradead.org; Tue, 06 Dec 2022 08:56:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1670316985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CqZFqVBtylbYGQv6fqQJvdJIfV6X8roWE3KAq8vjmfE=;
	b=raibVzMU7BJYXx0PGtHH3DrI/r/qBPebQCm/L5bsc3BRIIMZg1E40ZrYWc0ns5+U+4ce24
	k0N4ec7oJrZtvqIVkQcSSZ+ml+UORHjOa4dYJWBUitklxw5l7maywAz+Yui5bb1kd+coU3
	JSBHOHChfHNP4ZRS7DSMcwHihEkqa/k=
From: Sven Eckelmann <sven@narfation.org>
To: Mariusz <enebeo@gmail.com>
Cc: walde <waldemar.stroh@uni-siegen.de>, "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Re: Wallys DR9074-6E(PN02.7) QCN9074 refuses to work on 6GHz band
Date: Tue, 06 Dec 2022 09:56:22 +0100
Message-ID: <23529001.ouqheUzb2q@ripper>
In-Reply-To: <3684626.iIbC2pHGDl@sven-l14>
References: <mailman.7.1667674802.1691884.ath11k@lists.infradead.org> <CAJrE-q7GshGMSoiP8Vb9itUvap2=tWHqQnDFnckzcRNNpya6Bw@mail.gmail.com> <3684626.iIbC2pHGDl@sven-l14>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_005633_235725_86E7B809 
X-CRM114-Status: GOOD (  12.57  )
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
Content-Type: multipart/mixed; boundary="===============2837307710645962649=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

--===============2837307710645962649==
Content-Type: multipart/signed; boundary="nextPart2055396.KlZ2vcFHjT"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2055396.KlZ2vcFHjT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: Mariusz <enebeo@gmail.com>
Date: Tue, 06 Dec 2022 09:56:22 +0100
Message-ID: <23529001.ouqheUzb2q@ripper>
In-Reply-To: <3684626.iIbC2pHGDl@sven-l14>
MIME-Version: 1.0

On Friday, 18 November 2022 15:05:49 CET Sven Eckelmann wrote:
> Wallystech has to find the correct document on createpoint which describes the 
> process. It was something like "module" "board id" "fusing". But it is not the 
> "Board ID Fusing for 802.11ax WLAN AP Chipsets" which only describes the way 
> how you would to it for thei internal wifi of the IPQ807x/IPQ60xx/... SoC.
> You/they are searching for the corresponding document for Pine IPQ9074. Most 
> likely hidden in some QDART documents.

It seems like this can be found easier via the search terms "Steps to fuse 
board ID in OTP for QCN9074". For example in document "80-YC644-3 Rev. A" on 
page 62. Qualcomm wrote there that this is needed for cards but can be skipped 
for internal radio - must likely referring there to the possibility to 
overwrite the board_id via devicetree (or using other hacks like providing 
only the specific board.bin instead of the board-2.bin).

I cannot say much about the document but is basically telling them to use 
QDART and enable the option to write a specific "bdf version" (yes, Qualcomm 
has many names for the same things).

There is also another documents which describe similar methods for various 
chips. For example "Fusing board ID to OTP in QCN61xx" in 80-19559-1 Rev. AA 
on page 76. Here they have a lot less steps - only the ones which set the
"bdf version".

At the end, these are documents which are only released under NDA and which 
need tools which you also can only get under NDA. So the manufacturer of these 
devices has to take care to write the board_id (or "bdf version") to the OTP 
before shipping them out to customers or resellers.

Kind regards,
	Sven
--nextPart2055396.KlZ2vcFHjT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmOPA7YACgkQXYcKB8Em
e0Z1Nw//WI3NgcHCKkbpJkkzMdFKC5C7e4UxGMX4MyWFLCJFpPhCuT/JgAWLFpTn
gWEGN9zVQ2tEU8u3OpgDtTXFgruoxruCoRGn40Vi4H8k1tSRaTF0vWEH0Ki8qTQx
TF7y6ReH9tYdaTqzlHNa4pKTE0Kfs/1m8qea4OzGx/CRm7HOU2lXv4Th8iFm3xDS
5Ijn/ZhUUNSrYxwNaqbg3psNRnYGyhrQJQD0OgsibzbQ089bEzdhVzJKtJYpOir9
7h0qQBAo1VDZEYYwMO7qO2+k54FYjMbASA6WppwSV2pKcINixaABdcz0sxe/CFWq
ty5lVVW2ouLCrL/VF669NDV9VCCXJXILPHklbcCflOAwaonssbFuhLUSCNsmKg5N
7stD3QVp217SWKL5m4BHHbmFkqz6njg4oxT68MPVHOnzdUraDp/zAkcfzPQgoJwK
8qRj/3Z/ht9cTyH0ikjYrqCOR3JZ/D6QTXAlWw1tC6giXVU9ebAKJEerH/pjOFdu
fDVyEdKTqdM/ilDGYBgl7AGSeN6RYyeLDjWoXnQOOSBQWIEIfcj0U6jgJ5qngdo5
vpYz3mguqOHjm4G/kEAaR5kGD9sykkGpPXxJP3BgzuJG0s6jo+azjSDlYWrUj21T
SzzB6sJ274iQ5Gw+50xZg3oNhWXYh3CCuxsJH6J8LnzymUVDMD4=
=NxlD
-----END PGP SIGNATURE-----

--nextPart2055396.KlZ2vcFHjT--





--===============2837307710645962649==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============2837307710645962649==--




