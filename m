Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from dvalin.narfation.org ([213.160.73.56])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVIB5-00077V-Eb
 for ath11k@lists.infradead.org; Wed, 21 Oct 2020 17:45:36 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: Re: IPQ807x: No regulatory rules available in the event info
Date: Wed, 21 Oct 2020 19:45:26 +0200
Message-ID: <7780171.8BBbFCJXL2@ripper>
In-Reply-To: <3358088.zmNjgFgxhd@ripper>
References: <3358088.zmNjgFgxhd@ripper>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8210874186915784464=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org, kvalo@codeaurora.org

--===============8210874186915784464==
Content-Type: multipart/signed; boundary="nextPart95210947.MAiEPgWyhm"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart95210947.MAiEPgWyhm
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, 21 October 2020 17:51:07 CEST Sven Eckelmann wrote:
[....]
> A board.bin is attached which causes the problem. It is just the 
> bus=ahb,qmi-chip-id=0,qmi-board-id=255.bin (from IPQ8074/hw2.0/board-2.bin) 
> with the REGULATORY_DB_SECTION.regDbFlag set to 1 and the regdb included.

Ok, it seems like the reg_dmn_pair_id 0 is now forbidden in the 2.4.0.1 
firmware releases. The entries must now always use a value > 0. My tests now 
seem to suggest that I am able again to embed the wireless-regdb.

Kind regards,
	Sven
--nextPart95210947.MAiEPgWyhm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAl+Qc7YACgkQXYcKB8Em
e0Z65hAArFyb4hOYqHlUzapElylZPGZ9rC/yKLzGytX1Kr427T8wzE1Pp5NpN+Uc
YR1WHkWJLPIpOypkC0u4puCcu5ixPVORuntPbvabebdjthRLUvTEdeGFF3CRtKUI
5hKIEYXHlfljMLN/vSvnV/14cLG8+3Chy2WBwy//s/pb5WeA45VuRhgr1CaPnwh6
DSlVy/hSbefTOoiz6vl7CK1gwgoYP1L7xx+UzAeeT2sKVsMxxvxxKVvXajxuxUUZ
FXd7IGRZlqpfp4OjJqvQ/aapQXhlL1n2F2ynF8qavu/k1rAJlIiOWYpsqISxIVKg
7AZ4waCuM3w17XcpTneS3H82cKkM6DYXWpom7e5qVVDmqAu5SW3l+CGR5qBOz6yX
w3oLaeEa7lzEJp4VeApvRb+O+hVLNbGVnZNV9ClaUoWGpqdbNy0Nn14sOwRTY6cM
f158J8dexsAO+YJDXerewh2Hf8LQrpPBYCkNRitCANO5DCrGO0bTTTcov5XTZPxH
AImvX81Y/eEmH14bwXmwgtE2wqwsTLKmpejFzxwUMPBlkh/9rmlwA47pO/NAqixK
DJmCMAaSCPR35URoLfa/5mKJFaI7u7+YXE0KKxt/Dmv/yZrEi+RnFw6/8aY5uJUr
9kTwrvQ5ZUq8zSlFc8RWtClOcLQFaVzFItW+8HiMCplz+xAUvlM=
=zgxb
-----END PGP SIGNATURE-----

--nextPart95210947.MAiEPgWyhm--





--===============8210874186915784464==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============8210874186915784464==--
