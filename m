Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247B5C27C53
	for <ath11k@archiver.kernel.org>; Wed, 19 Jun 2024 15:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qq78ltb5crvWyLzXIfnPlOkoWYmn1e4oCmMdRELkiuo=; b=1g/LtoqK/R2JgDLfLPiJjC01gZ
	P0E8MvwU9r2jFz3Ob52HgIEfQCpOBRpmQ+1+MhSr8m8Cn9jtleSZPXkaJuw38dk6DaQ9hDZIirSYY
	nrB8Ue+fAaX9yN1XgxwDttI0ZnYviw9dRTyo6tjRryxMLet4JUNDFtUlXyiTI1ZDXpcQjsYsCuuuq
	vNvi68tB+lKHAcGl5UYHFpshi/OIR75c7Jo5ipEc/L+0caJl9QmDRuw9rYnNsbBLEz+jDztgZUdP5
	zE8E2QM/+WSTeHmFwrkWI+TyBg04CMDD1a+/cAV/YMTfpJA7YnFzIF+TdmGFX5aPO5iKJOU5rxFJV
	H/6SEifQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJx0x-00000001l5I-28mJ;
	Wed, 19 Jun 2024 15:14:23 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJx0u-00000001l1n-0aQw
	for ath11k@lists.infradead.org;
	Wed, 19 Jun 2024 15:14:21 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-6b06bb80d7dso33112766d6.0
        for <ath11k@lists.infradead.org>; Wed, 19 Jun 2024 08:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718810059; x=1719414859; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qq78ltb5crvWyLzXIfnPlOkoWYmn1e4oCmMdRELkiuo=;
        b=o5hoUX60wQUzCNqwXsiDB6VsdQOlUe+eeCWy3WDjVQWMV1qLk2d5RegYpg0Lqwk1vU
         q7rewfislX2jGCsmH766ATPHBrbju6abrLjnaIWwFswSkKRNjcWpyKZpkKAE13lCcDCn
         BMPViob3En+167EvmwwnBjeqy7XkYuVkXJfPHH4Kh5pqoLhqWFh5ebOzEGyQDrdRa341
         U3EXr45puXw+E/Zly/39SldMGd2hFlb6LX3p//mCGt9DUUI6TwPcW8cOQqLhMEuGJ3L7
         gbPl5KRmYN76/15BMUiFLvb7KxEu8iOlH3ZXqnbCaTGPIa8XETwm4Pn8tMwNIgtI9dVZ
         ciDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718810059; x=1719414859;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qq78ltb5crvWyLzXIfnPlOkoWYmn1e4oCmMdRELkiuo=;
        b=Yn5tzoyQvaUMkLJpbd3Yd5dGgTG0OdRDisMJTVzUO9nrOjEqQ0Jw8Lnx5YgWB33U/V
         5cWBG2n07lAFHPsiltUkD7r6RMiT4cKJNWqUvSqVb1+KCRXnCBWSXE1pO6flZjtlTJ+r
         RoRRr8y/Rkpxmjq4Yejw3CW7ETeCvtcxythfLXFfW15ml50w8d1qphSsxLPErnCCj+tz
         4O6pNezlvBk6R7jtk/+llWxglMbwydW+/HsgRZFIUGDECkQonFkdxTF0vPuneRelLzRO
         h0o91gH5ETIGBPCfIwNznwxW/zRseUyldVbi0b55ebJibghn1cbAXoDeLP5Z2bE9AuHi
         fhHA==
X-Forwarded-Encrypted: i=1; AJvYcCUxv1Wkh2sTTG8G8X9GenRgnoR0/XoVI5fOkLDeRYEtk670u2wTSQHauwsUoii4OlPXkVNfAnGUknBVHy+5OBwrTUj/VuA0Kb13Jg==
X-Gm-Message-State: AOJu0Yxx+FPma08Zv4jjyL48ZXFlZAILh8OFt9Me8gr6QNz3BcpdIMLK
	O/4eWFywygD8hiZa5ThBQ+sFPC4IwGqJveGxzD9ih5bic4FoNcQTHahp/tP46wY=
X-Google-Smtp-Source: AGHT+IEOeuPwNQG30sVHkXguHikBPl0Zz6A9LkZtMX2PCT+BlXopyE8xiWNkdljzVxC2GPEBoe42EQ==
X-Received: by 2002:ad4:4bb0:0:b0:6b4:ee84:905e with SMTP id 6a1803df08f44-6b501ea4245mr25964686d6.43.1718810058700;
        Wed, 19 Jun 2024 08:14:18 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b2a5c113b3sm78372256d6.34.2024.06.19.08.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 08:14:17 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sJx0r-004ne0-3e;
	Wed, 19 Jun 2024 12:14:17 -0300
Date: Wed, 19 Jun 2024 12:14:17 -0300
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
Subject: Re: [PATCH v3 18/21] drm/rockchip: Use iommu_paging_domain_alloc()
Message-ID: <20240619151417.GK1091770@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-19-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-19-baolu.lu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_081420_201215_8E66A26B 
X-CRM114-Status: GOOD (  10.18  )
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

On Mon, Jun 10, 2024 at 04:55:52PM +0800, Lu Baolu wrote:
> Commit <421be3ee36a4> ("drm/rockchip: Refactor IOMMU initialisation") has
> refactored rockchip_drm_init_iommu() to pass a device that the domain is
> allocated for. Replace iommu_domain_alloc() with
> iommu_paging_domain_alloc() to retire the former.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

