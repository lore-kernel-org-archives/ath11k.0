Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D0BC63797
	for <ath11k@archiver.kernel.org>; Tue, 17 Jan 2023 08:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4zWyz+xTZWNTvMZmm0Tdjj8hHN+q9GZVsg3pRHoBz54=; b=R0BE5CpgJHvDlA
	I/2c/O7LymcEJl7n7xIrXLsOKtVKz+ngcS+G17yJsxRzniHl/AKjOMSpw4QDHuEHqxTx/rsKO9hPf
	RSb9flSRIsOXbVLu8u4NtcuK873Q2KS1eGFCtAf6QMraag54RtLLQSwosMjXGwf49uWvC7DrX0n1I
	apEBvnHMvbw48wA2Hm2tpsDTtsBO2PXWOwuTo/XSZ0B3k4xMbZBpxHnaAnZCTXkKuba8Vgd5Lq0Hn
	ePVOyeQjdPWeHQc2DVt2ZSJgKjwXgmnHj3Q2LGLy4wum8L3gbe4qOW/qmjiGHENAlI3WCMwjO+Fo+
	UMYW5xXvo7UQc8Ta1SWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHhSA-00DLFH-1i; Tue, 17 Jan 2023 08:36:22 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHhRx-00DLCI-BD; Tue, 17 Jan 2023 08:36:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673944569; x=1705480569;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+/sep6cg202vL4sr/HrqlldWJYwNCPz0Civ/zJRrPiM=;
  b=WindGijWW1SRfUReVORUbSpeG5K0Iiy3aKXMXe4XGDHbXDHNpW7DY14s
   xuZNOd9d1ddORgijNN7X9PqlqnPJhIB4nMnp6cBAr4CYvFG/EZfFyvdWg
   v6fd8TrZzAUEy6G00G3golRrefHypqW9zTvQDeWeTPcGfUUW7+FCmcCpx
   ivRk67WuFiGQPfDu1HVL5Nqnr7okwx1VBdm/aN+NcOF1+q3Ccz5gfa3iU
   8thDEz4qM0se7CkjGd0d76s+H0akY9aVRJTxjDQlf270Pq+q8BF+Ar4KR
   fyNpvkH5xgew0392aH+MabWSx/OCiXbYlU6s0CmcmOflGbksfHtj/kRZo
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="324696295"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="324696295"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 00:36:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="783168240"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="783168240"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.252.187.178]) ([10.252.187.178])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 00:35:59 -0800
Message-ID: <c742969d-d692-1580-d22c-0f8f3d897201@linux.intel.com>
Date: Tue, 17 Jan 2023 16:35:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Cc: baolu.lu@linux.intel.com, Alex Williamson <alex.williamson@redhat.com>,
 "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>,
 "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Niklas Schnelle <schnelle@linux.ibm.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
Subject: Re: [PATCH 7/8] iommu/intel: Support the gfp argument to the
 map_pages op
Content-Language: en-US
To: "Tian, Kevin" <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Joerg Roedel <joro@8bytes.org>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <0-v1-6e8b3997c46d+89e-iommu_map_gfp_jgg@nvidia.com>
 <7-v1-6e8b3997c46d+89e-iommu_map_gfp_jgg@nvidia.com>
 <BN9PR11MB52765EE38CA21BA27EEA06548CC69@BN9PR11MB5276.namprd11.prod.outlook.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <BN9PR11MB52765EE38CA21BA27EEA06548CC69@BN9PR11MB5276.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_003609_449597_9797116F 
X-CRM114-Status: UNSURE (   7.80  )
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

On 2023/1/17 11:38, Tian, Kevin wrote:
>> From: Jason Gunthorpe<jgg@nvidia.com>
>> Sent: Saturday, January 7, 2023 12:43 AM
>>
>> @@ -2368,7 +2372,7 @@ static int iommu_domain_identity_map(struct
>> dmar_domain *domain,
>>
>>   	return __domain_mapping(domain, first_vpfn,
>>   				first_vpfn, last_vpfn - first_vpfn + 1,
>> -				DMA_PTE_READ|DMA_PTE_WRITE);
>> +				DMA_PTE_READ|DMA_PTE_WRITE,
>> GFP_KERNEL);
>>   }
> Baolu, can you help confirm whether switching from GFP_ATOMIC to
> GFP_KERNEL is OK in this path? it looks fine to me in a quick glance
> but want to be conservative here.

This is also good for me. The memory notifier callback runs in a process
context and allowed to block.

Best regards,
baolu

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
