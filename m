Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79663C2BA15
	for <ath11k@archiver.kernel.org>; Wed, 19 Jun 2024 14:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7eSifi9kzw937hBs9m+vGjWLDbN4rIVu8qbt3p8ubO8=; b=MuUDU4QJVuG5Bt8Oz8K8E/hN5i
	MpFOyhvmnU79TWEkSRF1dDiQAgpWqgbgCt5GzeMwBpP3o4TzOFGwKzAXAoqlZJGp6iXT6qRg+XdEd
	BLqSoCyXY7CI4jAOw+9xFpHTFdBY/UU1Kqv67zwSLhGXFmzC2X9ARYB/pqWg7YZR3erhhMyqzYPax
	F8jnToWaj6vimZHnkitqJUjKQPsqQigfmwpWCyNN9UaYg2j27SleS/uQ+bHqEIy0tWhzbcBivnWvp
	Fe/XB6xhPk8wpd9fIcVUAlp9Wl/Q9TK5bJW0IT5Sy/he/wrJUEu/oa4iVApvpMn5c8Osw/d4aEkUB
	V7J60YVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwSH-00000001bKY-00RY;
	Wed, 19 Jun 2024 14:38:33 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwSD-00000001bHf-3V09
	for ath11k@lists.infradead.org;
	Wed, 19 Jun 2024 14:38:31 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6b2c6291038so7633586d6.0
        for <ath11k@lists.infradead.org>; Wed, 19 Jun 2024 07:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718807908; x=1719412708; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7eSifi9kzw937hBs9m+vGjWLDbN4rIVu8qbt3p8ubO8=;
        b=n9V7AkHYFC5Ph/k3p/MFE4BbXbT77Wju/6QrrDl8wmBJq4EvuccRX6zbIw229qRn0P
         L7fWTzVtGp2bawpq5SXJIlgnyibjdvxvOV3rhqh+mmp+bz3YcYOSY0e424Co7QOU0woi
         SyWC8H/WxRvtK2t8U7qALNle1nTKdmAALWY7D41zQoKPS/ck2dOsukZkytU2Rf+ia7Gu
         XAQt1M/TAOvWg8EjpDbaU2d1McCiWxtDIUNI71iWAk8XMt6SVlSnb9kgVqfA68i8ZYRa
         leW8LFVsV7TiNReXwKaKg/m/WiUq+MXKthsbEzALBq8znjGC9M67NEJNa7ItrQ1b8Y3V
         J4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718807908; x=1719412708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7eSifi9kzw937hBs9m+vGjWLDbN4rIVu8qbt3p8ubO8=;
        b=VVCJWp2/BoNrQWQ9JYDaU2DlU2s5aYIBRvAIn+YMgUEqAKj6CiuRZ7swFfKc2Zf7Bw
         bkk97kHsnDfuptPsvXwsEY4bfnBQc/LJPcvYfiIhYj75EQ4k2EQz1Idtni8gZ/mB1qLU
         ydNfx6dqh9tKjlGJ6zce01zpQ0tjF7HQjmcy7TxfMHbDV5lBtbmIq8vcvUAhvnZDLeUt
         ksoK/bUQoQEiRVF0QZ/kaLEDmSxiASOBm3dUZVnE5TzLKy2zbZymTq1D6qkTj4sB2WRF
         FayEqhwBxUu0L8l/QzHO8hFLVBQ7c844vFTFtTpqAsf7ZH0v57LJQpo+n7XhmuZLoRnz
         b7BA==
X-Forwarded-Encrypted: i=1; AJvYcCWVyU6jvZHzOIiyPcr7hOjHHBkOF3k5lalxlJQxZVw91ZWzbDOt67cLBAWbW95OqDutghvjViZgwa/NVDAxJ33vWTHImsGCW3jwLg==
X-Gm-Message-State: AOJu0Yygq49A9cIYr9iUsUN0IQExKbGkYsk6V5tGVdHg5yYlFx80d8gl
	NfTcjZO7Y7R5dSsziqPoMuTbYEqZabdyMj4G5b45oeqi0c/5vLWeFQ+RvFMRT3U=
X-Google-Smtp-Source: AGHT+IGZSB/Brli4dklvGSX8RN5hj5Xa3TKJWnONX5AltWqs8DK5Wub0LYx6UoNFdFIIjbi83LBDQw==
X-Received: by 2002:a05:6214:124c:b0:6b0:8991:a2f7 with SMTP id 6a1803df08f44-6b2e230ec57mr96370946d6.12.1718807908248;
        Wed, 19 Jun 2024 07:38:28 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b2a5eb4f4asm77884476d6.98.2024.06.19.07.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 07:38:27 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sJwSB-004dXU-Dy;
	Wed, 19 Jun 2024 11:38:27 -0300
Date: Wed, 19 Jun 2024 11:38:27 -0300
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
Subject: Re: [PATCH v3 12/21] remoteproc: Use iommu_paging_domain_alloc()
Message-ID: <20240619143827.GG1091770@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-13-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-13-baolu.lu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_073830_024101_8666F646 
X-CRM114-Status: GOOD (  11.10  )
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

On Mon, Jun 10, 2024 at 04:55:46PM +0800, Lu Baolu wrote:
> An iommu domain is allocated in rproc_enable_iommu() and is attached to
> rproc->dev.parent in the same function.
> 
> Use iommu_paging_domain_alloc() to make it explicit.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

