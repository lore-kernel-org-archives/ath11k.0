Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A0BDC433EF
	for <ath11k@archiver.kernel.org>; Wed, 27 Apr 2022 12:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fvAC+i2iJC8BttRjip1FeAdaHf+xTguFW8zUxRCvetY=; b=3KezJ8vt3SoacX
	bCUvNBai6GDJTf0KDFmnZw5M/g9tGtm7ipWmA0Vvm1Y6AAnTyuX3MhyiYo1r+zG6Y3xHJ3ptKm4vo
	3oN8yaXQIuxLB44vv1XbwXXgQCVWC47mk4Att+y28D9dvoKsgJdEvrd85RzvjQI59n2hrKFX2vXHq
	Sbm3hIsAig3adUfKj3QaEAd7EthZcoUTdJpfvvTQ3bb/Jqc6dc5MgwMZP3Ofu3Te0brhB7CtcpxlU
	ASE4LH6yXUjXMWYDs0AT2+d/uMEZM04vNybPl1J4qV/NIhXu5+RWJ3KYcIrM0KQYv9p20VzXujU6S
	0bBeE1k+ttDb1rAL+5TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njgt2-001KYW-OQ; Wed, 27 Apr 2022 12:35:16 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njgsz-001KVg-58
 for ath11k@lists.infradead.org; Wed, 27 Apr 2022 12:35:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651062913; x=1682598913;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wabwfxq2ea3ScsaUrS8rkQH3XWlo//81jSwv8ow+8jU=;
 b=rNQdXaHRLKTZzegZNpIoJ265hEBvE+yCi58BzplRW/yG/SFhEkcESRma
 6vciZQdajMtkUlQ9Hrj91IQdquoE5DzDtRRl+pGOEJaV3+YZNg+EAwC1c
 GbpwhkWm00H/+Webi4XlCA/urdMQ01lYSRS3rK7XlSatfal2GrZ3ZX1dF s=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 27 Apr 2022 05:35:10 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 05:35:10 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 27 Apr 2022 05:35:09 -0700
Received: from [10.50.15.218] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 27 Apr
 2022 05:35:07 -0700
Message-ID: <86da868b-c1d5-0494-ba43-45067c436904@quicinc.com>
Date: Wed, 27 Apr 2022 18:05:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v6 4/9] ath11k: Add register access logic for WCN6750
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>, <mka@chromium.org>
References: <20220427111848.9257-1-quic_mpubbise@quicinc.com>
 <20220427111848.9257-5-quic_mpubbise@quicinc.com> <87pml2g1c7.fsf@kernel.org>
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <87pml2g1c7.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_053513_279173_EB5E5009 
X-CRM114-Status: GOOD (  18.09  )
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

