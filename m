Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C67AC004D4
	for <ath11k@archiver.kernel.org>; Thu, 19 Jan 2023 11:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v+q+9t8UfXMX/xLxfeSuv7nKMG4tbuwbTOWEmakrEYg=; b=Fb+/nQIhI3HFet
	MCrcVrmSZahYVsQ9+5SnToXQ6zYGok2mTsb+MvhviCGeEsyewlj1EqTxEcgLSU97RnJwHMb0RMxsO
	4JyXExBCI9nEhDCNOFIXUPXM1RmK9bRZrmidu0OpSlLIcbVzwCZKX4SpyuWCQx47ZoaUQXKxy1t/d
	n966QqIUZNsZ2voIjjufke10eSQjFpFW79e6ok+gUg5v/0jpPzjdfuhmEVb3vmdUTTlPfehgCOMk7
	XLLp+2I1L6UF9KvLZQE6MvAPKikMwkqFblkkuV6EEbDFmV+a1TXcGvZsNMf6oK/YGFwSRIqlpX/qG
	EIR5Ha3ni3IZCuRbKyYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pITZ0-004gyI-Iz; Thu, 19 Jan 2023 11:58:38 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pITY3-004gPE-MX; Thu, 19 Jan 2023 11:57:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674129459; x=1705665459;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=OOSuI8Ptgbyop0bHqYWl6Cev1ihhKUlYoWWsszEriiM=;
  b=S4eSRqreChhxjLKV0pF553MLzwDKQ1UPx5NvsrG4IzMpeTcxltsHoi5l
   4PU0pcnYm6aJ8uVxVSRwlRf2rXnA2j0zLoxwM0BjYsm8rav5zV7PWklEt
   OoJWFF6NJMusuZRsk3SGlcgTzJUTy/wS7PSzhkM4+5C0UeUcxOSI6b+hU
   oPSPWAahh25yROlpqHwbPzFVWxwJP5F02tEO77vNZMcnpE79zcN/rroBC
   Hg9//miQXCGC2bJqBTWhPUSflx0toYaUraeHjurRSsw5umF/q06622qoZ
   Ip+U1X4NoAEbbhxYSg/9s+KAuDUHa1KyQrNB9R2pDZpId7lEYdItxpu/n
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="305637392"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="305637392"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 03:57:29 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="692393155"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="692393155"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.252.185.248]) ([10.252.185.248])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 03:57:23 -0800
Message-ID: <e44077a7-e275-4e34-b7ad-3e1382ea974d@linux.intel.com>
Date: Thu, 19 Jan 2023 19:57:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Cc: baolu.lu@linux.intel.com, Alex Williamson <alex.williamson@redhat.com>,
 ath10k@lists.infradead.org, ath11k@lists.infradead.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 nouveau@lists.freedesktop.org, Niklas Schnelle <schnelle@linux.ibm.com>,
 virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v2 07/10] iommu/intel: Support the gfp argument to the
 map_pages op
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
 Kevin Tian <kevin.tian@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <7-v2-ce66f632bd0d+484-iommu_map_gfp_jgg@nvidia.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <7-v2-ce66f632bd0d+484-iommu_map_gfp_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_035739_838266_C4187A47 
X-CRM114-Status: UNSURE (   5.18  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 2023/1/19 2:00, Jason Gunthorpe wrote:
> Flow it down to alloc_pgtable_page() via pfn_to_dma_pte() and
> __domain_mapping().
> 
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>

Irrelevant to this patch, GFP_ATOMIC could be changed to GFP_KERNEL in
some places. I will follow up further to clean it up.

For this patch,

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
