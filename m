Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153E0CF8853
	for <ath11k@archiver.kernel.org>; Fri,  4 Oct 2024 17:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JGey8z46xtiDH6o60iRI3jz1uNpAA+ObxEoyMMg1bdo=; b=gXBTeBE19Pl788Y+RInMxFIg2A
	PwkJoKqm0J9Zay9qGrhBHQeGUmqox2E/Zoj/BoGj1DIuJAxavMe4yxs5VFZNqTbmacKGeBSP1WEuX
	hlI3YrHbE+Jg17YBA772Bf4doeyfoJdeqKzDQP5hxk0vC49oql48tujV/3+HTaGwY77rIVMsPHi4k
	71mHPXl4swMf1e8Qko2gKu1VM0v0zA3oEGFW8HnA/OkDfQKNNOOM68uI2cwl99+dD+2ta7gDBVG83
	sa2uq9bLTjhamyxyFBfJ3homcyYF6TdorkETSnPj4rV/vYeljDUMDStLSzItRIzXLunYonNQ4RNmW
	D3x98aoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swm3B-0000000DVgn-2pF3;
	Fri, 04 Oct 2024 17:25:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swlkl-0000000DNpL-09eu
	for ath11k@lists.infradead.org;
	Fri, 04 Oct 2024 17:06:08 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 494FDhG8012564;
	Fri, 4 Oct 2024 17:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JGey8z46xtiDH6o60iRI3jz1uNpAA+ObxEoyMMg1bdo=; b=gkbPlYYMU125BFlh
	PydgUAsiYDfA8Jt8rYo2GYnfB/PVhsxh2m+cp8PEv65ytsBnlf0Vk7r7RhPuJO0p
	18dkA4WdZn5/cpO5iqpJxZFLgAfotEfWBf8bvEOoxTUjP/p55jVlkM90qHmztl5g
	ateSNh0Z7v7v7EdhJML+fMzOSYlh8X9hKHd7OQPSbi1XRS4zDl3qFTkXks6geIAs
	2l+Q9VviakzBFBatkHeoIog/h30cMRWD8uOZU6A3CMxN4ne4xvc/VfZHhVPL7Npf
	Sf4MwZQZ09HBooZHtQsX0Xy9o9Js/2tAqAX4bZua0C35PM8ZmON1ayV5FQmVXlUW
	OIoFcw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205jjsp7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Oct 2024 17:06:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 494H64ui013313
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Oct 2024 17:06:04 GMT
Received: from [10.111.183.136] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 4 Oct 2024
 10:06:04 -0700
Message-ID: <cf9e3c4f-92b7-4a52-b114-bc1769545585@quicinc.com>
Date: Fri, 4 Oct 2024 10:06:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] wifi: ath11k: add srng->lock for ath11k_hal_srng_*
 in monitor mode
To: Kang Yang <quic_kangyang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240924102345.811-1-quic_kangyang@quicinc.com>
 <20240924102345.811-3-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240924102345.811-3-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6n0Plh-c0kFaYmgl53ZZ-_9-vN-JJYcY
X-Proofpoint-ORIG-GUID: 6n0Plh-c0kFaYmgl53ZZ-_9-vN-JJYcY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410040118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_100607_119322_18BAE2A0 
X-CRM114-Status: GOOD (  17.25  )
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

On 9/24/2024 3:23 AM, Kang Yang wrote:
> ath11k_hal_srng_* should be used with srng->lock to protect srng data.
> 
> For ath11k_dp_rx_mon_dest_process() and ath11k_dp_full_mon_process_rx(),
> they use ath11k_hal_srng_* for many times but never call srng->lock.
> 
> So when running (full) monitor mode, warning will occurr:

WARNING:TYPO_SPELLING: 'occurr' may be misspelled - perhaps 'occur'?

> RIP: 0010:ath11k_hal_srng_dst_peek+0x18/0x30 [ath11k]
> Call Trace:

WARNING:MISSING_FIXES_TAG: The commit message has 'Call Trace:', perhaps it
also needs a 'Fixes:' tag?

