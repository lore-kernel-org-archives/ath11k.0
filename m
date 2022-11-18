Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB16C433FE
	for <ath11k@archiver.kernel.org>; Fri, 18 Nov 2022 14:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CDpJNqUrh1d4sRES9rUAEQym6OZADZYXPxQMiJ9E0CE=; b=2Y1q7b+h7eLAnEBHFZDRb0LTsd
	AMSNWJrmT7OipakgLkijLqDMTh+yxgqCiSdnI9Pwf5+J8C3RWkh2NhkBhbL6r+MSPIH80Ptyq1hY7
	Vl+de2PRn6qobBCxGfdvfj3nFXY0j52cRwkykMlzXQsta0ukkbbjhq101JXoT8H9OoPaHgxW43Y/s
	gt3uNzjdi1g7w5qlEz726EC4G2FHVen9yj+hd3iZYbwL5oZzQM5Q8k7PtYYlEKRrDp3j4zWiSulIL
	bYeno34jNmxNjtZv54Jj/sgpJYB5RqMY1P6s0gjxq+xnKw2YMVsXW+w+JXpWbgUqQu2QJs/hA62Jm
	tia6IsbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow20R-004IVG-GY; Fri, 18 Nov 2022 14:06:11 +0000
Received: from dvalin.narfation.org ([213.160.73.56])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow20P-004IRI-34
	for ath11k@lists.infradead.org; Fri, 18 Nov 2022 14:06:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1668780360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bXg5WspFU1PMc4bgF14+CaIwMFeLBy0BOMuqmwc+azA=;
	b=PStTHLYDN4QbNGAg9R5LZPfZUp7Gt4xGXEMT3HRRRu9LgSlqFn8p8S0n0h8WCURCaDzss6
	jXQZHvGk7GbRAf7y32xnqt5/58MkJrhEOd1D8dYCLJhhN8gS5F/s70C5LlmN+cQcL+NIRF
	KUHZJMk9o0ghUw/MncXcuagH699gtZI=
From: Sven Eckelmann <sven@narfation.org>
To: Mariusz <enebeo@gmail.com>
Cc: walde <waldemar.stroh@uni-siegen.de>, "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Re: Wallys DR9074-6E(PN02.7) QCN9074 refuses to work on 6GHz band
Date: Fri, 18 Nov 2022 15:05:49 +0100
Message-ID: <3684626.iIbC2pHGDl@sven-l14>
In-Reply-To: <CAJrE-q7GshGMSoiP8Vb9itUvap2=tWHqQnDFnckzcRNNpya6Bw@mail.gmail.com>
References: <mailman.7.1667674802.1691884.ath11k@lists.infradead.org> <4660647.LvFx2qVVIh@sven-l14> <CAJrE-q7GshGMSoiP8Vb9itUvap2=tWHqQnDFnckzcRNNpya6Bw@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_060609_316424_3B5FAA28 
X-CRM114-Status: GOOD (  12.24  )
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
Content-Type: multipart/mixed; boundary="===============0274716790517808406=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

--===============0274716790517808406==
Content-Type: multipart/signed; boundary="nextPart9242861.CDJkKcVGEf"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart9242861.CDJkKcVGEf
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: Mariusz <enebeo@gmail.com>
Date: Fri, 18 Nov 2022 15:05:49 +0100
Message-ID: <3684626.iIbC2pHGDl@sven-l14>
MIME-Version: 1.0

On Friday, 18 November 2022 13:48:43 CET Mariusz wrote:
> Mine is from a different supplier - Wallys - and I bought it 2 weeks
> ago but not sure how old their stock is. PCB looks slightly different
> than Pinapple's. Is it likely to have the same issue?

It definitely has the same issue (because you reported that board_id is 
255/0xff) but I have no idea whether Wallytech ever fixed it. At least I was 
never in contact about this problem with them. But sending around precompiled 
kernel module binaries (for an unknown kernel build), with some hacks to fix 
their hardware production errors (missing module id fusing in the OTP for 
their separately sold modules), doesn't make me confident that they are able 
to solve this problem correctly.

In their defense, QCA doesn't make it really easy. It seems like their 
reference designs with Pine on 6Ghz are (mostly?) for (embedded Linux) APs 
which use the normal flash (NOR or NAND) to store the calibration data. And 
for these devices, they use the devicetree (or various other hacks) to load 
the correct board data.

Wallystech has to find the correct document on createpoint which describes the 
process. It was something like "module" "board id" "fusing". But it is not the 
"Board ID Fusing for 802.11ax WLAN AP Chipsets" which only describes the way 
how you would to it for thei internal wifi of the IPQ807x/IPQ60xx/... SoC.
You/they are searching for the corresponding document for Pine IPQ9074. Most 
likely hidden in some QDART documents.


Regarding the problem that some countries are not allowing 6GHz: You have to 
either get a firmware from QCA which has it enabled or you modify the BDFs 
("board-" files in the board-2.bin) to enable 6GHz in the (enabled) embedded 
REGDB of the BDFs for the specific country. Unfortunately, the data structures 
of the BDF are not officially documented and you would need an official QSDK/
ATH.11.X release from QCA to fetch the bdf2txt.py, txt2bdf.py and the 
corresponding template for your BDF to extract and modify it.

Kind regards,
	Sven
--nextPart9242861.CDJkKcVGEf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmN3kT4ACgkQXYcKB8Em
e0Y+3hAAiDQOXXBQbPP1Fowwi3dLlP0E4hG/Tjt6yEpFMtBpS6FyIjzRacIr46gl
UC7VTeSujtjXGec7p4KXUnui+kcIPB2BEaTiLDi9V40Kfhnd2mGym+3PozGe6zTV
5dEpKvIMwUuGFm1B5B3/mca2ns295GNT9nAjaYa+s+AohzkVtR5NHYhHf5d4tmis
hUTGjgjswFZ6zpYi3FDKqqvqYq9f0k4WL8nw8c3G3mQGwqxXgwgXMLJtgsGisPs/
MhmrpBqFEz+sYEBiDMdQ7ygAlQXRvPzzvhE0VMur7kJ92DBiCkO5jEQKPkchv4O+
pNbdxZTk5Doy9ct5uYIEtkoQyFzMVSz8Dvf5cB8pb14yTtdC/CizZxV/AqWJgJKz
1b9JHgAVu/mKeCInUqy75tVrH6SanowG44CYG8yDc6HJSnH9sxZtKaXu7wR5JjcT
ttMouej/+xV09KLVUJjBD34P6wAcLQEraV/cTIeX2DrsXm4EX0NfnO6MGEKEHmTY
Jx8IBLdGOBj3jzSp+89emeijop54HDpou0oGq0uDYeb53KxYATI/2T7S1ppXnWQ0
bk3PBSlnOEDwNVW3y1Pvw+xtkBDuziU5Y16fsgFoFQ3q7XrEnonL3Llicu8ZJNXF
bWA/9zShj5bVYL4m3S+liv9lz35NAfwAvfElkba0SwBwzXxIvwI=
=mn3J
-----END PGP SIGNATURE-----

--nextPart9242861.CDJkKcVGEf--





--===============0274716790517808406==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============0274716790517808406==--




