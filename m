Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from durin.narfation.org ([2001:4d88:2000:7::2])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hayqT-0000h0-Bc
 for ath11k@lists.infradead.org; Wed, 12 Jun 2019 08:43:03 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: Re: [RFC PATCH v2 3/3] ath11k: register HE mesh capabilities
Date: Wed, 12 Jun 2019 10:42:49 +0200
Message-ID: <1614431.vQLKkJHT2m@bentobox>
In-Reply-To: <1919330.hVZVHELXip@bentobox>
References: <20190611180247.19524-1-sven@narfation.org>
 <20190611180247.19524-4-sven@narfation.org> <1919330.hVZVHELXip@bentobox>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7837656271940229076=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Bob Copeland <me@bobcopeland.com>

--===============7837656271940229076==
Content-Type: multipart/signed; boundary="nextPart4254098.4Ndc6H3f2e"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart4254098.4Ndc6H3f2e
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, 11 June 2019 21:52:20 CEST Sven Eckelmann wrote:
[...]
> 	if (!test_sta_flag(sta, WLAN_STA_RATE_CONTROL))
> 		rate_control_rate_init(sta);
> 
>    /* inform drivers about changes */
> 	rate_control_rate_update(local, sband, sta, changed);
> 
> Both will at least cause a call to ath11k_peer_assoc_prepare + 
> ath11k_wmi_send_peer_assoc_cmd but unfortunately the ath11k firmware hangs 
> afterwards.

The fw hang seems to be related to the not set bss_conf.he_support in 
ath11k_mac_vdev_start_restart. This has to be set when ieee80211_join_mesh 
calls ieee80211_vif_use_channel. Otherwise the firmware will set a HT/VHT mode 
in the firmware. Any sta with an higher phy mode will just hang the firmware.

So the two main problems right now are:

* set bss_conf.he_support during mesh_join before 
  ath11k_mac_vdev_start_restart is called

   - no clue what the best approach is

* let ath11k redo the association procedure with he_cap->has_he set to true 
  when wpa_supplicant is in control of the peers.

Kind regards,
	Sven
--nextPart4254098.4Ndc6H3f2e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAl0AuwkACgkQXYcKB8Em
e0YPPxAAnX5qB+eKAtJXohO+ZMzRklrbhMuJUYYQwyXf21xuwNpoQKLPZ5YHBvus
a5Oq5tInf4/potjT9Xwq5NbkN8kotuec9Rt+NaDcsh6z470QyUCrEEO9TjkIs8Fk
xMuSLu/3IHYbRyfD2i4K/ai5VDcAPq6Pjz6yXHnZHz/umQTVRQidjoV72ZSFFvhK
s2ZXLzOPe5PYUgLDh45SwIEuFhMMXW81eqrodc9Y7lTy8F8yra1ZaqrpGCQCIEPo
JVv0q0iFS7KSMsbUM5SuROBZu0TfIVXFqIxfZX8/mQaSu6aK5DJl8v6o0Ci9tUo+
boHDLclvsY3qVsvLe0SGtjxTaMZker1gQPKaXEyzhiBDo5moo6s+jZKogL+xvGlv
JpDexQGBGwohurKjTlPax2djlibdIODfKfZKMNUU+UnOmuBwm+lkV9pTy3oJuGQ1
zMkUrp2hugvT/L3PT/4M1KnpKtJ7kGNfKyj5d0iHwzeFRCSqvEO2iFcovvKmfUM2
pHzpXOaXFRXWFO7jLrl14mOLjj+pxiulf0CxSH6ld/rnmC6ZGsXjn0umGbVwd6fh
H2rUx6PrhqmCLKrTcfojXvSMQLUIF9IzywtGa2cB2Ru0QKW1zPHvOBCj+4sA/4Zl
BYa6ULsi7c0u6ZWf9I0ODgKaXBV80nHBq0c7Qqv7fJXiSaoxI1w=
=Spr6
-----END PGP SIGNATURE-----

--nextPart4254098.4Ndc6H3f2e--





--===============7837656271940229076==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============7837656271940229076==--
