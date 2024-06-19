Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A028FC27C79
	for <ath11k@archiver.kernel.org>; Wed, 19 Jun 2024 15:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=moEdRVU3PoPlgPdcVkukT3vEmMSfRXd64UiQM7jDSSo=; b=ys22YZu/qcFTGTsEK7eX2Jy0Dh
	zhcdVLn8xILziSMciKas2xeRgHwkXIEdoPf5J1qbh8CqSvveW1x+P6G17I3OoPKRqO9o8lDVNC07Q
	7uK5Q7ejVp5/HQIosZfNaG/51jOq9J69Hgl+dZ7aOZTUpkBWuw2t7BQv6CFM4yTrfxl+7G+G2b8fS
	SwYbNw7vzZbQOCsbOjJUDjL4GmCWXadSj93GKcQkst/ACRAvkdq5r3aFzsycevH3NP5s8p0/j5TjU
	/Eg9pg1KDowfl+Hxso66NNw4KMzPFwrDjNLKDcwlel2b55V4SvEVFz8b/4NeuOJexJe1Cy+/tLFJp
	9kUvrmcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJx0U-00000001kqc-44cD;
	Wed, 19 Jun 2024 15:13:55 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJx0N-00000001klR-3C0b
	for ath11k@lists.infradead.org;
	Wed, 19 Jun 2024 15:13:51 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6adc63c2ee0so25499756d6.3
        for <ath11k@lists.infradead.org>; Wed, 19 Jun 2024 08:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718810025; x=1719414825; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=moEdRVU3PoPlgPdcVkukT3vEmMSfRXd64UiQM7jDSSo=;
        b=oBzTWITxL94BwgCSPoi2FPMnIKKDybryAe058JPc9bugormqvGdNx68eEwDGieAquH
         LPAAEYV8TlXLAtRHhVnQndinb9QJIwVP3ocT+2fQHvTWAIe5ZxplNJ41THlE78WGcm6U
         dEBiyeGmHd6As31zipeli7BGPTI2UrAkoFwtwL4fGHntCgf5HxJYfdjFhaglTwDBKDHg
         +vYpb1mBJamWHs7AghEYki5lzuZkyNs6mfXODd92t+tHd8OYJF1QswL9XoQ3XxUNDo2p
         aPaZ7EPa464o5zfzwFD26YC0NPp/de3yDedCXpce8Uqqb+Rkh+vQh7OcEcIBT82e2zZp
         KhRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718810025; x=1719414825;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=moEdRVU3PoPlgPdcVkukT3vEmMSfRXd64UiQM7jDSSo=;
        b=quEGqx4d62mL0d+MIQbIi5aZxvwEN5CbIuFOrEwRJ5FH6hODWwJ6GJzU/HFGp1a94V
         W0Lh6AmRTwum6o2QP4Cpr0ryaOhQG4XqzVb3DNUZh4FFc+PBlX07rZ6NX4HPBw43ylPO
         pUixVdUM3/1G9C2yBcymOvvj9Dm3+uiEndzwF7U+FLGEfye+QVBXr3ejZ2TBkiXrIMlI
         DfnUabwae9Y+F68jkaBZ6Cwo5Ya1nKfmxV5tfG/svW0SaakTJM+ODUTFd1wOVfy69SVh
         fbZp3HBLjxSctJkc+e6IpcNbDXxi2vxe6tPTexH6E2epjyuN0BL2vD8trePf1ujyYSLb
         e1OA==
X-Forwarded-Encrypted: i=1; AJvYcCWB/WcTaJyY53PiM/ET40ZFz+O2gUxj61VFKUZ02WKVrpkM1Y3zLDt4bifvswi2H6NxG6MBSbHrr4yanTjm5uCgfKNsKthNF6o8PA==
X-Gm-Message-State: AOJu0YwmXQ1ErDgWoUqiZ7M5FmM/utVcQkzb4jfrOGyV3LaXkaIwuPLa
	9ZMlCAcGdyreczAYbYRulKUkzVMBmY000UyASxQFKrBc8KFMXSx/BMonKkLPNcA=
X-Google-Smtp-Source: AGHT+IEJkRZBkgVagiNpl/OtqoGC4d9ZaTPjOU1+2kFAPWdp2oRDjZmssY8YvGAEYa4O75oAH2+OSQ==
X-Received: by 2002:ad4:5849:0:b0:6b2:b3cd:c323 with SMTP id 6a1803df08f44-6b501d22234mr29977206d6.0.1718810025609;
        Wed, 19 Jun 2024 08:13:45 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b2dea97206sm26986726d6.84.2024.06.19.08.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 08:13:44 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sJx0K-004nTt-3N;
	Wed, 19 Jun 2024 12:13:44 -0300
Date: Wed, 19 Jun 2024 12:13:44 -0300
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
Subject: Re: [PATCH v3 17/21] ARM: dma-mapping: Use
 iommu_paging_domain_alloc()
Message-ID: <20240619151344.GJ1091770@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-18-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-18-baolu.lu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_081347_835936_6A4AB354 
X-CRM114-Status: GOOD (  10.15  )
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

On Mon, Jun 10, 2024 at 04:55:51PM +0800, Lu Baolu wrote:
> Since arm_iommu_create_mapping() now accepts the device, let's replace
> iommu_domain_alloc() with iommu_paging_domain_alloc() to retire the former.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  arch/arm/mm/dma-mapping.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

