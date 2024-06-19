Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ACB8C27C53
	for <ath11k@archiver.kernel.org>; Wed, 19 Jun 2024 14:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cokph3+KYsFeNsm+0akdDgXIRf+sbN6W33vmdBN3BV8=; b=KxjCot2R+dPmSPFWvDogfeyYfE
	Cq86pzDwPwPWf3Lbtc+ba5uGpcajdlCbI6WixjJXLmcj5uvEnDdsnAptSDrEYtrelPqy62WO4np7y
	sHPh8264Ar1aBoi6JvmVr4PWw5RHWffdvE71BvdLi0eYkINV0lOpFg8n/evywmPPGQtoEE9guji2X
	6NUNS62f5p2LVv4VAoDxp/6+9a0FjV3syQ7AzYmSpAc5AKDkKc830i9w3aGFiM/EfY9gPwHghqV2P
	Gk0wdnVVvZfpj6PkhOO7RUTLxTPmjaG6MJeJCGOj5uHcghVJJKGutbWoCK+QKbHigFpMjJ1grJo/c
	4O5hwWiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwTT-00000001blM-0ZQM;
	Wed, 19 Jun 2024 14:39:47 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwTG-00000001bha-3edd
	for ath11k@lists.infradead.org;
	Wed, 19 Jun 2024 14:39:36 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-4449beccc7fso6317511cf.0
        for <ath11k@lists.infradead.org>; Wed, 19 Jun 2024 07:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718807973; x=1719412773; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cokph3+KYsFeNsm+0akdDgXIRf+sbN6W33vmdBN3BV8=;
        b=nzlU7fQNNOM1Z2Pf3nRH/IJRQ6JQpsOBve66VHG3M/4W4LeFUnCpE75zcpCiRukSiJ
         0uTmFBix5uXQegzDd14NMUI9AXElb4KJwD75oVQmEYm2JFe4Ap22Stoe1IqDymTUBjNf
         4RtVKHHBlXP6aUNmjP+J0ewlJWuhYLomA2kB6uUEDyLAxl4GutaCJqnj+fxdrT2tml8C
         KEuaVqPhh5XTh3HeemRswbkvnRh7A/MPSHCSX+mYALj3SKaNZxVZz9SXsZUqBfZyAfKT
         wCaM5wDtpAXhmi3FNMtkIVp9HhdyfYCn8RMeQIF27/RRkA8X9aqEZOntdcWRWz675/oF
         Dp5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718807973; x=1719412773;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cokph3+KYsFeNsm+0akdDgXIRf+sbN6W33vmdBN3BV8=;
        b=p75Purb2WGkgDGiwBDN91QFsJmpLbqhH7s0mAFm33vKgwddrlw+3IXHb1YshM04QKk
         gkuxyro1V8gYsOhq9B+mHE8AvKC0NBfeNhNjAksiwL9KCXo2rDkQUqFjKjIsJJ79BeSc
         mltUKaJLx9eqjpZb4MFis8BxLeKV9oZTrFhH4Ncru568Sx9MbzHhLJW3G5USjDZHROTf
         IM9jAQ/8r0XTUr5S7YNcub4l7KY5Wdxy0aeMer/9K0kEe2cfDhDscLXcFPCwTicJN694
         boDLFks7baDqC4zs5YnMxWSJZhaK1FplVgf3pEZKyKtMrzcS+s52QmOKqUpcliTt5LwN
         0hrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhWa/D8RBwa3Fnu+9McMoIuB9ooj7YtrKsbzaJlg6qbtudqKPrpuD1jRkVTYJBshE0rqRihzG4jBzh2LiwzKRU4G72MuR9u8k/KQ==
X-Gm-Message-State: AOJu0Yxc0mBjOxucA4bzNnsW6cz0bsN7Of3e533jfkciI2qJ7Hxof32X
	F7D2DVrqSWz481aw0thsk4dS+S453VTawviadfza5et5RHNN3NhqVUAP3DiIyFQ=
X-Google-Smtp-Source: AGHT+IG1XaOP45+fSUMkTGWH4nocXjjMBFeSWjsksr0Y1tefBQYZu2xLsBBhuOT4sOfHsJbLjtz4+A==
X-Received: by 2002:ac8:5ac4:0:b0:440:5b49:2d63 with SMTP id d75a77b69052e-444a7a76f5amr34714511cf.66.1718807973466;
        Wed, 19 Jun 2024 07:39:33 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-441f2ffb37bsm65405151cf.90.2024.06.19.07.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 07:39:32 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sJwTE-004dqv-Em;
	Wed, 19 Jun 2024 11:39:32 -0300
Date: Wed, 19 Jun 2024 11:39:32 -0300
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
Subject: Re: [PATCH v3 13/21] soc/fsl/qbman: Use iommu_paging_domain_alloc()
Message-ID: <20240619143932.GH1091770@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-14-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-14-baolu.lu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_073934_935309_1053D65C 
X-CRM114-Status: GOOD (  11.20  )
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

On Mon, Jun 10, 2024 at 04:55:47PM +0800, Lu Baolu wrote:
> An iommu domain is allocated in portal_set_cpu() and is attached to
> pcfg->dev in the same function.
> 
> Use iommu_paging_domain_alloc() to make it explicit.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/soc/fsl/qbman/qman_portal.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

