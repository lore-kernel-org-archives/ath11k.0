Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54526C433F5
	for <ath11k@archiver.kernel.org>; Sat, 18 Dec 2021 08:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D4DrU/6e1D5s5TrZ9ZdxAV5AHRhqd7GJdc9/1hd0Qbo=; b=vgAPaWBN8EZpXaBLFoMHt18vNq
	NtW0m2qKxeBp1s/KxBTjcjCRLnJg9OVyN1/M8mjF1WgPf3oPtHBE55vnIqBVm7pG978LBMoSr4a3q
	jbkEObU6Vx6eLJ/rItbCV5SZJDvWo/bignsCG7cCjhzSH62TE4qbK/pbccAgJd5rN1K60NAgFwdnX
	3gZ+dE4SqrOgDwNo7hDjP3tXBoXRzXO3DY+BmaAIeLiZpOwGMKsWgzhBQcPJ8JgMzT+fYhIATBgDy
	Lybt33l+BBk8xrFyQU/VilqJQ1bnxEmHmN8XjU0grdYGaMpejKawPLS+cTGVEN0QtBEm32ujtDCH8
	oUijP+dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myVJV-00DHyP-3y; Sat, 18 Dec 2021 08:43:33 +0000
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myVJS-00DHwu-DT
 for ath11k@lists.infradead.org; Sat, 18 Dec 2021 08:43:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1639817009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KnjbssXCNVGeaKnilFi+t7KdY+BtRy52CmoJpR1wwK0=;
 b=w0ySm+cV3XTMNTyAUZXcsb/6keAnVPLwOUTw1vGY9c3jvCEXhlUfTlADca0kEnHQ5w/Bv0
 mrj4en6bhRKzEIRLCUrFEP90K1IKDUTGsfJ0R2uAOn4p5E2XpYHwy50GGL8du02sVzRZ3i
 uAOPlfMnOqCJkb1u6MWPdxS0qajso5I=
From: Sven Eckelmann <sven@narfation.org>
To: Kalle Valo <kvalo@kernel.org>, ath11k@lists.infradead.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 quic_cjhuang@quicinc.com, Carl Huang <cjhuang@codeaurora.org>
Subject: Re: [PATCH 6/6] ath11k: support GTK rekey offload
Date: Sat, 18 Dec 2021 09:43:26 +0100
Message-ID: <2990117.pcrbhTqeWH@sven-l14>
In-Reply-To: <2102838.219ycuhFCz@sven-l14>
References: <20211011193750.4891-1-cjhuang@codeaurora.org>
 <4f28496abae7743ab2a9fa7150c5d64c@codeaurora.org>
 <2102838.219ycuhFCz@sven-l14>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211218_004330_657230_2C752641 
X-CRM114-Status: UNSURE (   5.50  )
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
Content-Type: multipart/mixed; boundary="===============8231807236635909929=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

--===============8231807236635909929==
Content-Type: multipart/signed; boundary="nextPart3507083.0544kFUCgU"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3507083.0544kFUCgU
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: Kalle Valo <kvalo@kernel.org>, ath11k@lists.infradead.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, quic_cjhuang@quicinc.com, Carl Huang <cjhuang@codeaurora.org>
Subject: Re: [PATCH 6/6] ath11k: support GTK rekey offload
Date: Sat, 18 Dec 2021 09:43:26 +0100
Message-ID: <2990117.pcrbhTqeWH@sven-l14>
In-Reply-To: <2102838.219ycuhFCz@sven-l14>
References: <20211011193750.4891-1-cjhuang@codeaurora.org> <4f28496abae7743ab2a9fa7150c5d64c@codeaurora.org> <2102838.219ycuhFCz@sven-l14>

On Saturday, 18 December 2021 09:37:02 CET Sven Eckelmann wrote:
> Why isn't the firmware taking care of the conversion at that place?

Forget this part - this was non-sense.

But the rest of the questions still stand.

Kind regards,
	Sven
--nextPart3507083.0544kFUCgU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmG9ny4ACgkQXYcKB8Em
e0YppBAAlZ5ITaDdvMw8teBFRwszkRrK/XXbdCSu4ebSDsoGfA0cslv/WJOfZV57
q5EJ0kxEp3K9Mg8JWnnMIkwF6qxhiuynpxC6Hxc66YpwZArg70q7atNbhN+qtZK5
LSm8wCFz6fR52IRg+TwUQPREuMXvCVKO8Cs7On/U52dXv1YjiQNwi+B8BQz6M0Yp
LGDd/+NMgVp65rFCDhlaYGWt/BBPa0voKwj3kPA1y6AfAm/3xUhBJDrbVq7a2NKw
p5RM0qxVkTyTZdnh/HGM65lC5R32qTsIo4Tuaz/gcY1OK4N+n+N30L51PepVghp2
KxNntLOSkcDC5i9K4J14wZt0JBgm1sZqDSNjKgZUM3nT1Nn/FerLV5bwFthDe1xR
RZUCGaBpFfC9XaX1XGIyoeKAQicQ4oVJdUpv4Hnwz0PW7yAAsm9T9pgOwxZsVV7p
jew0se/XzTKOnvD51V4VaZABkh5MW79db4LcFVjpBVdYA44GgHk3bSdpyC2WAvWg
1o9GUYx/b8mig9HD4vpYZ7NNpxY84mZ6ZhDGzfauE998CkELxyBFT6F+hGfmTiPO
rpSFltUMlX5457GMmgMq1xopj3OztxFDiSGfJjRsiP8z48YAWWAM25Pq5BIRX1bv
8n9y2P7cViP7dBw3T5hAWQLVDnxHXpnIqcBiB7xwa3W73cOIB4w=
=uSUM
-----END PGP SIGNATURE-----

--nextPart3507083.0544kFUCgU--





--===============8231807236635909929==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============8231807236635909929==--




