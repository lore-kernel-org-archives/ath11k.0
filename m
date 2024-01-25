Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162AEC47422
	for <ath11k@archiver.kernel.org>; Thu, 25 Jan 2024 16:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M1F4mrmiC01J5V7YRQdBfdqTZ8iyhfPBw81+LlMJyIg=; b=ejskttHkAlOGcMyI0FNAARoYVZ
	zLwpsFJ1yuiZ/WygQ2c1+kEXZFrMYLZyFsq1ix/TwN66pkpSyaaT4Tc2nBcl4Q791v+OGEbPNaGoZ
	Pd4/HUiXoLAHHK9+d0vPhx31WNSTI31qTs7Mp5T04K2z767bh5t/HS69C6weYBQ/0Sp2OWTWLs4l3
	mF241nIx/j88yU81NDdPgDSfBSnLJh3zROYwwqX8nKe5SIJKC8GW9t1Fdp/GkAVTxGXR5R/Hb+Bm9
	0a4NpFtllhd4eFU6z4ze0F7wT0gosn0ZC4DSaYUphsiwNxFseiRGgqALW/LGv+IyJ2rwrbSfClzKq
	4gDE7v4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT2k8-00000000qiM-0O1N;
	Thu, 25 Jan 2024 16:38:20 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT2k4-00000000qgM-2YSe
	for ath11k@lists.infradead.org;
	Thu, 25 Jan 2024 16:38:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 710D7CE3427;
	Thu, 25 Jan 2024 16:38:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41482C43390;
	Thu, 25 Jan 2024 16:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706200692;
	bh=1k/fOt1ptdKUqxoEp0Ten5ndypjM0YAoefKa2pgGH3w=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=qKeRe6LtfgZJvDxbAqW8UF+UB/zyDAW2TlnRuF6N0oHJSEez8m0DeJsRCkBO9dunV
	 mAZjUiZbDz3nbMWAzceSffz6zlf63vMwKEMZhmmM/B7lKky3ILlDLkc/C3IMnS2fiQ
	 G/4+j/nSGAnH/Jm9FX6tkBNBh7i9R53vcNsxQYnpmd6W7r+mxGiwnodG0shB0+Jdnd
	 2qe0qslG7ksAjw2fA9xuK6MZRlDO14LaLtPSzO2XOVW6iPo+5kAd035GkJcnq3Pqlj
	 0cwaqtY/FMy4BeaCC51Rdv9pzC3ffTMCeDmCvQE0KbpfJty4cp/HT5Pwmpx7IVLUYM
	 wV4zuk3t3DB3Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath11k: enable 36 bit mask for stream DMA
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240123015201.28939-1-quic_bqiang@quicinc.com>
References: <20240123015201.28939-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_bqiang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170620068905.500647.8187957964143425904.kvalo@kernel.org>
Date: Thu, 25 Jan 2024 16:38:11 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_083816_884088_3592173A 
X-CRM114-Status: GOOD (  13.26  )
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

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

> Currently 32 bit DMA mask is used, telling kernel to get us an DMA
> address under 4GB when mapping a buffer. This results in a very high
> CPU overhead in the case where IOMMU is disabled and more than 4GB
> system memory is installed. The reason is, with more than 4GB memory
> installed, kernel is likely to allocate a buffer whose physical
> address is above 4GB. While with IOMMU disabled, kernel has to involve
> SWIOTLB to map/unmap that buffer, which consumes lots of CPU cycles.
> 
> We did hit an issue caused by the reason mentioned above: in a system
> that disables IOMMU and gets 8GB memory installed, a total of 40.5%
> CPU usage is observed in throughput test. CPU profiling shows nearly
> 60% of CPU cycles are consumed by SWIOTLB.
> 
> By enabling 36 bit DMA mask, we can bypass SWIOTLB for any buffer
> whose physical address is below 64GB. There are two types of DMA mask
> within struct device, named dma_mask and coherent_dma_mask. Here we
> only enable 36 bit for dma_mask, because firmware crashes if
> coherent_dma_mask is also enabled, due to some unknown hardware
> limitations. This is acceptable because coherent_dma_mask is used for
> mapping a consistent DMA buffer, which generally does not happen in
> a hot path.
> 
> With this change, the total CPU usage mentioned in above issue drops
> to 18.9%.
> 
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

dbd73acb22d8 wifi: ath11k: enable 36 bit mask for stream DMA

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240123015201.28939-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


