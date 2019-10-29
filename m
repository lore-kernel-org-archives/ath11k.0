Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from dvalin.narfation.org ([213.160.73.56])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPMe8-0006Vc-D2
 for ath11k@lists.infradead.org; Tue, 29 Oct 2019 08:14:34 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: Re: ath11k: (broken) mac address reporting by firmware
Date: Tue, 29 Oct 2019 09:14:19 +0100
Message-ID: <1864155.BGtVDA1Edn@bentobox>
In-Reply-To: <6869330.LJuu87LXsD@bentobox>
References: <6869330.LJuu87LXsD@bentobox>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0033005173581454238=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org

--===============0033005173581454238==
Content-Type: multipart/signed; boundary="nextPart2733153.Uzpqu2RnCP"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2733153.Uzpqu2RnCP
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, 28 October 2019 22:19:02 CET Sven Eckelmann wrote:
> I've just tested here WLAN.HK.2.0.0.1-00043-QCAHKSWPL_SILICONZ-1 and noticed 
> that the mac addresses returned by the firmware are not the ones stored in the 
> caldata.bin. It was observed that:
> 
> * first octet is always set to 0x00
> * octet 2, 3 & 4 are copied over from the caldata.bin
> * octet 5 is random
> * octet 6 is random
[...]

Forgot to post the actual raw values (word0 and word1) from the firmware. So 
here this part:

* WMI_TAG_READY_EVENT:

  - addresses: 3 (but only 2 radios)
  - mac_addr:

    + addr: 00:d9:b8:17:76:76
    + word0: 0x17b8d900
    + word1: 0x00007676

* WMI_TAG_ARRAY_FIXED_STRUCT:

  - addr_list[0]:

    + addr: 00:d9:b8:17:aa:db
    + word0: 0x17b8d900
    + word1: 0x0000dbaa

  - addr_list[1]:

    + addr: 00:d9:b8:17:46:a7
    + word0: 0x17b8d900
    + word1: 0x0000a746

  - addr_list[2]:

    + addr: 00:03:7f:12:f2:c3
    + word0: 0x127f0300
    + word1: 0x0000c3f2

So it is also not a problem of incorrectly shifted addresses. They are really 
not the addresses which are in the caldata.bin

[...]
> Is this a known bug in the firmware? Is it possible to retrieve the actual mac 
> address(es) from the firmware? Using hardware with randomly changing mac 
> addresses is not really a nice thing.

It seems like the problem can be solved by changing following things:

* Offset 0x03E: 0 -> 1 (enable non random mac address reporting?)
* Offset 0x224: 6 -> 2 (report only two mac addresses for the two radios)

The checksum has to be recalculated using:

1. set the two bytes on offset 0xa and 0xb to 0xff
2. calculate the checksum[0] by XORing all odd bytes
3. calculate the checksum[1] by XORing all even bytes
4. save the checksum[0] to offset 0xa
5. save the checksum[1] to offset 0xb

Maybe someone can correct me here because I've just documented what I found
without spec or access to the firmware code.

Kind regards,
	Sven
--nextPart2733153.Uzpqu2RnCP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAl239NsACgkQXYcKB8Em
e0aHShAAt1riSVfky7y0NnC/vEaEC7bJ0VUY2MPSx1F/fG0VAZnWUy9tM2dBIesL
ZdhNHJWfyaBykbstiOZolg/AEwr1NeFLcdCVr6yPS3gG3eFhXyzdjEDWsRuS86ec
OY0BetXeAR+xBJUxhKK0m+dvsf4XoQa/Tdz9nbtdnGjmydz9h8CEXzaA0LwtjiY/
ueEkqsVUu69xoptHJSo3RDR6a+Fdlwe7ebOrEn7PrAx6e/PMnDeR9DFy6x8AXhSz
UBujlrl7ffQ8xNmQ7wptP3XxyndKHHK1p9f6k84yU4n4KCnHfmhoEJqa5jT8+FID
5KSyJliSZvQZw1VRDrC0ViDseB7Tqg00ThxSovJeKn8es0wAwZlqRZRJnoC5Z7a8
wGTrdkHDl2yrFhHS5+rMvSXmjZU3rBEajBWa+ttgq5ZVif5//wKyUktnzyq9sX9z
Usj8xcVdFA9ZzEHmi17uP3UdQCi4IzS2vh+2HjPyeor6KBhRTR/hzGMGFfH5zIEU
5ziUEpVb6p9OvUAaKXzhUMhw3FOv5muG9e6rGXwxxqxPhywTu67mLfAhfYREZ9gw
nlnwXjr2FUH1IYZCp1zkJ4tYiQN6X8IPXuQPLHO0gsz21/krIRoWy8eD/dPK9Cm7
1lx/JmmUaXw1Kk7Dni2GK17wNq1Gum55UUGeL9kAshMjn2n/Uzw=
=CFW+
-----END PGP SIGNATURE-----

--nextPart2733153.Uzpqu2RnCP--





--===============0033005173581454238==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============0033005173581454238==--
