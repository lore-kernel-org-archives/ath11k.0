Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B470C2BA15
	for <ath11k@archiver.kernel.org>; Wed, 19 Jun 2024 14:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eIX8MgTBAh7QnNhNTPIeyUxRJPYUCCcH54QxTjKMhwQ=; b=3Vch6nyTJmIBYHy9qkDGdJMiNo
	g42RkxXSMQC+arQc7YU8Fk3pvQxMHi7dC+YR0e7HqFzfp5oMB6oWXhoQgIRMmLCrr36I7xUcf/Ktw
	lFzrPOqQVqVzN3FBpst2aQ7cMrR1/UfNF788DTVpN/hz4GQmy/UQaD7y+BbrKPibtqIZ6FlkuQ1RZ
	1ZqnmaQeVTNOeISdDDB/eMr0AB9Yrta3T2ZeLA9l7DQhTRo4gnv2/Ha4FbgSHd63B8VWaK4jUNTEA
	A6Lor9Qr/TIvHOSYzxre7vZs8TrPJ2rc+SY1vW8MTsnSzHGUl4yX9xVX67hZMi0WAsNQHFJx8uCKn
	cer1P9nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwHq-00000001WfK-0hmw;
	Wed, 19 Jun 2024 14:27:46 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwHn-00000001WeT-1lbK
	for ath11k@lists.infradead.org;
	Wed, 19 Jun 2024 14:27:44 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-79550284502so386748085a.2
        for <ath11k@lists.infradead.org>; Wed, 19 Jun 2024 07:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718807262; x=1719412062; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eIX8MgTBAh7QnNhNTPIeyUxRJPYUCCcH54QxTjKMhwQ=;
        b=NFu3nMsxEaRYxmkuH9Otep3dAqpk3S3yYGXd3AMzUQZRN94XSePiCgMEIdZX5wNK9r
         JAgCwI9aBnshXcH061h9NN3IGJEIVdCnjZ8CyJXYXnnjawz9+JdKLp1TUB6RV5WtOODu
         j35co0RqGNLfLigSw3eJypioJvRKn4THKJp33ecU+ZhSjIE3OTuytXOEqaD3kkzuJy4l
         SLMOoKJ50sjqVT9Q6GCnVjNYUe3DP8UKrtX7XKa+ygqj4Z7qIXsqvnqPiljzYf7YwpTX
         fCNo3CFBXzD6S3qPsrczI1UA+ey6KZdrCBQM0hUEK0ujHQOuUmGVuAWCKGrAvEqmeams
         TDiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718807262; x=1719412062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eIX8MgTBAh7QnNhNTPIeyUxRJPYUCCcH54QxTjKMhwQ=;
        b=Dn5KWYnY+lnHAvGFoifRzt2jIb/rS1EuX77HRpUMLEwe1BXutG+OxRLUFFDVQ85Q1i
         V2afrkIFQYP5igiOEHB7zZj0DNcrYIAMK6wg4KrNjAzky6UMiTILzmPnfIgxMcyDEdF0
         XuvNEvSQiSK73cewOE1hRvH2Hwpj/zLg8/Yx7fDhRFWoBl081iXD5PfLszjYUrRJ11I7
         n039zAo3dPr66VcGrBWzQUesCbeiz/DCJJaxXw4BAOrB0loWhXGdTjFQjfgQ0vlUi2M9
         mf7oWx5NsqI6Uk+6Da/O8FAokt7+/j1ZjD/GuUJG3OlS8cw/iQ3juedU1lmk8bLFJmKY
         k+8g==
X-Forwarded-Encrypted: i=1; AJvYcCUpFrlouZsjuglUQENnLfWzNCP6eCLiJTwqmbDKcvDZszFOsLTgKwtnRxHVF660m/UqhMoyeYJuScKz8Yq/YK2VvdCixOrzGMS2nQ==
X-Gm-Message-State: AOJu0Yw3s0ENICRHBavWND25ptOWaPYNLmp6+ecVP3z49SWebbW9A9sf
	+uupxbNZF/syLi5UIPUyTMgNtYvG58fxl5JOwfoEGNzNgXLxntllt/+W3oey4uk=
X-Google-Smtp-Source: AGHT+IEeEBRvNzwpSD8Fs1Imp5pVXlsQQfg/ZiA1zsRiN4FF/aYn4Gxlj7EWTGzB/0ufExiA5d7ZKQ==
X-Received: by 2002:a05:620a:4450:b0:795:507b:6dac with SMTP id af79cd13be357-79bb3ee2f81mr279621685a.75.1718807262304;
        Wed, 19 Jun 2024 07:27:42 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798abe279a8sm609903885a.106.2024.06.19.07.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 07:27:41 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sJwHk-004aSD-L0;
	Wed, 19 Jun 2024 11:27:40 -0300
Date: Wed, 19 Jun 2024 11:27:40 -0300
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
Subject: Re: [PATCH v3 04/21] vhost-vdpa: Use iommu_paging_domain_alloc()
Message-ID: <20240619142740.GA1091770@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-5-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-5-baolu.lu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_072743_479499_866DECFA 
X-CRM114-Status: UNSURE (   9.19  )
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

On Mon, Jun 10, 2024 at 04:55:38PM +0800, Lu Baolu wrote:
> Replace iommu_domain_alloc() with iommu_paging_domain_alloc().
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/vhost/vdpa.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

