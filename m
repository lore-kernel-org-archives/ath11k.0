Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8C6C433EF
	for <ath11k@archiver.kernel.org>; Wed, 13 Apr 2022 07:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VZpOZjvYe1c+411gAtYC9uhh6mjgr4XMDlyxpNSEzY8=; b=blrtqT4yN2i+Jrxh2OsGah4nk8
	NtKMaVRweOIVvVfuKo9qnW44LnKzxXBsHORd53TLK5L4QbNaUuMQhyl0h3S2oYoqbkgEy8WYSeinD
	At8+C9dpaw3qIrsn80RlabOHotli7qrXWSKTGa1z+IIDvcSSNtjj0XJoS99ESVdtzJ0ujQ/tVAXXJ
	kDKsBoPmb/ghqZFWyAC7m8NJMvoye+9IEH518VmnfhDZoU18AQXnDNO5R444FdPzD6FQ5CltDTk+V
	MICE8Y2r98jJ8TcmGl335hEzjQRWN7lY2Dl8zMIb16POZ+Zo1eV1pq/shupxSnWBAvIhOZp2/1pR/
	qiAnPtDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neXJO-00HNR6-CW; Wed, 13 Apr 2022 07:21:10 +0000
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neXJK-00HNPV-Uw
 for ath11k@lists.infradead.org; Wed, 13 Apr 2022 07:21:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1649834457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cwEM3DKig/v69tE9het+u6nSqs6qBE6XFYMR0AnRg2Q=;
 b=v2mdXcFC63cXuoK71O3wqI7SBzHL6Paj1RlOv13qivdb1GzaNRjSz5J4lWu+r5rErNh6Lx
 DaLtg5RAR3kHx3iHS1bnBN1NRMDEYXYE5VxX5LWiKk+pbZ8dVUIGJBnppflhvk9VNhOapz
 pUgvFSGFbxvr+vrMLrMj+pr62PRomKU=
From: Sven Eckelmann <sven@narfation.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org
Subject: Re: ath11k: incorrect board_id retrieval
Date: Wed, 13 Apr 2022 09:20:50 +0200
Message-ID: <10773580.hMCCILeT51@ripper>
In-Reply-To: <87wnftmppe.fsf@kernel.org>
References: <1734146.k9CKHTOI9D@ripper> <4611744.eon2OSsH4K@ripper>
 <87wnftmppe.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_002107_484748_3A945A20 
X-CRM114-Status: GOOD (  21.86  )
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
Content-Type: multipart/mixed; boundary="===============8255713390454254944=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

--===============8255713390454254944==
Content-Type: multipart/signed; boundary="nextPart8510087.Y7LHHXzHXR"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart8510087.Y7LHHXzHXR
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org
Subject: Re: ath11k: incorrect board_id retrieval
Date: Wed, 13 Apr 2022 09:20:50 +0200
Message-ID: <10773580.hMCCILeT51@ripper>
In-Reply-To: <87wnftmppe.fsf@kernel.org>
References: <1734146.k9CKHTOI9D@ripper> <4611744.eon2OSsH4K@ripper> <87wnftmppe.fsf@kernel.org>

On Wednesday, 13 April 2022 09:01:49 CEST Kalle Valo wrote:
> Sven Eckelmann <sven@narfation.org> writes:
> 
> > On Friday, 26 November 2021 15:48:17 CET Sven Eckelmann wrote:
> > [...]
> >> * 8devices Pineapple
> >>   - 2GHz: 160 (0xa0)
> >>   - 5GHz: 161 (0xa1)
> >>   - 6GHz: 162 (0xa2)
> >> * Compex WLE3000H5
> >> * (maybe there is not a single one which works?)
> >> 
> >> If I would use these boards in one with a devicetree then I could just 
> >> overwrite it using qcom,board_id (and/or qcom,ath11k-calibration-variant). But 
> >> this isn't the case when I want to use a couple of these cards in a simple x86 
> >> system. All off them (even when they are significantly different) are reported
> >> as
> >> 
> >>     ath11k_pci 0000:03:00.0: chip_id 0x0 chip_family 0x0 board_id 0xff soc_id 0xffffffff
> >
> > I've send my 6GHz modules back to 8devices. They told me that this problem was 
> > identified and fixed in their calibration process. I've just got them back 
> > from them and now I see following reported by ath11k:
> >
> >     ath11k_pci 0000:03:00.0: chip_id 0x0 chip_family 0x0 board_id 0xa2 soc_id 0xffffffff
> >
> > So it is definitely not a firmware problem and it should be fixed by the 
> > manufacturers (similar to what 8devices did).
> 
> So the device is working fine now?

8devices Pineapple (after RMA) - yes.

For Compex WLE3000H5 - not that I would know about any fixed HW revision.

And for the EmWicon WMX7205/jjPlus WMX7205, it seems like the 
vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108 is used 
for identification of the actual vendor/product [0] (and not the board_id like 
on other devices). But as you can see, they say that it 
is a QCA product while it actually isn't actually one

And the manufacturer is also not able to provide a BDF which is compatible 
(signed? [1]) for the usage with ath11k's firmware blob.

Kind regards,
	Sven

[0] https://lore.kernel.org/all/CACT4oud4hmkjrAPkOr0sG1DNNgcgQaKT2JNJzcivZey9b5Hpiw@mail.gmail.com/
[1] https://lore.kernel.org/all/DM6PR02MB69248F37B55ACCC868F8B82BE0769@DM6PR02MB6924.namprd02.prod.outlook.com/
--nextPart8510087.Y7LHHXzHXR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmJWedIACgkQXYcKB8Em
e0b7Tg/8D27ZpitLGSjKmaycPrh9rPOnuozbyl1iPWS/hNnmD1cXHYqmobFGnGV+
tY4+sHXt3Ip/VZeoJQevhnW0Lu1rFToOvUkRgQauxF9oTnBwkoBKsQvZXX4QXXdo
ujANUKSXonfPcyi9KRYP1VBW4HA6i7HpnBZK7+4M9qHCBfojlg2f20F7o6tiIqor
S+PE0P1g+Ts66AJMJByIIaRxzewY7BOIaNNyl3Fbsx8z22FrSljLwxqNwnM8O0Q5
eXsAN8am0YbpDaUQaNmb5DngMIxvgtOFefRrAE+H5Fm241pjGFviOYC3VIy8tfKL
KEzxt4jF28Jr9NMXaMMEGSiNzEvejbC4djzpzZb2xCceCChbKLpFX8N1L0EAdCc4
RcpiNh+1c8kXEBSadofbau4bK0F2C2rhgIBAOXYStYoW5WjwHPhPTc8tuOI6tjTV
F6wHhHP5rR062vpL8ykQHpaiqq8YZSCfCcQw/Xs/7LlGAxpuwJQEiv9pLgg0tNNR
DIZKdgow37UGz/9crSMw2tXdf9SUQZXy/kE6CFjRmIfpQ3UDtJeXHS7A9xWMhXtX
W/Kht2DdK6jyHIcMdwLASSnoDD2b1qyXg6lgQi+Gv5jXDCki6W5ey1N5R/DaJO5q
2WoBnUbcaPVemmH0W7t+rzN+8LGRgEurneYtaq3mMjlP3XeakDg=
=9Qjj
-----END PGP SIGNATURE-----

--nextPart8510087.Y7LHHXzHXR--





--===============8255713390454254944==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============8255713390454254944==--