On 4/27/2022 5:55 PM, Kalle Valo wrote:
> Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:
> 
>> WCN6750 uses static window mapping to access the HW registers.
>> Unlike QCN9074 which uses 2nd window for CE and 3rd window
>> for UMAC register accesses, WCN6750 uses 1st window for UMAC
>> and 2nd window for CE registers.
>>
>> Code is refactored so that WCN6750 can use the existing
>> ath11k_pci_read/write() APIs for accessing the registers.
>>
>> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
>> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
>> ---
>>   drivers/net/wireless/ath/ath11k/ahb.c  |  6 +++
>>   drivers/net/wireless/ath/ath11k/core.h |  2 +
>>   drivers/net/wireless/ath/ath11k/pci.c  | 34 ++++++++++++++--
>>   drivers/net/wireless/ath/ath11k/pcic.c | 54 +++++++++-----------------
>>   4 files changed, 58 insertions(+), 38 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
>> index cfdd415f0203..fa12e50f32f4 100644
>> --- a/drivers/net/wireless/ath/ath11k/ahb.c
>> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
>> @@ -34,7 +34,10 @@ static const struct ath11k_bus_params ath11k_ahb_bus_params = {
>>   	.m3_fw_support = false,
>>   	.fixed_bdf_addr = true,
>>   	.fixed_mem_region = true,
>> +	.static_window_map = false,
>>   	.hybrid_bus_type = false,
>> +	.dp_window_idx = 0,
>> +	.ce_window_idx = 0,
>>   };
>>   
>>   const struct ath11k_bus_params ath11k_ahb_hybrid_bus_params = {
>> @@ -42,7 +45,10 @@ const struct ath11k_bus_params ath11k_ahb_hybrid_bus_params = {
>>   	.m3_fw_support = false,
>>   	.fixed_bdf_addr = false,
>>   	.fixed_mem_region = false,
>> +	.static_window_map = true,
>>   	.hybrid_bus_type = true,
>> +	.dp_window_idx = 1,
>> +	.ce_window_idx = 2,
>>   };
>>   
>>   #define ATH11K_IRQ_CE0_OFFSET 4
>> diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
>> index 51f313dd7f26..ee0ad93d5843 100644
>> --- a/drivers/net/wireless/ath/ath11k/core.h
>> +++ b/drivers/net/wireless/ath/ath11k/core.h
>> @@ -756,6 +756,8 @@ struct ath11k_bus_params {
>>   	bool fixed_mem_region;
>>   	bool static_window_map;
>>   	bool hybrid_bus_type;
>> +	u8 dp_window_idx;
>> +	u8 ce_window_idx;
>>   };
>>   
>>   struct ath11k_pci_ops {
>> diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
>> index ddd1e2de6a2e..9184cb893bd4 100644
>> --- a/drivers/net/wireless/ath/ath11k/pci.c
>> +++ b/drivers/net/wireless/ath/ath11k/pci.c
>> @@ -115,12 +115,26 @@ static const struct ath11k_pci_ops ath11k_pci_ops_qcn9074 = {
>>   	.window_read32 = ath11k_pci_window_read32,
>>   };
>>   
>> -static const struct ath11k_bus_params ath11k_pci_bus_params = {
>> +static const struct ath11k_bus_params ath11k_pci_bus_params_qca6390 = {
>>   	.mhi_support = true,
>>   	.m3_fw_support = true,
>>   	.fixed_bdf_addr = false,
>>   	.fixed_mem_region = false,
>> +	.static_window_map = false,
>>   	.hybrid_bus_type = false,
>> +	.dp_window_idx = 0,
>> +	.ce_window_idx = 0,
>> +};
>> +
>> +static const struct ath11k_bus_params ath11k_pci_bus_params_qcn9074 = {
>> +	.mhi_support = true,
>> +	.m3_fw_support = true,
>> +	.fixed_bdf_addr = false,
>> +	.fixed_mem_region = false,
>> +	.static_window_map = true,
>> +	.hybrid_bus_type = false,
>> +	.dp_window_idx = 3,
>> +	.ce_window_idx = 2,
>>   };
>>   
>>   static const struct ath11k_msi_config msi_config_one_msi = {
>> @@ -704,11 +718,26 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
>>   {
>>   	struct ath11k_base *ab;
>>   	struct ath11k_pci *ab_pci;
>> +	const struct ath11k_bus_params *bus_params;
>>   	u32 soc_hw_version_major, soc_hw_version_minor, addr;
>>   	int ret;
>>   
>> +	switch (pci_dev->device) {
>> +	case QCA6390_DEVICE_ID:
>> +	case WCN6855_DEVICE_ID:
>> +		bus_params = &ath11k_pci_bus_params_qca6390;
>> +		break;
>> +	case QCN9074_DEVICE_ID:
>> +		bus_params = &ath11k_pci_bus_params_qcn9074;
>> +		break;
> 
> Now you are making bus_params device specific, that's not really the
> point of bus params. They are supposed to be _bus_ specific parameters.
> 
> Can't you use hw_params like I mentioned in the review?
> 

I'm totally confused now, CE & DP window indices are specifics that come 
in to play when we access the bus registers and they are closely tied to 
static_window_map variable which is already in bus_params, I'm not sure 
if it is a good to have them in hw_params. If at all we decide to move 
them to hw_params, then we can move pretty much everything to hw_params 
and remove bus_params completely.

I prefer to keep them in bus_params and make bus_params device specific,
If you feel it otherwise, then I can move it to hw_params.

Thanks,
Manikanta

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
