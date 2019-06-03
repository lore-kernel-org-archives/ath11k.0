Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from narfation.org ([2001:4d88:2000:7::2] helo=v3-1039.vlinux.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXolc-0002vY-E8
 for ath11k@lists.infradead.org; Mon, 03 Jun 2019 15:20:58 +0000
Received: from bentobox.localnet
 (p200300C5970CA3FE0000000000000DF6.dip0.t-ipconnect.de
 [IPv6:2003:c5:970c:a3fe::df6])
 by v3-1039.vlinux.de (Postfix) with ESMTPSA id 2480E11011C
 for <ath11k@lists.infradead.org>; Mon,  3 Jun 2019 17:20:55 +0200 (CEST)
From: Sven Eckelmann <sven@narfation.org>
Subject: Re: [RFC PATCH] ath11k: register HE mesh capabilities
Date: Mon, 03 Jun 2019 17:20:49 +0200
Message-ID: <4287292.mqGLfAt13s@bentobox>
In-Reply-To: <20190603151719.31974-1-sven@narfation.org>
References: <20190603151719.31974-1-sven@narfation.org>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1174904970942476083=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org

--===============1174904970942476083==
Content-Type: multipart/signed; boundary="nextPart1640954.V3CcBb2Eqz"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart1640954.V3CcBb2Eqz
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, 3 June 2019 17:17:19 CEST Sven Eckelmann wrote:
> From: Sven Eckelmann <seckelmann@datto.com>
> 
> The capabilities for the HE mesh are generated from the capabilities
> reported by the fw. But the firmware only reports the overall capabilities
> and not the one which are specific for mesh. Some of them (TWT, MU UL/DL,
> TB PPDU, ...) require an infrastructure setup with a main STA (AP)
> controlling the operations. This is not the case for mesh and thus these
> capabilities are removed from the list of capabilities.
> 
> Signed-off-by: Sven Eckelmann <seckelmann@datto.com>
> ---
>  drivers/net/wireless/ath/ath11k/mac.c | 56 +++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)

This patch is just for demonstration purposes. It requires the
patch(es| series):

* https://patchwork.kernel.org/cover/10963863/ (whole series)
* https://patchwork.kernel.org/patch/10963219/
* https://patchwork.kernel.org/patch/10963221/

But the firmware WLAN.HK.2.1.0.1-00629-QCAHKSWPL_SILICONZ-1 seems to hang when 
trying to associate.

Kind regards,
	Sven

--nextPart1640954.V3CcBb2Eqz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAlz1OtEACgkQXYcKB8Em
e0Y3rxAApFbRW+PPkCiuccOJ/1n1h9zVBil3bQnTuiGwzVU6N1sVDWlzSqBXjwCX
9iynrXxzwgwAS+Z+cQ3BLKwqkiEgaVCUKKII3EXrkGob7Wy5ubCvfHB5peMpHRvZ
KU/GWQ3ChmZ7WRC1dTS9fzHO/qQWJOM2MKJoHueNXA2vgo6/CkK3Tkz3o1MFyimd
n1DA7CQRP/DXalnJyQuUEtuNXzKcjpHVUGKmvdHdq1VkSnL736d8WmDqjUTAy4Q6
ONUSRBgFUXBKM4uoKx2vQ8n8h321umwWBBggikxD6tCexqj6BaCifuP324LC6Pld
BZKVpVowSDVutolSfSlJRo9hti2198lpVNWaBthwMwUwbmDfnSAK9CZzacr7JkrH
9p916ixvsctTMQ0tqFQj6R0Wxs837MsOWN6dd6MeVq7YyO3efpRabkCNNOh3oXcD
8w1whXDQCCx12r7N4kAO9k0Shjsx2NabcgW8JWqfTP+Q916dpy8L5pp/g6Zw87oz
1jipm7pvkGmn1kCXY2zHaaQ25gyRFP6JGB9RvZPL3yKOdPCCAfKuDz5KHYCPGujt
9WZovzPAj7RmV0WCcT0PM2hlX/kGJh+ucjRmiPsODk0+GfIW3ecRi0xRUpjEHSx0
bIMhHUiKbK29IFYLiVuoVs+DSnA9n5KLvWL79tPYbNGh8vzy6qg=
=sVgb
-----END PGP SIGNATURE-----

--nextPart1640954.V3CcBb2Eqz--





--===============1174904970942476083==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============1174904970942476083==--