>  ? ath11k_hal_srng_dst_peek+0x18/0x30 [ath11k]
>  ath11k_dp_rx_process_mon_status+0xc45/0x1190 [ath11k]
>  ? idr_alloc_u32+0x97/0xd0
>  ath11k_dp_rx_process_mon_rings+0x32a/0x550 [ath11k]
>  ath11k_dp_service_srng+0x289/0x5a0 [ath11k]
>  ath11k_pcic_ext_grp_napi_poll+0x30/0xd0 [ath11k]
>  __napi_poll+0x30/0x1f0
>  net_rx_action+0x198/0x320
>  __do_softirq+0xdd/0x319
> 
> So add srng->lock for them to avoid such warnings.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

should be blank line here since the Tested-on tags are ath-specific and not
"official" kernel.org tags

> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath11k/dp_rx.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
> index 072963d3396c..5fd681b5df2e 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
> @@ -5146,7 +5146,7 @@ static void ath11k_dp_rx_mon_dest_process(struct ath11k *ar, int mac_id,
>  	struct ath11k_mon_data *pmon = (struct ath11k_mon_data *)&dp->mon_data;
>  	const struct ath11k_hw_hal_params *hal_params;
>  	void *ring_entry;
> -	void *mon_dst_srng;
> +	struct hal_srng *mon_dst_srng;
>  	u32 ppdu_id;
>  	u32 rx_bufs_used;
>  	u32 ring_id;
> @@ -5163,6 +5163,7 @@ static void ath11k_dp_rx_mon_dest_process(struct ath11k *ar, int mac_id,
>  
>  	spin_lock_bh(&pmon->mon_lock);
>  
> +	spin_lock_bh(&mon_dst_srng->lock);
>  	ath11k_hal_srng_access_begin(ar->ab, mon_dst_srng);
>  
>  	ppdu_id = pmon->mon_ppdu_info.ppdu_id;
> @@ -5221,6 +5222,7 @@ static void ath11k_dp_rx_mon_dest_process(struct ath11k *ar, int mac_id,
>  								mon_dst_srng);
>  	}
>  	ath11k_hal_srng_access_end(ar->ab, mon_dst_srng);
> +	spin_unlock_bh(&mon_dst_srng->lock);
>  
>  	spin_unlock_bh(&pmon->mon_lock);
>  
> @@ -5607,7 +5609,7 @@ static int ath11k_dp_full_mon_process_rx(struct ath11k_base *ab, int mac_id,
>  	struct hal_sw_mon_ring_entries *sw_mon_entries;
>  	struct ath11k_pdev_mon_stats *rx_mon_stats;
>  	struct sk_buff *head_msdu, *tail_msdu;
> -	void *mon_dst_srng = &ar->ab->hal.srng_list[dp->rxdma_mon_dst_ring.ring_id];
> +	struct hal_srng *mon_dst_srng;
>  	void *ring_entry;
>  	u32 rx_bufs_used = 0, mpdu_rx_bufs_used;
>  	int quota = 0, ret;
> @@ -5623,6 +5625,9 @@ static int ath11k_dp_full_mon_process_rx(struct ath11k_base *ab, int mac_id,
>  		goto reap_status_ring;
>  	}
>  
> +	mon_dst_srng = &ar->ab->hal.srng_list[dp->rxdma_mon_dst_ring.ring_id];
> +	spin_lock_bh(&mon_dst_srng->lock);
> +
>  	ath11k_hal_srng_access_begin(ar->ab, mon_dst_srng);
>  	while ((ring_entry = ath11k_hal_srng_dst_peek(ar->ab, mon_dst_srng))) {
>  		head_msdu = NULL;
> @@ -5666,6 +5671,7 @@ static int ath11k_dp_full_mon_process_rx(struct ath11k_base *ab, int mac_id,
>  	}
>  
>  	ath11k_hal_srng_access_end(ar->ab, mon_dst_srng);
> +	spin_unlock_bh(&mon_dst_srng->lock);
>  	spin_unlock_bh(&pmon->mon_lock);
>  
>  	if (rx_bufs_used) {

actual patch LGTM

