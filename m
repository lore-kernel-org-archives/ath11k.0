Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC44EE4992
	for <ath11k@archiver.kernel.org>; Fri, 18 Aug 2023 22:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MJPPjEBH8j/5OCMH3c2lIT56cDfg79+75Xb7K3I4JsY=; b=ob0s0JOzhGfWE1daCbT9p3l3RH
	YoZme7LAQb1i5cVPdGnOJkTaPP6l02Ok0HTvFEXuXIZ/oSzq6ivaL9y9TzMLy0HeUlBv8bxTAsLyp
	tWcaETsT71rLq75UXxj067CPM7KUyJpb8BDm86AwMX6z5FhpjDnp8qPJmPNvpvLoRDrN6joKgdZBL
	XyOHRTLOUQLzRVtlb43DKU0b1VJot+0fjBWFNng5chGzIQGlWWevYcouG8Zb/VJAkwR4UV2mFuz+N
	jOWeP72OEEt/Ywm6pCVX80wo0WInWWX35g3p05iw7dGHwRbR9EXf6LR/OdEvvzK6kk3AlfPgC5p9b
	Zyu9UUDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qX8Fe-00A7eB-39;
	Fri, 18 Aug 2023 22:47:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qX8Fb-00A7dI-23;
	Fri, 18 Aug 2023 22:47:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D06A363A4D;
	Fri, 18 Aug 2023 22:47:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5936C433C8;
	Fri, 18 Aug 2023 22:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692398846;
	bh=GERRINsAE4jFIhYWdb4073xkrV0e7fJw3JwzPleFkGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cyuL5Iht3FYQhRsQPZ882/GmkeF4L5szu8lARMrLLwnl/0ywm7mtvMs22mHQfpQEV
	 PfMAoZI9wLWJ88CsiWMyPcyIZlbf2PVYElReCYpEyqPx79/9xEz0p2o24WJqS7cfEd
	 3ppg3GlffC8lgib60tR67hmDMT96+jDVyO7khBg5IfTrrrzO8vR2si+EvKu7D/bwFl
	 BOQJwbKJE47igkOtaP04PX5ASifTwmFRyzEb76CWj1pq1lFsCFcdYnoSNsmw3bbopA
	 jb4Cy2tCBGbxN1MIv7KK7Nkz6ZeGN4hzis7MN6B2iZymCsTslqic6QQ0etjZshT3RI
	 t7o66s2q1HFRw==
Date: Fri, 18 Aug 2023 23:47:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Andy Gross <agross@kernel.org>, David Airlie <airlied@gmail.com>,
	alsa-devel@alsa-project.org, Bjorn Andersson <andersson@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>, ath10k@lists.infradead.org,
	ath11k@lists.infradead.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	dri-devel@lists.freedesktop.org, Emma Anholt <emma@anholt.net>,
	etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	Frank Rowand <frowand.list@gmail.com>, iommu@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Joerg Roedel <joro@8bytes.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Kalle Valo <kvalo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-wireless@vger.kernel.org,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Maxime Ripard <mripard@kernel.org>, Sinan Kaya <okaya@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>, Sean Paul <sean@poorly.run>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Takashi Iwai <tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <jroedel@suse.de>,
	Kevin Tian <kevin.tian@intel.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH] iommu: Remove the device_lock_assert() from
 __iommu_probe_device()
Message-ID: <1b53ea1e-3522-43db-a7db-dd4b460f0bc6@sirena.org.uk>
References: <0-v1-98d20e768c66+7-of_dma_lock_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <0-v1-98d20e768c66+7-of_dma_lock_jgg@nvidia.com>
X-Cookie: Your aim is high and to the right.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_154727_782406_DC1FC2CB 
X-CRM114-Status: GOOD (  11.95  )
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
Content-Type: multipart/mixed; boundary="===============7425959746219560404=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org


--===============7425959746219560404==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sBznzgBGlLdaocvC"
Content-Disposition: inline


--sBznzgBGlLdaocvC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 18, 2023 at 06:32:28PM -0300, Jason Gunthorpe wrote:
> It turns out several drivers are calling of_dma_configure() outside the
> expected bus_type.dma_configure op. This ends up being mis-locked and
> triggers a lockdep assertion, or instance:

Acked-by: Mark Brown <broonie@kernel.org>

--sBznzgBGlLdaocvC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTf9O4ACgkQJNaLcl1U
h9CQkgf/U+glO2B163vQwi/fCAxSj8fyw/4Fx89WMOmUEwj0C05hkeR75k8U4pW8
4U0vPSpT0yaPcjKGpztFpE3uMIf/40CZ1SbbKuvZ4RcYoumOqLIWVcQzYmEiQSml
M4NjnYXvs3xppLRtxlnWYCzwmvijPoQfs/Ot1VBn9TsoGz70YwLD3JfjHXnztUHF
y9wAVvMF5OgDayDuWedbuh63H4kRGS7LIhIu9cPgnV14RWL9SmYat6UKcto2FePd
th2ai/d8CMoJ8oHV7BOaf86sQXul26EvMiWSqgyc9uGX/ag9RYCA465U/QXlVQZc
M7hwZKW9rlZZsKXxSdbNPklRZ/Mdqg==
=cHW/
-----END PGP SIGNATURE-----

--sBznzgBGlLdaocvC--


--===============7425959746219560404==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============7425959746219560404==--

