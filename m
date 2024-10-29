Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D02D5B16F
	for <ath11k@archiver.kernel.org>; Tue, 29 Oct 2024 09:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x3ogfrTttp5p7pE6AZoAKax7FI+GQ70CFKMQwLrETvo=; b=t1Dj5YXoZLBX6uJ3shpPkN1YTB
	9wjxNJyrg7wp4riyM8IV865dmbhHNp2T6oy5qXpkN9fp/KuqkKcH3GF6R0NcCsKboF7mh36DF+gNk
	cXhG/UOS1K1GpHmuns34zacUNZQJD/Xx9XU3W6mGYAqEv4H1PiNFPU8A2VwrJO4TsHh/4WzTiAhMS
	3YKvzh66cHvAWDYV7OOHNDnsGqYY9Ja8fVYG6gZmFEtu/IT2zUOY0XH0OrgUFmnLua+6zIZ1X4uHo
	ZqfmxVZVB9By1uFKW+1hwpCSkyVS3PmWPQMsjcCCoIIO3W0AGdXulSE2qn3A4eyRVy5VnrrOLvygU
	7auZSwjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5iGU-0000000DpsB-2hqS;
	Tue, 29 Oct 2024 09:11:50 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5i9x-0000000DogW-0ZfP;
	Tue, 29 Oct 2024 09:05:06 +0000
Received: from 8bytes.org (p549219d2.dip0.t-ipconnect.de [84.146.25.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id E03332A8D55;
	Tue, 29 Oct 2024 10:05:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1730192704;
	bh=eH17U5iBFIa1Xemd4TTLtZPVFnYTiOpDfOaOdchseTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OvqM/nJdIN4RIHkOZXT/boGA06HOCSNDia/ch0HOAtXn8Y2f0qs+VNfZmWe1TBAab
	 oVrw8Y12u2hz6G2pRm2+fbfog0Xyyw8Bwh1Ur9Q/DHk39e7+PsWkkikajdeualC/LF
	 YlYJmry+Mo9xqehf0SQQHPrxP2pLRtY8hkWLE+4uv+7E1l5c4EuthLdJm1XKEp9hWT
	 W6QbRKp1BqMhVYAcd2/keR64P1dhZT19hc12bvTV3FDumLJx9we3i4sa3/CHwYSOl/
	 UBhUMYyLDlh9RW377Plzn5H6dB5ydJMjC6+NtmRqxOqNEAtW489rnJhMFqXoq7beS+
	 Ps1bL2l7NNtMg==
Date: Tue, 29 Oct 2024 10:05:02 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
	Yi Liu <yi.l.liu@intel.com>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Kalle Valo <kvalo@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>, mst@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath10k@lists.infradead.org, ath11k@lists.infradead.org,
	Lyude Paul <lyude@redhat.com>, Beleswar Padhi <b-padhi@ti.com>,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/4] iommu: Refactoring domain allocation interface
Message-ID: <ZyClPkzekxXKqTFV@8bytes.org>
References: <20241009041147.28391-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009041147.28391-1-baolu.lu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_020505_430028_EF5B8E93 
X-CRM114-Status: UNSURE (   8.75  )
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

On Wed, Oct 09, 2024 at 12:11:43PM +0800, Lu Baolu wrote:
> Lu Baolu (4):
>   remoteproc: Use iommu_paging_domain_alloc()
>   media: nvidia: tegra: Use iommu_paging_domain_alloc()
>   drm/nouveau/tegra: Use iommu_paging_domain_alloc()
>   iommu: Remove iommu_domain_alloc()
> 
>  include/linux/iommu.h                         |  6 ----
>  .../drm/nouveau/nvkm/engine/device/tegra.c    |  4 +--
>  drivers/iommu/iommu.c                         | 36 -------------------
>  .../media/platform/nvidia/tegra-vde/iommu.c   |  7 ++--
>  drivers/remoteproc/remoteproc_core.c          |  6 ++--
>  5 files changed, 9 insertions(+), 50 deletions(-)

Applied, thanks.

