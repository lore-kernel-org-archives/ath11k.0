Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4864C30653
	for <ath11k@archiver.kernel.org>; Thu,  4 Jul 2024 14:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e5eYTQdvLIkTcl4PNOZ/yd1edGyVxgYSlbYpvR211Zs=; b=A2udU4w4DybVaXfwAWIXfJFpCS
	QFc+c592Eb+aVrlIVsMvv9EnnPXFAGxSWi5sTT3Y4aym1v87zTJWyr72lRFXZsaoNmH8JtG37mYl+
	Xgx/6Lj/MyaJz7ZKjvfBViWpxIYNMMUEwmPl/7bPTYg3iGwHPIpAF0t8Gq8jYhQdOmd/5cdc2jJLD
	ZmYB//QBHnIgQr8SyulXXDT4x/w/Ob5WTGf47EuOK1T6s8k5sc8VkMZBegOOriGgZzMwomiv65fdi
	O2mKZVeiFPVOQG/jpBeCYtG4dkObZcip5CD+c/70/NGQw9gsHfi+13/jG9AHf9iL1yyFWC34dciIz
	yO8VBOvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNIr-0000000DQSZ-1xsS;
	Thu, 04 Jul 2024 14:19:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNIk-0000000DQPB-3fEP;
	Thu, 04 Jul 2024 14:19:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CA83562766;
	Thu,  4 Jul 2024 14:19:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22FC1C3277B;
	Thu,  4 Jul 2024 14:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720102749;
	bh=4TqqG+6gW7sExbSc1fa3XwDb/nyy6iV4f8aqglDYIS8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mGcZvGhpiCFJxCg5MFKIgFwN0DjdrJzgg305KWBMNwcvSwheMjvg2+DMCwiYNlRMO
	 8wezWa3GlSRKqZtHGmERCrSRGBJ7pGKpwlngEspfCif86OY6EUt2SN4ESIwkpoI1VD
	 0+REjFXfs2ImiHANv2CM91Ic4PxkUsiM8vAotyUD4n5VFHBc7yF9Pk6GszNM3DJ5ja
	 egCGJEAu8lAySsVBZQty5h/GV+K+e1XfbRo+0eQuJSDfEuezuPY129BrwhnhCxMSYa
	 Akmrv0zLO4CTeVBxV12AT1rIF0Vcztq/kposhNyOyzGaIk+p7v/NR85DQeOJrtgVcv
	 4QZx3A5e/eFQA==
From: Will Deacon <will@kernel.org>
To: Joerg Roedel <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>,
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Yi Liu <yi.l.liu@intel.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Kalle Valo <kvalo@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	mst@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath10k@lists.infradead.org,
	ath11k@lists.infradead.org,
	iommu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/21] iommu: Refactoring domain allocation interface
Date: Thu,  4 Jul 2024 15:18:56 +0100
Message-Id: <172009858593.2049787.5200500337719932334.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240610085555.88197-1-baolu.lu@linux.intel.com>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_071911_055359_C604D8F6 
X-CRM114-Status: UNSURE (   7.86  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Mon, 10 Jun 2024 16:55:34 +0800, Lu Baolu wrote:
> The IOMMU subsystem has undergone some changes, including the removal
> of iommu_ops from the bus structure. Consequently, the existing domain
> allocation interface, which relies on a bus type argument, is no longer
> relevant:
> 
>     struct iommu_domain *iommu_domain_alloc(struct bus_type *bus)
> 
> [...]

Applied a few of these to iommu (iommufd/paging-domain-alloc), thanks!

[01/21] iommu: Add iommu_paging_domain_alloc() interface
        https://git.kernel.org/iommu/c/a27bf2743cb8
[02/21] iommufd: Use iommu_paging_domain_alloc()
        https://git.kernel.org/iommu/c/26a581606fab
[03/21] vfio/type1: Use iommu_paging_domain_alloc()
        https://git.kernel.org/iommu/c/60ffc4501722
[04/21] vhost-vdpa: Use iommu_paging_domain_alloc()
        https://git.kernel.org/iommu/c/9c159f6de1ae
[05/21] drm/msm: Use iommu_paging_domain_alloc()
        https://git.kernel.org/iommu/c/45acf35af200

[10/21] wifi: ath10k: Use iommu_paging_domain_alloc()
        https://git.kernel.org/iommu/c/d5b7485588df
[11/21] wifi: ath11k: Use iommu_paging_domain_alloc()
        https://git.kernel.org/iommu/c/ef50d41fbf1c

[14/21] RDMA/usnic: Use iommu_paging_domain_alloc()
        https://git.kernel.org/iommu/c/3b10f25704be
[15/21] iommu/vt-d: Add helper to allocate paging domain
        https://git.kernel.org/iommu/c/9e9ba576c259

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

