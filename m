Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A45C27C79
	for <ath11k@archiver.kernel.org>; Wed, 19 Jun 2024 14:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oXd93FB8mW37LRaoaeih1f4UeSXMaaR0S6po9oPAKCU=; b=c+CKzVTmjy2aW8BHqIRPKxkZlu
	xXS4HNsF4ebhYk36aQnk/qvIPGUlonG3xVJHx0GkVLXLJKr1WLvq+1N0j7Fii3gX3QPG/p0RlgXbb
	+PfHCDcNb+KXw9mEtvqk0T0uZM+9t5oXxUW0KBlrsTUrMTSsSSC8Wu7cIUkwinY7d+alUZLZDWIJL
	7ToTWnnDt/IRD5MM/G9m75Qg17Wwfv8hg8kgzS3R36BU2GDj5G5jF5FnGbt0SCPfHmZQna9dqVRxa
	YHBTD9Q5LBK4M8tZ+QVpGbCw5i+mhSJDMI43VuBg0VuzVWMiypRXhG04PENkBVsJiXaYiG2hxDLtW
	pTKHpXJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwBq-00000001UqI-3iIu;
	Wed, 19 Jun 2024 14:21:34 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwBl-00000001UkF-1pzD
	for ath11k@lists.infradead.org;
	Wed, 19 Jun 2024 14:21:31 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3d22378c59eso3897052b6e.1
        for <ath11k@lists.infradead.org>; Wed, 19 Jun 2024 07:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718806888; x=1719411688; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oXd93FB8mW37LRaoaeih1f4UeSXMaaR0S6po9oPAKCU=;
        b=R2PD0LmrbIAyoYOLJ2mWkSAWm5PMHzh7piq8XF2ANkOa3Ql5WpJWn3x4y4kSR++DmH
         HKqPlcqEj/2Xj4kl5hE35cYqF7WliGTaPEXfBu4atfwSCTuDSyRPJPS5l5vvyPEeKTZb
         3X6nOUIhWk8Ubqc47NTwTTXQXOEsfXYXqvA6sdGOHtgiJLCWBYiuXDNfDcG/hbDckeGU
         ff+4e5LVHk6bwBpP7YzPXHboVtDrifljH0FfDPqHjyF8JCgX0zkEelGQ98240O6wPfhr
         VGvxw+rAcrLXgA5bphkNGDRbu6Op43kZ9AOTjsWFQoP6HEnIvnsEqvEk8SgkYnaVy3tV
         qy6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718806888; x=1719411688;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXd93FB8mW37LRaoaeih1f4UeSXMaaR0S6po9oPAKCU=;
        b=TA0Yy9M25eFiEYINnvI9W99XNV9RzAZBLzMK41QUngiSh2AJV5cBeCCktJ7dg0x+EM
         xPg0DTvzUtSq6GzVanYVO+qJ/ydP/Xm31NPvDHY5tRnDMFQ8UeiWlUlW3RSSr9d6IkHg
         FbrLrzEiXme4CQHGhJS6CeTZzCZ0crSJHt429GPn0xXZsYYopXlIj1YVUA3S8AxFM9l4
         ZWKKh3CAgZ4KAAShyP2AqFP1/eUalj2Fr1ku2O5m2Tsspdjv9XlHlO/zdE5qSyvXXQru
         W5RULOAsrYvk8QsSNQ31sif1nQ5mPVi4VDlXGyM3EaxmYH+TGjy08Rd57e4UyNqUU9Gr
         oEKg==
X-Forwarded-Encrypted: i=1; AJvYcCVYA9GQU3tmGkWdJGqZX0WZcLD8wxpk27apetJIw1RSE4mAxmEfiP51FyMTcK85o7JVBjUfPqsZOyKmSf2LqkCnPY1vt+Q9I4DKOg==
X-Gm-Message-State: AOJu0YzPbxCR0JQUBDXTfdV3S7FgWzIeX5n4xxZTlFJkExUc5zFPOctd
	SbJp/r33RgHV9s40H3hnuOk1hicCJDqWDvILuWSFzscQM/zkmZW7BjTABYWi17w=
X-Google-Smtp-Source: AGHT+IGeUQCBPT+VgM+BpkPpQTiytNsNv7t22Ffuk+cASd5EIDo/hVSa+fwqc195JPldb8qsFYSfsg==
X-Received: by 2002:a05:6808:188f:b0:3d2:29d6:fe8e with SMTP id 5614622812f47-3d51b962118mr3218240b6e.8.1718806887789;
        Wed, 19 Jun 2024 07:21:27 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-444b3aec088sm454201cf.62.2024.06.19.07.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 07:21:26 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sJwBh-004YeT-Jx;
	Wed, 19 Jun 2024 11:21:25 -0300
Date: Wed, 19 Jun 2024 11:21:25 -0300
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
Subject: Re: [PATCH v3 03/21] vfio/type1: Use iommu_paging_domain_alloc()
Message-ID: <20240619142125.GI791043@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-4-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-4-baolu.lu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_072129_821138_60104D6F 
X-CRM114-Status: UNSURE (   9.43  )
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

On Mon, Jun 10, 2024 at 04:55:37PM +0800, Lu Baolu wrote:
> Replace iommu_domain_alloc() with iommu_paging_domain_alloc().
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/vfio/vfio_iommu_type1.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

