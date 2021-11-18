Return-Path: <SRS0=Pndp=QF=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCEA7C433EF
	for <ath11k@archiver.kernel.org>; Thu, 18 Nov 2021 10:35:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E21960F51
	for <ath11k@archiver.kernel.org>; Thu, 18 Nov 2021 10:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7E21960F51
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tw5cTBr4i8L8gKSwLkWqep4geFCSD8qOKCCY7ZkzqTs=; b=4VDUncSj8QDPOh0+Bn3+fUbgvN
	6RwLgM7xt7McHe1fB4YSa4+nHm85bexQeeQtIBkaakLy1u0JsqH9X2Hf6VhxHe+KrJ6ubg1o32u9Z
	T5MrV95BH7fG8vplLSzRtMSyaRVus6noev8DdHtlYJ6vE4Nd/dfh84XvwGlwny6esstBulWPbNyqe
	BRYE+uqZWq8o5JTCBdB2qKiqcMq23+dTsA954gFBiUUXJNGu7AQw8QTn6A75ZZPNyCOM2/ee0/6zh
	9BI6mDRLgomIKAuj1L9Tgap1/oHB4q1Y7aX44XOfCxRL35P+5H/AK9KOlkwa9Zn6s2yOdc4JvS278
	6tQ7h2SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnelO-007Sz9-FM; Thu, 18 Nov 2021 10:35:30 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnelL-007Syb-6w
 for ath11k@lists.infradead.org; Thu, 18 Nov 2021 10:35:28 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637231724; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Fdsu310sXJ3E6Nw2PfabYdImgE5w6YhUrOF7m5J6Z4I=;
 b=AUk33iIMC7VzJALW4+9A2aPQqYeXcMPnWX1Wc1c3P2utkkq0RSz7hte+4WGlV3/uO9BfGaxc
 9vMcw+wGivXtl6Hss/V9D5KP++yLQFQ42xiUwdqoSIGl2lyoaKbqJ7RakL3pf0nCgrXBAyr8
 CBUh07eIMm/pCM8us6UmK53XLTE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 61962c6b0a5410021b7c3854 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 18 Nov 2021 10:35:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 17C91C4360D; Thu, 18 Nov 2021 10:35:23 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: akolli)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 13BD4C4338F;
 Thu, 18 Nov 2021 10:35:22 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 18 Nov 2021 16:05:21 +0530
From: Anilkumar Kolli <akolli@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org,
 kvalo=codeaurora.org@codeaurora.org
Subject: Re: [PATCH v2 2/2] ath11k: Use reserved host DDR addresses from DT
 for PCI devices
In-Reply-To: <87wnl7dx69.fsf@codeaurora.org>
References: <1637082058-6398-1-git-send-email-akolli@codeaurora.org>
 <1637082058-6398-2-git-send-email-akolli@codeaurora.org>
 <87wnl7dx69.fsf@codeaurora.org>
Message-ID: <b1617fc74da2d65d663a82e4a4f538e2@codeaurora.org>
X-Sender: akolli@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_023527_367429_0B297893 
X-CRM114-Status: GOOD (  29.92  )
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

On 2021-11-17 13:35, Kalle Valo wrote:
> Anilkumar Kolli <akolli@codeaurora.org> writes:
> 
>> Host DDR memory (contiguous 45 MB in mode-0 or 15 MB in mode-2)
>> is reserved through DT entries for firmware usage. Send the base
>> address and size from DT entries.
>> 
>> If DT entry is available, PCI devices work with
>> fixed_mem_region else host allocates multiple segments.
>> 
>> IPQ8074 on HK10 board supports multiple PCI devices.
>> IPQ8074 + QCN9074 is tested with this patch.
>> 
>> Tested-on: QCN9074 hw1.0 PCI 
>> WLAN.HK.2.4.0.1-01838-QCAHKSWPL_SILICONZ-1
>> 
>> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
>> ---
>> V2:
>>   - Use of_ API to read from dt node (Rob)
>> 
>>  drivers/net/wireless/ath/ath11k/mhi.c | 42 ++++++++++++++++++--
>>  drivers/net/wireless/ath/ath11k/pci.c | 10 ++++-
>>  drivers/net/wireless/ath/ath11k/qmi.c | 75 
>> +++++++++++++++++++++++++++++++----
>>  drivers/net/wireless/ath/ath11k/qmi.h |  1 +
>>  4 files changed, 116 insertions(+), 12 deletions(-)
>> 
>> diff --git a/drivers/net/wireless/ath/ath11k/mhi.c 
>> b/drivers/net/wireless/ath/ath11k/mhi.c
>> index 26c7ae242db6..0ea6ab7edeb9 100644
>> --- a/drivers/net/wireless/ath/ath11k/mhi.c
>> +++ b/drivers/net/wireless/ath/ath11k/mhi.c
>> @@ -3,6 +3,7 @@
>> 
>>  #include <linux/msi.h>
>>  #include <linux/pci.h>
>> +#include <linux/of.h>
>> 
>>  #include "core.h"
>>  #include "debug.h"
>> @@ -316,7 +317,11 @@ int ath11k_mhi_register(struct ath11k_pci 
>> *ab_pci)
>>  	struct ath11k_base *ab = ab_pci->ab;
>>  	struct mhi_controller *mhi_ctrl;
>>  	struct mhi_controller_config *ath11k_mhi_config;
>> -	int ret;
>> +	struct device_node *np;
>> +	int ret, len, sw, aw;
>> +	u32 *reg, *reg_end;
>> +	unsigned long start, size;
>> +	bool no_dt_entry = 0;
> 
> Use only true or false with bools.
> 
Sure.

