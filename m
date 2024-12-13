Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6521E7717D
	for <ath11k@archiver.kernel.org>; Fri, 13 Dec 2024 06:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y5RtScDgn522UbKDuIq3ny5JDJfsxEGeUY5/2RdTUWI=; b=rOCvveYlUFZptpPODBmbzWiGaT
	aFhAT6xxnplpDtEJh5bxts38qBrR4Pu0cFRhoEBBUfD35WZwRwk7kM4Z26qPHRauzb6F4L2AndCxe
	klRib9+xkuy460EfuBfRtzfRBPsHDxzFkzQhvHQ3xeTtlYgPK4e2v52giDBIVUdalCbksrZHKGqYh
	orTEApda2FNq6CIR7WpumIWRMDoFcYh1RkX5A+wq4oSfiYFdflkpp9UvXll1j7iI//Aezt0/3l030
	Es4c/2ow4tLUSpTf4tAQRjt1yTNNTOoGO2VrO0atqLFvWs4I/ZNndiu2lL9ee0OBSLHkj/4kSTPI2
	PWDUnfQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLyzr-00000002qma-3ktI;
	Fri, 13 Dec 2024 06:17:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLyzp-00000002qmF-338g
	for ath11k@lists.infradead.org;
	Fri, 13 Dec 2024 06:17:55 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCM4BX2030144;
	Fri, 13 Dec 2024 06:17:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y5RtScDgn522UbKDuIq3ny5JDJfsxEGeUY5/2RdTUWI=; b=YqvJmXQieKSNfuiL
	Sw7wKOpyoijaiYuLkEFMM0k7bdJrCih/sZSIocECiZ4aCECPzVhG0X7AbNjyLiZU
	sFb8FL/jYdCz92vue7/TlSL+tJ1jpSKGidFQr0L+So/d8m2mX3myttdOQqG3FV9v
	twz20S2fc++GAKWfAn3rkq7pfxyFYotPJF5+mcp2LTEep8W9c1PnPwHlKFEOAV5I
	9tqi36I7QNW1H5xaq1EeIyoeV/PcqNFJ4xR/eApBhpBJTQ42dHskjAmNC5emvl4E
	cL2dzqTDOSZz3topYTESMcglog//PaiEfGN9BD6Z4iB8/AvgKwFXx3x3SIKhvaRY
	WlDHRw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fwgejs09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 06:17:49 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BD6HnWT007787
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 06:17:49 GMT
Received: from [10.110.46.166] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 12 Dec
 2024 22:17:47 -0800
Message-ID: <79910df2-a7fd-4880-bd32-4f2927341654@quicinc.com>
Date: Fri, 13 Dec 2024 14:17:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] wifi: ath11k: add srng->lock for ath11k_hal_srng_*
 in monitor mode
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20241008053744.1070-1-quic_kangyang@quicinc.com>
 <20241008053744.1070-3-quic_kangyang@quicinc.com> <87ttb9nea6.fsf@kernel.org>
Content-Language: en-US
From: Kang Yang <quic_kangyang@quicinc.com>
In-Reply-To: <87ttb9nea6.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: W3H7-C_TEOrcTuGXp04oq2oYrbb9vCrS
X-Proofpoint-ORIG-GUID: W3H7-C_TEOrcTuGXp04oq2oYrbb9vCrS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 bulkscore=0 mlxlogscore=983 spamscore=0 clxscore=1011
 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_221753_792261_40F1E977 
X-CRM114-Status: GOOD (  12.48  )
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



On 12/12/2024 10:53 PM, Kalle Valo wrote:
> Kang Yang <quic_kangyang@quicinc.com> writes:
> 
>> ath11k_hal_srng_* should be used with srng->lock to protect srng data.
>>
>> For ath11k_dp_rx_mon_dest_process() and ath11k_dp_full_mon_process_rx(),
>> they use ath11k_hal_srng_* for many times but never call srng->lock.
>>
>> So when running (full) monitor mode, warning will occur:
>> RIP: 0010:ath11k_hal_srng_dst_peek+0x18/0x30 [ath11k]
>> Call Trace:
>>   ? ath11k_hal_srng_dst_peek+0x18/0x30 [ath11k]
>>   ath11k_dp_rx_process_mon_status+0xc45/0x1190 [ath11k]
>>   ? idr_alloc_u32+0x97/0xd0
>>   ath11k_dp_rx_process_mon_rings+0x32a/0x550 [ath11k]
>>   ath11k_dp_service_srng+0x289/0x5a0 [ath11k]
>>   ath11k_pcic_ext_grp_napi_poll+0x30/0xd0 [ath11k]
>>   __napi_poll+0x30/0x1f0
>>   net_rx_action+0x198/0x320
>>   __do_softirq+0xdd/0x319
>>
>> So add srng->lock for them to avoid such warnings.
>>
>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
>> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
>>
>> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
>> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
> 
> [...]
> 
>> @@ -5607,7 +5609,7 @@ static int ath11k_dp_full_mon_process_rx(struct ath11k_base *ab, int mac_id,
>>   	struct hal_sw_mon_ring_entries *sw_mon_entries;
>>   	struct ath11k_pdev_mon_stats *rx_mon_stats;
>>   	struct sk_buff *head_msdu, *tail_msdu;
>> -	void *mon_dst_srng = &ar->ab->hal.srng_list[dp->rxdma_mon_dst_ring.ring_id];
>> +	struct hal_srng *mon_dst_srng;
>>   	void *ring_entry;
>>   	u32 rx_bufs_used = 0, mpdu_rx_bufs_used;
>>   	int quota = 0, ret;
>> @@ -5623,6 +5625,9 @@ static int ath11k_dp_full_mon_process_rx(struct ath11k_base *ab, int mac_id,
>>   		goto reap_status_ring;
>>   	}
>>   
>> +	mon_dst_srng = &ar->ab->hal.srng_list[dp->rxdma_mon_dst_ring.ring_id];
>> +	spin_lock_bh(&mon_dst_srng->lock);
> 
> Why initialise mon_dst_srng differently? The commit message mentions
> nothing about this change.


Because need to fetch spin lock inside 'struct hal_srng'. If still use 
'void *mon_dst_srng', need to perform a variable type cast.

Bur 'struct hal_srng' will make this line too long:
'struct hal_srng *mon_dst_srng = 
&ar->ab->hal.srng_list[dp->rxdma_mon_dst_ring.ring_id];'
So I separated the definition and initialization.

ath11k_dp_rx_reap_mon_status_ring()/ath11k_dp_process_rx and others ring 
process function is the same.



> 


