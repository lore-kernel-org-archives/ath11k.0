Return-Path: <SRS0=tQuD=KI=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_ALL,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5F3FC433B4
	for <ath11k@archiver.kernel.org>; Thu, 13 May 2021 06:18:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 242DD613C2
	for <ath11k@archiver.kernel.org>; Thu, 13 May 2021 06:18:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 242DD613C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=narfation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mqh6glu96F2V6iF/IQe2MlUrMIKXNHUUGThgkrFUUUQ=; b=e6+Fdmrx8R+jv1y5WG/W28clv
	Torp9tMR48f6UcahofERctQsEyE1TKI1aI8F9AgAEMq6VGtn8JjwXYOWZJ7EsmzL/96TDcND3W9lG
	97Ilekuc2NCrZXsteVgSMbVR/YB+nXS4XFXfvYrZ4n2IZOlt3+EpcCJ4gBFseUYtcFs6o1KGfsksk
	KVDIo2Fdaun49vH/c35vuHpLjiBpPKqrovF2M77ZV+dzMX/lYcLma8JPsbm9RUrFABNVF3mtIsLpZ
	+JUiJ+4S17PaWPHgD3fLg0h2r1qbDoLPNVALOz/dNlaE+DGsFTICFEFpKIqkC3F8h6+LTiyb6LDqk
	ifDrR1Ntw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lh4gK-004si9-00; Thu, 13 May 2021 06:18:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcNMv-007PKx-RK
 for ath11k@desiato.infradead.org; Fri, 30 Apr 2021 07:15:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=4N87R8hHeys4zB3iQZJH55+DFPxABQ/mPIh4s0AtOjo=; b=pvT6mk9CS09m4jf6txFwdvHa92
 4scbd5tpIC7fJfHl+v0w756aDRitk90b9GjQND7svsey7fmFxDibquGEfkbOAzFQdKeACimNJ+xtS
 9Up5LBFCqaWQZcm3GCkEjHQHsn2LQqJ++q6ilPGUh4iuLKtX51yKvFLsdp/5rtVBXANlOkHrdaYAb
 cmFE2GAinoetBSyU0iQw9aYrKaDAZ4Ix9X0ZeJc83GO9DVuDAXeGf1kq2Un8vgg0hGJvSQHIy3DUB
 Ow+TGYDXBh0GWHSPLvETvPW4V+8vLW86e0ev0k4RvVtGhvGjlRK77jL9C4X/Aa/2Wdg+4B4D9v1Vl
 Q2pu1X8A==;
Received: from dvalin.narfation.org ([213.160.73.56])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcNMt-001C0k-1S
 for ath11k@lists.infradead.org; Fri, 30 Apr 2021 07:15:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1619766913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4N87R8hHeys4zB3iQZJH55+DFPxABQ/mPIh4s0AtOjo=;
 b=QngDDYWITFFfYseCFsKv9KDVtQxqFca7OMmPNeqUlTee4MqVz3KaH3RmJUnRfX3c2dpkXw
 i4VR1MIWagUjITrHmajDkksU0N/e+ociWRjINqYCvx5gbthzCA3WhXvGsTqG1X8GtlYILx
 reyYjazUVHYxDK7A+mJysEYFZblamGY=
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: Re: [PATCH v2 0/3] Add support to configure beacon tx mode
Date: Fri, 30 Apr 2021 09:15:06 +0200
Message-ID: <4581459.tLtf2NohVe@ripper>
In-Reply-To: <1619696874-30072-1-git-send-email-mkenna@codeaurora.org>
References: <1619696874-30072-1-git-send-email-mkenna@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_001519_418876_9F685BFB 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Thu, 13 May 2021 07:18:46 +0100
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
Content-Type: multipart/mixed; boundary="===============3487076928734282125=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

--===============3487076928734282125==
Content-Type: multipart/signed; boundary="nextPart1712661.e4ZrjNOSLu"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart1712661.e4ZrjNOSLu
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: Re: [PATCH v2 0/3] Add support to configure beacon tx mode
Date: Fri, 30 Apr 2021 09:15:06 +0200
Message-ID: <4581459.tLtf2NohVe@ripper>
In-Reply-To: <1619696874-30072-1-git-send-email-mkenna@codeaurora.org>
References: <1619696874-30072-1-git-send-email-mkenna@codeaurora.org>

On Thursday, 29 April 2021 13:47:51 CEST Maharaja Kennadyrajan wrote:
[...]
> Beacons can be sent out in burst(continuously in a single shot
> one after another) or staggered (equally spread out over beacon
> interval) mode.
> 
> V2:
> 	Addressed Johannes's comment on v1 patch.
> 	Updated the commit log.

Still it is advertised as vif setting but the code itself shows that it is a 
phy setting (as you would expect). Or is it a potential feature for a device 
to send some beacons staggered and some beacons as burst?

Kind regards,
	Sven
--nextPart1712661.e4ZrjNOSLu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmCLrnoACgkQXYcKB8Em
e0aEFQ//VpQqXvuo31Uos4tq0mqLv4uulNB+pHArrJ9LhKhtZHCIfckWRFaX/aXJ
VuzXcnCulu2JZ3iWnUpA64nhyL2y0wisEjMOqZxMZiOtcn4IGE8PyjTGZjavoAmg
UXkgdsIic4Lib5Tg1+Zw86ekAfKbTr9I9GYu1AA/LCTpYqZHzpQw/ABsbDvwYYsW
QHO43K7SLf1um3Rh9CYu21j9tZm8l/nU+8exb4X2LkZttcXihM89m7LbpxW7CaOi
lx89eR5rZ7/ZTFeBieD61EFJNNQbnAwVeNknNaJPoqYKEqVvskh6WfxPXKUywQ4m
I4EfEdX1RUXs80Lnynxp1DN/KC47ZX72bAxETYdqLyKtHdxUys6K9ThCr6kJ7E2B
fWPNAqExDL34mL2DCAEWTj4HZ981aUi1FEVCB5m+iMRM0ntgbZZvrBsiNpPu6R5o
BpBtf4J0yGWykjY10TymjFmUF/UJDGJ/hH9tkBoxHXF+M0J3WEEV086mdKN6zm7s
MKxIzeRCX43KN9FvKMvPIEOvAOH8+8YiyoO92t+QeNzG8jYd7FDfrbX7HniCdcFQ
408DMnA3cthWy23v69LdtU+3G27cm/lPUO8NO+7dXkM1a4swgiVuGaGSEQXORn76
gqbtYnOZYhNowx2EXnAUq3qm3Yu1LXNZSSrD2oHqhT0JeKb9MvE=
=v8x9
-----END PGP SIGNATURE-----

--nextPart1712661.e4ZrjNOSLu--





--===============3487076928734282125==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============3487076928734282125==--




