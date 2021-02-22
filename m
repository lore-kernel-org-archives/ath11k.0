Return-Path: <SRS0=2HMb=HY=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_ALL,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1055FC433E0
	for <ath11k@archiver.kernel.org>; Mon, 22 Feb 2021 19:26:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBDA064E12
	for <ath11k@archiver.kernel.org>; Mon, 22 Feb 2021 19:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBDA064E12
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=narfation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=x5D1InMEimIzl+7+xbKoY2IQuvbA4AVQX4GNzMmSbxU=; b=2vW1CtuNxwTzcPy3PODvIhewd
	l0ua9ldTj9TTGrxPGoSszvQ2MOG2YE599THU3vdg5+uosCmIZPlMTC711ZRxEANE5YZFQwj3hRjgr
	xR8egUBPJr+ezxzlqLD3CgHd4eIXFA67Nqp2EFaD7rj+Rb0QO3FhdcFgBgSS5fTWmSaeV0tuZX+fa
	4CYt0KNGjZ4JAcmTKBpca3CkgIp3c0qs1KjYxPzuqdWs7KAn9ovRUujywHuRO47sXAuL7Y/tXRUN/
	qqH9Kx4ynatFHig2sByheiVNRs89VYuqXCDBh58VeCoppJjP+0svzSn013sLeT3/lfGY3tKZCn4Cg
	Dg1SHf9Jw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEGqr-0001ET-J0; Mon, 22 Feb 2021 19:26:38 +0000
Received: from dvalin.narfation.org ([213.160.73.56])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lE8WG-000082-SO
 for ath11k@lists.infradead.org; Mon, 22 Feb 2021 10:32:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1613989966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RglH45pRougffSqyZRP1V3JRlYZ4dB4gDEVVU9O4+iM=;
 b=0gCgaWoWJjTc3wXul9RJ8DSUdlMySwMY/RV5q2L3llnZ93QCJIARTCbHqjKf6yKImwVQjv
 jg5I8LOVFkJ8a75H0jgr9kB628sh+ADeImcaRS9rkeMD9M0rEKT/srzuGyeP99uQ6Ow0XL
 UIppfF030HFQ+HlsQj0MHxLCROdGGik=
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: Re: [PATCH 1/3] nl80211: Add support for beacon tx mode
Date: Mon, 22 Feb 2021 11:32:43 +0100
Message-ID: <2718995.X0rUDs3ZmB@ripper>
In-Reply-To: <1613988573-10839-2-git-send-email-mkenna@codeaurora.org>
References: <1613988573-10839-1-git-send-email-mkenna@codeaurora.org>
 <1613988573-10839-2-git-send-email-mkenna@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_053249_261902_D472A2D0 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 22 Feb 2021 14:26:36 -0500
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Content-Type: multipart/mixed; boundary="===============2565928843249656890=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

--===============2565928843249656890==
Content-Type: multipart/signed; boundary="nextPart3417114.ojRXWDtZ2E"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3417114.ojRXWDtZ2E
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, Maharaja Kennadyrajan <mkenna@codeaurora.org>
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: Re: [PATCH 1/3] nl80211: Add support for beacon tx mode
Date: Mon, 22 Feb 2021 11:32:43 +0100
Message-ID: <2718995.X0rUDs3ZmB@ripper>
In-Reply-To: <1613988573-10839-2-git-send-email-mkenna@codeaurora.org>
References: <1613988573-10839-1-git-send-email-mkenna@codeaurora.org> <1613988573-10839-2-git-send-email-mkenna@codeaurora.org>

On Monday, 22 February 2021 11:09:31 CET Maharaja Kennadyrajan wrote:
> User can configure the beacon tx mode while bring-up the AP
> or MESH. Hence, added the support in the nl80211/cfg80211
> layer to honour the beacon tx mode configuration and pass
> this value to the driver.

There is not a definition what this actually means. But I am guessing that you 
are mean the way the HW sends our the beacons for a multivif (beaconing) 
setup. And in this case, it is a per "phy" setting and not a per AP/meshpoint 
setting, right?

Kind regards,
	Sven
--nextPart3417114.ojRXWDtZ2E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmAziEsACgkQXYcKB8Em
e0ZQTxAAtiTmU3DFj/tOFyPxV9hZjvEjOkxWpqeVy6RHr0kwYcaoFUbTGOjkbqhQ
1dSmGXPze3L0cN7+hC9ZMhY8t7PZlJJ45roFFfnyq4FEmNIkDkb3ZYH9H+d4oq1H
D0AjvMSSx9yh+t9abzYQ+DcoEcmTa1oT6++XS9sDTzGP3hhA9/4pPxx49KF+XNUN
7L97eNbzIYI/A4aVkglI9hildlP0HtxNvufItM4uN1B0ap2bmfrT1N0RLaggcgpK
o9Z9nuGH0LZEpjs1J+qUgp15UhcQwfasFQ/vrow5lluIx0zUqy+6EUc0MXgNimN1
mzjg0jfCt8sbBfb6lGaWWJZzsGY11eVs3r65L36prSy1INLLlfP/NGwWDotP0uAK
xpWUWjA7rr831iufT3qwrJrLrumpAFM57EXhu/cPBOnfI1a7Nmvsiqo8157PnOrx
L1/VtL5b2gAcEOPGab3W/YCCOmg6GRyrZIa8L6PiSDFKNLNKnECmBmDeD2Gq7RI3
dSzX9Su9IrYCsAdO9RuFmRtNCWzusMQxo0jXnwpsDU0drQ8yk0iJlQ/K6r5m3nXP
c29xVsZvLFsUK1FqlAcddM/M+mZVDVpoxC6MjvlR3nABDfUIFo068NbXRGCrUq4p
njLGrX40P3HaUnmlcRSDtTxkyIfw8ZwJCnhB9sjS33UBsU5yI2Q=
=eyjT
-----END PGP SIGNATURE-----

--nextPart3417114.ojRXWDtZ2E--





--===============2565928843249656890==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============2565928843249656890==--




