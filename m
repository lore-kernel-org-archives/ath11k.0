Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41831C27C53
	for <ath11k@archiver.kernel.org>; Wed, 19 Jun 2024 14:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=41x36+E2nhusvTatiAF8IHTdsL8WdLUPppc5CYA4l6M=; b=LhfY3inX254pLP9cAWK74E//V6
	CEkM4lsSahEjQPT9rpty4UPqJYplzoY8Lh8RDO6QUeYIEB98zrEWECWKw95xKlxuIhBthwQ7cwUn2
	MsJEfnpwtIKCUz6wIay4/kdEsMgLOh7FOKMiWe5y+OUoqHkYTIv1sbC9iMTgy4xr7O1dUCGN05l/b
	xziLNeIUCCslyhd06q6VPezOC59dDiuSnTmtYyma9P3nFIX8JwSws5VtjNNUlKS3U3NhHhzNWw3wl
	WV38gyC8nj6xiW6CZrP6lk8mmFgb4R4r3yQb0pHYNYVaUoO+5kGSy615p5CkiMR8emuu6tcNdS0Yp
	toy1S30Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwRb-00000001at5-2Atp;
	Wed, 19 Jun 2024 14:37:51 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwRX-00000001aqo-3YPd
	for ath11k@lists.infradead.org;
	Wed, 19 Jun 2024 14:37:49 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-797dcb558ebso426138285a.2
        for <ath11k@lists.infradead.org>; Wed, 19 Jun 2024 07:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718807866; x=1719412666; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=41x36+E2nhusvTatiAF8IHTdsL8WdLUPppc5CYA4l6M=;
        b=WodYc+oDCgY7D9A5QeYmiMCjcdCcJwGZMkq7zXfvw4h0Ph7KxzioVe85ugdaNu3eB/
         tQwxDaIkFX1Yy4u6mF+ufav9Ypcy4Sb+vpGFm9CdurGKNBVMaybjUv+qSsIzu8B/zlue
         WojN09r85K3+YY/KeNhbup/9aIWjwk4nhYZR0O/gEhcH3x6usL33Tswcew3jKEzg4i86
         rsM3HZKa5jldjBPrtnEtxGneCx/1Ekfr80hqL1Qr0Kyjmc6AguNoSoFisn4iFvQsTACh
         H1iG2OO4/RzuyA/b34khxcXjenM8VlLLiQAbi0EilOJFl2JUSpzqMXTD9whKpai2VGas
         RUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718807866; x=1719412666;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41x36+E2nhusvTatiAF8IHTdsL8WdLUPppc5CYA4l6M=;
        b=m5+z99Ozk9kdml+WPrVKiF3PVOmAORzFie+bNoeNQCUSKOgjhYekBtBIlHjk4pB/Kq
         U4Os+5PDXPhdZRP0F1w8RxlfDQkxC8hhpPJnG48z1D3GAbJ+9TGdd8SSSQRumwhNqfaA
         8jlwf8UgpTnU61kFfIFY+nhzIGRyZ3IXz3p/zaX6VbOq/9qudgMITmdtxCcGmh/hxEkI
         GDenKoBqK40LDsQDGxRtA93XbOyxckuiVkbXo+w6e5Pdpf6qnSvBoSMvZZVxHHom3htb
         CjZPWa84bF5bY6QqiKQklj9oM47rmRrIYm6ZYTx0t05toQBTsZ8uPBnu9WQ+CG6+j2ZM
         SSCA==
X-Forwarded-Encrypted: i=1; AJvYcCUDHOOJe6njavQGT9AxT9AZR7MFRYCaJXKAS0DRwzWs03IHByu7RvzxJHpexCoUikhUTBBifTOrMD0h84IadJeRs9mU2jf+8zibNA==
X-Gm-Message-State: AOJu0YylvWbh+3MNMmZ0LLQ5wL8z90vJNF0QqK6kUHe7cbiumaRVDy6Z
	7riO61yX1jN4EFsvQaFFpCKzyap75HR9b5NOJKFHoTKzUxXPk85FEU4Zj7B/trw=
X-Google-Smtp-Source: AGHT+IEcJxNrliYdvuzlpiDb78QsThSHkvJcrlo7MFvwHxPiUc2KNP4DZqSrOqcyX1HTz8934IoI+w==
X-Received: by 2002:a05:620a:4044:b0:79b:b8ef:160d with SMTP id af79cd13be357-79bb8ef1b2fmr197306985a.32.1718807866220;
        Wed, 19 Jun 2024 07:37:46 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798abc0719fsm611398185a.83.2024.06.19.07.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 07:37:45 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sJwRV-004dKe-BM;
	Wed, 19 Jun 2024 11:37:45 -0300
Date: Wed, 19 Jun 2024 11:37:45 -0300
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
Subject: Re: [PATCH v3 10/21] wifi: ath10k: Use iommu_paging_domain_alloc()
Message-ID: <20240619143745.GE1091770@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-11-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-11-baolu.lu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_073747_954537_D986CCD8 
X-CRM114-Status: GOOD (  10.59  )
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

On Mon, Jun 10, 2024 at 04:55:44PM +0800, Lu Baolu wrote:
> An iommu domain is allocated in ath10k_fw_init() and is attached to
> ar_snoc->fw.dev in the same function. Use iommu_paging_domain_alloc() to
> make it explicit.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath10k/snoc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

