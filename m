Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252DAC282EC
	for <ath11k@archiver.kernel.org>; Thu, 13 Mar 2025 16:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v3yOKLKxvqnwVWyTJYapj7iEumHmeOq56BxktMOlk/k=; b=CM3WQJ1AebeS394or8PAbtH3Wi
	sWCYLT+Z6utn6lntis2HkIenGCLg/BJjjA5TK2hHmTjFrmNJD+GN+T8ELeVAZqzj7jb2F5WFq8lR3
	d6I7y7s1cQINN5R/acUr58jf/InzfweLcxb63I3/Wh4otyRh+RRBQdR6LP2LcVKgCiXc0ouu2o4kS
	qv1qns5QuX3LvIxf4Y6BszHDE26i+NEB2qB9n/QLI3WY7jcUJfWK8G513JrzhnjM0ED4b03V1G/7P
	A58ZHJTImPCx0H0aNmgOCZO2hWvr8NB4dXyhnDLlAh7mzO/PGkDQvFDd8dGK8VezKqbWUjFSNalIQ
	t+N8WWqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsl2q-0000000BkNf-2Ng6;
	Thu, 13 Mar 2025 16:04:28 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tskwQ-0000000Biof-15ug
	for ath11k@lists.infradead.org;
	Thu, 13 Mar 2025 15:57:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A84FBA476A8;
	Thu, 13 Mar 2025 15:52:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A190C4CEEA;
	Thu, 13 Mar 2025 15:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741881469;
	bh=8xF8Ve++MFLvn3va/Rkql+bAxSWGx5T39bOEbMiYWV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kfygOIBn+MElPBdc8pLT3Y2c7WzZIBn7MwCaeyRVq8JDPiauPA9nRZiYIya9SUAxU
	 /uGdfziFVrBA9My39MJlD4IakdbB4AcT3vpHhycx3vscpZhSpfTIFKdQGRa/eo+I+B
	 mJICM4n7Z9F1wzVsXv7FSgcTjJAq99Z65T5PNPbXuD7kDCAdVfxlzduSa0iICnXkE2
	 IBei5DyA3F1zZboSFbuByEpXXdC8Gre4XW5jp2qNooksCDufLa/jGl3lTxA9cOT0/O
	 GcafZDMAJNjtosrTrQQJkO4+ZYMBl+F+vHFWCNzKKIkQe+ZSJ4PXbHNeZLg+9/h1UW
	 zvUlnzxXZxBTg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tskwM-000000000Xu-0yWw;
	Thu, 13 Mar 2025 16:57:46 +0100
Date: Thu, 13 Mar 2025 16:57:46 +0100
From: Johan Hovold <johan@kernel.org>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, johan+linaro@kernel.org
Subject: Re: [PATCH v2 ath-next 2/2] wifi: ath11k: fix HTC rx insufficient
 length
Message-ID: <Z9MAehaipGtwge8p@hovoldconsulting.com>
References: <20250310010217.3845141-1-quic_miaoqing@quicinc.com>
 <20250310010217.3845141-3-quic_miaoqing@quicinc.com>
 <Z866cCj8SWyZjCoP@hovoldconsulting.com>
 <7b1c5e40-b11d-421b-8c8b-117a2a53298b@quicinc.com>
 <c0cdcaf2-655b-4d22-a949-1519c552e6a4@oss.qualcomm.com>
 <72d95d77-674e-4ae7-83b0-ab58748b8251@quicinc.com>
 <Z9G5zEOcTdGKm7Ei@hovoldconsulting.com>
 <8251fc50-5df4-4a3f-91bf-40c09c33cf6e@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8251fc50-5df4-4a3f-91bf-40c09c33cf6e@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_085750_366483_A6259CFF 
X-CRM114-Status: GOOD (  16.35  )
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

On Thu, Mar 13, 2025 at 09:41:51AM +0800, Miaoqing Pan wrote:
> On 3/13/2025 12:43 AM, Johan Hovold wrote:

> > I've taken a closer look at the driver and it seems like we're missing a
> > read barrier to make sure that the updated descriptor is not read until
> > after the head pointer.
> > 
> > Miaoqing, could you try the below patch with your reproducer and see if
> > it is enough to fix the corruption?
>
> Sure, the stress test is running.

Thanks.

> > If so I can resend with the warning removed and include a corresponding
> > fix for ath12k (it looks like there are further places where barriers
> > are missing too).

> If the DMA read barrier works, do you think my submitted patch series is 
> still needed? Because the error handling is incorrect.

Yeah, it would still be good to fix up the error handling even if you
don't expect to ever see a descriptor with length 0.

But unless the device is doing something wrong here, there shouldn't be
a need for peeking at the descriptor and retrying.

Johan

