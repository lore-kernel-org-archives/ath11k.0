Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2AACC5B543
	for <ath11k@archiver.kernel.org>; Thu,  5 Jun 2025 10:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GW0Qa6Vk79fbK+GLmyhPVBywiKAN9dtNsEqmuYtgBWg=; b=sjs5DBmV3hlexi+GJ1ZFqxs69U
	4r/4J7JoElDU63vBNFsKywQAJmvq3ul3aij4LThGMFN/jgOqIGOUzo9fLUR2Zy/ZaBJ5MsuSVIxaU
	HunpAyfltV5jNagRhFUrjtcrIzwg2V7tngE3AC48kvk/5EBkVaExWqUyrNdIAG8UPV3f4XMgHBx1F
	LD6Vz5ZDqE7kyIPTMSomyEON+IvDIbX/JchJaqmxhyQYpWWaRrylwfulapXz4pvlefkmbyWe7WSDF
	z9PDIS4EM6XiXav0Uh8Slrxi9HYSgGA88+LLwgVA9yOhhCVd9dkHgMa6DLcpqdlx48E+dv9pRtBpj
	m+rN4HqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN7eu-0000000FEWK-1D53;
	Thu, 05 Jun 2025 10:17:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN7eq-0000000FEVz-2kL1
	for ath11k@lists.infradead.org;
	Thu, 05 Jun 2025 10:17:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2EAAB4A7AE;
	Thu,  5 Jun 2025 10:17:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 074DDC4CEE7;
	Thu,  5 Jun 2025 10:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749118632;
	bh=a6T6uy8JJqaAh2fWN1bXbqlR42gQ+U00pJPQTvacV20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ld7ilh3Plwes2xGUoCEz02MwqG898KcFcfG11jtm8kyHH1kG8NVkggqIVftn3lmmD
	 LIeDLh997sbEFy2dWy2hYI/xgoX9tu7RS6aJ+Z4oFWqM/W0aJKYUNJzusO4VVzWMJi
	 jEqaMgMl4EDX5Sq40ALuuQLQ45cqJoZ+i3EGaDYDGux9+HuU6pfN6roylCinu+2+7w
	 oXUT4HblMekgsEr7DNOpXHAjM6GA92BjspXswI+bS/7/2hxINIidtPj6OG29dk/Jpk
	 VrX4HN0XaxkIzi3Pfveui01npJpTFKHLiMDf9xknSUElHazUg6pFo56exbp9hc9T7B
	 Lds+h+lQDVlOA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uN7em-000000000rV-35Nq;
	Thu, 05 Jun 2025 12:17:09 +0200
Date: Thu, 5 Jun 2025 12:17:08 +0200
From: Johan Hovold <johan@kernel.org>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Baochen Qiang <quic_bqiang@quicinc.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/3] wifi: ath11k: fix dest ring-buffer corruption
Message-ID: <aEFupJ_nd9ryaTVt@hovoldconsulting.com>
References: <20250526114803.2122-1-johan+linaro@kernel.org>
 <20250526114803.2122-2-johan+linaro@kernel.org>
 <026b710f-b50f-4302-ad4f-36932c2558ff@quicinc.com>
 <aD1axxSAJsbUfnHH@hovoldconsulting.com>
 <5268c9ba-16cf-4d3a-87df-bbe0ddd3d584@quicinc.com>
 <aD7h0OOoGjVm8pDK@hovoldconsulting.com>
 <01634993-80b1-496e-8453-e94b2efe658c@quicinc.com>
 <50555c1a-c200-4ac0-8dfb-424ff121b41d@oss.qualcomm.com>
 <03354d56-ed21-47e0-a52e-14f559ff3bfb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03354d56-ed21-47e0-a52e-14f559ff3bfb@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_031712_743162_A0D41E00 
X-CRM114-Status: GOOD (  16.19  )
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

On Thu, Jun 05, 2025 at 12:01:29PM +0800, Miaoqing Pan wrote:
> On 6/5/2025 12:24 AM, Jeff Johnson wrote:
> > On 6/3/2025 7:34 PM, Miaoqing Pan wrote:
> >> We previously had extensive discussions on this topic in the
> >> https://lore.kernel.org/linux-wireless/ecfe850c-b263-4bee-b888-c34178e690fc@quicinc.com/
> >> thread. On my platform, dma_rmb() did not work as expected. The issue
> >> only disappeared after disabling PCIe endpoint relaxed ordering in
> >> firmware side. So it seems that HP was updated (Memory write) before
> >> descriptor (Memory write), which led to the problem.
> > 
> > Have all ath11k and ath12k firmware been updated to prevent this problem from
> > the firmware side?
> > 
> No, as this is not a widespread issue, and addressing it would require 
> modifying the core underlying modules of the firmware. Therefore, we 
> chose not to proceed with that approach but instead used the workaround 
> patch I previously submitted.

I strongly suggest you fix this at the firmware level rather than try to
work around it in the kernel to avoid playing whack-a-mole whenever a
new (hard to track down) bug shows up.

The barriers should be enough, but if they are not then the firmware
must be fixed.

Johan

