Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA98C27C79
	for <ath11k@archiver.kernel.org>; Wed, 19 Jun 2024 14:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3LZUM5jfj4JrQADb+518kXqO9JR2q1Dki1G0Ben/yk4=; b=2ZsgLioQHCtM0oRGO3Zoa1fVgB
	//OpdnGok0PU8hqLzpCewwek5/at8klepdGbGmY3DhM4WxWHVLCPMJWbX3bNbTaXvJhAuhsbyDq88
	6ckfzkAglE+5e/MhUtQQWlwU3SMHXJLohURb8PTKUHWsrsmA0D3xJE+TI5iAHWy3Sqooc1pkXyigE
	eSWfDUTb8y3M8i9FCTzVRoie1jyJ3fcKDybcrwWENrH/d2bi3sBfPn/MrrVOxSj6GCBwtBq6FuanK
	xQlkfTwJeKWt+mytrlxOW2D3bsbA0+Gc+YHc4i1YWgS0uJbP3Cizh9tVYGw8c6qPv+LtO5rSK07xo
	kv29nB2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwM4-00000001Y7x-35T1;
	Wed, 19 Jun 2024 14:32:08 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwM2-00000001Y6C-2wKW
	for ath11k@lists.infradead.org;
	Wed, 19 Jun 2024 14:32:08 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-6b50a68b0b3so3543196d6.0
        for <ath11k@lists.infradead.org>; Wed, 19 Jun 2024 07:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718807525; x=1719412325; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3LZUM5jfj4JrQADb+518kXqO9JR2q1Dki1G0Ben/yk4=;
        b=AfjPusuWn4sIzY4YFQBfsW7+eJZwdG4r8lCD7cDxAigHeGfnCGGSb/w4hiMFLVYkm7
         PSUGggJi3oa1UMlIrKr7pZmZ3buteHZcq36gGOiygIXtn7gPT+h5eYq76KRZN1tmTFFX
         HbpadvPSobXOuZK5yoHTh0Ys538sXMQG2XQWHirDlnr1ZGPzr2Vy/IVgw39zOh49atW1
         3j7+d23fIlEykBFEnmpVjmA0eVgz/I6jUrAFagL0SX/us1x4XwpGqH2et2kT7cfiKCK8
         bk1lUPLgx3nT/YzOfO+biYgWnG4H84Jp+m81JPdTqylpmlaz+L9YAg2q46CK/ytGYHoe
         Sqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718807525; x=1719412325;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3LZUM5jfj4JrQADb+518kXqO9JR2q1Dki1G0Ben/yk4=;
        b=hmOJN7SdhNUgdkCnMLH2Nw6GMCgB9WAkSkxNeI98SV6QZPd3koYFc5Lk6QtirV6n5p
         9dTkiLvVdgPvEfTfMhK89A2clKhukHJgcMQv7jxmvUqS9dl1QT1a10omGGDgZz+Y6p5h
         aJfEuF/P3vNWyoo0zXNXb0hz3TLua4QhVR+ohAb+2OFyq3VdlMMFIamJtGvMNEJT4zQx
         Z5ZVRFBDZAvmK/x8cCvZLfGSJbo0enop2u4CJU4KR0AWHCpfnk+0dV9+25/iuGp6ed/i
         t8Ummse4WbPopZ1Lhhd9EN4fxxo2yi7RGV2gYp25lIsithPz+2yNEhoW9Dfdwqt7lY2Z
         VceQ==
X-Forwarded-Encrypted: i=1; AJvYcCVH7b+OhuysT9cxxWF91ud5/s3V76KWZrZ5e/fwrBSvgSkh8D5Zr0NtwhKtMSZpUaJnPOXYLrXTUZEqblfby6m4sWt+uAb8gH/f4g==
X-Gm-Message-State: AOJu0Yw5XJAcd0Ox5lFdJyZa23z7hmCDIBs/FSZnP9m9FPtb5Pu2qWpF
	2uxoynvj6WD5MkdJHGOivXSG4fsv0+qnQSh5gkdr53o8jDVhcXh7lqGBUEJW3kY=
X-Google-Smtp-Source: AGHT+IGuQBogl5nnCa0xO+oPgBraH+EqrP6Ubhg3FSeuAcnXv1sZiKKYgQ7jm2DbFVYX9xP9hURczQ==
X-Received: by 2002:ad4:5f8b:0:b0:6b0:72ac:b306 with SMTP id 6a1803df08f44-6b2e22d60bdmr86925786d6.1.1718807525299;
        Wed, 19 Jun 2024 07:32:05 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b2a5eb498bsm77913746d6.76.2024.06.19.07.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 07:32:04 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sJwM0-004bip-ET;
	Wed, 19 Jun 2024 11:32:04 -0300
Date: Wed, 19 Jun 2024 11:32:04 -0300
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
Subject: Re: [PATCH v3 09/21] media: venus: firmware: Use
 iommu_paging_domain_alloc()
Message-ID: <20240619143204.GD1091770@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-10-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-10-baolu.lu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_073206_791729_28610893 
X-CRM114-Status: GOOD (  10.49  )
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

On Mon, Jun 10, 2024 at 04:55:43PM +0800, Lu Baolu wrote:
> An iommu domain is allocated in venus_firmware_init() and is attached to
> core->fw.dev in the same function. Use iommu_paging_domain_alloc() to
> make it explicit.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/media/platform/qcom/venus/firmware.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

