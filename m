Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20CB9C433FE
	for <ath11k@archiver.kernel.org>; Fri, 18 Nov 2022 11:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ph5c/EFcifwcKgDvX8Vp+BDS706tPG0mQ+49ql3Lxto=; b=CAffURUee5i+xfTbUgfoSc14tS
	ngeguVkBnSY4u0kmhtn08ZSyWrjKJMrqTBqTqSnPYjbdJNyfQLiqQ5C7fFKp6X/VpBz6DQqxoJYMl
	3339z6961p8grB1rTCxY6E0LNBL3B8Iby3ORI0l9m7ANH4sbsf+tC//jH7OlVisHa4z7EO+eZIp5K
	C1Vbhzl7hYOhkCTxHWn3J+dULG2BWOmjoehyQgoueyBOQFD+TjEJ/rYCo+s7/+tru8DRLntKFS3Rl
	Cu2sp3lCu9OStNTmcZBk3bn31szj1Gqe+XSzy+UbLQkA9tbT6MlTRk/gGOKWrrR2ulTVG9VZRyfXE
	Aj0vVZzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovzWa-003f2j-5J; Fri, 18 Nov 2022 11:27:12 +0000
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovzWW-003f01-A5
	for ath11k@lists.infradead.org; Fri, 18 Nov 2022 11:27:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1668770822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V/kkoPA6snxiDqJuDxgfr1YC3nbPt3FiHpBQblCcGj0=;
	b=PuOn7yDv83lLPuJB+Aanq7vxTldPGzTnuzWxWInk/uogxhSEFSevr9BHGbc1hN3V0IR1+i
	M/rl7/BcM+5q1jYPNbwqIxN+gmvofAOu/qPnmzPdgOcB3kec0RNVhLHYvxxBY7NGtmZ12t
	u0u2awnsgR/wuKoe8ZHAUNpOFUJAfw0=
From: Sven Eckelmann <sven@narfation.org>
To: walde <waldemar.stroh@uni-siegen.de>
Cc: Mariusz <enebeo@gmail.com>, "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Re: Wallys DR9074-6E(PN02.7) QCN9074 refuses to work on 6GHz band
Date: Fri, 18 Nov 2022 12:26:54 +0100
Message-ID: <4660647.LvFx2qVVIh@sven-l14>
In-Reply-To: <28dd9e69-a2f6-2e5e-90d7-c44611d700a5@uni-siegen.de>
References: <mailman.7.1667674802.1691884.ath11k@lists.infradead.org> <CAJrE-q7-+b_6yGAP2Aq8nNM27n0unsSFOxy6ac-ZLOkKC_caZg@mail.gmail.com> <28dd9e69-a2f6-2e5e-90d7-c44611d700a5@uni-siegen.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_032708_840627_2506EF81 
X-CRM114-Status: UNSURE (   9.72  )
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
Content-Type: multipart/mixed; boundary="===============2475791754601687917=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

--===============2475791754601687917==
Content-Type: multipart/signed; boundary="nextPart2480574.ElGaqSPkdT"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2480574.ElGaqSPkdT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: walde <waldemar.stroh@uni-siegen.de>
Date: Fri, 18 Nov 2022 12:26:54 +0100
Message-ID: <4660647.LvFx2qVVIh@sven-l14>
In-Reply-To: <28dd9e69-a2f6-2e5e-90d7-c44611d700a5@uni-siegen.de>
MIME-Version: 1.0

On Tuesday, 15 November 2022 19:29:13 CET walde wrote:
> we probably have the same problem.
> We have two Pinapple 6 Wifi 6 cards from the manufacturer 8devices that 
> we want to operate at 6 GHz. The modules have the QCN 9074 chipset and 
> are also certified for the 6E standard. The modules work very well at 5 
> GHZ. However the option to transmit on 6 GHz is not available. The board 
> ID is also defined as 0xff. If there is any information you could share 
> to enable the modules for 6 GHz, we would appreciate it.

You have to return it to them via their RMA procedure [1]. I already did that 
in (mid) January 2022 and they replaced our cards with properly working 
versions in (mid) February 2022.

Maybe you got a card from their first batch(es) (which had this problem) - or 
the problem was reintroduced for some reason.

Kind regards,
	Sven

[1] https://shop.8devices.com/index.php?route=account/return/add
--nextPart2480574.ElGaqSPkdT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmN3a/4ACgkQXYcKB8Em
e0aVABAA1GpkrEUzfHmy/PHw2ZmZ8PvF+NIvKll5pEyrNc7doaIyAebLEXa98eYV
FfJH8tj7OntOXiRpvvPWPnpstk2YYMA/A5Q5VP5YfV34mCekIOP83XYCIdmeU+6t
L8UrYBy2vMnC8brSEs9R+/gpT7jlKBwA2Wgetqd2n4E1GFdVE2mXFi5Mc975kkBL
/lnt1/7/ifZAUqLuf+DMqIOGOb22PIdfBLNuVcshQGPDNuXXUQAMNu5lUJNlne/8
2NfQMYPglo/cjOQEWaYyZ55xjodWMdrb5LegRUuCGp4lFoyHiiY3RHHIhUkDoerV
DZm9R+ljDDris8w9Z8ihUrwQVRHFI427FqrHmrtuqhyMqyNpizHAgkWJKEbsj4Kk
Y0UUePo5h73c/izuLgWITEjUojwWcyc73/wW1s9gulrp3IsaE/MnDAr/gBSP67+c
tt2e/qA2Id3bC7P7tlwMUAJZpPGrecWqpUeEFZJ9sszMQLT5Xt+KTop9iLMSX0Yf
EAY3l5I+hnkT+sV/sE0+pbWDJndmZZ2HfkvFzdS58QftMOUAl572gMKQVxpXUpT4
W9Jqzk+NU/VaOk0LH2t4tyrG1R66iouzhYPNX/jyQxVRNHshVVWty5uc8COPy5fn
ZD7HTryWf9n+L1i7ZKIw9YzA6vOdfxFth05JT4+zq1acOkUXWpI=
=ayfu
-----END PGP SIGNATURE-----

--nextPart2480574.ElGaqSPkdT--





--===============2475791754601687917==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============2475791754601687917==--




