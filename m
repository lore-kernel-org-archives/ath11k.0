Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF5AC25B50
	for <ath11k@archiver.kernel.org>; Mon, 23 Jan 2023 10:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gZAe2S+wT4JCO2SPBgD7z7ht1rS5o9xIL3no1SDlB3o=; b=Vs0MkjaAIcjCXZ
	GivdC+jRaxKyfZveZoZSOj7g5k7cSGzL6owTBu4BJXXT4wXVsfMRzvfTfe0LGZ8ynfNcQszQQDJcX
	Fv5R3v/SUNuYSQClXtk8h//7yBLcQBc72+Xre7sUX0/zNxLb89gRu6fpZRT5IROKh+9s6CjLuQ2du
	dljCMometqoTvEZGliQmhhkxbtxLHXsy9TeZ5HWWnP42lhZJOlo/R156D/t92bAvGkqIhBwktWEkX
	meqH8/x9HC8AevN4NsWAVq98F/scMHkDkaEWF/KDbDLnPwEvRt9pDolH3kxbOUW3LkUCBqFi0scla
	A22NTw5QZ5VsMHDJtvQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJte4-00Gdwx-JX; Mon, 23 Jan 2023 10:01:44 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJtc3-00Gctm-Nh; Mon, 23 Jan 2023 09:59:41 +0000
Received: from 8bytes.org (p5b006afb.dip0.t-ipconnect.de [91.0.106.251])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 9A316262C2B;
	Mon, 23 Jan 2023 10:59:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1674467975;
	bh=0KQBObUcnpg5GrqXq3hC5RyjGf2zS6TIXg2zcVgFWn0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tr3JGNsZMXVI480xgKW5iIBnC2CS9vyEqh9gWSstha079Y/cRMHa9gi+uxnReHb5d
	 fwek2sY7wwUJnFwFFwIvWemH12HdN0YbgdSZ2RWwC0269UqDUwGwB35CRDyXhq60AT
	 USyIwI3wP05/5oGtUOpS94M53A08jNcPckKA5ZXpZIPRaNJ96Q+BFkTkmpgSNGCPm5
	 YogHT95t/tBdYhxC9Y35A2TokJihCUBd4VwOl8Pa35zfKfyCatWPy6AY7P+apvfw5a
	 T/W6TQnG+GLz390G6KRQWUX8KnoKg77Sxn7JUzcugID6/sS1m397rjmidCEXxQK2Lj
	 1j8HX1fY4eNAw==
Date: Mon, 23 Jan 2023 10:59:32 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	ath10k@lists.infradead.org, ath11k@lists.infradead.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org, linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org, nouveau@lists.freedesktop.org,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	virtualization@lists.linux-foundation.org
Subject: Re: [PATCH 1/8] iommu: Add a gfp parameter to iommu_map()
Message-ID: <Y85ahCk3sRTVAU8O@8bytes.org>
References: <1-v1-6e8b3997c46d+89e-iommu_map_gfp_jgg@nvidia.com>
 <4fd1b194-29ef-621d-4059-a8336058f217@arm.com>
 <Y7hZOwerwljDKoQq@nvidia.com>
 <Y8pd50mdNShTyVRX@8bytes.org>
 <Y8rVJGyTKAjXjLwV@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y8rVJGyTKAjXjLwV@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_015939_942978_01EEDE88 
X-CRM114-Status: GOOD (  14.64  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Fri, Jan 20, 2023 at 01:53:40PM -0400, Jason Gunthorpe wrote:
> > Well, having GFP parameters is not a strict kernel convention. There are
> > places doing it differently and have sleeping and atomic variants of
> > APIs. I have to say I like the latter more. But given that this leads to
> > an invasion of API functions here which all do the same under the hood, I
> > agree it is better to go with a GFP parameter here.
> 
> Ok, I think we are done with this series, I'll stick it in linux-next
> for a bit and send you a PR so the trees stay in sync

This series mostly touches parts outside of IOMMUFD, so we should follow
the process here and let this reach linux-next via the IOMMU tree.
Please send me a new version and I will put it into a separate branch
where you can pull it from.

Regards,

	Joerg

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
