Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC7CEE4996
	for <ath11k@archiver.kernel.org>; Mon, 21 Aug 2023 12:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DY37/lUrOMrVXMRN+ZbcwPBaybHH5Ti4ySC+h7s97XQ=; b=bIQprtcL9J4Pq/
	6oJZKWJKr2cBKYNcFf3/eRNtgoCOcshPGMJ4hBjQJVyDSvHpYt757cS1ew3tcrWe2QsPXl8kA5FEI
	A03FNplmqjs4POW1MmwKLa2m8bAA2agTNpqs1hXQ4LW72Bru9Pm6CVdXidNJILuQOwdAgFxRumSAN
	XY8tOEj9ux/mtCJZr3AseTotLQMczwURBEb9zJlml7NSyfzxojl20AgxhT7saj8/QGZMgWftQa2GE
	8yD39upRvIPLhw+dvDkwhJ7rXmd/8+//2oZstxOqMJZGYujIjOuYeLWkqoX+BdDE221FmIu2M9ky1
	wg8MmImnI+MEYOZAynkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qY40k-00DyTN-03;
	Mon, 21 Aug 2023 12:27:58 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qY40g-00DyS5-1i;
	Mon, 21 Aug 2023 12:27:55 +0000
Received: from 8bytes.org (pd9fe95be.dip0.t-ipconnect.de [217.254.149.190])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 14D6D28194F;
	Mon, 21 Aug 2023 14:27:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1692620870;
	bh=FixGPDbY1JGUzoXJGnGCpBH8LX7vfPyc85NTwmVIvZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1GNfM2qXUHu69LlGLcBH8KY7o7o7XmY+SCrGkW/UUIs2KGTpDHXZZbMpPGz6QSYZs
	 UPnFUxDcsVEY3pjS1DruthDw9f83ySojUQCSB+rWg+GUD0/AhHwU/y7CvGp4ChZNfv
	 PF0U1t4Yrw0S3cKVt3Z1VBJMi6C4Yubn+JBgQ0h8akaCgHt2/SoukE6zqp52PyQtal
	 mSBFlaAtIaUSfX6biqD/5UJPh1qGAUoCalqefQ1b2bqiPcVjHwugqG0e+YrG5Eef+K
	 UDBnBPokoAbTS28F+RA/gZgu4I/tGuWG+hC4PlSSGwOqv9iwEYEE1WLsVZflD78r+Z
	 CJt+ubMPFXzmw==
Date: Mon, 21 Aug 2023 14:27:47 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Andy Gross <agross@kernel.org>,
	David Airlie <airlied@gmail.com>, alsa-devel@alsa-project.org,
	Bjorn Andersson <andersson@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>, ath10k@lists.infradead.org,
	ath11k@lists.infradead.org, Mark Brown <broonie@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	dri-devel@lists.freedesktop.org, Emma Anholt <emma@anholt.net>,
	etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	Frank Rowand <frowand.list@gmail.com>, iommu@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
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
Message-ID: <ZONYQyMSG17YMc_b@8bytes.org>
References: <0-v1-98d20e768c66+7-of_dma_lock_jgg@nvidia.com>
 <78114fd6-9b83-92ba-418f-6cc7bda9df9b@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <78114fd6-9b83-92ba-418f-6cc7bda9df9b@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_052754_737837_CAF3C49F 
X-CRM114-Status: GOOD (  10.20  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Mon, Aug 21, 2023 at 12:06:40PM +0100, Robin Murphy wrote:
> The solution is to drop those locking patches entirely and rethink the whole
> thing.

Agreed, that was exactly what I thought when looking at this patch.

I dropped the original 10 patches and the 4 fixes on-top from the IOMMU
tree. This needs more investigation and adaption of the actual API users
before it can be reconsidered.

Regards,

	Joerg


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
