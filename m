Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from durin.narfation.org ([2001:4d88:2000:7::2])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbmxY-0007S8-LZ
 for ath11k@lists.infradead.org; Fri, 14 Jun 2019 14:13:42 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: Re: [PATCH v3 2/3] mac80211: implement HE support for mesh
Date: Fri, 14 Jun 2019 16:13:32 +0200
Message-ID: <2194147.kqlnQF7k4C@bentobox>
In-Reply-To: <8d0d11ca39b6216b24cf4e9e3a1522072db5c0d2.camel@sipsolutions.net>
References: <20190612193510.29489-1-sven@narfation.org>
 <20190612193510.29489-3-sven@narfation.org>
 <8d0d11ca39b6216b24cf4e9e3a1522072db5c0d2.camel@sipsolutions.net>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2654954833373931478=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

--===============2654954833373931478==
Content-Type: multipart/signed; boundary="nextPart1611464.BoocHWZ4b5"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart1611464.BoocHWZ4b5
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, 14 June 2019 16:11:15 CEST Johannes Berg wrote:
> > +       ie_len = 2 + 1 +
> > +                sizeof(he_cap->he_cap_elem) + n +
> > +                ieee80211_he_ppe_size(he_cap->ppe_thres[0],
> > +                                      he_cap->he_cap_elem.phy_cap_info);
> > +
> > +       return ie_len;
> 
> There's no value in the "ie_len" variable here.

Sorry, my parser just broke. Why is there no value in ie_len? Was just 
assigned a line before. Or are you talking about something else?

Kind regards,
	Sven
--nextPart1611464.BoocHWZ4b5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAl0Dq4wACgkQXYcKB8Em
e0butBAAu0U2S7wFCG42oSqGv9AjRaZtFJHKf6JLUfaHbld0mJNvxXMMncLsYNQV
gmPmIEoDJuk6d4BlRUa9whCPPc8V6kMODylOwqVDx1qpeuVUuNUxbK/7rvMwQPCF
TAuwzZ/ILxX4onafvgI2OCcJD+BauDCYPlgBSJwZi9OMOaLwgz5F59fcA/R2MlEt
nAqxyUdL/tJRjLNxDMtVOZdm8VSUGFBZLD8Ww7RIqUuZb7dsAkGAcmhbPyoGzoqy
IFXwqwVtGjb7YPASrqfG1N+LJjKVAbBvknofHEkHciDUV9o5VKKX/I7IiJAyMF1X
IILegixRN8MJtVXXZEx+9K2r8V5lB/KZWj9x75qw3ZHh2uta7ga7pbUYta6PHIHr
80jvJ5KTkGsYia3XEXgxNaAO77xT8Ai85itex5V5zrL/HmtNWBcZl4XPYc1HSa8+
PVa82kX0puYi7pa5QKj7GfKeUn9Xetty52hrT7aqyLeGgFf1Nrry3lzcCAK5BKWI
1ExMP2wevkv+11UHR4xaVl9/1oNcmMIWlU7nZJgClUMOigt8U5r70Us2lQ2kSkck
kgQEzt0yDvpfB9lhQoO2H3E38VhlWljC928YecyZcvKDlZo+7ZhI3VeIKy62aSYX
AttrUYElR8SutIZN8YlwF1If61rx9SBnK6oBTYmWnejz9HQOPFE=
=0tJn
-----END PGP SIGNATURE-----

--nextPart1611464.BoocHWZ4b5--





--===============2654954833373931478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============2654954833373931478==--
