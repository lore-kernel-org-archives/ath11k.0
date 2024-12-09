Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC37E77173
	for <ath11k@archiver.kernel.org>; Mon,  9 Dec 2024 08:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zpFY7gcoJBmZTHPJMDojA/Pybr8yXqJXMpcfco8Qz1E=; b=QI+UT6ChAr/f3yp1XDtaWZJJDm
	oZjx3iFVuDJwfDaKysnrGs3MpYa2WHcMSi5plJtv5JnSvh1pZdz85h0Yh6fiYbC0wmZ6UlSA53EOC
	Cf8yofyWsx80s/17sXFBoa74JDPDdTO+wzXy3YLdyJaR7YmAJvSwE3rzM7YRDG8St5oJ7sTjvEYSr
	QyeRvITWkv1n3OrXuIzf91/8vnSx1WJwMzy09k3GOkBe1BNfzazHbx3PLA5zXAJipgsEB+qKbAxfZ
	kRjhK5Br3iubjKpAu39PU9L/WUG3onkiD8kfErNTRQlS8wwF4+9qkhTpN9fDGJqxcaVptqkEzjsn6
	72nz0EDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYyN-00000006sTJ-2vd7;
	Mon, 09 Dec 2024 08:18:31 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYxE-00000006sDA-35Z0
	for ath11k@lists.infradead.org;
	Mon, 09 Dec 2024 08:17:21 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 111A868D0F; Mon,  9 Dec 2024 09:17:14 +0100 (CET)
Date: Mon, 9 Dec 2024 09:17:14 +0100
From: Christoph Hellwig <hch@lst.de>
To: Tim Harvey <tharvey@gateworks.com>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>, ath11k@lists.infradead.org,
	linux-wireless <linux-wireless@vger.kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev
Subject: Re: ath11k swiotlb buffer is full (on IMX8M with 4GiB DRAM)
Message-ID: <20241209081714.GA25363@lst.de>
References: <CAJ+vNU0EL3T+GyNAbVbGqYYQ5NM3h7cgAwqxxBMuZjh+-YQ3bA@mail.gmail.com> <1b2ea8b2-6fbe-4118-b6c6-742c8f0be476@quicinc.com> <CAJ+vNU1-OZ3y4p2L+zf64AiVtUv70yZNqkT20jTxyE0_gJb6Jg@mail.gmail.com> <0282be95-9094-4d49-b79e-4f7c976dad00@quicinc.com> <CAJ+vNU32EMHjtchJRb1sODBrUKG2vZW4ZEu1_F0+dCCEjCn7Dg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ+vNU32EMHjtchJRb1sODBrUKG2vZW4ZEu1_F0+dCCEjCn7Dg@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_001720_912990_E247ED4F 
X-CRM114-Status: UNSURE (   6.55  )
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

I scrolled three pages before giving up as it was just quotes over
quotas.  Can you please write an email that contains whatever you're
trying to tell instead of just quotes?  Same for the person replying.


