Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37A7C27C79
	for <ath11k@archiver.kernel.org>; Wed, 19 Jun 2024 14:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BsT9hgFyZbBGkde271aluLYZILHDBPNQg1gpCGW3N38=; b=FTZF95aX3u52qRyE4UjMBmPpOF
	1EFuU12PkBVqb0BMIuaUBjwumX2zeC6nG6JFzAuCR0CE4tQyJ8wz6nvE+PAKPnxmxlQ2FAyL6jHKS
	oVZk3U+ZX29F7yJixWlPAsuoRR4otbr5hWUuHuk5tzUDKENcBaHiIYRHzHgC71Rkyz/j4q1fl0Au/
	wzqX8frhEhKG05FOzLs28og/s0OJNte3k1t/2/U5rFp6k8GVYE6uKoQgnnwv5mka0VEM139HjrHo6
	o8lQvw8HqSb7+j6usHmZK2QWbEbKSF7yUOGIJWFDNoMClE2WsrNmh6SX697oH3BwEtv1xjU/5y6/v
	Bja+tXUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwLN-00000001Xo9-2Hk2;
	Wed, 19 Jun 2024 14:31:25 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwLI-00000001Xl7-3l9c
	for ath11k@lists.infradead.org;
	Wed, 19 Jun 2024 14:31:23 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6f9fbec4fd9so3887281a34.2
        for <ath11k@lists.infradead.org>; Wed, 19 Jun 2024 07:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718807476; x=1719412276; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BsT9hgFyZbBGkde271aluLYZILHDBPNQg1gpCGW3N38=;
        b=XbKRwxBSkXf3e5bb84Z0oKh6bQ7mZVUyxxxfpzVG1L6ukKsczwF+VpjKkCR+NrKNuy
         k41N26VyzejK+yQX6++0yhdSuzsBaToaXvmfcHnP68tXhzyw+iL/ndUw13HDrRCbkVUJ
         NWZTJuFwGmN02cVQDiOXt+mguBby2XG6ivDKQ18pPWGGAnMPZhLBr5bq7QaXyeEO5YZz
         rFTSNiB01+OWJjCkJrnZl4AKPfoFX05iOH0fECXa8yiGXME9hr0mzHyKWhIMG6Sw581H
         I9sN7QLuyFVdRldJMfIw7/lOxjV+fWyUB6pqdtDw86EIiZZa55yi4NuZBi1EZOfx4Jgt
         k1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718807476; x=1719412276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BsT9hgFyZbBGkde271aluLYZILHDBPNQg1gpCGW3N38=;
        b=iIJeefj3h6ezxPxhiVXhfXZ7BpqhRWaDztuLyQMLWL+8o+3tr/IebUjp0CiQ1NE6dv
         jnU6xKWvjEeNCrEAtgbhTlEnMVGoU7cg2he2p86XMfl4tTHx+TNnBtAER/75vV2+eQpw
         r7uK+dMMH+UyPiaQKXMxrmBMl4mXjBB5r7PcvM/TuJ1AFyord8bOPEEZ3GRnHuEtCY9f
         ktPnY9Ib2Pp3PLY1+2AixgfhEywoS59wt1Ydegp/bkOkEsDE3V0WCjZGPuAiKmSwqkN5
         rWJOHCA6N4a7VVcXCh8zP/dk7ny/58gwV20thqPULhxo6LqA91Cb8d6Ur1XEMCtJgQQK
         l01Q==
X-Forwarded-Encrypted: i=1; AJvYcCURdXLZ0eZ82zXrOc09Uwd4kTDFxxilad64avDK1CT0lSiGcUPuuPpg+oaqMSP9pbbMJYFNMEuqYLuW0oRnhRfPVuBaTbrcEtL7oQ==
X-Gm-Message-State: AOJu0Yyy6cN4SoZlsI5ZI8bACRqpXz6KW9gjjCNWjD6pwsHITfhJD3OS
	w3x3J0x4kM/IR+Zm6LOEHkzRRwN+xQlnZ9vex8KoRCpH3X/fJhlt4yyQbSRTYWs=
X-Google-Smtp-Source: AGHT+IHZayxzfwc1KZvF4t1SmwGVNV6P/gZQ5Mo6uiPN1/R0ej17zeeigaD/qQOHMYxQZ4opihlAhw==
X-Received: by 2002:a05:6871:592:b0:24f:ef6b:353e with SMTP id 586e51a60fabf-25c94d106f7mr3066372fac.36.1718807476505;
        Wed, 19 Jun 2024 07:31:16 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b2a5bf23f6sm78142956d6.8.2024.06.19.07.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 07:31:15 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sJwLD-004bUT-Gm;
	Wed, 19 Jun 2024 11:31:15 -0300
Date: Wed, 19 Jun 2024 11:31:15 -0300
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
Subject: Re: [PATCH v3 08/21] media: nvidia: tegra: Use
 iommu_paging_domain_alloc()
Message-ID: <20240619143115.GC1091770@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-9-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-9-baolu.lu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_073121_471618_A4667BB3 
X-CRM114-Status: UNSURE (   9.81  )
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

On Mon, Jun 10, 2024 at 04:55:42PM +0800, Lu Baolu wrote:
> An iommu domain is allocated in tegra_vde_iommu_init() and is attached to
> vde->dev. Use iommu_paging_domain_alloc() to make it explicit.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/media/platform/nvidia/tegra-vde/iommu.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

