Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC16C7EE2E
	for <ath11k@archiver.kernel.org>; Fri,  9 Jun 2023 15:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R9b+f+aoFWDAlxVOSfgv6J0Wo3yo705SIQhtd6qoDPM=; b=UIjvJuxnQFG3d98aaM3zK0/Ul7
	Gk4EhxdVoCwRrnSXjKHnuMTg3elwPLAhYWMpEgSR4WHvbixz8gAdWLwlYeKbw8rQ3SToDO95+nCdU
	FNj6RO7mKRS7pJHMnMdMHwc9ZHchZLNjgQXAMZfoodusJgHxv8MTfR043pyXPIQcFMYt7yaUrCbyR
	MWlon/aZKoDW7vgpjpE36paB5RPgo1UA98ktY0uYKchXEOM2E57RlVMD31GjQUVCG5fyHrOyN7Gfm
	qsjUYfYQghWIR4Olc5KbzHlUT4k2ihgujxhHteGs1qClCWHUWk5/FwqhbwK5J4YySk8xRbgulbWSM
	9g/uN4Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7eN7-00DVfr-0c;
	Fri, 09 Jun 2023 15:49:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7eN4-00DVee-0h
	for ath11k@lists.infradead.org;
	Fri, 09 Jun 2023 15:49:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 549E965969;
	Fri,  9 Jun 2023 15:49:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 053D2C433D2;
	Fri,  9 Jun 2023 15:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686325788;
	bh=VujHTb3Jst7P7AKBSUf6SEnI2gqNIkp0cYDL1jRQ5Uw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VWXiQoWUZrbEzGfv1didX1XWnGpeFeM3Z0E5xFzq1wZBaoT+OTdszCqjUwy0vmHzA
	 X/7EPPA2WhjAo3F3jVs4bVDMkDHGijdyvrla3eg+6VFKx6NOtifHDjTLZ+ygZaxcpp
	 Ca8sGBOFBEoK2g5OG66BiWNwPKQM/z0CikQQvwqFbgL2nGGf/sGRdSjTy+bqT3iLOD
	 7WMHt+XsklMQxtJCVebXjk07aKWzN3RADgbrC/gOV0KkoVn3jrhAcnnmolSu2uRnI9
	 HrMbHmE6SyFeoiplswxjwGxg70IF2hXNATe6aE4Mbr9UEsrIzUWBwXu/HLL04U2oXh
	 W/z4gj442vyrg==
Date: Fri, 9 Jun 2023 16:49:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Christian Lamparter <chunkeey@gmail.com>
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org, kvalo@kernel.org, conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: net: ath11k: add
 ieee80211-freq-limit property
Message-ID: <20230609-carded-stipulate-439950812469@spud>
References: <a3075482150d342f71ec235badacec32cdd6c553.1686300243.git.chunkeey@gmail.com>
MIME-Version: 1.0
In-Reply-To: <a3075482150d342f71ec235badacec32cdd6c553.1686300243.git.chunkeey@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_084950_297507_61EC5131 
X-CRM114-Status: GOOD (  10.34  )
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
Content-Type: multipart/mixed; boundary="===============2418517492179895985=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org


--===============2418517492179895985==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Hr0x/gMYpYr/cxtg"
Content-Disposition: inline


--Hr0x/gMYpYr/cxtg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 09, 2023 at 10:44:54AM +0200, Christian Lamparter wrote:
> This is an existing optional property that ieee80211.yaml/cfg80211
> provides. It's useful to further restrict supported frequencies
> for a specified device through device-tree.
>=20
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--Hr0x/gMYpYr/cxtg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZINKGAAKCRB4tDGHoIJi
0g+3AQCFQ8p2CNxwxmughCknWM1xVeucR0xBQ1yAXg8iamMwtAD/RLoywsac7z6f
gp1X+1swDTOiyPsYQXc2tf41bBIHxw0=
=CDm6
-----END PGP SIGNATURE-----

--Hr0x/gMYpYr/cxtg--


--===============2418517492179895985==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============2418517492179895985==--

