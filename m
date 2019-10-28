Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from dvalin.narfation.org ([213.160.73.56])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPCPx-0004mD-Hx
 for ath11k@lists.infradead.org; Mon, 28 Oct 2019 21:19:15 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: ath11k: (broken) mac address reporting by firmware
Date: Mon, 28 Oct 2019 22:19:02 +0100
Message-ID: <6869330.LJuu87LXsD@bentobox>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1604295103129982826=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org

--===============1604295103129982826==
Content-Type: multipart/signed; boundary="nextPart4782421.A5uNfvj5y8"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart4782421.A5uNfvj5y8
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi,

I've just tested here WLAN.HK.2.0.0.1-00043-QCAHKSWPL_SILICONZ-1 and noticed 
that the mac addresses returned by the firmware are not the ones stored in the 
caldata.bin. It was observed that:

* first octet is always set to 0x00
* octet 2, 3 & 4 are copied over from the caldata.bin
* octet 5 is random
* octet 6 is random

So for example, I have following addresses in my caldata.bin:

* f8:d9:b8:17:74:a8
* f8:d9:b8:17:74:b0
* 4x QCA defaults (00:03:7f:12:*:*)

And then i get:

* on first boot:

  - WMI_TAG_READY_EVENT

    + 00:d9:b8:17:c3:c3

  - WMI_TAG_ARRAY_FIXED_STRUCT

    + 00:d9:b8:17:14:47
    + 00:d9:b8:17:3c:cf
    + 00:03:7f:12:64:57

* on second boot:

  - WMI_TAG_READY_EVENT

    + 00:d9:b8:17:ef:ef

  - WMI_TAG_ARRAY_FIXED_STRUCT

    + 00:d9:b8:17:87:0f
    + 00:d9:b8:17:97:ff
    + 00:03:7f:12:54:0a

* on third boot:

  - WMI_TAG_READY_EVENT

    + 00:d9:b8:17:3b:3b

  - WMI_TAG_ARRAY_FIXED_STRUCT

    + 00:d9:b8:17:4b:27
    + 00:d9:b8:17:53:af
    + 00:03:7f:12:5b:37


The WMI_TAG_READY_EVENT address is completely ignored by ath11k. The first 
WMI_TAG_ARRAY_FIXED_STRUCT address is used for the 5GHz PHY. And the second 
WMI_TAG_ARRAY_FIXED_STRUCT address is used for the 2.4GHz PHY.


Is this a known bug in the firmware? Is it possible to retrieve the actual mac 
address(es) from the firmware? Using hardware with randomly changing mac 
addresses is not really a nice thing.

Kind regards,
	Sven
--nextPart4782421.A5uNfvj5y8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAl23W0cACgkQXYcKB8Em
e0Zo/g//ewGZb4vY3zvfsLJAqCJj96Fwbz873qdA7M3YREpe/Q6mPdjgcOVbj/jc
n+U7LEDO9qwttSMq+f8CVmL+FVkvspsg1Gsjfeb87KyP2cIjeaLnDC+aj+AfhuMh
kPoj11Z6FWVBBOgmzFVOlp/SldpLtKoqTem7xfCDuuObKuAXIqTjWmNkSseN9udG
o4IsYeM/x+FtUhNmBTUx2l2yn+wYMTj8xLTBlaD6z5mBm80WT6T8g2fydZXXF2qE
QRD1nvz2Wp1JxjFlZaLXMwR3EIoTxp5VcFuOxmRAvydwzIbfxsE2pyY6L7B+OMy0
dexhZ0UzMjxA9tO2QURzPT03IYuUl92duDZ/5yh7BP01UJOc3tuMpRaRK88Kofq3
1KBUHtKpxUa/VONyJcp4n7MCNBb5/EUvD9os849hX50rNoq5REixW1dC8PN6HoQR
Xs441VgQFNn68BKwHgyiU6VN9yB+AKXlYU2+oECk6PVQv9c4zRL95qjysgrD5e28
SARkvIOYz9uBoowzf8RIQm2Cq48RTCGAZ3FGDTunY8Ykie9m08ftJVVvJL7y0I3s
4wAddhtX9jNCoVsPWTEc0+AXzW16pf+H5ViXoamShn74iNW1pjt5+j8JTnAa4Jw2
inkyrIBS12nRhw8c9F0stzDxK0DdPtsFFCg2mrZByf3G6t5wtJk=
=M5OE
-----END PGP SIGNATURE-----

--nextPart4782421.A5uNfvj5y8--





--===============1604295103129982826==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============1604295103129982826==--
