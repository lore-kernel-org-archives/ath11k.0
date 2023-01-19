Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5CAFC004D4
	for <ath11k@archiver.kernel.org>; Thu, 19 Jan 2023 12:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j3Vupf5XHziUQCwJ6e9hu+5dKamLrEncHqbCbd8fdBI=; b=ZvH5/ph0K4btQ7
	WwCZqaLOL+Td7kDgNYzhm/TYt5Qs1Z7g3PeGW4Eb101njmSln6E4xCEU92djYmN6VRaX2GOaHTmtO
	tzCohChpUGwz0hDRbOsusM+digg+Ij6utyuhmxTUOGXvBphnQ3SRaoNToeQC29tDD0x4zVke7Mr6u
	jiLnHUTGjgG9gl4emutvXmcLWEb+l+G1U8U8Bi4pQzXgvHk05W5qhgqIGRRDgWCvuwYsHvmi+yopo
	Lp7sBOGUsyzAKxpYCQIOpFGeW6mbQ1d9bpUm6OvEd+RcS9tK8RjoG8tq02L6JSQFU0NDhhAKxR35Y
	m2YSAtCWfi2VV59T75Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pITah-004hvG-07; Thu, 19 Jan 2023 12:00:23 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pITa3-004hYg-PX; Thu, 19 Jan 2023 11:59:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674129583; x=1705665583;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=5iljU3ubicNtm4iB5o/W1SF+gNSsJnJBGq8FDgyaBeE=;
  b=YJ/QlCoT7DYMttgGqDxKeUbQZ6goafNAAym+GFDunyT71aI3R/TK+pVe
   +nsRxsS82HRLRuQz0I08/gXZzzheNKjL9gEgOTwCLY24R7AMcStvOi0SZ
   Pu1GonNcYF00r0HuWA4D2JE0rVkGCFsWzM4mOsWMLChii0mAIwoRsI5Rz
   eWBm5ecYuYDOdLmhQ8xpemdTxznPHMiN5zeL6FTks4Im8lst6oj/AgVak
   DjCMcZEY6mVltK0PhOUDzWj0lcrdXd3zfHf10Vlj+0nB3eDexNtYEGkIe
   vxbP497amLU0nqSW4WJrGtwVfgqoz0aRpvIMkMVhBS7BUBpCj9hoeiElh
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="352522354"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="352522354"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 03:59:38 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="833967799"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="833967799"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.252.185.248]) ([10.252.185.248])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 03:59:31 -0800
Message-ID: <54887e93-22a1-496a-838c-ad6a8b4a830f@linux.intel.com>
Date: Thu, 19 Jan 2023 19:59:28 +0800
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
 <e44077a7-e275-4e34-b7ad-3e1382ea974d@linux.intel.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <e44077a7-e275-4e34-b7ad-3e1382ea974d@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_035943_917921_9677BBF9 
X-CRM114-Status: UNSURE (   8.06  )
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

On 2023/1/19 19:57, Baolu Lu wrote:
> On 2023/1/19 2:00, Jason Gunthorpe wrote:
>> Flow it down to alloc_pgtable_page() via pfn_to_dma_pte() and
>> __domain_mapping().
>>
>> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>
> 
> Irrelevant to this patch, GFP_ATOMIC could be changed to GFP_KERNEL in
> some places. I will follow up further to clean it up.

It has been done in the next patch. Sorry for the noise.

Best regards,
baolu

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
