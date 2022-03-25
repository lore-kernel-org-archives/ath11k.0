Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE417C433EF
	for <ath11k@archiver.kernel.org>; Fri, 25 Mar 2022 07:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C2rQN8nXDNdv/AtYOJevuIsDcSbDQgEVG6XhV1rUwUk=; b=e6N1DF3KP11AkRHtThO53yyq+O
	eTZD1FehhQ4g2pLl7CfSSp22r8YeR6yqp/+54YuLojTNbIQc9CTSHq+vV8IW33hkNdpN/5absS/Ym
	O/7aLWqWU18bHIW8TA0518rIMeJ7h7hh+lW5cS88xj+YCjtiRil4umvoyP34YTr3+/XGpDU8U1Ckd
	HKSQ6gJta8E3YRx6Wc/efaO6/luyPOBnvAyj0V5vddtNwqqlt8CKx22qzAOl7PUu8QiRpPswxU6Az
	HHJ57va7XaT+tpV4R3waNtqJjsVKOI6H56B3D4Nx3wkhIbLIwe7/2mJYAN2FQgPjN4KVwqCMWc8q4
	Hh5Tp5VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXeL1-001L2Y-Co; Fri, 25 Mar 2022 07:26:23 +0000
Received: from dvalin.narfation.org ([213.160.73.56])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXeKy-001L1z-Cf
 for ath11k@lists.infradead.org; Fri, 25 Mar 2022 07:26:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1648193175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+y0EoZNvS8wlq8z+BSVtPdl9tjxgILVz0c89RdWlznc=;
 b=nC6zIy1roWwhMJQhK3evmQhPndU3CieItULRFtT5quihhfnCzCdL8RqEYwHFTAds/qOhUO
 i3SoUBrNIrsEVUjM/D0v7IGHn26vx9h/OhHbITUKB89hdjEBmf9r49JY0w0h6xFDBQv5FR
 TW6kVIB9Z1hCbci0Z09FHFJ96Ze9oRI=
From: Sven Eckelmann <sven@narfation.org>
To: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH v5 1/3] nl80211: Add support for beacon tx mode
Date: Fri, 25 Mar 2022 08:26:10 +0100
Message-ID: <4594028.WNQrFERZ9z@ripper>
In-Reply-To: <3c54fa579046082c6dc30286ab291936@codeaurora.org>
References: <1628585783-21139-1-git-send-email-mkenna@codeaurora.org>
 <6210385.n8AMQ0p90U@ripper> <3c54fa579046082c6dc30286ab291936@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_002620_786403_D323452E 
X-CRM114-Status: UNSURE (   7.05  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============6698706919941621369=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

--===============6698706919941621369==
Content-Type: multipart/signed; boundary="nextPart1758225.uXCZi3jzxr"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart1758225.uXCZi3jzxr
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH v5 1/3] nl80211: Add support for beacon tx mode
Date: Fri, 25 Mar 2022 08:26:10 +0100
Message-ID: <4594028.WNQrFERZ9z@ripper>
In-Reply-To: <3c54fa579046082c6dc30286ab291936@codeaurora.org>
References: <1628585783-21139-1-git-send-email-mkenna@codeaurora.org> <6210385.n8AMQ0p90U@ripper> <3c54fa579046082c6dc30286ab291936@codeaurora.org>

On Thursday, 24 March 2022 19:10:20 CET Maharaja Kennadyrajan wrote:
> [Maha]: yes, it is radio/PHY setting only and it is supported for AP and 
> MESH mode now.

But why are you setting it by vif when it is actually a PHY setting?

Kind regards,
	Sven
--nextPart1758225.uXCZi3jzxr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmI9bpIACgkQXYcKB8Em
e0amsw//XVFMI3zFPPfBdQNhZu2vXOzUJUQ+WnSE6gqmNY1WmPs41tV4bTZkWuqS
6nba7dXnviTrASs4QOGfNvhlaEGxucAt1E/eaEEhyPTtioX4IMSdII8dfaFIv/yE
vWLlOUR17muCHWJ+eRBMSJX2WJnIP5A4lWhuTNwkqLLhlIXhZQpwDOAryruFQ7Gq
foOvEw+eUtFXVOq/YsrSMZwzMHX3qOPY8segup1lsAYFfTUgK48e+Wj4LOmUND2i
zGGPHK6CAp10oF8ISzKMq+ERF3gsDlxdnvfuxc6RbDLKS6kkbE6nfU84fX8ZXZt5
Z/gNlEUQCFKCFxWC6jkM9qhR+9q8wg748etPqSq+ov4vPrFaMWUhMh545a+bLVsi
CCnckQMrWfPNv9WxwyYMjrtQS7huq1F41DEoXPCu4IoGF5Eb9TKwZyw1m1HKjm/5
wLW/E+CCfgHnsTFvs9paTh80AKqoIbesGO1OxTyKgeInZ9oqbmNMQhSE4xprBW44
TP5OoPxBTR+Y+Y5OKTkuW2sYRCqGc9yCEFUGa0vFBKdY0idXXhgi6AJgOzQVhm8m
7XxP18PPRYCXcWoM+QoeqmddxNDdZfk6YBg22mVGSUfavPWHiB4PKtXiD4uMGcuV
R6O2i8ddIE4r3lx3UVb0X1YMrh9j88uUIO3Q/Z1werxKw6T1vBc=
=Ee0X
-----END PGP SIGNATURE-----

--nextPart1758225.uXCZi3jzxr--





--===============6698706919941621369==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============6698706919941621369==--




