Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA22DC2BD09
	for <ath11k@archiver.kernel.org>; Wed,  3 Jul 2024 16:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T29v3MqMDNzKMLmvfKJHErvtZBlG75imLBcIldPfbq8=; b=qoaGPFWLK2r16b37lDMdGWsxw6
	XTNd/sliHO7RmSfUGMDhUNXoBwGjPO2ac41aRiNLqsGj9MUrMWKCZ6OS/k/2Kn2Jw5gx5VYMsVin+
	syWou4vV3J5oUkuTg0KRBMlQB+B5cXm0Ep4EHTLl45loHQYHaeOk6/Mv8MfkdViBUEKIR/x+zjIgA
	c4WjSoXMeQkwUYh0zwP3QVlx9iQTlAqveECbDWn8RFNYaKRlt9ugUczMIk+9TqKGPu6Wc5teoo3Ar
	XPQoO21iZu1piQa6y/8iDWT4QRrSfiWDFlB49DzgqjW59G56byC/Bu0VcRr4qYLAQJ9CRD1b+2xlx
	n7R/Oatg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP2u7-0000000Arma-0v4i;
	Wed, 03 Jul 2024 16:32:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP2u4-0000000Arkt-099A
	for ath11k@lists.infradead.org;
	Wed, 03 Jul 2024 16:32:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720024337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T29v3MqMDNzKMLmvfKJHErvtZBlG75imLBcIldPfbq8=;
	b=Qx7GC6/ynqSOZCB6YvarnTIqZoDnojeaZOenF53dv7CKW3pgENvpBMrUesxcYiBGS92ZMF
	c2wiDDlk9/ekoRXlaYIw1amH1q5vYce85uwsDn+PDfaKT6Qrrj3inQQaTEPtKcXZpTuNqB
	ZcRyZIYmEwXRJddR4ww4p7I/0upPf/o=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-i5ivjW0JM22PR-8iiRZ8iQ-1; Wed, 03 Jul 2024 12:32:16 -0400
X-MC-Unique: i5ivjW0JM22PR-8iiRZ8iQ-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2ec72d14876so49609321fa.2
        for <ath11k@lists.infradead.org>; Wed, 03 Jul 2024 09:32:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720024335; x=1720629135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T29v3MqMDNzKMLmvfKJHErvtZBlG75imLBcIldPfbq8=;
        b=MiD5yZoGOqZV7IZdgfqd4jOBPQNVXJj6TEYp6UHMK58y5j7mop9igLXW4GRQZStCqm
         hP/b4E8ZY323vNZ1LoytYJ7/uJTp8djqIaOCBKvYSLYtEWMjbhoVi9cclI7USDQo2WeQ
         5DOsX8Iz6JO/wdgpRb+PmPOP4FpG3AYQn6Kj5cCCg86gsdExQlmFEFsFNI8XFD6n6RfM
         J+dX3tIa43etEmvMsDqxwJHkjQBZPuMBVkDrpbWTNrza0Ywead6xl7gEsz+1COrZQlU+
         R1PiE60fx0SAyJL4ab9YS8DpEEHxnJHjwVTbfXtyTfrAM+/ZZ6wtnaj9eCbqZxZyqOPB
         nDlg==
X-Forwarded-Encrypted: i=1; AJvYcCWAu4oEY0yRE4245TuFGpg4XGoCvz+LVSC1tURtzgakoTFi0aMKZMj8lE/p2ap6OhHcQ37nMlD7k//xnuvYfh5+qKQGy8mY3taypQ==
X-Gm-Message-State: AOJu0Ywfxi+pT0YWoDgGKYii369wldsAidyhj2oa6yRsoZU77+dbHTdN
	H99PUDQwkP+3bpZhgmNWVW+W0vWDa/+oZwP5enubeKsORpNKeoIBAl2bp6zLIOQWOviXZ6XvWK1
	bMtzCYVZlP75c9FBXpVXf88l5/IeerHr1SDIdYZkvOuIrE1be8DOsFDB/LDg=
X-Received: by 2002:a2e:bc19:0:b0:2eb:d924:43fb with SMTP id 38308e7fff4ca-2ee5e6bc6f7mr90933191fa.41.1720024335107;
        Wed, 03 Jul 2024 09:32:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3V7vYkVhH8OJphhsnsxAVWOG21asngpKcdckbhi0zQYrX/jZvvDTcTN6is+OmAjmZQvtD0g==
X-Received: by 2002:a2e:bc19:0:b0:2eb:d924:43fb with SMTP id 38308e7fff4ca-2ee5e6bc6f7mr90932111fa.41.1720024332354;
        Wed, 03 Jul 2024 09:32:12 -0700 (PDT)
Received: from redhat.com ([31.187.78.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af3cff9sm242324535e9.3.2024.07.03.09.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 09:32:11 -0700 (PDT)
Date: Wed, 3 Jul 2024 12:32:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>, Yi Liu <yi.l.liu@intel.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Kalle Valo <kvalo@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath10k@lists.infradead.org, ath11k@lists.infradead.org,
	iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/21] vhost-vdpa: Use iommu_paging_domain_alloc()
Message-ID: <20240703123146-mutt-send-email-mst@kernel.org>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-5-baolu.lu@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20240610085555.88197-5-baolu.lu@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_093220_189084_4A0799A5 
X-CRM114-Status: GOOD (  18.49  )
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

On Mon, Jun 10, 2024 at 04:55:38PM +0800, Lu Baolu wrote:
> Replace iommu_domain_alloc() with iommu_paging_domain_alloc().
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>


I assume it's merged with the rest of the stuff, right?

> ---
>  drivers/vhost/vdpa.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
> index 63a53680a85c..e31ec9ebc4ce 100644
> --- a/drivers/vhost/vdpa.c
> +++ b/drivers/vhost/vdpa.c
> @@ -1312,26 +1312,24 @@ static int vhost_vdpa_alloc_domain(struct vhost_vdpa *v)
>  	struct vdpa_device *vdpa = v->vdpa;
>  	const struct vdpa_config_ops *ops = vdpa->config;
>  	struct device *dma_dev = vdpa_get_dma_dev(vdpa);
> -	const struct bus_type *bus;
>  	int ret;
>  
>  	/* Device want to do DMA by itself */
>  	if (ops->set_map || ops->dma_map)
>  		return 0;
>  
> -	bus = dma_dev->bus;
> -	if (!bus)
> -		return -EFAULT;
> -
>  	if (!device_iommu_capable(dma_dev, IOMMU_CAP_CACHE_COHERENCY)) {
>  		dev_warn_once(&v->dev,
>  			      "Failed to allocate domain, device is not IOMMU cache coherent capable\n");
>  		return -ENOTSUPP;
>  	}
>  
> -	v->domain = iommu_domain_alloc(bus);
> -	if (!v->domain)
> -		return -EIO;
> +	v->domain = iommu_paging_domain_alloc(dma_dev);
> +	if (IS_ERR(v->domain)) {
> +		ret = PTR_ERR(v->domain);
> +		v->domain = NULL;
> +		return ret;
> +	}
>  
>  	ret = iommu_attach_device(v->domain, dma_dev);
>  	if (ret)
> -- 
> 2.34.1


