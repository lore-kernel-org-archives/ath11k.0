Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from dvalin.narfation.org ([213.160.73.56])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hr0JX-0007Zy-TK
 for ath11k@lists.infradead.org; Fri, 26 Jul 2019 13:31:17 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: Re: [PATCH 2/2] mac80211_hwsim: Register support for HE meshpoint
Date: Fri, 26 Jul 2019 15:31:02 +0200
Message-ID: <3082836.hUm4yBdaKs@sven-edge>
In-Reply-To: <f2e16d10ce3eb3ff08c97c27424b824b8e012553.camel@sipsolutions.net>
References: <20190724163359.3507-1-sven@narfation.org>
 <20190724163359.3507-3-sven@narfation.org>
 <f2e16d10ce3eb3ff08c97c27424b824b8e012553.camel@sipsolutions.net>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3647362913598053688=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, Sven Eckelmann <seckelmann@datto.com>

--===============3647362913598053688==
Content-Type: multipart/signed; boundary="nextPart17383225.By4h09HMEI"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart17383225.By4h09HMEI
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, 26 July 2019 15:26:32 CEST Johannes Berg wrote:
> On Wed, 2019-07-24 at 18:33 +0200, Sven Eckelmann wrote:
> > From: Sven Eckelmann <seckelmann@datto.com>
> > 
> > Some features of 802.11ax without central organizing (AP) STA can also be
> > used in mesh mode. hwsim can be used to assist initial development of these
> > features without having access to HW.
> > 
> > Signed-off-by: Sven Eckelmann <seckelmann@datto.com>
> 
> Even with the tshark workaround in place, this breaks 68 mesh-related
> tests in hwsim tests. Jouni says only 3 use tshark ...

As I already wrote:

> The first three things looks like wpa_supplicant problems. Seems to be 
> caused by the way HE forces VHT to be enabled and now the tests fail 
> which try to disable VHT. There was already a patch [0] for that but it
> wasn't considered a good solution.

> But beside these three things there are various other problems in 
> > wpa_supplicant regarding HE with pending patches. So I've used 
> wpa_supplicant 91b6eba7732354ed3dfe0aa9715dc4c0746e3336 with two 
> additional patches [1,2] and increased the VM memory to 1024 MB. Also 
> wireshark (tshark to be more precise) had to be updated to 
> v3.1.0rc0-1192-gf64990438c
[...]
> [0] https://patchwork.ozlabs.org/patch/1125305/
> [1] https://patchwork.ozlabs.org/patch/1125314/
> [2] https://patchwork.ozlabs.org/patch/1125322/

Kind regards,
        Sven
--nextPart17383225.By4h09HMEI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAl07AJYACgkQXYcKB8Em
e0Y0zhAAxIiho4RgmgU9uOKpUfa1P3m+O9tIrsmpjZMjS0ITvxsgH1ahDdnTzAoE
w5VEPvas/BUmh84AWG60UkkivZz1Vlwd0Ivr3nUazQhfj0cmv+Hwme/ttV7Z3Zwi
UWg3S8WogRO9wDtX/lepAPtPVxLLGQoyV+Z3E7MTqjQkiNo5LICguZiM5X8vVKxb
qZ8XqRz8xEdIaIF9tv9XmTJv3qsxC70MqO9Xlq6YTUXXIeQYKw7zRex+8DpGARjG
4WWdu3pUYErWln8vddixsTPH0nPHS9BPnYQqvEzTnF1X6ZcRVN17ev25OMv7ntx4
lvc4WDCD8mp70f3ITQXB/3yuUZO7CMaqKiJy1ruchu7Bw2KT5XDGN1MFg4r1KRan
3HtNqjT4bPNdeoeeyhxZ3hnerv5aQtxUY0Mus17fZ09z8D1cL49hJj3RN3LszwrH
UYmX66Efbrgpjo3z8lbqfaxa9aB3+agFhI1pq6pvdfxG3rp1oyJPGIk2pNY4ii9j
vxA269oZ7rwmn7iMaH20NVnK3GxLGRnvo2XzdE0RyYINS7MOfBNyG6P8n/lWJaXL
X6pNOinkkpc0J+OaFi6mxB7Ypq6n7NRvxjzj0zPdxCCG0wqyw0AxONnb6Ow9TXtC
qDs9LCGPpyBd5fEFoB3lMmWgsCuiA1abccd1ioUyZREKd/sjpAo=
=9JHr
-----END PGP SIGNATURE-----

--nextPart17383225.By4h09HMEI--





--===============3647362913598053688==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============3647362913598053688==--
