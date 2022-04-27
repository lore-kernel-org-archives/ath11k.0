Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CEC2C433EF
	for <ath11k@archiver.kernel.org>; Wed, 27 Apr 2022 05:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tW9kxzbgyqApVjBlnVUuZABbZ45x75WSk2TIIHbFSdo=; b=EQWM6B5/D+jlF1
	4UufFJY8AfqeaJtH43pBLRQHFq33lKwDNwOhGPCTKzrMPmyjIeQWrPw2pNsHGVqU0yMTq2pVtQc/0
	rTbsWTuwu5cEts+g1NhlefVSVHPtdr3gjzvGdQZm8eCvQvojU4bLQW6EwWHR5Ey/2wbjD5t+cMvtG
	I6f4MayBvDdD4EwkWSbM3tzTnH4sPC4u3eHkxxFQf8I8DfSGnl3MjmLwn/+CoW2+DoUVF/0JP2jLH
	fpZsVBd9dpqmYGyDDZCjhrVQRc5KVrsVZy8KJGuGloNIGSI58lRXBzH0bpUCECj2eYH2isfN3Gw8W
	lvxPid3aAZHJxA9JJAhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njack-00HWBj-Py; Wed, 27 Apr 2022 05:54:02 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njach-00HWB9-T7
 for ath11k@lists.infradead.org; Wed, 27 Apr 2022 05:54:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651038839; x=1682574839;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kyHJp3urRg7RiUC1XvnEuetAxaXO2+JM1YtjA5BQfTo=;
 b=o2XBIHgBCrzJozxIMX0HtsHrEaaLrvOmoNnAgLfCKEXY9m5gW/Ppx4YU
 kHK7clsGkRDFd/E08VPk3+eAIfJGRMja4kZUSEG9ghNX9ASKwGaPGUMDp
 7eEpPToOZ8JzKgXJ0Kog+160/j0rstzj/P3GdoPBPVuXoaB4AzHOcP0+o 8=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 26 Apr 2022 22:53:58 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 22:53:58 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 26 Apr 2022 22:53:57 -0700
Received: from [10.50.15.218] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 26 Apr
 2022 22:53:55 -0700
Message-ID: <2a18a4d3-254b-727e-e96d-90deec61571c@quicinc.com>
Date: Wed, 27 Apr 2022 11:23:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 04/12] ath11k: Add register access logic for WCN6750
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>, <mka@chromium.org>
References: <20220406094107.17878-1-quic_mpubbise@quicinc.com>
 <20220406094107.17878-5-quic_mpubbise@quicinc.com>
 <87czh3gjuq.fsf@kernel.org>
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <87czh3gjuq.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_225400_011449_5F023ED4 
X-CRM114-Status: GOOD (  10.51  )
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

On 4/27/2022 11:15 AM, Kalle Valo wrote:
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
>> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00573-QCAMSLSWPLZ-1
>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
>> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
>> ---
>>   drivers/net/wireless/ath/ath11k/ahb.c  |  3 ++
>>   drivers/net/wireless/ath/ath11k/core.h |  2 +
>>   drivers/net/wireless/ath/ath11k/pci.c  |  4 ++
>>   drivers/net/wireless/ath/ath11k/pcic.c | 53 +++++++++-----------------
>>   4 files changed, 28 insertions(+), 34 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
>> index d73643e3e8dd..d27fc7276977 100644
>> --- a/drivers/net/wireless/ath/ath11k/ahb.c
>> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
>> @@ -42,6 +42,9 @@ const struct ath11k_bus_params ath11k_ahb_hybrid_bus_params = {
>>   	.fixed_bdf_addr = false,
>>   	.fixed_mem_region = false,
>>   	.hybrid_bus_type = true,
>> +	.static_window_map = true,
>> +	.dp_window_idx = 1,
>> +	.ce_window_idx = 2,
>>   };
> 
> Even if the values are zero, please initialise the new fields in every
> bus_params structure:
> 
> ahb.c:31:static const struct ath11k_bus_params ath11k_ahb_bus_params = {
> pci.c:118:static const struct ath11k_bus_params ath11k_pci_bus_params = {
>

Makes sense, should I send another series addressing these?

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
