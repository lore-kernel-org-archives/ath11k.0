Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F9CC27C53
	for <ath11k@archiver.kernel.org>; Wed, 19 Jun 2024 15:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mOCumefnCWAh/IoBUZ2rq796M41BHPnroxPN1L782is=; b=OI2l3tM6uV92lHG17z0SDm/CPp
	lJ3FKmM89qq/jgpZubQP7+TSeerVWCoQpnylw1aYQ5G5++rYoKWF7BeMk31EHoy/ZMpnzQlawE4ig
	CuJC2Ydy+C7FXt66+ERbiEkc/FvMPL6OMgNDzmKRYul6QxRIvBQ8cPrR6Q9xX4ZjJjHnpNzBJT2OA
	urfaIsC1dUH8Je+xt1bGDcEkztCowt1R2cQwfVnanNT3ytzCTAMk9DhsRa2r9ZHCvTnIlaF/s3wsc
	bi8JLjBV9XDPUnUDuWnznPKO+XgfLgOGjeTdWugR1qg/ukiQ+iGjHZNE24OHdekCL9lnpngfmOZ7+
	Hal/uxjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJx1Q-00000001lNA-1DnA;
	Wed, 19 Jun 2024 15:14:52 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJx1M-00000001lJ5-14XU
	for ath11k@lists.infradead.org;
	Wed, 19 Jun 2024 15:14:49 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-5b97539a4a5so3666473eaf.2
        for <ath11k@lists.infradead.org>; Wed, 19 Jun 2024 08:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718810087; x=1719414887; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mOCumefnCWAh/IoBUZ2rq796M41BHPnroxPN1L782is=;
        b=o2kCjgD9SOQbnZgOqVhMWYu6EcnVhkwss+6pqKdXHTRt+7ehVvHFsMYumfKP2DJ9Wz
         kg+Px6giFdNo+KlKEM0N3RSzP/tgdf/LqpxAJiRmjTMCvvwfZdxm1pmS0cOeWzUWbtVv
         PMGtlVnzdjvdlgCPBWA9Bh8ffJuLiqP2HEiAoRF/gn4EGhPa8dyK9BHgm09SdbNHxyfK
         guzRxzHAYzEBPMc/VRK/u1GHtMlPcbIKaAe7XXDx8IwpsECRaPwwb5jkVZs57AKe1Rs0
         /bKbIwlH+3ptxDfYe35rFFkvyyMp2CQMH8+jah8Xeppre1lBzxGZLjhAtrkQvNd+HGUX
         Wv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718810087; x=1719414887;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mOCumefnCWAh/IoBUZ2rq796M41BHPnroxPN1L782is=;
        b=Ig/nGaL1KKrRRGDn2t+lPpIgx8g6SMlwQi/TQ/4OoIldI72hLe+g5D3bZAcPZUaeSk
         GLj0ViEHY1UKXdv9PMs9j3A5m8hBuaepD49abeYlowBKB2ngUg0g2xIZevtzRo5cKhX5
         CLqMr1BMgZFmyF7ffdHFTbzKPpJU9oviVwvbWiSmTw0Pix36LwxNpo3kGyVaTfVwZvaN
         2RxAvgRNaLQ4sIx0UQ1Nq14EEawH3QjNud0McUN2hHUviyO4QlWIsM9lz71PwlZxPqLv
         /tEUfnN7n6iKtGD6hnliV4KVV903lZysOm4K9QJw50kJaEzcptXNpqC1s8gOd93eoLi0
         KPYg==
X-Forwarded-Encrypted: i=1; AJvYcCVpD+yadj4jLqhhU50rzfnoqXKNBuvSTe8FIHEIMsQxqAdsY/e2Y2UAzUm3pZXC5OZwG4js44i+V3psVc40xHLhgqLMfuQj3TaWSg==
X-Gm-Message-State: AOJu0YxVkK22kS8xYjJOirHDlWOEB6QQ/kSWFqSQqtKN8B0otjLqVotY
	Q1/kSkni6caqqBvVq6NghNVgsHHISxvBVgUZA+E57l8pfRVejZpailiGpQJjlVo=
X-Google-Smtp-Source: AGHT+IFVFHsVlQMiH0Fbhd4tc40tCEx10K+gMkRqXAjqGDO2L2x5wkknywHxXN6ff9bLZXfNrK0Jmg==
X-Received: by 2002:a05:6358:9886:b0:19f:1644:d45e with SMTP id e5c5f4694b2df-1a1fd470d73mr300419055d.8.1718810086999;
        Wed, 19 Jun 2024 08:14:46 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798abe47ce5sm614900285a.103.2024.06.19.08.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 08:14:45 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sJx1I-004nmY-NX;
	Wed, 19 Jun 2024 12:14:44 -0300
Date: Wed, 19 Jun 2024 12:14:44 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Kevin Tian <kevin.tian@intel.com>, Yi Liu <yi.l.liu@intel.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Kalle Valo <kvalo@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>, mst@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath10k@lists.infradead.org, ath11k@lists.infradead.org,
	iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 21/21] iommu: Remove iommu_domain_alloc()
Message-ID: <20240619151444.GM1091770@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-22-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-22-baolu.lu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_081448_355860_03AFC03E 
X-CRM114-Status: GOOD (  11.31  )
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

On Mon, Jun 10, 2024 at 04:55:55PM +0800, Lu Baolu wrote:
> The iommu_domain_alloc() interface is no longer used in the tree anymore.
> Remove it to avoid dead code.
> 
> There is increasing demand for supporting multiple IOMMU drivers, and this
> is the last bus-based thing standing in the way of that.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  include/linux/iommu.h |  6 ------
>  drivers/iommu/iommu.c | 36 ------------------------------------
>  2 files changed, 42 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

