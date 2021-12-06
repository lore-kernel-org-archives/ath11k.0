Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD590C433FE
	for <ath11k@archiver.kernel.org>; Tue,  7 Dec 2021 09:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pMx5oFilV6V1Qmsie2GxNPG1+GZZmsPAD9wxki59CIk=; b=hGVYdFaxqKk4HYz8c35/Rkfwhg
	Lx7ZD0vrXw6SARrUT5kEFhLofxxBfTf8JEXbgkk6sifyrSOiIfGM0vuccorYqEuiaPbGDUSlux5An
	3uIpvQYaW6Zmbbo6Q+dIw3sCXtSRShZA0cnuzAsPdo7X3mGKj19ppmeBMbTFS0QGRv7cAb1hueyIt
	tGgh29XzqXLmP97QgIXTdgz6TFq/AH7LQ7q/UZ/Qo7c0akorTJie7mwArjo4scJ+MzQBeNXZqgmiT
	lQFWEGqK2ptO5aeM6ZE7FqSE8ZpoozI8e2lahSHSizVczJHat2O0yj6qbnVIDHJ6TeD5LTqtLi/EV
	YuRgCJZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muWSJ-007iBD-PH; Tue, 07 Dec 2021 09:08:11 +0000
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mu7vB-002ida-Sa
 for ath11k@lists.infradead.org; Mon, 06 Dec 2021 06:56:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1638773776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pv8TB+g588DsnRCeOefbPFBHB+8AgUI3a/uGs3NBbgI=;
 b=DU5yfbpKJd0GFi5j+ONXubahVsZsCyY3m+agwScwy8rSeoR8+EYzoFSYen7KAdvqAfCWL5
 1iUdHkBgeDUqsc/toKJ9mGMM5tqtoTRBpyMZ6Swe20X/78ynnzBgDRqxFk+K/yvk8DNrR/
 1uuWoovjCq5SEKQ2vYAz83gBlmxk2b8=
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org, Wen Gong <quic_wgong@quicinc.com>
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH] ath11k: enable IEEE80211_HW_SINGLE_SCAN_ON_ALL_BANDS for
 WCN6855
Date: Mon, 06 Dec 2021 07:56:11 +0100
Message-ID: <7418334.kqliQQpNxi@ripper>
In-Reply-To: <7318ffac-f5ec-4c1b-3e80-c816bdb28a79@quicinc.com>
References: <20211129101309.2931-1-quic_wgong@quicinc.com>
 <1854698.r8H18GsEis@ripper>
 <7318ffac-f5ec-4c1b-3e80-c816bdb28a79@quicinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211205_225622_174761_F8274F46 
X-CRM114-Status: UNSURE (   9.50  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Tue, 07 Dec 2021 01:08:01 -0800
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
Content-Type: multipart/mixed; boundary="===============9127845996649053436=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

--===============9127845996649053436==
Content-Type: multipart/signed; boundary="nextPart6005903.RJP74QPFIO"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart6005903.RJP74QPFIO
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org, Wen Gong <quic_wgong@quicinc.com>
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH] ath11k: enable IEEE80211_HW_SINGLE_SCAN_ON_ALL_BANDS for WCN6855
Date: Mon, 06 Dec 2021 07:56:11 +0100
Message-ID: <7418334.kqliQQpNxi@ripper>
In-Reply-To: <7318ffac-f5ec-4c1b-3e80-c816bdb28a79@quicinc.com>
References: <20211129101309.2931-1-quic_wgong@quicinc.com> <1854698.r8H18GsEis@ripper> <7318ffac-f5ec-4c1b-3e80-c816bdb28a79@quicinc.com>

On Monday, 6 December 2021 04:29:39 CET Wen Gong wrote:
[...]
> I did test in my setup, not see the crash.
> 
> I am afraid you also need this patch("ath11k: change to use dynamic 
> memory for channel list of scan",
> 
> https://patchwork.kernel.org/project/linux-wireless/patch/20211129110939.15711-1-quic_wgong@quicinc.com 
> )
> 
> Could you apply this patch and try again?

Tried it and I see the same problem.

Kind regards,
	Sven
--nextPart6005903.RJP74QPFIO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmGttAsACgkQXYcKB8Em
e0ZZSA//WgYpkZW20C/AjhjDjbPmw9hGD93VZxE4PwscESBViXDLXTCCFMqB+jJt
x5sjOPQfIg6hXEkfIIUtW8tQi87/kmVh+LtLFZmnw/4yoYJjZoC17X8UQPjXGpXL
EMvrvi2N1hyY8K3H5Ke7AFsfYe7CdkcOGPkfbH/LZRD74Zw1ZB68ddkCHfLLeLDJ
WClfy25kzqU3sTTa7kCpMgs/QiYvOIhGPLBpNdhOKUmFSL9yrSeE5C2BRp7vkfh1
cu0WNjC4gWGn5h0zbYeZbUkzpSGB1THkLAMXCKX6/UEPXLFKkZ1kP/bCa9u/lduR
snFMov44SE+YGDssKdoxw9rZM5XlGb9+rwNSQu46vyY63XX/28Zc8ijvh+gWxUO5
kLvOsJBxrAWNAgD/gVn4uZmIYMb2dOggMXyESzJBjKv/XK4vpqrNbI+/eEWtzyUy
tBP3IV5VW3O/5/8qBxYIlBNO29TW0MDdWEUkPZlZJvAgqA4/rlXft8kdlOBVPgmi
dwVQ+yZ9c+10lqgD8UBO6nk+3Nfep5SdHR0SkVktH/E7/NA3khrAk694xgSibTpb
qWj7TEKoUIg9RbC22b/WeSWzPmuiM4j7lEA/g6M91WLkEeNkysdy2v+xb7/pVKFD
jQ+rRR28z+nsF6eNPZwKsM5z1ZRfREmgGUT7EsJibGAb3ihz/2M=
=LrIj
-----END PGP SIGNATURE-----

--nextPart6005903.RJP74QPFIO--





--===============9127845996649053436==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============9127845996649053436==--




