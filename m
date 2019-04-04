Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-delivery-195.mimecast.com ([216.205.24.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBw7o-0001bX-OE
 for ath11k@lists.infradead.org; Thu, 04 Apr 2019 06:45:26 +0000
Received: by mail-pg1-f200.google.com with SMTP id d1so931321pgk.21
 for <ath11k@lists.infradead.org>; Wed, 03 Apr 2019 23:45:19 -0700 (PDT)
From: Sven Eckelmann <seckelmann@datto.com>
Subject: Re: ath11k: Meshpoint interfaces with fw 0x30804a5
Date: Thu, 04 Apr 2019 08:45:09 +0200
Message-ID: <11963916.mhQnyPb6De@bentobox>
In-Reply-To: <ff33985163361d7ab73dd658e0410bf6@codeaurora.org>
References: <cd1c5f61ef06cf858ad650c7529ed2ff@codeaurora.org>
 <ff33985163361d7ab73dd658e0410bf6@codeaurora.org>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3412414453705317841=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Rajkumar Manoharan <rmanohar@codeaurora.org>
Cc: ath11k@lists.infradead.org, john@phrozen.org

--===============3412414453705317841==
Content-Type: multipart/signed; boundary="nextPart3025474.27mnbuL9t9"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3025474.27mnbuL9t9
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, 4 April 2019 05:21:14 CEST Rajkumar Manoharan wrote:
[...]
> Below issues were observed in bring up and fixed in 
> WLAN.HK.2.1.0.1-00113-QCAHKSWPL_SILICONZ-1 firmware
> 
> 1) Assert in mesh interface creation.
> 2) Group action were filtered
> 3) fix 4 addr in firmware for mesh peers
> 
> 
> Moving forward please use 2.1.0-1 firmware release which is meant for 
> ath11k.
> We are still working on to enable secured mesh (SAE).

Thanks. So it looks like I was on the right track for the initial 11s support. 
We are using this firmware at the moment because I heard from John that the 
newest(?) firmware was not working with the public available ath11k sources. 
But since I have absolutely no idea about the current firmware situation of 
ath11k and can also not find anything which sounds like 2.1.0-1 in Kalle's 
repo [1] (and I most likely mixed something up), I would like John to add a 
comment about the current situation.

Kind regards,
	Sven

[1] https://github.com/kvalo/ath11k-firmware
--nextPart3025474.27mnbuL9t9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAlylp/UACgkQXYcKB8Em
e0Z8SRAAjdjFxDUBPIJWhjHsQtrODsDSEN5JkePzduxH9S3vT6SEbcEtoRpKpVAo
TaO+etLYRqBaZpWy7Qm8vjnz6BMmA7KqBCk4uiOfHg9ASrR2m2jvA4djhgRCg4RU
c0jTU2kgOpR6ML9YTSnAvDEfqmB0EW70sS24mUcKC+NxCBA6Kzde3b0BafVMvOpI
H1xNSL4rsZfM1f1jnrjAgqdnsxuTeQ8bfFKKdRKtkLDdkgFKIK0PkLpdlqp8l0l+
3jSZ4SLIHFRObG9z4D0/fIRSaYQtsiZc67S06muBfwIQ9CZPVL5E/Q781WGr5qBj
+Zjgz8aA/d2GoZgMBZWRr+JYy1JY6idBlfueMtAaSS5nkyuHhsaQpVnLrW4MPGq7
Oanpbj2xVPjPmTqBF0idSKWAxi2P3SFyyizGvJrXeIkKu27LFVdJ++RruS9zji86
Kdo9/QiqcCz7HPkt5S4CLgmY5zurozGlmprYPXh2JXZbJhwdq/8NtpaggnjqmgyQ
nBBhXJmqhhHaO13efbLuZ7ijvIUuM6e5oD2Bmt9ABUi0JUwKGUQ1EeKzkUURT5US
As2sJMvYjykjSKo9bKCOEzqdPAdG5UEHwApIzTGitr6AXdEg6xurIgbutfjheJpx
Q2Dvi5k3GljlE6UwImvs+pWXAMaA2UT99UTVgwT1/e2CbdQXv4I=
=BuDn
-----END PGP SIGNATURE-----

--nextPart3025474.27mnbuL9t9--





--===============3412414453705317841==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============3412414453705317841==--
