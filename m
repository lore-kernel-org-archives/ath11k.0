Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB5FC433F5
	for <ath11k@archiver.kernel.org>; Tue, 21 Dec 2021 22:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Et6nLl7rvmf4G5Si5tVPRE2REeatrzjlRTFl2WegvWg=; b=MUCPTtBO5i3aJpvrGIPWoQOWhE
	HxfXv9ACAqj8HXue3Y8ZHSzx2LXZbAz8xjZdEJeAHiLr93xOKf6rJCP3bHYew5FDl9X9mQrI5smue
	8OGpFOr4Xb9Q/yqUkXusmEm6ndZY359TYiaCg/kIfp4u/SXfLsSW42Kajc3uYXIR0UPCUSLw7UWGx
	yhH6vl9ibCayeGlpVi+sosr9wS2KWKmnS+x6D7f4aVUk1hmRlObItFVbDOItZd5R2Wz24rs4juRK5
	CpF/qmwVW5Yj705QNTqlge7SvIWpzCb1z6ajrSJAmBk91TSHQcIORGFokKyHpkVj6AZR6HcrhHxK7
	didlU0JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzo5q-008heX-TH; Tue, 21 Dec 2021 22:58:50 +0000
Received: from dvalin.narfation.org ([213.160.73.56])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzo5n-008heD-B0
 for ath11k@lists.infradead.org; Tue, 21 Dec 2021 22:58:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1640127525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l3omHYXDMuKxycbiedWpdLMHyqEFwOrcYLvWtUoduGY=;
 b=UBINfFbl1X6sYK79W/Wjslutp1WWE/IVV8bjisN1QzWiqJ/jHyDplhVLUDyVZtkN5O54sw
 Ibtd96EGSwn0gYO0kzesimWZ4WMfVamo/W+n2+UGpkX8NItnQ8DHwN/C5yqeZf1uQ4r78T
 6rUZk0bd/G2EgtBm23tTLNpQbvT6qKk=
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org, Kalle Valo <kvalo@kernel.org>
Subject: Re: ath11k: QCN9074: Incompatible board-2.bin for 6GHz
Date: Tue, 21 Dec 2021 23:58:42 +0100
Message-ID: <2947430.zJFXT1rtDI@sven-l14>
In-Reply-To: <87k0fy6mek.fsf@kernel.org>
References: <2091899.pNsEtq2SQc@ripper> <2340060.uFBqQg8s0L@ripper>
 <87k0fy6mek.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_145847_571140_E89C3AC7 
X-CRM114-Status: GOOD (  15.31  )
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
Content-Type: multipart/mixed; boundary="===============3908174200013552990=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

--===============3908174200013552990==
Content-Type: multipart/signed; boundary="nextPart9943023.Ro6Tc9THTW"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart9943023.Ro6Tc9THTW
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org, Kalle Valo <kvalo@kernel.org>
Subject: Re: ath11k: QCN9074: Incompatible board-2.bin for 6GHz
Date: Tue, 21 Dec 2021 23:58:42 +0100
Message-ID: <2947430.zJFXT1rtDI@sven-l14>
In-Reply-To: <87k0fy6mek.fsf@kernel.org>
References: <2091899.pNsEtq2SQc@ripper> <2340060.uFBqQg8s0L@ripper> <87k0fy6mek.fsf@kernel.org>

On Tuesday, 21 December 2021 15:52:03 CET Kalle Valo wrote:
> I have told the firmware team numerious times that the board file should
> be backwards compatible as it creates problems for upstream. And I do
> try to keep everything in ath11k-firmware (and in linux-firmware)
> backwards compatible, but if they are not please do let me know.

Please check the first message to find such a problem. Ok, it was not about 
board files being really backward compatible - it actually is about the 
firmware not being backward compatible and not working with the board-2.bin/
BDFs in the same repository.

So if I get
https://github.com/kvalo/ath11k-firmware/commit/ae4f4f64ed14097dc24a8d686fa60e932cba4868/QCN9074/hw1.0/testing/2.4.0.1.r1/WLAN.HK.2.4.0.1.r1-00019-QCAHKSWPL_SILICONZ-1/board-2.bin
(extract board_id 162 as board.bin - because nobody seems to initialize the 
board_id in the OTP)

and use it with

https://github.com/kvalo/ath11k-firmware/tree/master/QCN9074/hw1.0/2.5.0.1/WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1

then it causes the initialization error described in the first mail. And the 
firmware used here is the only non-testing firmware available for QCN9074. And 
the board-2.bin is the only available one from your repository for QCN9074.

> For other repos I cannot do much, if any.

The described problem was NOT that files from other repositories were mixed. 
Actually, the solution was to mix the firmware with the BDF from a different 
repository.

And I didn't only see this with BDFs from your repository but also from non-
upstreamed BDFs from manufacturers which embedded a pine "card" on the PCB of 
their AP.

I was able to fix the problem for the non-upstream BDFs for this AP by 
rearranging the BDF sections to match the new layout. I didn't try this with 
the BDFs in your repository because also the IDs seemed to have changed (but I 
didn't analyze it further). Simply using the BDFs from a different repository 
was easier.

Kind regards,
	Sven
--nextPart9943023.Ro6Tc9THTW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmHCXCIACgkQXYcKB8Em
e0ZS/g/9EidXF3MmeDxkXYVWt9+nJAf14t/Pf7YNFmC+RG4sDQ1kfUztDcT+wKue
2NgC/eyqD7xIkC2oxOhHdFh3wRAPDsBhAlzp0ac1DYDENTioC4Y2QeXXUAlbabLw
qa0NTzG86bmcKuXx59xSEXE4PfSDINHOa8V5U7xf2eWytuOJRtrDOZODMcsGnxm4
DF5rwPOOBeaMTqKLzY/Geyb/4Sp6V9ZRA+BB4mzyrS4jaIB6GWC3Qfqv9WyqkAIx
gWwAKxDlcANqU2/Q1z/FbAiz7f8ArYREZhgcAFz1bl1bzIcJY1lXZkBDb8iz9GD2
CY5JsfuZ9mf2FrGJPBcXycgML8nZXfkmz1xrxhvdKKcugv6QZpL8oEx6ZjfuZtMg
hOZ5P4ZF0IGsxl9ROd85ztFoWR95hfFR1vE/YKeohM3lgjqA/9M+stTDYY/FTPz0
2J2MsE7NXOdJEA8ecxVZDcmfKGaTyE2N5TDZRE/skB5+e4pLXguz31+xtOdoyrrh
K9xJw1R7YVebzpvd6UowBUXkgcea7qcgNUBT4SX8Ya5WwLhJsrewxTLP/el1sAFC
t38dw2XZEej3sbuAELHS6Xz333QAf5g8+yQFR3EYDGgO+vTzYtaNhgS+pBBzDOm/
TsRgVNSHLlQ8KPSL6C/3G5qdyIao/iSF1alF3PdVBjuAmSxynYo=
=74AA
-----END PGP SIGNATURE-----

--nextPart9943023.Ro6Tc9THTW--





--===============3908174200013552990==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============3908174200013552990==--