>>  	mhi_ctrl = mhi_alloc_controller();
>>  	if (!mhi_ctrl)
>> @@ -339,8 +344,39 @@ int ath11k_mhi_register(struct ath11k_pci 
>> *ab_pci)
>>  		return ret;
>>  	}
>> 
>> -	mhi_ctrl->iova_start = 0;
>> -	mhi_ctrl->iova_stop = 0xffffffff;
>> +	np = of_find_node_by_type(NULL, "memory");
>> +	if (!np) {
>> +		no_dt_entry = 1;
> 
> true
> 
>> +		goto no_dt_entry;
>> +	}
>> +
>> +	aw = of_n_addr_cells(np);
>> +	sw = of_n_size_cells(np);
>> +
>> +	reg = (unsigned int *)of_get_property(np, "reg", &len);
> 
> Always try to avoid casts. of_get_property() returns 'const void *' so
> you are casting out const here, which is a bug. You don't need to do
> casting with void pointers so remove it here.
> 
Sure.

> But is reg property really unsigned int? And not u32 or dma_addr_t, for
> example?
> 
 From DT specification, each value in reg is a u32.

In our example
     memory {
         device_type = "memory";
         reg = <0x0 0x40000000 0x0 0x20000000>;
     };

     0x0 is higer 32-bit addr of RAM
     0x40000000 is lower 32-bit addr of RAM
     0x0 is size
     0x20000000 is [1GB RAM] size

>> +	if (!reg) {
>> +		no_dt_entry = 1;
> 
> true
> 
>> +		goto no_dt_entry;
>> +	}
>> +
>> +	reg_end = reg + len / (aw * sw);
>> +
>> +	do {
>> +		start = of_read_number(reg, aw);
>> +		reg += aw;
>> +		size = of_read_number(reg, sw);
> 
> of_read_number() takes 'const __be32 *cell' but reg is 'u32 *'?
> 
Yes.

>> +		reg += sw;
>> +	} while (reg < reg_end);
>> +
>> +no_dt_entry:
>> +	if (no_dt_entry) {
>> +		mhi_ctrl->iova_start = 0;
>> +		mhi_ctrl->iova_stop = 0xFFFFFFFF;
>> +	} else {
>> +		mhi_ctrl->iova_start = (dma_addr_t)(start + 0x1000000);
>> +		mhi_ctrl->iova_stop = (dma_addr_t)(start + size);
> 
> I don't like casts, they hide bugs like the const issue above. Is there
> any way to do this without casts?
> 

u64 start, size;

     if (of_property_read_u32_array(np, "reg", reg, 4)) {
          ath11k_dbg(ab, ATH11K_DBG_QMI,
                     "qmi fail to get reg from hremote\n");
          return 0;
     }
     start = reg[0] + reg[1];
     size = reg[2] + reg[3];

I will this code in next patch. still needs typecast form u64 to 
dma_addr_t. no ?

>> @@ -1245,6 +1246,13 @@ static int ath11k_pci_probe(struct pci_dev 
>> *pdev,
>>  	pci_set_drvdata(pdev, ab);
>>  	spin_lock_init(&ab_pci->window_lock);
>> 
>> +	/* Set fixed_mem_region to true for platforms support reserved 
>> memory
>> +	 * from DT. If memory is reserved from DT for FW, ath11k driver need 
>> not
>> +	 * allocate memory.
>> +	 */
>> +	if (!of_property_read_u32(ab->dev->of_node, "memory-region", &addr))
>> +		ab->bus_params.fixed_mem_region = true;
> 
> ab->bus_params is supposed to be const to catch this, but clearly it's
> not. The idea of bus_params is to have static bus level configuration,
> please instead use dev_flags or something else.
> 
Sure.

>>  static int ath11k_qmi_assign_target_mem_chunk(struct ath11k_base *ab)
>>  {
>> -	int i, idx;
>> +	struct device *dev = ab->dev;
>> +	struct device_node *hremote_node = NULL;
>> +	phandle hremote_phandle;
>> +	int i, idx, len, sw, aw, host_ddr_sz;
>> +	u32 *reg, *reg_end;
>> +	u64 start, size;
>> 
>>  	for (i = 0, idx = 0; i < ab->qmi.mem_seg_count; i++) {
>>  		switch (ab->qmi.target_mem[i].type) {
>> +		case HOST_DDR_REGION_TYPE:
>> +			if (of_property_read_u32(dev->of_node, "memory-region",
>> +						 &hremote_phandle)) {
>> +				ath11k_dbg(ab, ATH11K_DBG_QMI,
>> +					   "qmi fail to get hremote phandle\n");
>> +				return 0;
>> +			}
>> +
>> +			hremote_node = of_find_node_by_phandle(hremote_phandle);
>> +			if (!hremote_node) {
>> +				ath11k_dbg(ab, ATH11K_DBG_QMI,
>> +					   "qmi fail to get hremote_node\n");
>> +				return 0;
>> +			}
>> +
>> +			aw = of_n_addr_cells(hremote_node);
>> +			sw = of_n_size_cells(hremote_node);
>> +
>> +			reg = (unsigned int *)of_get_property(hremote_node, "reg", &len);
> 
> No need to cast. And I guess you are again removing the const?


- Anil.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
