Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from narfation.org ([79.140.41.39] helo=v3-1039.vlinux.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJEW9-0004xV-2m
 for ath11k@lists.infradead.org; Wed, 24 Apr 2019 09:48:43 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: Re: [PATCH] ath11k: move per peer pktlog entry to per sta debugfs
Date: Wed, 24 Apr 2019 11:48:29 +0200
Message-ID: <25124618.P5zsotkJkX@bentobox>
In-Reply-To: <b7fb612b6fe0c9130d8a60c87fd93f90@codeaurora.org>
References: <1555389673-19625-1-git-send-email-akolli@codeaurora.org>
 <3753b87a425d38b5c50c33cb4c030451@codeaurora.org>
 <b7fb612b6fe0c9130d8a60c87fd93f90@codeaurora.org>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2342007303056088409=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org
Cc: Kalle Valo <kvalo@codeaurora.org>

--===============2342007303056088409==
Content-Type: multipart/signed; boundary="nextPart2420241.cGjXsRHssL"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2420241.cGjXsRHssL
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, 24 April 2019 11:04:19 CEST Anilkumar Kolli wrote:
[...]
> >> Does not compile:
> >> 
> >> drivers/net/wireless/ath/ath11k/debugfs_sta.c:455:11: error:
> >> initialization of 'ssize_t (*)(struct file *, const char *, size_t,
> >> loff_t *)' {aka 'long int (*)(struct file *, const char *, long
> >> unsigned int,  long long int *)'} from incompatible pointer type
> >> 'ssize_t (*)(struct file *, char *, size_t,  loff_t *)' {aka 'long int
> >> (*)(struct file *, char *, long unsigned int,  long long int *)'}
> >> [-Werror=incompatible-pointer-types]
> >>   .write = ath11k_dbg_sta_write_peer_pktlog,
> >>            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > I am using "arch/x86/configs/x86_64_defconfig" and ath11k enabled,
> > could not reproduce this issue.
> > Kindly share the build instructions.

Not sure what kernel you compile against but the second argument (ubuf) is a 
const since a long time (before the history of the git repo starts). I can not 
tell you since when GCC checks the constness for function pointers. But try to 
upgrade to something recent like GCC 8.

> My build machine configs,
> ./ath10k-check --version
> ath10k-check (md5sum 5d3d5f426267bdc0a18e038d2f691a74)
> 
> gcc:            gcc (Ubuntu 4.8.4-2ubuntu1~14.04.4) 4.8.4
> sparse:         0.4.5-rc1
> checkpatch.pl:  Version: 0.32 (md5sum 3a4f482bde0f92cd08f79fca7efd2a71)
> gtags:          gtags - GNU GLOBAL 5.7.1

Btw. you should really think about not using such old components. Ever though 
about upgrading your system from a nearly EOL [1] ubuntu version from 2014 to 
something more recent?

Kind regards,
	Sven

[1] https://blog.ubuntu.com/2019/02/05/ubuntu-14-04-trusty-tahr
--nextPart2420241.cGjXsRHssL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAlzAMO0ACgkQXYcKB8Em
e0bEkBAAoy87LIr4YQe56JetE1ucYqncc0w+nf4gZ6i7zjAU2KDW2QW6Ebegpgwu
THtpIVZJtlaiepdVdg5PNBTRbBQOaxBFis2aakcSQt2r0sQuJay5k6SSx5tDj9tc
pEgb5VNe7WF8y7r0wXZChMza/+R652+ta1wuM/UqeEEbdS9ZTOrlwJqjku/0cb1o
zuC0khyLH/fcsymyqXwOeJSjaKw21pnzXRgFPAWoxtur+6cLvHINpQqg2pivoknC
8XdH7qBAh6qrT0m7PwDL2jFB0LipLwKas4DYLa2UuKOmCtfTC2/v1PwEQ+OsFEQd
G0QgdCnhoCrBHnA/jcTzjPJ9AhSuTqo8y/2PIU+kNtvAUROUwfbYGCizSLsCL0gA
QH6tKXfIfxqySypa/bccNkoTLER8yLcTJbshIvFPZxSVksNGBIh9jmZcthmAH4+A
TyVvmTgyJsGU9kfCTkMuNs/G1rxWO9uJfjmGF8g8JrtFl4W/YsxjgcQUEz4xoyaU
xI/RwE+QDc9RKCqWIVuO/u8ZknZxUAAXEed7Mu+MWNMA4+tXSjrxavYoe7aV/XYo
tta/WJoxDi74Op5dil2SV+offhrdFiUVie+L2/VQIbQOhRPx00DTwYIiTzous7Xp
VlISn3xN3UaQXOrwKbX0RoSReepy6bjSGn7W3QDrLQHFPtg0qtE=
=oraO
-----END PGP SIGNATURE-----

--nextPart2420241.cGjXsRHssL--





--===============2342007303056088409==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============2342007303056088409==--
