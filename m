Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB76C54E90
	for <ath11k@archiver.kernel.org>; Thu, 22 May 2025 15:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tpteHR4j4RW8B5bGrxwkjmVxwT1rmhw2u37kWPPCBU8=; b=kdo71jmKuGVFZ1nFS83FMHaVL7
	erdF2gmQ2FI/Vmtl9m+RX5rUK60X09NRR8TBQCnW1i9qNSOWMh/KUdF6ZSidojt4vfFBwjr1+Nd0o
	e0Foi/xkcOpQkhGvlHovKIDZFHzfG4Kbcu7AlDnos5j3DnfaEPaQi0A4Jr5+DvfqjfAKnA9SRrJ7x
	lGDmm36oBlNu6wVrGS7JGEzCpNSm2ZtaqNczsxKYhDmmfxk1nNUrQwuJQEkRyN1gWWqt3392ix19S
	Ifbh2jCsw81k9MBZHoHVuWu1UAaw/9QtXd/EzpjWGbRVzBhsvcRVjgHreYUhOjBs7Q76E/hNaBpfX
	QGIidfYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI89o-00000001UYn-0xQD;
	Thu, 22 May 2025 15:48:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7ji-00000001QVX-23DV
	for ath11k@lists.infradead.org;
	Thu, 22 May 2025 15:21:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 91ED95C5DC3;
	Thu, 22 May 2025 15:19:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67606C4CEE4;
	Thu, 22 May 2025 15:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747927293;
	bh=tpteHR4j4RW8B5bGrxwkjmVxwT1rmhw2u37kWPPCBU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HuGurj2lcnxWSiV65uFPDXeyYIIcA/Ege0JFRQTY+yuVXAYNCfPnaI/6sAjRiu6UY
	 gbRszGGEu6GkcPylHhLc2v3lb8Uc0HWEldny8P/oSccTpBowdF4MUgArWT09XX4pWZ
	 dWMIxLTAKOUZOVNJfCsFfltudEND1hzo66pQqIUGYKlMKye0rmqQ9FRtMjhElurLbd
	 iSaX3ePvBGN0fa7DRtU/k9N43hs7JVIYX8naXRVJ92/c2m3OlOKdq9GJ0vkERFmV0i
	 J5AttV7bKfJor2pPLyd3i3yFSyI2MpAloWan6EP7doKApstzg4OqYEUWuOnGu2ghEk
	 iDQoCe2nZpVgQ==
Date: Thu, 22 May 2025 16:21:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: jjohnson@kernel.org, johannes@sipsolutions.net, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH ath-next 1/2] dt-bindings: net: wireless: ath11k-pci:
 describe firmware-name property
Message-ID: <20250522-elves-appealing-8ecff4971f4a@spud>
References: <20250522013444.1301330-1-miaoqing.pan@oss.qualcomm.com>
 <20250522013444.1301330-2-miaoqing.pan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DOVqCIfPjKAtLcqy"
Content-Disposition: inline
In-Reply-To: <20250522013444.1301330-2-miaoqing.pan@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_082134_569615_E7DDE409 
X-CRM114-Status: GOOD (  10.56  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org


--DOVqCIfPjKAtLcqy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 09:34:43AM +0800, Miaoqing Pan wrote:
> Introduce 'firmware-name' property to allow end-users and/or integrators
> to decide which usecase-specific firmware to run on the WCN6855. This is
> necessary due to resource limitations such as memory capacity and
> CPU capability, or performance and power optimization for different
> application scenarios.
>=20
> Two firmwares are supported: 'WCN6855/hw2.0' and 'WCN6855/hw2.0/nfa765'.
> The former is the default firmware, suitable for most WiFi 6 STA
> functions. The latter adds support for commercial-quality SAP and
> optimizes power consumption for IoT applications.
>=20
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>


--DOVqCIfPjKAtLcqy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaC9A+AAKCRB4tDGHoIJi
0r/0AP9lmNp1y/LqEal+ClxcWGKPEJiDGBkHW5NbPiRHcRSJswD/Tg9dzDCG6wvf
GEE4QzIxtB0xIL3syZHj6PjYN9/n4wg=
=92db
-----END PGP SIGNATURE-----

--DOVqCIfPjKAtLcqy--

