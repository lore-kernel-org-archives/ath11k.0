Return-Path: <SRS0=wXcr=JT=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_ALL,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A2D7C433ED
	for <ath11k@archiver.kernel.org>; Thu, 22 Apr 2021 14:00:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60D07613C8
	for <ath11k@archiver.kernel.org>; Thu, 22 Apr 2021 14:00:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60D07613C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=narfation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=zytz9poUW+vw8q+sqDqLYvu8p2KsCTAEneyGTf4gKwA=; b=GrP
	GG6opfHhONdtMh+LB1EQzE7RURFVaLNWTY1jn/kHCvWkYIaK45mMQNsFLRjA+wMyaJBH/1x7DVBO6
	VVRg4sLQbhIxt1k7OUmiq1mVxx7YzZvigZuq+2PfJV5n7oBlR4FYsVyGu6XwHUWgE7LKbGh9CgMu0
	+x2WSAAJz4ImlEi8Jw/I6mftHNsEiFeguOlHr4Z3yha2FhlMvR3o6a9YVVLc41fBGEeY1XmpYS2Mk
	3zurbRObmVh1n9j/7akcfoJZZ2+6i4KGBECBWcoCxoa87IFqyJqNKAOHOO90O+tyWGMMCe6RNX5KV
	GLj9F052s7/JAtfWSfLGd82Bz703/0g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZZsa-00GqQl-Lb; Thu, 22 Apr 2021 14:00:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZH7f-00EvbQ-V0; Wed, 21 Apr 2021 17:58:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=FK9hCB1qSvp764+HNpPPNyfTo/MJos7VQXdYDeP7mM8=; b=lc9FbocnkqipyuVKecZarKuXf+
 EOhcy3AXqLDl9nucwsMuG7ho4ELI9Z41V/nFARuWahM5ua9IZDqoufCURt9UemBbPaxXJoJrNDcSf
 Pcwl46TttktosK4hKzDze0BYx1vbgHujKXBf24utN+5819i4p2ss/izM9xiH0cTcgGUA71KRI4g41
 lyapkp3Pxxt7lBv2mcF4RFkk2HK0GYYTGtt3cnlggJjmFF6YvWjvQqQh/4UEUMohNEdVEAaQmscQt
 4U1VS3gqpZLK5eEMOdSmJsxQynEo/yUlF1kZ8iwhHUliMij9x9Awrxm4bNjlSe+TYCnIkO1alcaV0
 ZS600JAg==;
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZH7c-00D5Jd-TH; Wed, 21 Apr 2021 17:58:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1619027919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=FK9hCB1qSvp764+HNpPPNyfTo/MJos7VQXdYDeP7mM8=;
 b=gw+QjwJz2tLfjfIZoNPr/NrsOpOH1OU1lO8CVG+tR6ujJ6Asyu86wMip4pXoiBFlRRcV0M
 qyyYGLNFpgujWk6PHr0nssltf2mEA2PRWpt4KymDdL+/kXh/x+6enudU7mK5PJZ62lJUIn
 3eOe1S9M8cSxHH7rDici4XmDam8WPB8=
From: Sven Eckelmann <sven@narfation.org>
To: hostap@lists.infradead.org
Cc: ath11k@lists.infradead.org
Subject: hostapd: config_reload: Switch from WPA to open leaves keys
Date: Wed, 21 Apr 2021 19:58:32 +0200
Message-ID: <7827540.TDG2QzLjjR@ripper>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_105845_280285_F50510C0 
X-CRM114-Status: GOOD (  14.12  )
X-Mailman-Approved-At: Thu, 22 Apr 2021 15:00:27 +0100
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0025835813974401310=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

--===============0025835813974401310==
Content-Type: multipart/signed; boundary="nextPart5607402.45CjJggNyN"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart5607402.45CjJggNyN
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: hostap@lists.infradead.org
Cc: ath11k@lists.infradead.org
Subject: hostapd: config_reload: Switch from WPA to open leaves keys
Date: Wed, 21 Apr 2021 19:58:32 +0200
Message-ID: <7827540.TDG2QzLjjR@ripper>

Hi,

it was noticed that the hostapd runtime switch (config reload) from an AP 
config with a WPA2 PSK to an open AP created a non-working AP interface. The 
driver was ath11k in this case and the client just connected to the open AP 
and tried a link local IPv6 (ping ff02::1%wlan0). The AP could receive the 
unencrypted data but the AP was unable to send back unencrypted (solicitation) 
packets - the multicast data packets were still encrypted

I could see that following happened when changing from PSK to PSK:

* nl80211_new_key
* ...
* ath11k_install_key (DISABLE_KEY)
* ath11k_install_key (SET_KEY)

Nothing like this happened when switching from PSK to Open. It is still 
possible to see the old key in /sys/kernel/debug/ieee80211/phy1/keys/0/

An investigation showed that the relevant code to delete this information from 
the kernel is #ifdef'ed out in hostapd (CONFIG_WEP was not in my config) since 
commit 200c7693c9a1 ("Make WEP functionality an optional build parameter").

If I enable it again then I can see that the key is removed correctly by 
hostapd_broadcast_wep_clear -> hostapd_broadcast_key_clear_iface.

This also triggers the removal in ath11k but it afterwards still not able to 
transmit data to the client because it still encrypts mcast frames. I haven't 
checked this part in detail but at least the re-enabling of this code path
fixed it for ath10k. For ath11k, I still have to restart the whole vif or
otherwise I will only see encrypted multicast frames from the AP (and no 
unicast).

Kind regards,
	Sven




--nextPart5607402.45CjJggNyN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmCAZ8gACgkQXYcKB8Em
e0YjjA/7BGsMgMxmERiprihrc4fHyXjZkmJJXiSEN/lihP4bv3SyGartcSzK2EW6
++k5Zy6UNjahrCsw5dnYcSUVclsjYp55mjtxekDabT2HqdtYn3i3MLj5iB3IK6FJ
oWQ7RH2Q+/1rw//a+6veufuyC7PNQQWWsKjcKLn6J1BaxDP175lVqQW0VN/W69Tw
0E+C7EctmalMQFo7vDEAILPZ/NSD8B6Oi6zApKGdVX2DfyqUCZxEKMg1/HSXs7Fo
hPFwCk9ja8F2dpYtRjdEOfGcAZR1pRV51vNc3isdk/nrAyP5yJIy1TlaDPojMz+E
hItv5IPbDdT4yLSxL+4+ewMGSMF6gtjWmdBsaBpGMD3K1YxPg1MV4S/xF0BejQOr
ZC9528Mh1c/OuiR6r/JFSjCsVuwMNPic51f+K1SG2nOXUm7zfKdTSXd8GH7uqVTx
qaWiTmWQwa6rGOuIeThBN3qgg+vkify5OLuILeX4lODU3qKKEc6uGaVEhJGuzfrI
yQlREXWPPPvGQMwpKjpdc/tdIYc6Av5AzrdpuJ00QOXsrmyW9AKBxonr1ZouPfe6
K9NTmsDCvC//bn/c/CPg+r253YUebSOrjr2gKPMzVKqsY+iwpuoX+xkA5Xh+GX6F
D35qT1JDu1HOirho8bNJT3Af1PT6AWgverqaTvIS6ltA69wt8tE=
=1Bd6
-----END PGP SIGNATURE-----

--nextPart5607402.45CjJggNyN--





--===============0025835813974401310==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============0025835813974401310==--




