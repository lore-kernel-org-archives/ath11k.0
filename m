Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE533C27C76
	for <ath11k@archiver.kernel.org>; Wed, 25 Jan 2023 10:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z2ZEK6W58oJq9sti0Sob/x5GzEna4VwShMkUYPuwJHU=; b=wfjhkJy47k+yro
	KLzP81uOqQ9cqeqoUNsJvELvdlHSHKGEgPXMwVwG0VuJyvuDn+xtgAoii85nEGeGY5Vk/uVr/Sno9
	29/WhxQvNWbiv8bD7r473zt8VqksE7+tWhPea+YC9NSp1aazLClg5upzzUHysBQG7yRTlVeEL2PNR
	UnTdodcJvBFERa8RHz/NS07u7WEUqjlDHGHjjE5thFNw+G79EEoAB3WDx+M+gznobpTdedwOalNI1
	qvOHFFPzPQQV0RuO1U7Uj6WjZUTvfY9w4ih4za78zMLNdsrw8lqTr31TgNxVVrCbWFFFrvmN6baN7
	Svj/55L/ngMhiy1uYmMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKdVA-0072mZ-By; Wed, 25 Jan 2023 10:59:36 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKdV6-0072kP-Gw; Wed, 25 Jan 2023 10:59:33 +0000
Received: from 8bytes.org (p200300c27714bc0086ad4f9d2505dd0d.dip0.t-ipconnect.de [IPv6:2003:c2:7714:bc00:86ad:4f9d:2505:dd0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id EA1A7262E65;
	Wed, 25 Jan 2023 11:59:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1674644369;
	bh=T38KYBmqOO/YysbFxidRcHI2EqxeKT2mSwZbXhYqf1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xjLIYBe2Reb4sUbyDIO/QWp7US6P8C31V+nRPiKC12bUvIf7ZM2sEz6rexMly82MG
	 SdqC2ipNyx624847dznAPsTr5JegX+avBcrYfRuhpCCtUCj00j5UMMKFv2s5yqcp78
	 M0y7wdWzVXQ3svUwvlcuJMoxQJuspChvYRhYbBD4VgYfSxytDzzifVhHBhI3LbACxs
	 T3fe0NZnfc4OI4+mzTVEq4TCO9vBUsWz4/KYFySgVFLjFM48o+FEL/Pas2FYAxM+s5
	 h6WCzD311EPYK4UyWDMAMAz7XrOhVE163Ksfw3L/LtMiYeejlNUntipX85M2JSVOt+
	 8KBgiGtflHGcg==
Date: Wed, 25 Jan 2023 11:59:27 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>, Kevin Tian <kevin.tian@intel.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	ath10k@lists.infradead.org, ath11k@lists.infradead.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org, linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org, nouveau@lists.freedesktop.org,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v3 00/10] Let iommufd charge IOPTE allocations to the
 memory cgroup
Message-ID: <Y9ELj1yKsE58mlgi@8bytes.org>
References: <0-v3-76b587fe28df+6e3-iommu_map_gfp_jgg@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0-v3-76b587fe28df+6e3-iommu_map_gfp_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_025932_810346_CDB7C64D 
X-CRM114-Status: UNSURE (   9.11  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Mon, Jan 23, 2023 at 04:35:53PM -0400, Jason Gunthorpe wrote:
> Jason Gunthorpe (10):
>   iommu: Add a gfp parameter to iommu_map()
>   iommu: Remove iommu_map_atomic()
>   iommu: Add a gfp parameter to iommu_map_sg()
>   iommu/dma: Use the gfp parameter in __iommu_dma_alloc_noncontiguous()
>   iommufd: Use GFP_KERNEL_ACCOUNT for iommu_map()
>   iommu/intel: Add a gfp parameter to alloc_pgtable_page()
>   iommu/intel: Support the gfp argument to the map_pages op
>   iommu/intel: Use GFP_KERNEL in sleepable contexts
>   iommu/s390: Push the gfp parameter to the kmem_cache_alloc()'s
>   iommu/s390: Use GFP_KERNEL in sleepable contexts

Merged into branch iommu-memory-accounting and merged that branch into
core.

The merge commit contains your cover-letter descriptions. Given all
tests pass I will push it out later today.

Regards,

	Joerg

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
