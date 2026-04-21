Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEAD3F94CA9
	for <ath11k@archiver.kernel.org>; Tue, 21 Apr 2026 20:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zlc1xvs7V1MA2mbAbpURS34qCSlGhYRGswgZIBC4UrY=; b=tOhIXq8oMQU+NXLWoQaTRt1dra
	6mlqnCJ34BS7TUty9gytPXc9tWd3XoBJ6ptkz9Yf35BYQZ6vHCRYMuShK5dy2cco7quqeO1tfAz4m
	GCq0X1xlMWsKB0MKBsU7THPVjrAvGriHmth2KcVMdT1voE/2qn07LYRr0y/sBn41vAq9bceKaPmz6
	57KZLAbFZzWvHck3RXNzXAaIQ+zalu2dHagaTaWiZU/DRpHW9OzNgoD+ZyAtUfuvk8IqFpZl6k0VN
	Ml/VjImugpdkkDdzoLyWILYjFj4KKpaBpBT+m1k7BUl4JIZkKkjZNyBXdqImmXVj/UQzjhR3A22zx
	fz7pxGQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFHGe-000000096Zi-29No;
	Tue, 21 Apr 2026 20:00:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFHGc-000000096ZL-1PnY;
	Tue, 21 Apr 2026 20:00:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 56A5661335;
	Tue, 21 Apr 2026 20:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F1E0C2BCB0;
	Tue, 21 Apr 2026 20:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776801617;
	bh=Zlc1xvs7V1MA2mbAbpURS34qCSlGhYRGswgZIBC4UrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q3Ls/D6bQyexm8rodqpy6NEtHra1oMoMVRLg3U9JMkuJrvmpKemOoLsPg8viOmxAA
	 oqbL97hhSfvKpFblHAkaTwKXjjjZLWkOveAAbzSfAq6JcamM1T1fjT2bPzUSogslAK
	 +zvD75CC72k7pSEbCjzlxRdWV5d56eR8iYLCZ//CrhVjnarDFCciD4iZ3S+xX53yHk
	 JTeIP7kLtxMiNbsa1tHstJOkS9fk+Nvrwwvv0ksP1PkgiT2k6Bx4ENQF1dlHWnOOKe
	 HidJJmzeMoiBAw/SATUP6S23FVd3QT8sw7/HfUkMqBjCCQnnLWyBosurg75kP4c4BR
	 TJbjwsrX4yqUA==
Date: Tue, 21 Apr 2026 21:00:06 +0100
From: Mark Brown <broonie@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jeff Johnson <jjohnson@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yang Xiwen <forbidden405@outlook.com>,
	Alex Elder <elder@kernel.org>,
	Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Rao Mandadapu <quic_srivasam@quicinc.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
	ath11k@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Fix phandle-array constraints, again
Message-ID: <ddeb29fc-1292-4191-8963-8ba817410740@sirena.org.uk>
Mail-Followup-To: "Rob Herring (Arm)" <robh@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jeff Johnson <jjohnson@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yang Xiwen <forbidden405@outlook.com>,
	Alex Elder <elder@kernel.org>,
	Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Rao Mandadapu <quic_srivasam@quicinc.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
	ath11k@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
References: <20260421195836.1547469-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SlEK5XXQLOw6MldA"
Content-Disposition: inline
In-Reply-To: <20260421195836.1547469-1-robh@kernel.org>
X-Cookie: Jenkinson's Law:
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


--SlEK5XXQLOw6MldA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 21, 2026 at 02:55:25PM -0500, Rob Herring (Arm) wrote:
> The unfortunately named 'phandle-array' property type is really a matrix
> with phandle and fixed arg cells entries. A matrix property should have 2
> levels of items constraints.

Acked-by: Mark Brown <broonie@kernel.org>

--SlEK5XXQLOw6MldA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnn10UACgkQJNaLcl1U
h9C8Vgf/TIh3jOwQkzaSh+ITMEgUCeXAFPb4VUUhIGQS66939JxKIGlaCr8kVeam
fIS+iyN8BAflGToJHouS473TERLm3pmQaKv4FHy2m/XW3E7aNKl/WZ6nuPJbZzLH
jN5jU8h19JcMriiidDPn73PPnDdSLZHsxuegwuYvWjjutnanS7pzFFJnvB5FqglH
DmQVRssnzzYzUBCLII2ARQtKPwTAkv1thWPjVRwXU0AxPSrEWA2+9xpNDedbe86f
gZJyKDlrKgAXce/tnTDNOJYTUAUwUf66KgGMWLOjfRI+tbwsRV/Z1s6TbSIGgVif
0AXVOMGUdqpfkYJFeGJGk/8tGGdtZw==
=Hh8L
-----END PGP SIGNATURE-----

--SlEK5XXQLOw6MldA--

