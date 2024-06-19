Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA61C27C53
	for <ath11k@archiver.kernel.org>; Wed, 19 Jun 2024 14:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dnuarbriLv1gjZdB+/82zOEKoFtQbXR8yQCL4vTr0Qs=; b=rRQm+qQzeQrWOF7nutQi0/a1lO
	8iSmDCi8S3K4liY64QBET1vvdhcNGldgUuQK88xRJR3vf55S7+rnLhEE0oVBue6KkevZX6OXmv/Yy
	SDzOXfCkL2UtiwgoiIQOSwmRzC9ZoaBfCrdMsdY2RRtsaZ8lv8SWOKAIztpeSygmOnuBeR7DQbsRm
	pXCYmlVyaVEbS8UVdFEftFD5sI01aD3ggpY1FZ6HLeuxJnAvmNNcReNoRssPTVhDvQPmuty+Le4Px
	NSo1r7YNpIEYVohhLkAUSJIeTGOiJQRcXJTriHB06LGatUSmoWxupmiMdx1OgQdKw70SQOjwGUHfi
	RN6B9bMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwBY-00000001UbY-3F8J;
	Wed, 19 Jun 2024 14:21:16 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwBS-00000001UZ7-3E5Y
	for ath11k@lists.infradead.org;
	Wed, 19 Jun 2024 14:21:14 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-4405e343dd8so27376411cf.1
        for <ath11k@lists.infradead.org>; Wed, 19 Jun 2024 07:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718806869; x=1719411669; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dnuarbriLv1gjZdB+/82zOEKoFtQbXR8yQCL4vTr0Qs=;
        b=PYOoSo3CEfdIHiI59WDbX7IqVYrbrg6cHgk41Qb+4bnOfSW/prZDI1j1kghY8XoBlU
         baWbCciCm5DYgSF2tloLRFf+w9qa6oDfCi/trnWSPJ/Y/FMwcCaDwYHw8oC6Qb6lXXas
         lpJ3X38li4BoAzRzyurf1bdEf+nj2MHJ7yIPH+WtI3KPae4WnvWzkPFKoISLm90GVaW/
         hq2TEIuyFjyHX2gy8s9QvNeJfbb3LPu7izYZWMGV6pTuO16slW00kQl9Ei5BzyaOpM/0
         qzoHUCOHqknLQ2HoVjQJQZGuI+nDyFHIdA+pTh9zTaB31qq3Dy/jYC5PQRq8y/UhhSIK
         WKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718806869; x=1719411669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dnuarbriLv1gjZdB+/82zOEKoFtQbXR8yQCL4vTr0Qs=;
        b=i9u5vAtHNAGtw4y9a7gOoq6GmG78M/2o1QOdu8MyBBWG0oN94tUx7dXf+QMHXqncXT
         y5iIYQssq5f74xAzhsPwjzVu7fyBp0+Gd421eHAI962ofGkCFs0rNmXcQlDe5GejEP2O
         +MUpxfe63dIDuZjApJGie58kOrh06g0OJ8zRRIw5UY89dC+t0Av6iFYV0zrz828sXk3s
         2aqpcMEkYpCJtJs3kUoFmbFcaen6Maua6nE+Xxx1CFBBNH79vJn9NVpAOtIaXQBqwM5W
         xthSL2fytua4KC1J4tArHphtp/8zL6PbxKvtYwoOOTI5ZV/CY4Bb7xaszuGN9oKwCqkp
         FvQg==
X-Forwarded-Encrypted: i=1; AJvYcCX3qYG5oc0iwBdACUNE1prXAsxCfQlKbCn5kt2ioykY+gLub4vhk7DVTfBAufRQTrpB9NrKBMoIb3xRO16IDuMVD7CtvvU7WbH8NA==
X-Gm-Message-State: AOJu0YwzGfuDPWG9Nx30HtuTRhOvCedRYPokgmE/J0kbPh0uBUhlJE+h
	irRStLL/fFSLvOf4UD7Mlwn9WMprb7eBYOC2Yje/tuEytF+1n9n/Wz0a2m0NHfs=
X-Google-Smtp-Source: AGHT+IFditz4+ndDJELnqBk6Tg5RVcppmA3k0NZASSXMhXG6oxi/4ZiVAiLFkBd54vQUHLyqIQAFrg==
X-Received: by 2002:a05:622a:11c1:b0:43a:ac99:4bb5 with SMTP id d75a77b69052e-444a7a4a90amr26916401cf.51.1718806869361;
        Wed, 19 Jun 2024 07:21:09 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-444b1e112a7sm2007311cf.97.2024.06.19.07.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 07:21:08 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sJwBQ-004YYo-D3;
	Wed, 19 Jun 2024 11:21:08 -0300
Date: Wed, 19 Jun 2024 11:21:08 -0300
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
Subject: Re: [PATCH v3 02/21] iommufd: Use iommu_paging_domain_alloc()
Message-ID: <20240619142108.GH791043@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-3-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-3-baolu.lu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_072112_288219_01CA5D3B 
X-CRM114-Status: GOOD (  11.50  )
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

On Mon, Jun 10, 2024 at 04:55:36PM +0800, Lu Baolu wrote:
> If the iommu driver doesn't implement its domain_alloc_user callback,
> iommufd_hwpt_paging_alloc() rolls back to allocate an iommu paging domain.
> Replace iommu_domain_alloc() with iommu_user_domain_alloc() to pass the
> device pointer along the path.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/iommu/iommufd/hw_pagetable.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

