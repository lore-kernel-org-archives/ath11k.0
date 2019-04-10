Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-delivery-195.mimecast.com ([63.128.21.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hE8Dv-0007ne-3p
 for ath11k@lists.infradead.org; Wed, 10 Apr 2019 08:04:48 +0000
Received: by mail-pf1-f200.google.com with SMTP id h69so1164311pfd.21
 for <ath11k@lists.infradead.org>; Wed, 10 Apr 2019 01:04:39 -0700 (PDT)
From: Sven Eckelmann <seckelmann@datto.com>
Subject: Re: [PATCH] ath11k: fix compiler warnings for unused variables
Date: Wed, 10 Apr 2019 10:04:32 +0200
Message-ID: <2594851.t0ysoKU8H1@bentobox>
In-Reply-To: <20190410055840.5049-1-john@phrozen.org>
References: <20190410055840.5049-1-john@phrozen.org>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4787557277369581336=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org
Cc: Anilkumar Kolli <akolli@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>, John Crispin <john@phrozen.org>

--===============4787557277369581336==
Content-Type: multipart/signed; boundary="nextPart1976581.ANWEItbfTi"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart1976581.ANWEItbfTi
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, 10 April 2019 07:58:40 CEST John Crispin wrote:
>   CC [M]  drivers/net/wireless/ath/ath11k/core.o
> drivers/net/wireless/ath/ath11k/core.c: In function 'ath11k_core_init':
> drivers/net/wireless/ath/ath11k/core.c:609:10: warning: unused variable 'rproc_phandle' [-Wunused-variable]
> phandle rproc_phandle;
> ^
> drivers/net/wireless/ath/ath11k/core.c:608:16: warning: unused variable 'prproc' [-Wunused-variable]
> struct rproc *prproc;
> ^
> drivers/net/wireless/ath/ath11k/core.c:607:17: warning: unused variable 'dev' [-Wunused-variable]
> struct device *dev = sc->dev;
> ^

This patch doesn't apply because they just dropped the 
CONFIG_IPQ_SUBSYSTEM_RESTART support (which is their only way to get the Q6 up 
in their 4.4 Hawkeye kernel) using a off-the-list patch [1] submission.

Kind regards,
	Sven

[1] https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=ath11k-bringup&id=426598fdbef82ace7b4a728445f61ecf034f233c
--nextPart1976581.ANWEItbfTi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAlyto5AACgkQXYcKB8Em
e0a82hAAqAMkfZT7TZo/bb1DLPvftddWBizrtlmqCTPPHMKpP/nZ5RlqFzlBx5Gf
KyIjWfsvYla9qjdC0azDeFoI+oPJ+PfD03UBCuQWVGNgvCwwJfISmhCjCBDShODS
ZRQ/cnl7LOqmd6HKyiXIXWeRWQvh3ARli5mjnzxt81547QnjejeJxnAmEIuqqVgg
A/+re3xN5mHfnkpOemTR5rU50Ll/OZnoKIQrVL659XPcpB6py5B5bJ2Xe/HfGP0K
iWbuOE1IktDRA6OFxdZY5gmQzlRHT/yDwUBVO+CdQxea3UCXhdNy0yMUQXr/79tG
lSfqS2k7pnxlBu7H7UiQUw1Wdnf6dAPP5J/5G8D0dNi3sJ9oEwKPqbfsIQHJ2QW1
egsi/hBfk2J1wwTqEfZBvoNf1Zy/Bfz3Rn0VtqPuaC9rqmuhda/UrA6SXRlS8Hat
rd2iq1gUrkQPo1cPJR6ciD/lPzpLP9oQ/KsdcYo9IFaOsA9J0o1GtqJC0tN8bYVO
LLpSD6dUOY0UgBCvh+3crOzF2QUnOn9P7nAVOy2CDpEUBCg+AhpEkeYLZN0h8vJe
mk84fDNbuGHhMroMM1MNtNPh6xRQA+BvPALGOGmkeVpHH+3d4bHyBgTp1psXreXw
5MS6u81yMQJFyrCPtOKHqY+ZahiGRFyalBDllz2lVYt8ccl8b4A=
=S0FT
-----END PGP SIGNATURE-----

--nextPart1976581.ANWEItbfTi--





--===============4787557277369581336==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============4787557277369581336==--
