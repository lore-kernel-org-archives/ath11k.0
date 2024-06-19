Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D0AC2BA15
	for <ath11k@archiver.kernel.org>; Wed, 19 Jun 2024 14:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7yoE1PBMeOt8AWWOCfirQIQiAXfywLWQ1wTXnwAB5no=; b=YvZUTocRx6eExdvcVxG7aYisEF
	iiC0NTAsKyu3/4FAMNrPW9lp0zkwafmgL/yCLw33eOFIVWu+5DbimBwWC3e89OyR6xc4fRFE8D6uT
	DOXtx32+dlpTKnY+iKEfgcKnU203gd6mVO2Xn05qYWl9U8/A+jMeUVwjXESD/fTy+pMHPDE8oK7eW
	2UUgWrG/1Mw0K2SV1/nJvP8x1IhVgyHokVNjCQLKVkGsw1Um4i92wzyV/pjXKLDe9TYR4HGtjslTO
	sWoZAMHCamJUKz+6IpdsfRw0Pn55p6fPB0mDUmtGrk7kFZi0ebqzME+p1s+actTHL+bNPNGf3BSUb
	i+GMf52g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwBE-00000001USg-1sGr;
	Wed, 19 Jun 2024 14:20:56 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwBB-00000001URu-3kPn
	for ath11k@lists.infradead.org;
	Wed, 19 Jun 2024 14:20:55 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-6ad86f3cc34so30554366d6.1
        for <ath11k@lists.infradead.org>; Wed, 19 Jun 2024 07:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718806852; x=1719411652; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7yoE1PBMeOt8AWWOCfirQIQiAXfywLWQ1wTXnwAB5no=;
        b=H+eIuBX/8gEOO3Ad8zf2X6jGNSZoXed01kkQa3Pvg+QHm1BshXOD3L6naux1nl+YzP
         bM8rySEY8IN0bpSdG1JrVbCaaEmxglVT3FhYSGQtxYFQZFrsgNDvGbLFjqHjBXd3ZH2M
         Z2pi8wFdalD2+nkdLm/WTFrPuA+93KT66uVu2LbW6fRXlur5TRJODDWIzhZH9UAdiGbR
         d60XJb/ZvEjs6ghLLhYonoTSZuiDoGhYfPXUEedoPsCZ+lDjWLBxUBlIvwIoyDC1+Uo1
         Ves/i7ySln9T/2MFGi/VYX3or96ba8+3htxtBMf76FGYad5IAEfgXW6oil8Kguk0/83A
         1Teg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718806852; x=1719411652;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7yoE1PBMeOt8AWWOCfirQIQiAXfywLWQ1wTXnwAB5no=;
        b=oui/2nwgBWzjLLh3nIOt1Y5tvpC6Z+ra8BUf4nSo3LYC+tNPC0BA8y9BCOGmZJwslp
         KHmiBW/cWgFo9YR/Zd9tPoYwVugyvg1PjahQlnfzbLGmV6D8HGBcA3sonO5tzTni54uh
         p5UkwVDHGs9jILCnAGpVBK4m15uQNBe4U7u/T2mOMgY+u9Mga6x26mWeojubMijGQwh1
         F5L6aOsS6OfXSTOgmtboMn8OKJV9mfvZZNZD0mpETw0C3NNDMj08m5FYN1rk6PMOmjVu
         5edr74Oi+r82iN3KhsrpzGid0jAJe7qPgb2DuRh2nBH4C36CTEiiidiW3UJF500soNOa
         BmjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaCvfHNEO0O2UKPuBfTazk3aBIdRBAMq1k8lq/ydoAExAHIkewvO/puxt/wq+8CwpJfRKXHOZUj2PQDExbiN7lIX/chYt4N2LBEg==
X-Gm-Message-State: AOJu0YyEcsUvZzlwm3+F+MplZAMFy/A1bzMmgfZAFiK7ZR46Uu/biauB
	qC3bix88OTCIo65ShEyzjCctKBnvwxz742nINvNMVtGasZXryOn8WYLCQ+lmH/M=
X-Google-Smtp-Source: AGHT+IHRnNfM3kpcWftEa4vzfduj3t2OxKbu1f062TE8ncSp4oMlwh+It4VOxlc2xlXVn+nW/690wQ==
X-Received: by 2002:a0c:f093:0:b0:6b5:a5:f5f2 with SMTP id 6a1803df08f44-6b501eabd0emr29525536d6.55.1718806852061;
        Wed, 19 Jun 2024 07:20:52 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b503445091sm9427136d6.101.2024.06.19.07.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 07:20:51 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sJwB8-004YTZ-Pt;
	Wed, 19 Jun 2024 11:20:50 -0300
Date: Wed, 19 Jun 2024 11:20:50 -0300
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
Subject: Re: [PATCH v3 01/21] iommu: Add iommu_paging_domain_alloc() interface
Message-ID: <20240619142050.GG791043@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-2-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-2-baolu.lu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_072054_079232_6BD4C198 
X-CRM114-Status: GOOD (  12.64  )
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

On Mon, Jun 10, 2024 at 04:55:35PM +0800, Lu Baolu wrote:
> Commit <17de3f5fdd35> ("iommu: Retire bus ops") removes iommu ops from
> bus. The iommu subsystem no longer relies on bus for operations. So the
> bus parameter in iommu_domain_alloc() is no longer relevant.
> 
> Add a new interface named iommu_paging_domain_alloc(), which explicitly
> indicates the allocation of a paging domain for DMA managed by a kernel
> driver. The new interface takes a device pointer as its parameter, that
> better aligns with the current iommu subsystem.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  include/linux/iommu.h |  6 ++++++
>  drivers/iommu/iommu.c | 20 ++++++++++++++++++++
>  2 files changed, 26 insertions(+)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

