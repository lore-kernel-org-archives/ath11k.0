Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F0E8C27C53
	for <ath11k@archiver.kernel.org>; Tue,  4 Jun 2024 08:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jIxrG2rJLNev+S2sFVjSEfocW+02vTLboo8kBEkNTa8=; b=nd4r8xitcQHkq2pFXIlWHQzcXP
	PNgfqTKvgHUwhiyVFIG64D6f4EemND5o+jdAfL5bun8CPtUv0deU/f7WIXXItoZBW6LAYKJkfQ/Km
	FRQHcCbN12wtBQf0dq8eLrNxMNO0TQXLexcNkMF5002UNmYmgEPRvIrp4RQoPEElYhv5O4ZpLx5uE
	F0bvF6meTsBse8CvvVQlZtn3VV5JUE655pE1f00qC+shUDybZhmj730UEiV0JIlZok2Uh1Jleys82
	g4maNkwD8rlj1bMaYlmMSp0dvzLiExa94/XbdHWv596vtmW1mEkXBxufBI0x78nQHpKfEex+eJ/sa
	QY1WGxtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEPOR-00000001eij-2ejj;
	Tue, 04 Jun 2024 08:19:43 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEPOP-00000001ei2-0C3N
	for ath11k@lists.infradead.org;
	Tue, 04 Jun 2024 08:19:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8BBCFCE1087;
	Tue,  4 Jun 2024 08:19:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 922FFC4AF0A;
	Tue,  4 Jun 2024 08:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717489177;
	bh=Cl26qCxo2UX/Hr4fxo+oX7S1ymUZ9Z3ZTZcmorokdoI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=gwSFn6Tebpx2FbyOPMGfXWm/Mu5F0chYv9oPxGYovid46Ggp4OhKt4lT+8wmWVGwZ
	 bcSDSm3H+mOWpVCDwB+geWnkEcpvwZ12PaV9T7Kd/iceMQtXOQC+U1G1jzlBFszzgZ
	 G2/yEUs619rFYWz0RU3p3kwmh7rmFm9UBxZ1RMfR9To7jTcp4dW4iaK77fhWhPwGBu
	 Uh8ckP5yo3H6bMK8EXyKN6QsSAfNDn7Ue5UJkeH2pNe5M3VpFHRlt08g6N6AgIjupy
	 A14Ws1BJ3YArVaqOrjOCwf85nHtxgxueN1dRTSS8LOwU/h2kSBXuI60MLEwcV2eW2Y
	 K+lqvi8NWzRIg==
From: Kalle Valo <kvalo@kernel.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Joerg Roedel <joro@8bytes.org>,  Will Deacon <will@kernel.org>,  Robin
 Murphy <robin.murphy@arm.com>,  Jason Gunthorpe <jgg@ziepe.ca>,  Kevin
 Tian <kevin.tian@intel.com>,  Yi Liu <yi.l.liu@intel.com>,  David Airlie
 <airlied@gmail.com>,  Daniel Vetter <daniel@ffwll.ch>,  Bjorn Andersson
 <andersson@kernel.org>,  Mathieu Poirier <mathieu.poirier@linaro.org>,
  Alex Williamson <alex.williamson@redhat.com>,  mst@redhat.com,  Jason
 Wang <jasowang@redhat.com>,  Thierry Reding <thierry.reding@gmail.com>,
  Jonathan Hunter <jonathanh@nvidia.com>,  Mikko Perttunen
 <mperttunen@nvidia.com>,  iommu@lists.linux.dev,
  dri-devel@lists.freedesktop.org,  linux-kernel@vger.kernel.org,
    Jeff Johnson <quic_jjohnson@quicinc.com>, ath11k@lists.infradead.org
Subject: Re: [PATCH v2 12/22] wifi: ath11k: Use iommu_paging_domain_alloc()
References: <20240604015134.164206-1-baolu.lu@linux.intel.com>
	<20240604015134.164206-13-baolu.lu@linux.intel.com>
Date: Tue, 04 Jun 2024 11:19:30 +0300
In-Reply-To: <20240604015134.164206-13-baolu.lu@linux.intel.com> (Lu Baolu's
	message of "Tue, 4 Jun 2024 09:51:24 +0800")
Message-ID: <874ja9t90t.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_011941_285049_751C76D1 
X-CRM114-Status: GOOD (  15.83  )
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

Lu Baolu <baolu.lu@linux.intel.com> writes:

> An iommu domain is allocated in ath11k_ahb_fw_resources_init() and is
> attached to ab_ahb->fw.dev in the same function.
>
> Use iommu_paging_domain_alloc() to make it explicit.
>
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/net/wireless/ath/ath11k/ahb.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
> index ca0f17ddebba..a469647719f9 100644
> --- a/drivers/net/wireless/ath/ath11k/ahb.c
> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
> @@ -1001,10 +1001,10 @@ static int ath11k_ahb_fw_resources_init(struct ath11k_base *ab)
>  
>  	ab_ahb->fw.dev = &pdev->dev;
>  
> -	iommu_dom = iommu_domain_alloc(&platform_bus_type);
> -	if (!iommu_dom) {
> +	iommu_dom = iommu_paging_domain_alloc(ab_ahb->fw.dev);
> +	if (IS_ERR(iommu_dom)) {
>  		ath11k_err(ab, "failed to allocate iommu domain\n");
> -		ret = -ENOMEM;
> +		ret = PTR_ERR(iommu_dom);
>  		goto err_unregister;
>  	}

Adding Jeff and ath11k list so that they can review this as well.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

