Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0470DC00A5A
	for <ath11k@archiver.kernel.org>; Thu, 19 Jan 2023 12:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h7xCmr9hf7SlH7It6hSkXwomr0EQTY+j8uJ3XdjIBA0=; b=Jkn6zK8z58X0Nb
	4/px2w9OpEJxbngPtSeRWz5Ga54VjR2UE6loRxmG89F9gwThDad/GP6jfVmxqKeZV5YBj120/R7mj
	L816HTI863FeaBjWcLg+4765BHMXTlAzYSas2X1b1fhefIMxQ+Yxs3jLJ0+cjMb2vwPA56b5ly6ZY
	oBqagqC7+KLaiKTVmUT4nGhpkPwYPfyajLrRRAT0sOJPKjeG+v7RYbheJUNzfAOoO8Ddf0yKNJ9+e
	igsKvgH/EGUsEjB0Bgk+4UaV/Tq7pFQnADg+dhXQvE05/EXOhm5oohr59JfTGz+yn+/2euZbiWuX1
	rgdcMK8sTAm2TaPLLRyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pITcs-004j3C-1b; Thu, 19 Jan 2023 12:02:38 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pITbC-004iBv-Dk; Thu, 19 Jan 2023 12:01:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674129654; x=1705665654;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=a0VAKNGfVX7Xb0tncsnGiNJiQB7rZGtxb86sJ68DmJ0=;
  b=QHbh4XLfvS/rnGBtAzTMDdRD/Sa+On33gT/jZs6n/ibY9Te2C11qOicu
   Dam/RxBqpzVoppl5bEhkXuzqkv0WCvDQXEAGct8a50iIUD1IEJYc8d7G0
   NPN+jC2n8CkJ0u1I7yytWMEJYuoNcAa1MAjj9U6a/MNN9qqL+1jxczMWd
   qwMIG9LM33Kk9dkWvndbMyN6qVjJ4lCsEArlKzBHs16XqyCx8zHy5SaUT
   jqA3GGCOifuqRh3cV1jBB5BCQNQwmi0sa5zk39PgSSiidshebAF26fkhc
   AVdevh0Y/90ffdpT3ym7EkDl3WUElVAz/GVYKx/gG8PrQWtAzNjPbH26z
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="305638207"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="305638207"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 04:00:52 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="692393552"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="692393552"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.252.185.248]) ([10.252.185.248])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 04:00:46 -0800
Message-ID: <4f93e58d-2406-6b29-d546-02f90c4815b8@linux.intel.com>
Date: Thu, 19 Jan 2023 20:00:44 +0800
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
Subject: Re: [PATCH v2 08/10] iommu/intel: Use GFP_KERNEL in sleepable
 contexts
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
 Kevin Tian <kevin.tian@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <8-v2-ce66f632bd0d+484-iommu_map_gfp_jgg@nvidia.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <8-v2-ce66f632bd0d+484-iommu_map_gfp_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_040054_597128_F2B8BF0E 
X-CRM114-Status: UNSURE (   3.95  )
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
> These contexts are sleepable, so use the proper annotation. The GFP_ATOMIC
> was added mechanically in the prior patches.
> 
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
