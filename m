Return-Path: <SRS0=ph7s=NG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_ALL,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB80C4338F
	for <ath11k@archiver.kernel.org>; Sun, 15 Aug 2021 15:30:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21B9F6120E
	for <ath11k@archiver.kernel.org>; Sun, 15 Aug 2021 15:30:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 21B9F6120E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=narfation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/mewFLhOXZPJWJeytgGNgEpiB/nAyOAsSxogX2FRxCY=; b=TUHj0BO0IQKjlH5Lu+goDEh6I/
	t13pWlll9gFleHaifri3ba+ZuUPVHcM8LY2HjDJEUeWPjPOPjtt19QtlKKHEFsrAVBOO+cLJBW/Uj
	1mPVxS9og60zB/mb1/Zy8rpG7rI5bhIDxocVjENUb7lsQt3xKZ8Aw5hU+nMtisNg8oJ2v0OvCbtDU
	TkD3CUGjkeIz0coJJyrFyPXFEtLGcoWDjaLHaIBnTwGHiCN78P3719uwEuqohskvegFoV9KiQfKTX
	4sv4AEiGC44Bj7eZemJHuht0YIHxq3rEJgOB0Cpz8a8KpkcX5+imTsgk3tF9ZDBxBVShF52/rDiyp
	LTNsdsBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFI5h-00FTCs-KE; Sun, 15 Aug 2021 15:30:25 +0000
Received: from dvalin.narfation.org ([213.160.73.56])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDPN6-003ZI2-HJ
 for ath11k@lists.infradead.org; Tue, 10 Aug 2021 10:52:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1628592748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vaByksnZU0SJEQddb5aLty6JxOjM7E9gHuqnSrHVxIY=;
 b=va2OkbaZUnybNsNJgvbLYD6cyhKkKOenUxtS/vyUWXreNV2RJQ5Uz+K4jd8sK5w2GJW138
 bLe8K9FYsQwPzplzFAuag5neDaa9pFNvVHE8Gihake6iWxieHc2Vu4aFnd6dLsGDr3rA8j
 cN8+VgDKdJCCxLI8jmbnHYmcxeTYyUY=
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: Re: [PATCH v5 1/3] nl80211: Add support for beacon tx mode
Date: Tue, 10 Aug 2021 12:52:20 +0200
Message-ID: <6210385.n8AMQ0p90U@ripper>
In-Reply-To: <1628585783-21139-2-git-send-email-mkenna@codeaurora.org>
References: <1628585783-21139-1-git-send-email-mkenna@codeaurora.org>
 <1628585783-21139-2-git-send-email-mkenna@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_035236_942272_138B6B6E 
X-CRM114-Status: UNSURE (   6.94  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Sun, 15 Aug 2021 08:30:24 -0700
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
Content-Type: multipart/mixed; boundary="===============8483793634156823257=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

--===============8483793634156823257==
Content-Type: multipart/signed; boundary="nextPart6500757.dMg44LP4KO"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart6500757.dMg44LP4KO
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: Re: [PATCH v5 1/3] nl80211: Add support for beacon tx mode
Date: Tue, 10 Aug 2021 12:52:20 +0200
Message-ID: <6210385.n8AMQ0p90U@ripper>
In-Reply-To: <1628585783-21139-2-git-send-email-mkenna@codeaurora.org>
References: <1628585783-21139-1-git-send-email-mkenna@codeaurora.org> <1628585783-21139-2-git-send-email-mkenna@codeaurora.org>

On Tuesday, 10 August 2021 10:56:21 CEST Maharaja Kennadyrajan wrote:
> 1. Staggered mode and 2. Burst mode while bring-up the AP
> or MESH.

Why when you bring up mesh or AP when it is actually a global setting for this 
radio/PHY?


Kind regards,
	Sven
--nextPart6500757.dMg44LP4KO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmESWmQACgkQXYcKB8Em
e0ZVNhAAzEL7jFJRhuGh9GrlP6Jrf8AdcQ+Loy1Pg3u6f4QtRmPvUtYyuh49dqXJ
PA5Qheatm8hWbKRnvMLbJSwz6eZoN23R4bacKh0Zf3hpnyw3t5Z2VzLuEcqT1VYA
N8X1sMQgqiFtUAsd+B3XXgJW+MIf73IY1/iQ3BNpoVJNCT6+rsCC+Nuc9/kQ7vzN
U0X3/f4llpaaWoJqXuCOQwEMeEBU7VzMeliYki7qaecUYV09wx6Y5iDB4FN9BzBC
7e32l7rQ/HIK4Ddr3g4/pUz1st3+2gJdVPcufS4KMMbremWw4nqSy4/cEqPMuZ2y
vguzy+98Z7vJi2iFFP0o5GYYjDcE0Qn3e85bxoyj4jlNtZg5THufIty6LH+NB7do
YPYd8xja/9DhlmbIbJf0rTRg70xSpbpf8fG+8nodxwPHnfdntj1aZkdWomzSIhVT
txYkEFHbd/O7pAYZ2dHSmLYyDVFlclJonIPNrPq3aP687xagDSFt+i0vt2iRMl83
zVM0lwIDZsyl1Z6MO53xcHQ3bFJOsf1ovzUm/roZ4cuxjPFhw9HWRXb6tQ3u0BFV
uf1SBsGNBA6Ep1//suXx8+Qp1bxDWAthXouAsQyV44aX+ppR7nIaDh6KhUzep5q4
K3VavYf3/cvOgDiHFuGgIyBYL3VmgYWHiGyaz/Bvh/xn1UJU/M8=
=OsUH
-----END PGP SIGNATURE-----

--nextPart6500757.dMg44LP4KO--





--===============8483793634156823257==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============8483793634156823257==--




