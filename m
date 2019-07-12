Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
From: Sven Eckelmann <sven@narfation.org>
Subject: Re: [PATCH v3 0/3] mac80211/ath11k: HE mesh support
Date: Fri, 12 Jul 2019 12:38:54 +0200
Message-ID: <1999032.fCPl2VLiSg@bentobox>
In-Reply-To: <9a1d7a6651d3bf6c4a43c5bc8659df690c009328.camel@sipsolutions.net>
References: <20190612193510.29489-1-sven@narfation.org>
 <2019422.XptUlqRJNA@bentobox>
 <9a1d7a6651d3bf6c4a43c5bc8659df690c009328.camel@sipsolutions.net>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2642006298056025856=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Johannes Berg <johannes@sipsolutions.net>
Cc: hostap@lists.infradead.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

--===============2642006298056025856==
Content-Type: multipart/signed; boundary="nextPart2301428.JFisq3Yxm6"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2301428.JFisq3Yxm6
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, 12 July 2019 11:42:51 CEST Johannes Berg wrote:
> On Fri, 2019-07-12 at 11:36 +0200, Sven Eckelmann wrote:
> > 
> > There is already a workaround for that in the hostap testcases:
> > 
> >     if all_cap_one:
> >         # It looks like tshark parser was broken at some point for
> >         # wlan.mesh.config.cap which is now (tshark 2.6.3) pointing to incorrect
> >         # field (same as wlan.mesh.config.ps_protocol). This used to work with
> >         # tshark 2.2.6.
> >         #
> >         # For now, assume the capability field ends up being the last octet of
> >         # the frame.
> 
> > But maybe you already spotted the problem - it requires that mesh 
> > configuration element is the last element. Which is not the case here - 
> > similar to 5GHz tests (where you have most likely a VHT cap/oper element 
> > after the meshconf_ie).
> > 
> > I hope that this makes more sense now.
> 
> Ah, yes, it does. So I guess we need to update/fix that workaround.

I will prepare a patch now for hostap after lunch.

> And
> I guess newer tshark (which you used) is fixed again, if I understand
> correctly?

Yes and no, the master branch is fixed. But unfortunately, there is no 
release with this fix.

And the problems is there since commit 3c427376579a ("802.11: Use 
proto_tree_add_bitmask") and release v2.4.0rc0. But unfortunately, the 
workaround was added with commit 2cbaf0de223b ("tests: Work around tshark bug 
in wpas_mesh_max_peering") instead of bringing a fix upstream.

Kind regards,
	Sven
--nextPart2301428.JFisq3Yxm6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAl0oYz4ACgkQXYcKB8Em
e0Z41A/8DPolUsKnKtf/r6TUzj7Z0z50iFBWT00vfBPcz0TapYwyJgqGBWjyjAaN
UVZGfFAX/QTgKJxYobt8KSJLkclgobdTy87zQqOwwgWW20dZdHOJ4Qqj+nd3bKQ8
q2a1YZKcPsal2LYB/Ca+0gX/ndm5oMaDZbGZObpi/nKrbFNW+7g7IV+8Kfl9Uxr6
s3S2Pl76M5cyK6DkA9r1YEM3YauT5eHf1jCK1yhOVEb1kHGDkgOZruRbIBRuTJTv
wft/AuZkxgTpgCcDp2WPbdDGwj/17aH60BOlsLo802Gt0bAdzH/rSSMdkHjJC+1R
BupOHt6GU4wWLz51pqAO+7/SwfmCRue+T7BWdzKRXWklcjtdn7mHmUPvgoJb8wOO
MqL/+NjP4mfEyvRyikoSrYVgbDLp/ZCQDfYSFaDzdjjrepqp5LLE03Dk7vFz2/8X
mhfAl0GHJR6pxvGo0AxA+mF/l8JSYzjNS7QChhFEDr6bZiZvMyngrYLaonkffTb2
lpQrQJSRiGhxAKQFHvLwW87wrVyt9tzwt5NVeDg8JTLUF14HZ/iI+3NuzQ3V2ggr
hixI5YmSNSLG20CCgfJ8UDOyU1/RhTCqep1iitKw94CTzkmCs67LbjHOyevH6pn8
J6kK30VPMCVix5CSJCC0QMnwOXP7Z4BblReYeyn/+FAgFBYUMzw=
=N9dx
-----END PGP SIGNATURE-----

--nextPart2301428.JFisq3Yxm6--





--===============2642006298056025856==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============2642006298056025856==--
