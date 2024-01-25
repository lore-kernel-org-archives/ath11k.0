Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40ABFC47422
	for <ath11k@archiver.kernel.org>; Thu, 25 Jan 2024 16:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gnnqOW4WEc5t5NqMuGa7SLqkdW+FmKbgxmje9AU1oeY=; b=YbC9kjMPfk2eHxDTDBOUDFEBpD
	C8nO3JXcQDOYzlEP53tyHqlx3RyGn+NGv1G+JO+Y0jk8bF8vCs5ig80dKgFXs2zKvE7jAoQclbuaO
	wybrw2WD45Yo4Bgt/TE2YD8V7G5cwVQ7veFfiEfYoE/s6y2bQPabWcAKUR2tyHcPQhoPon9UJ9jw7
	8e5GTfKKqWpznLd6iuThOGF22YMBcD4IlyIB08iohxrG+T+gTFe3DHLe+oPSO39dM7CAsiaZ2LDiJ
	Na+ds2eLELNSXsayxoEfWj6fyWpHiOM6BfwTlBpaRjNfruRxiJ+tPOHuwHEjd2mUki4poVPJirTBX
	ht79BNbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT2jg-00000000qZY-0cpE;
	Thu, 25 Jan 2024 16:37:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT2jd-00000000qYb-13o5
	for ath11k@lists.infradead.org;
	Thu, 25 Jan 2024 16:37:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9A69F611C3;
	Thu, 25 Jan 2024 16:37:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D641C433C7;
	Thu, 25 Jan 2024 16:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706200668;
	bh=WYw4m0b98hGk2o3P5WPH7ylm5ZY+XZ7CvVVplA0O5gU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=V/3myDpcdLuUu7jyh3JWj4M3LTcVz9eKetLyfIx7S6w8zw4CojtZSScQntyCZnsmF
	 p4UdtWVl1ACLwJTzBcNC60gGwselRsZBMO5lfhiS/HWWdy9uNA7bQmAjSl4iXzAUw+
	 xDKPKrtGPpp6cOfKCUF7xxGn4fMw+zzTwAoV5vCpEo0QsKhaKpfzlFckAfvIkGatPo
	 g/VDf7XDSpINPB/iXzUsPvmhMEpwsT0lxpBNgpMLOQdPaPGJBMGktOm8Y7ovIf95+p
	 7QPH9wyeWU1bYDaEf0uIkZaGvEAwcF+zaYPBR/91h8iB8zE78yqEfzOTej/T/YrmQC
	 JUY3QDdCeVygQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,  <ath11k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath11k: enable 36 bit mask for stream DMA
References: <20240123015201.28939-1-quic_bqiang@quicinc.com>
	<73e9ddd2-7c0c-4a96-a120-7480ebffc4f0@quicinc.com>
Date: Thu, 25 Jan 2024 18:37:45 +0200
In-Reply-To: <73e9ddd2-7c0c-4a96-a120-7480ebffc4f0@quicinc.com> (Jeff
	Johnson's message of "Tue, 23 Jan 2024 18:35:47 -0800")
Message-ID: <878r4d1i92.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_083749_373657_C76FE7EB 
X-CRM114-Status: GOOD (  15.21  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 1/22/2024 5:52 PM, Baochen Qiang wrote:
>
>> Currently 32 bit DMA mask is used, telling kernel to get us an DMA
>> address under 4GB when mapping a buffer. This results in a very high
>> CPU overhead in the case where IOMMU is disabled and more than 4GB
>> system memory is installed. The reason is, with more than 4GB memory
>> installed, kernel is likely to allocate a buffer whose physical
>> address is above 4GB. While with IOMMU disabled, kernel has to involve
>> SWIOTLB to map/unmap that buffer, which consumes lots of CPU cycles.
>> 
>> We did hit an issue caused by the reason mentioned above: in a system
>> that disables IOMMU and gets 8GB memory installed, a total of 40.5%
>> CPU usage is observed in throughput test. CPU profiling shows nearly
>> 60% of CPU cycles are consumed by SWIOTLB.
>> 
>> By enabling 36 bit DMA mask, we can bypass SWIOTLB for any buffer
>> whose physical address is below 64GB. There are two types of DMA mask
>> within struct device, named dma_mask and coherent_dma_mask. Here we
>> only enable 36 bit for dma_mask, because firmware crashes if
>> coherent_dma_mask is also enabled, due to some unknown hardware
>> limitations. This is acceptable because coherent_dma_mask is used for
>> mapping a consistent DMA buffer, which generally does not happen in
>> a hot path.
>> 
>> With this change, the total CPU usage mentioned in above issue drops
>> to 18.9%.
>> 
>> Tested-on: WCN6855 hw2.1 PCI
>> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
>> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
>> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
>> 
>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
>> ---
>>  drivers/net/wireless/ath/ath11k/mhi.c |  2 +-
>>  drivers/net/wireless/ath/ath11k/pci.c | 16 +++++++++++++---
>>  drivers/net/wireless/ath/ath11k/pci.h |  1 +
>>  3 files changed, 15 insertions(+), 4 deletions(-)

> My Qualcomm Innovation Center copyright checker reports:
>
> drivers/net/wireless/ath/ath11k/mhi.c copyright missing 2024
> drivers/net/wireless/ath/ath11k/pci.c copyright missing 2024
> drivers/net/wireless/ath/ath11k/pci.h copyright missing 2024
>
> Kalle can fix this in the pending tree

Yup, added those.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

