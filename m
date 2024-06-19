Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98DFC27C53
	for <ath11k@archiver.kernel.org>; Wed, 19 Jun 2024 15:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FK6SjWXdq6bSAPX1rh4xTRaTP0djMJZM1guOyU6PPog=; b=gZJ9g2wAF1Mb8pdpa9tbeu+f67
	bS5XCuAX5y0tBfuJ2RClqLcnQndBRPnclMvZzgeeRNfizsut768qJzcKfS7VbulrJ7zzzSo0cZmbo
	g+2B9ctllmt/zwRxElGzjR2wVNfWvdMWZ8uedKyMPZDRBWRanXqWdr8LVh0E985kEZDk7CbyzD+KE
	S+xHzVENSIWsZ+zBp4DfErcfMG/IgrNgILQFQ9vRUN6kLUu/8F0OInM5Ix1WrWHS42A0GbUuvlETt
	QawrWP3z+LDeJ+FkbKVHE9asQT5P11UaBxdvTghL0X6l/JDvVXCcJr4LnMUdTJ4wWG5DHxivIMP+P
	UdtLRhuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJx1E-00000001lEq-21up;
	Wed, 19 Jun 2024 15:14:40 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJx1A-00000001l9x-1qc5
	for ath11k@lists.infradead.org;
	Wed, 19 Jun 2024 15:14:38 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-5bacd59e562so3338155eaf.2
        for <ath11k@lists.infradead.org>; Wed, 19 Jun 2024 08:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718810073; x=1719414873; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FK6SjWXdq6bSAPX1rh4xTRaTP0djMJZM1guOyU6PPog=;
        b=Z+4v9S8HRvo+aDyN2N9oZD+/VolQGHMW1Cc3ppOev2Wr39zemKo4UB9S1lZEOFDV2T
         3y5DevpxW0vkJ6YoN8t+98PeH7unL5569lxplx4Ki2XNkBCcejpwWBK2BYJNHpblAgbw
         0a5QWhD+zCHBX1nKwKM/68raMaqIEnx30lRo/uskBVPhqWEtynTdIjIHVfxR4CItIJbE
         0bpSUF8UvF+eAMQOpTMfvbs6KRdfIut007/MVEPDK1TAPdsxisWo6IVvc/X8ZO9dzJQC
         yIC5TYy8U1GHLwzaTSx7dyc9aJ1hg3VkXIEThXL6nG2KBRcj72ceLoXVs2HCH7HzIQ4d
         ivOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718810073; x=1719414873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FK6SjWXdq6bSAPX1rh4xTRaTP0djMJZM1guOyU6PPog=;
        b=hBoG8huqq8vGTmPzEu6nIrR4Q4Cu7c/MJjldV+wZhzF1ZfV+5U98ZMZD8mdfpfaOTv
         rf2IS/57gtgv3b6+YuXrPuCQ4TnzhruHYdPvtqTtK2dCeLjebNJbsW7H88IvfbD/CSO9
         HIo74XblpeFnSMCpiApwNe89Mhrl2nRo4V/3wO4ZLHOmXAooRmiJCxxjIh2FjFW1WtLn
         Psa4o0RiYkWOGlUekobFNn2lWB3Ntt0R92fFy8FB08xTuXxatukWaYfDWnzzOttPzygc
         1Ih8JAPVYiZFkuIbeWvUq/9alSbCseu6o1zZHNmWbIAENrpct2ydDcAp7r5HjTaVU3E4
         mCIw==
X-Forwarded-Encrypted: i=1; AJvYcCW3KKHwLf7rxsPeNDhwjq/U1QEVIdr3DCEnZrfnUai3dhpeg1SV4m/5fUZRCqFDksgLDt51FXpauZ65ZAqj96IrV/yZamHAcgMw2Q==
X-Gm-Message-State: AOJu0YyWd3zsZExD4hURK+3BUb9gysNwnw9NPr644KtMRNLRlFOU08sJ
	HsF1SLO/GpEZuIYa4cwawna+pFn/bV/tLk7tCQpYqhb9shWhsXCgZyKmZ6u2524=
X-Google-Smtp-Source: AGHT+IEfWtO517AiTmrP1W6dPNlAON8bn6xv/7Wv+S6voiPx4xyrmyITXKPZjbJGoypZCOWemcF1Kw==
X-Received: by 2002:a05:6358:6f11:b0:1a1:cb05:243c with SMTP id e5c5f4694b2df-1a1fd5cdffcmr360413155d.25.1718810073496;
        Wed, 19 Jun 2024 08:14:33 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc068sm613342485a.34.2024.06.19.08.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 08:14:32 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sJx15-004nig-UU;
	Wed, 19 Jun 2024 12:14:31 -0300
Date: Wed, 19 Jun 2024 12:14:31 -0300
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
Subject: Re: [PATCH v3 20/21] iommu: Remove iommu_present()
Message-ID: <20240619151431.GL1091770@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-21-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-21-baolu.lu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_081436_614047_332B1700 
X-CRM114-Status: GOOD (  10.07  )
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

On Mon, Jun 10, 2024 at 04:55:54PM +0800, Lu Baolu wrote:
> The iommu_present() interface is no longer used in the tree anymore.
> Remove it to avoid dead code.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  include/linux/iommu.h |  6 ------
>  drivers/iommu/iommu.c | 25 -------------------------
>  2 files changed, 31 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

