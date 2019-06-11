Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-delivery-195.mimecast.com ([216.205.24.195])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hamor-0005E7-Oz
 for ath11k@lists.infradead.org; Tue, 11 Jun 2019 19:52:35 +0000
Received: by mail-qk1-f200.google.com with SMTP id c207so8487702qkb.11
 for <ath11k@lists.infradead.org>; Tue, 11 Jun 2019 12:52:28 -0700 (PDT)
From: Sven Eckelmann <seckelmann@datto.com>
Subject: Re: [RFC PATCH v2 3/3] ath11k: register HE mesh capabilities
Date: Tue, 11 Jun 2019 21:52:20 +0200
Message-ID: <1919330.hVZVHELXip@bentobox>
In-Reply-To: <20190611180247.19524-4-sven@narfation.org>
References: <20190611180247.19524-1-sven@narfation.org>
 <20190611180247.19524-4-sven@narfation.org>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1120965589955155428=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org
Cc: Bob Copeland <me@bobcopeland.com>, linux-wireless@vger.kernel.org

--===============1120965589955155428==
Content-Type: multipart/signed; boundary="nextPart6218786.OGWznZaXkY"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart6218786.OGWznZaXkY
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, 11 June 2019 20:02:47 CEST Sven Eckelmann wrote:
[...]
> ---
> This doesn't work currently as expected. No HE rates are used between
> the two HE mesh peers:
[...]

There seems to be also an ordering problem. ath11k_peer_assoc_h_he is only 
called before ieee80211_he_cap_ie_to_sta_he_cap is called. So ath11k_bss_assoc 
will not have the information whether the remote has HE support or not.

Looks like I have adjust mesh_sta_info_init to get this somehow to 
ath11k_peer_assoc_h_he. Maybe through ath11k_sta_rc_update but this is not 
called by mesh_sta_info_init at the moment. Just because 
rate_control_rate_init is called and not rate_control_rate_update.

The easiest method seems to adjust the check at the end of mesh_sta_info_init 
to 

	if (!test_sta_flag(sta, WLAN_STA_RATE_CONTROL) &&
	    !ieee80211_hw_check(&local->hw, HAS_RATE_CONTROL)) {
		rate_control_rate_init(sta);
	} else {
		rate_control_rate_update(local, sband, sta, changed);
	}

and to create a IEEE80211_RC_SUPP_RATES_CHANGED change when the has_he state 
changes. And yes, I know that Bob Copeland added this because it would have 
crashed ath10k when rate_control_rate_init is not used [1]. The other 
suggestion would be:

	if (!test_sta_flag(sta, WLAN_STA_RATE_CONTROL))
		rate_control_rate_init(sta);

   /* inform drivers about changes */
	rate_control_rate_update(local, sband, sta, changed);

Both will at least cause a call to ath11k_peer_assoc_prepare + 
ath11k_wmi_send_peer_assoc_cmd but unfortunately the ath11k firmware hangs 
afterwards.

Kind regards,
	Sven

[1] https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=1d6741d86429a294f51f2773c751c8f7662e7ca2
--nextPart6218786.OGWznZaXkY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAl0ABnQACgkQXYcKB8Em
e0ZDTw//VlKtfZHuBBaQ9jy4c8svQ6EuOrANQe2WjL6YL7w24GFcLah7Azlmlu8n
E+KxhIdstajByPKIkS0i6ovW0GHBi+UpoP+dJ+Kt69sikzRVL+tkKRZOdSgm8XV8
g+/wErjwHUz5IQZ0rvyS5TPwcwZeo6zlEMqG384o8ip+AMqUBptWQKIdylTdvJqC
2UAWzuog24z96hgD3zRs5pzDypRZMfvTPgpsJzeKxnomTSJzDZk6orRjxdrxB3QR
1Jvj+cQ3tXrSs4l6Tp8HG01iKMg/4iPA0M8up/xlYWlOnKYoP/xhrJJUf1jpLcHo
Q2TKhGtHBG1TZEvNdiihYj8bFRCRrXLvcXLYODa0u4Hs2dMfSi30IEKb9zwY4zfE
ZjBWGIWcEvv+s/vsBNxZjiGXsyWbY5u++etea4OPx2Y3x/IrwzBRNSOQBqtLa7Ul
szRM+a4LdAJ+uIGXYs+9dM5OqGA0JR3SnwCxth3NRaYe9OExVAEZUNruL910lz+H
Rq7p+T/SRfSBWGRUaFo0iKPopJ1ICJ4bRFxRUnQuV3MZxpzpEcNPCzJ3MERTNGzt
+PD7ywI/1vWUKb9Upkel2lKp0g6/76BSROuwai1vMbE91E1WAIrBKMzhqqaGQyfC
xDstiRGa7SZSey20ElA7Dti6agub73tGfi5dRlVjtaR4oy1kG8w=
=pPAK
-----END PGP SIGNATURE-----

--nextPart6218786.OGWznZaXkY--





--===============1120965589955155428==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============1120965589955155428==--
