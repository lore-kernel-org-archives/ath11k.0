Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753D7C433EF
	for <ath11k@archiver.kernel.org>; Mon, 22 Nov 2021 11:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C15r32iQMm1YXs442QBT92QhMOD06P35g+qegP2r3fY=; b=GTRM8qI2RXNUp+L4W8gjNrAgwt
	AEiv8S0UovS3IPyFwK1Dg6qMB83n78/PJld+mxnZlwrSvT1JFtB3KiCy+HuPbGQ81hyRF88G/sB1w
	t1lW4d4LMzX2ZqQeqT2igUBcPeEFoDn3TwHy9zPWB7wYrv8EjOGMYLG8T8aKU/xZtQ7UQmxSkG8Q5
	YLiZRErRvjt5zFCW/DwamzYuBIoFD6dkRMH9XTTGhAcx4jUXjmN3UAabdkC9jCSuCfkMvDFKVO/x2
	5SFvj2sBGtspDvhFv10zcd9dUHdm2POHugm+TP/osQqZFkZ0ch+vWnx5Z+e4NULeX7inxpOSRJWkC
	SLjEsmuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mp7DK-00FzLL-Nj; Mon, 22 Nov 2021 11:10:22 +0000
Received: from dvalin.narfation.org ([213.160.73.56])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo4Nr-00Aaes-VV
 for ath11k@lists.infradead.org; Fri, 19 Nov 2021 13:56:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1637330214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uDh2Gef57VIrw3JCOhoreOyscn4mWGROcXDUPaTYRHU=;
 b=1FH3GsiIuqk9MfZBfqTih9QEDTPGeLAuiThZjHfujj6Z0YcJr2eg19OZgVrxyq5co8aqKS
 XlEQVCTdsNa8ulX2DxfqucUUem4LJobzCLNLPq4LPNyTjdAhmMxpjRowUb9iGPKuQTQq8X
 CCuYNTUl1qICtwetDDhmyry11QRNJeU=
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 Anilkumar Kolli <akolli@codeaurora.org>
Subject: Re: [PATH v3 2/2] ath11k: Use reserved host DDR addresses from DT for
 PCI devices
Date: Fri, 19 Nov 2021 14:56:45 +0100
Message-ID: <40959183.USSs3XEnCI@sven-l14>
In-Reply-To: <1637244892-27267-2-git-send-email-akolli@codeaurora.org>
References: <1637244892-27267-1-git-send-email-akolli@codeaurora.org>
 <1637244892-27267-2-git-send-email-akolli@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_055656_199008_5C9DFB13 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 22 Nov 2021 02:54:07 -0800
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
Content-Type: multipart/mixed; boundary="===============2190288286985808157=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

--===============2190288286985808157==
Content-Type: multipart/signed; boundary="nextPart4088782.isi6uL5OL7"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart4088782.isi6uL5OL7
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, Anilkumar Kolli <akolli@codeaurora.org>
Subject: Re: [PATH v3 2/2] ath11k: Use reserved host DDR addresses from DT for PCI devices
Date: Fri, 19 Nov 2021 14:56:45 +0100
Message-ID: <40959183.USSs3XEnCI@sven-l14>
In-Reply-To: <1637244892-27267-2-git-send-email-akolli@codeaurora.org>
References: <1637244892-27267-1-git-send-email-akolli@codeaurora.org> <1637244892-27267-2-git-send-email-akolli@codeaurora.org>

On Thursday, 18 November 2021 15:14:52 CET Anilkumar Kolli wrote:
> +                       if (of_property_read_u32_array(hremote_node, "reg", reg, 4)) {
> +                               ath11k_dbg(ab, ATH11K_DBG_QMI,
> +                                          "qmi fail to get reg from hremote\n");
> +                               return 0;
> +                       }
> +
> +                       start = reg[0] + reg[1];
> +                       size = reg[2] + reg[3];

That cannot be correct. Since when can upper 32 bit and lower 32 bit of an u64 
be combined with a simple "+" and no shifting? And why can you operate on the
reg without getting the address + size cell count?

Kind regards,
	Sven
--nextPart4088782.isi6uL5OL7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmGXrR0ACgkQXYcKB8Em
e0YWphAAoi8XgHm6HgBiHPw5kiqY+4Y+gqOXmJ+wdBpNEgosjJTQTNMC63+cR3+G
d1sIxFo3PDESFnM+1ECTEOQhYbJcG3AFtEwX06vYgtnaifR099MtW5cvLxyEfD3G
2updTMGLyYDCcrRHUpCrpe+JTuHLMZQBgbmMFtb//hs5YYtRP0DXObULwYStBMQS
Qsa2mqzSvzqmP7cUCVDPS1ERRSsUl61POTRi66c4x3vZH6B303OF9Al3eWbQ5VP5
sltJLngIIrHrl96LTb50ETEYsFbTFORed2tY0AKDVwL7LgEy6ZmUj4xypDVktxV6
gRgn64ccfXvUr3OWtCjLGp6yMNQokpHNJuazuLsQ4DbzdMzVuARWlBgfpn2o8XwQ
FqY7c/GJAUUmM7P2RT8hjnXnheZxnFdU+XYwqXBYfDi2AwLpFwL7se8FsR7UwU1H
C3gxOgU+UFSGEvNITubPl+qdxVEjzzUaKKz3arwqnzNmI84HgKNTlw6Ih8ypyl8g
1xjrioaQodhkQx75ZJuhQWzOgi9H+6hJrQck9k1czQZnCEA9ftzIWaTlGnJe03Ch
tYLbjnGh4Vx4SbIeHAWVuv7f7se04HjhgM0VsG3PtvxbA6ID2JAOxxNrkOD4Lb4J
KqbWQrF/5b5PkWo+duFcn8S4dehVJDOVg/z2RAPs3gHFgd9iO5w=
=ahX6
-----END PGP SIGNATURE-----

--nextPart4088782.isi6uL5OL7--





--===============2190288286985808157==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============2190288286985808157==--




