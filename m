Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1WgQ-0008Ob-0R
 for ath11k@lists.infradead.org; Tue, 11 Feb 2020 14:38:40 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: Re: [RESEND V2 3/4] ath11k: switch to using ieee80211_tx_status_ext()
Date: Tue, 11 Feb 2020 15:38:22 +0100
Message-ID: <4744821.iAptAJfnkX@bentobox>
In-Reply-To: <87h7zxxob7.fsf@kamboji.qca.qualcomm.com>
References: <20200204151135.25302-1-john@phrozen.org>
 <20200204151135.25302-3-john@phrozen.org>
 <87h7zxxob7.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6952970364753641256=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>, John Crispin <john@phrozen.org>

--===============6952970364753641256==
Content-Type: multipart/signed; boundary="nextPart2107701.dEEGrNscTW"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2107701.dEEGrNscTW
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, 11 February 2020 14:10:04 CET Kalle Valo wrote:
[...]
> > diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
> > index 7b532bf9acd8..66a6cfd54ad9 100644
> > --- a/drivers/net/wireless/ath/ath11k/dp_tx.c
> > +++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
> > @@ -357,9 +357,12 @@ static void ath11k_dp_tx_complete_msdu(struct ath11k *ar,
> >  				       struct sk_buff *msdu,
> >  				       struct hal_tx_status *ts)
> >  {
> > +	struct ieee80211_tx_status status = { 0 };
> 
> This adds a sparse warning:
> 
> drivers/net/wireless/ath/ath11k/dp_tx.c:350:47: warning: Using plain integer as NULL pointer
> 
> Seems like a false warning, no? But not sure how to shut up the warning,
> using '{ NULL }' would do that but just feels wrong. Any opinions?

Why is this a false warning? The structure is following:

    struct ieee80211_tx_status {
    	struct ieee80211_sta *sta;
    	struct ieee80211_tx_info *info;
    	struct sk_buff *skb;
    	struct rate_info *rate;
    };

And this is a pre-C99 initializer. The equal C99-Initializer would be

    struct ieee80211_tx_status status = {
    	.sta = NULL,
	};

So it is initializing status.sta with 0. But status.sta is a pointer
and we should use NULL for pointers instead of plain 0. If you want
to initialize the object on stack to zero but not initialize each 
member then just use {}.

Kind regards,
	Sven
--nextPart2107701.dEEGrNscTW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAl5CvF4ACgkQXYcKB8Em
e0ayUBAAjXc/3uYA9x/45bbvY7vVF41gDZSUj8P5uvnLXQJL5gfeAsKuNuPQno03
EdzxluMQWyKXjHo11T1IfwXo6hkHueYFschLpwnnBu2w6Rw6UeOWClpaAA4wWUfu
L3yf95F217nKVT05UvAIoyafHNuptIKBv9sDMydIaRfUF5v2Ywcb0RGesp6ICgqo
W8tFQzy9aRs9KSnDTlClZ/s+loSegRecUxEPN2/xPeNfKtmuSNngG1x+PDy/MFOX
mQWJI2M+GbPPPUEihK/KWsZ8Y4UJgLXsAE9vqZs2Df/WPlTLDN0UmlbOEM749ZVU
o+1zz+kkeA3JhSN0CCq941APt7axma2xNsAgfwaG1Vzfw2sVVUPun/QhAecqdcwK
8gbj8ecsyo1WQa4QJTifXetl6Kfl+hbBMQg8gH3vmUVVsG5brvtn4gdKHFNTlkdI
VbqWDGnq2FM+k6ydDtPeSGKNUyn0SigDcMJZr+8J4A3PvQVOaGGZ+/Bzwr3K4Ofk
plhUudyoCP8XGFiB+ZQuLioph8Fc4nXMRSp5lboi2xyPVlQD1OjlU4a016YreqAo
qziI8rFbxt89Xfx6j6zczALo+z+PHd+gjSXKuP/LwJvm9HaRCGd5dFSNrvgtEL7k
qRqm9A4zM6Tr5eKuQ6lrbiA8tqWY9KI0ZLNutiWhTEGOMjB/uho=
=bRu5
-----END PGP SIGNATURE-----

--nextPart2107701.dEEGrNscTW--





--===============6952970364753641256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============6952970364753641256==--
