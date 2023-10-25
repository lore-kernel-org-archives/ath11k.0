Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42880C25B6F
	for <ath11k@archiver.kernel.org>; Wed, 25 Oct 2023 12:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GKjWvfOn2PiHiu62wgy/bWjOzNBfcymEcWRd5X5kANE=; b=XsFVaH7Yms2t3w
	8idwu6KH2nVLClwKp8oqIT22VRFqrZhB1X1+XNH41bIcRdSjdguDyvnSjUG6kwWUramFUq5BDHmcY
	a+xasUH7shGSebuPFtF3+/HPQixWYELK+q8Ona4gBBEX7ZFw3I6mWFPXpSmnvVaJc6OhNJA+m+6AE
	CZ6U37pe/hUG61nrQVCw0dqIKoC5vlGInXsJ+SdHE2rG/0kDWuWoU0eG9bXhpD3B/EMpkCcpSbDEf
	zvJv8OPmDgu81Hr3eyNdA8RtKj1VCVxZEA08NSMXDzkP3EZDN1QdeTIY8EwVkKYx7ZZzgq7z36Ze/
	Xs1vgfpmPk9i9UTVwfXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvcxq-00CIgt-0F;
	Wed, 25 Oct 2023 12:26:22 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvcxn-00CIg6-0q
	for ath11k@lists.infradead.org;
	Wed, 25 Oct 2023 12:26:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1044ACE0B52;
	Wed, 25 Oct 2023 12:26:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3611AC433C8;
	Wed, 25 Oct 2023 12:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698236776;
	bh=cHUrccN7fXiRcS7yUlCSEnQli9FvN2GxQnGR+MMlk0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hBxMFi5IsvHNJCRE7uT3jxIgh7tHwPqhCVKKMkprmCadTtQn/Y4mEAB899H2sMsyW
	 6FN51RHaR1chZR0mBRKFomGQl6XcTEDwAD7Ap+MnSO8GQ7ZIzEV6oRAoly7KYOuXO4
	 kkb2mMNcHkv7muHwjWdrZMXF/TpJ+iQL0ZVbjGOdKzYlz7F7ANRQbbj10/PmW2tQlu
	 BrmRvpq8JBATmhnwzBKa60FSicSy8xdrlESvCvzr8ae7fLQ5MwfSE6PXIgyibqFfgq
	 EVwgsK+XUrKpGPt/zfdp4JbUjW8FZiuwRiYjxSy+Uq6b0kzG4p5Pg2QUvLFCzyULJ2
	 tyVV4YKYsJM+A==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qvcy4-0006F7-15;
	Wed, 25 Oct 2023 14:26:36 +0200
Date: Wed, 25 Oct 2023 14:26:36 +0200
From: Johan Hovold <johan@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] wifi: ath11k: fix temperature event locking
Message-ID: <ZTkJfGhCRpy9ESth@hovoldconsulting.com>
References: <20231019153115.26401-1-johan+linaro@kernel.org>
 <20231019153115.26401-2-johan+linaro@kernel.org>
 <87sf60xgs8.fsf@kernel.org>
 <ZTfUswqVkAgJvnye@hovoldconsulting.com>
 <87bkcnxc6p.fsf@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87bkcnxc6p.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_052619_472385_95083521 
X-CRM114-Status: GOOD (  12.13  )
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

On Wed, Oct 25, 2023 at 12:51:10PM +0300, Kalle Valo wrote:
> Johan Hovold <johan@kernel.org> writes:

> > I hit this on the Lenovo Thinkpad X13s and I guess the tag should be:
> >
> > Tested-on: QCNFA765 hw2.1 WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> From ath11k point of view QCNFA765 is WCN6855 so I used this one:
> 
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> > Note that I've only been able to test the ath11k fixes (not the
> > corresponding ath12k) and I only tested this particular patch fully
> 
> Thanks, I added Tested-on to this patch 1 and for the rest I added
> "compile tested only".

Thanks for fixing that, I'll try to remember the Tested-on tag next
time.

Johan

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
