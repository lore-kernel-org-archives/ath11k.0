Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83373C433FE
	for <ath11k@archiver.kernel.org>; Wed, 27 Apr 2022 05:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fDEcabuiPEYCe59TfhuUhDN3mJ0Z+CFNLMSyL/d8lxg=; b=l2odglOEzaAfyD
	YYqfKENPq9DK72JYp5pu/9PFOVnHAtAbw+8DoLxMPakQ7OQzZCnXQlmFANMWl3cu3D5CssEQJkg+j
	6wB347N9O5cy28DOWQPltbn3uOozOLXL5yJxn6/Uxjz+tmwv5dVepINIFGsBR60VqQSzMm1RI4/wv
	UYfSx0JjVKLEFnlfT//K9RLllPfcOg480PtaduJBxZ9DOF/e92UaIHphHONn4ZuW3nY+BP2TAozjJ
	r2lJVNVmoKLLQIqFn7xYfRrIe+0/1VNIV+av2GOjvsfB0//3qgL4f4w/xSVDHdY8QiI0ecsGOQIaO
	n7s83pVgfO00CvX9ZHJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njaKY-00HUMc-My; Wed, 27 Apr 2022 05:35:14 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njaKV-00HUM0-K8
 for ath11k@lists.infradead.org; Wed, 27 Apr 2022 05:35:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651037711; x=1682573711;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+NPvjvqMz0jQntnXppFMfIo7g9xIUS8A2Ir76H7o3Ns=;
 b=fV/Ozw9QLSWQF60uZsdfzgXMpyuiM9sjVaeBqnSId83/x5r5V22V65J4
 5j6v+k7XSGPNZB8fK9emht/xKFbe3823ZNfA2OO5soOKvnk9saj+IttmV
 YyQAjtaE/W6MS6sYg8Lr3kK1/rBjO14PH/iK5squzvtHe2TLOl2aV8LfA 8=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 26 Apr 2022 22:35:11 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 22:35:11 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 26 Apr 2022 22:35:10 -0700
Received: from [10.50.15.218] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 26 Apr
 2022 22:35:08 -0700
Message-ID: <06e5ce9c-87d0-17a0-138c-5f11f705f6c7@quicinc.com>
Date: Wed, 27 Apr 2022 11:05:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 02/12] ath11k: Add HW params for WCN6750
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>, <mka@chromium.org>
References: <20220406094107.17878-1-quic_mpubbise@quicinc.com>
 <20220406094107.17878-3-quic_mpubbise@quicinc.com>
 <87k0bbhzij.fsf@kernel.org>
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <87k0bbhzij.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_223511_739696_50C75BC1 
X-CRM114-Status: GOOD (  10.78  )
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

On 4/27/2022 10:51 AM, Kalle Valo wrote:
> Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:
> 
>> Add HW params for WCN6750. It is similar to the HW params
>> of QCA6390 with few differences wrt DP APIs and register
>> offsets.
>>
>> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00573-QCAMSLSWPLZ-1
>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
>> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
>> ---
>>   drivers/net/wireless/ath/ath11k/core.c | 61 ++++++++++++++++++++++++++
>>   drivers/net/wireless/ath/ath11k/core.h |  1 +
>>   drivers/net/wireless/ath/ath11k/qmi.h  |  2 +
>>   3 files changed, 64 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
>> index cbac1919867f..8695f999acb2 100644
>> --- a/drivers/net/wireless/ath/ath11k/core.c
>> +++ b/drivers/net/wireless/ath/ath11k/core.c
>> @@ -427,6 +427,67 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
>>   		.dbr_debug_support = false,
>>   		.global_reset = true,
>>   	},
>> +	{
>> +		.name = "wcn6750 hw1.0",
>> +		.hw_rev = ATH11K_HW_WCN6750_HW10,
>> +		.fw = {
>> +			.dir = "WCN6750/hw1.0",
>> +			.board_size = 256 * 1024,
>> +			.cal_offset = 128 * 1024,
>> +		},
>> +		.max_radios = 1,
>> +		.bdf_addr = 0x4B0C0000,
>> +		.ring_mask = &ath11k_hw_ring_mask_qca6390,
>> +		.internal_sleep_clock = false,
>> +		.qmi_service_ins_id = ATH11K_QMI_WLFW_SERVICE_INS_ID_V01_WCN6750,
>> +		.host_ce_config = ath11k_host_ce_config_qca6390,
>> +		.ce_count = 9,
>> +		.target_ce_config = ath11k_target_ce_config_wlan_qca6390,
>> +		.target_ce_count = 9,
>> +		.svc_to_ce_map = ath11k_target_service_to_ce_map_wlan_qca6390,
>> +		.svc_to_ce_map_len = 14,
>> +		.rfkill_pin = 0,
>> +		.rfkill_cfg = 0,
>> +		.rfkill_on_level = 0,
>> +		.single_pdev_only = true,
>> +		.rxdma1_enable = false,
>> +		.num_rxmda_per_pdev = 1,
>> +		.rx_mac_buf_ring = true,
>> +		.vdev_start_delay = true,
>> +		.htt_peer_map_v2 = false,
>> +
>> +		.spectral = {
>> +			.fft_sz = 0,
>> +			.fft_pad_sz = 0,
>> +			.summary_pad_sz = 0,
>> +			.fft_hdr_len = 0,
>> +			.max_fft_bins = 0,
>> +		},
>> +
>> +		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
>> +					BIT(NL80211_IFTYPE_AP),
>> +		.supports_monitor = false,
>> +		.supports_shadow_regs = true,
>> +		.idle_ps = true,
>> +		.supports_sta_ps = true,
>> +		.cold_boot_calib = false,
>> +		.fw_mem_mode = 0,
>> +		.num_vdevs = 16 + 1,
>> +		.num_peers = 512,
>> +		.supports_suspend = false,
>> +		.supports_regdb = true,
>> +		.fix_l1ss = false,
>> +		.credit_flow = true,
>> +		.max_tx_ring = DP_TCL_NUM_RING_MAX_QCA6390,
>> +		.hal_params = &ath11k_hw_hal_params_qca6390,
>> +		.supports_dynamic_smps_6ghz = false,
>> +		.alloc_cacheable_memory = false,
>> +		.supports_rssi_stats = true,
>> +		.fw_wmi_diag_event = false,
>> +		.current_cc_support = true,
>> +		.dbr_debug_support = false,
>> +		.global_reset = false,
>> +	},
> 
> In the pending branch I added:
> 
> +               .bios_sar_capa = NULL,
> 

This is the only other change I had in V5, thanks for adding this.

Manikanta

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
