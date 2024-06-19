Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4073C27C53
	for <ath11k@archiver.kernel.org>; Wed, 19 Jun 2024 14:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6pJIKfjLvugpNiyWUPkn81xpwGb7zZV1Mhqp6qTkwpU=; b=ZdSzWAzwlKVkiJKDPN+ciZCfC1
	TC43AzUnzgW3qg87im/kUKh7azjOnIvN8baavGU9dRif481aTQ11GqEqApCh40gl60pTTnOdA0lmR
	oe8FAVH9d+0J3Iek9TXrFdLwG0kY8rmNOG7s5OT/412HtH6NCjG4Lampjy+fx/nODTzgH8t4Q6Ykj
	MC1QItq5zzsaYyJMzsC70bcT9zIrjyitt1yq2I8q5Dafg+zRkGbyxSowC6PMCMbDvJ6bwoowd3wIa
	UIZ3033NDSW+4UgRNZnl+TvVwx/jP/wUiuR8oMJH1uYE5GgfazBjWKWQfT0YDX6ZGTTAn2j/cprgo
	UcybuuUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwRr-00000001b4E-0Tl4;
	Wed, 19 Jun 2024 14:38:07 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwRn-00000001azX-16gp
	for ath11k@lists.infradead.org;
	Wed, 19 Jun 2024 14:38:05 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-440581d6a50so34653001cf.0
        for <ath11k@lists.infradead.org>; Wed, 19 Jun 2024 07:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718807882; x=1719412682; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6pJIKfjLvugpNiyWUPkn81xpwGb7zZV1Mhqp6qTkwpU=;
        b=gEDGJ9mN7xtXaXIzIYMU72Zw6tfJUEfXCMrlnwGIQgMWgQ/i9g7SO7Yn2l0eMn+8Pf
         pgdjQ/so+vNUFcAwvHowzkpAMCGhRraFv5jxAxayKSfJIBWwXxdRSgm1xqQtyucCUsF6
         /wM/DVyj6EwyqFGMmN7a5bSQbxaBgdoSB9JxO/il9Lugdq7NbLgVtssZvenQnEFEy0Xk
         oAvlIQw3RLuqk4IKfbQw2UBUlnrzHrJXsFuOvVUOxMHo09FubdBWcKoyR5Qoa1goPphw
         6l+am/QRRrbrXBz8FLIO/FInP6/scz0242IlKZM5yIhVhRKMzi+izJzfyS1iADslswxa
         ddmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718807882; x=1719412682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6pJIKfjLvugpNiyWUPkn81xpwGb7zZV1Mhqp6qTkwpU=;
        b=ljkOC4tNebkZuLzUW8K/DPMr50sqLTB+ih8k446i52qIxDLIk/G6rvGJct3FkPGOPY
         6JnYFtDXBOa1TOJNRr83HAVki5xFGQrtZ46BWppOuQNzOKiUYC15t5sYQpCb33AnQS/Y
         CpgXHyJd3lahhMtT8ITrG8M8NibzCUOGNHNv24RKG1NlWtvYfFK4F1r9wlQUzJFw6UPM
         QSh75E5MtM+D+DenP36A2IqDvYPjKJxjvAbnXPwW37LNVS46v/QAeCBtq6/H4KCzFHV+
         CUgbA2EGpwk8pZLOrLdYFqzoOIQWhIaCtW/IYEwGu+BVVq+ASh5/sMrLPe1B/f6ffqK7
         bnCw==
X-Forwarded-Encrypted: i=1; AJvYcCVjFfv+CT0n0daUEs9AmjRgFc3v9MRnlpPXciqe+g8WZlyrMpUUGoyfRB8lsA9IWYpJ30squeZL2m3Zwbvk9Grg0YN601oOC0jbiA==
X-Gm-Message-State: AOJu0YyhJhv54uWgg54cvdNs+eQc/4b7gpxYr4MsyeOD3FvDvdBw4BX3
	Lbb+Gh9mxDi4CblZDliTo+UwP2jAV/5QZaJN51aAeoSkUty0ZC9PwHGs0dFodeY=
X-Google-Smtp-Source: AGHT+IHTB/lZ0M/byP4dE3kOpURatwyTsEaDzd7ugkc+m0b4VPnnl9e+XLcLWm6PxgGLzUpaixUT/Q==
X-Received: by 2002:ac8:5896:0:b0:440:645a:a209 with SMTP id d75a77b69052e-444a7a49c90mr31210081cf.49.1718807881767;
        Wed, 19 Jun 2024 07:38:01 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-441ef3d89c7sm65749961cf.20.2024.06.19.07.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 07:38:01 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sJwRk-004dPo-Se;
	Wed, 19 Jun 2024 11:38:00 -0300
Date: Wed, 19 Jun 2024 11:38:00 -0300
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
Subject: Re: [PATCH v3 11/21] wifi: ath11k: Use iommu_paging_domain_alloc()
Message-ID: <20240619143800.GF1091770@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-12-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-12-baolu.lu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_073803_470598_8E804A86 
X-CRM114-Status: GOOD (  11.42  )
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

On Mon, Jun 10, 2024 at 04:55:45PM +0800, Lu Baolu wrote:
> An iommu domain is allocated in ath11k_ahb_fw_resources_init() and is
> attached to ab_ahb->fw.dev in the same function.
> 
> Use iommu_paging_domain_alloc() to make it explicit.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath11k/ahb.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

